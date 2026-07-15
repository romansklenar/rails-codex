---
title: "TestProf Digest 2026.4: Surprising Finds from 30k Specs"
description: "Case study of a second 50% RSpec speedup at Whop (4m35s to ~2min across 30k examples) via GC-leak hunting, oneshot_line coverage, cheaper test-mode encryption, and the new TestProf v1.6.0 TPS profiler and GC memory-profiler mode"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/test-prof-digest-2026-surprising-finds-from-30k-specs"
  date: '2026-04-06'
tags:
- ruby
- rails
- testing
- rspec
- test-performance
- testprof
- profiling
- garbage-collection
- code-coverage
- encryption
- case-study
- ci
---

# TestProf Digest 2026.4: Surprising Finds from 30k Specs

Standout global bottlenecks and slow-spec fixes from Evil Martians' second CI optimization gig at Whop, which cut RSpec time by another 50% (4m35s to ~2min, approaching 1m30s) across a suite that grew from ~11k to ~30k examples, and the TestProf v1.6.0 features it inspired.

## Whop Case Study: The Numbers

- Summer 2025 (first landing): cut run time 50%, 4min to 2min, suite was ~11k examples
- Early 2026: RSpec CI back up to **4m30s**, examples approaching **~30k**
- Run time didn't triple despite the example count nearly tripling — first engagement also introduced fast-test best practices
- Second landing brought RSpec back to **~2min** in a few days, and toward **1m30s** while writing
- Tests run **16x parallelized** using `test-queue`
- Cumulative stage impact: 4m35s → 3m30s (RuboCop cops) → 2m30s (coverage) → back to 3m+ then 2m30s (encryption) → 2min (per-file TPS fixes)

## Global Issue: Custom RuboCop Cops and GC Pressure

- Workflow: profile small random samples with **Stackprof** or **Vernier** to surface *global issues* (test-env config affecting all tests)
- Red flag: **GC at ~15% of tracked time** (approximation from samples, not wall time); typical is ~5%
- **TagProf** (needs full-suite run) ran forever — process ballooned RAM after the first ~10k examples, while sub-suites run individually always finished on time → diagnosis: **memory leak/bloat stressing GC**
- Bisected by adding RSpec hooks to report GC time every 1000 examples and total at suite end:

```ruby
RSpec.configure do |config|
  gc_tracker = 0
  last_gc_time = 0
  config.after(:each) do |ex|
    gc_tracker += 1
    if gc_tracker % 1000 == 0
      time = GC.total_time - last_gc_time
      last_gc_time = GC.total_time
      puts "[GC] Time spent after #{gc_tracker} examples: #{time / 1_000_000}ms (current: #{ex.metadata[:location]}"
    end
  end
  config.after(:suite) do
    puts "[GC] Total GC time spent: #{GC.total_time / 1_000_000}ms"
  end
end
```

- Culprit: `spec/lib` — just 24 files, 6s runtime — the custom RuboCop cop specs
- **Root cause:** `require "rubocop/rspec/support"` installs a global `before(:all)` hook (in `CopHelper`) that calls `RuboCop::Plugin.integrate_plugins` for **every example group** in the suite; integrated plugins appear to stay in memory forever
- **Fix:** require only the helpers you need instead of the blanket support file:

```diff
 require "rubocop"
-require "rubocop/rspec/support"
+require "rubocop/rspec/cop_helper"
+require "rubocop/rspec/expect_offense"
 require_relative "../../../../../lib/rubocop/cop/custom_cops/some_custom_cop"
 RSpec.describe RuboCop::Cop::CustomCops::SomeCustomCop, type: :rubocop do
+  include CopHelper
   include RuboCop::RSpec::ExpectOffense
 end
```

- Impact: **4m35s → 3m30s** from this change alone
- Inspired TestProf's new **GC memory-profiler mode**: `TEST_MEM_PROF=gc bin/rspec` lists examples contributing most to GC time plus total GC time after the run

## Global Issue: Coverage Tracking Overhead

- Trigger: `COVERAGE: "1"` set on CI; coverage tracking typically slows Ruby tests by **15-20%**
- Turning it off entirely is the easiest win, but coverage delta is valuable signal on PRs — not always an acceptable trade
- **Best-of-both:** SimpleCov's `oneshot_line` mode (fatkodima's contribution) — tracks each line only on first hit, subsequent hits add zero overhead; loses execution counts (rarely matters)

```diff
 SimpleCov.start "rails" do
-  enable_coverage :branch
+  enable_coverage :oneshot_line
+  primary_coverage :oneshot_line
 end
```

- Impact: **3m30s → 2m30s**

## Global Issue: The Cost of Encryption

- Encryption is a top-3 thing to check for global slowdowns, but Vernier/RubyProf initially found nothing suspicious
- Regression appeared after a merged PR: **"Encryption: add blind indexes"** pushed CI back over 3 minutes
- **Root cause:** `blind_index` gem defaults to **Argon2id with 3 iterations and 4 MB memory** — a production-grade setting, brutal for tests creating many records with encrypted attributes
- No built-in test mode exists; downgrade the algorithm and cost in the test env:

```ruby
if Rails.env.test?
  BlindIndex.default_options = {
    algorithm: :pbkdf2_sha256,
    cost: { iterations: 1 }
  }
end
```

- Impact: back to **2m30s**

## The Key Metric: Tests-Per-Second (TPS)

- After removing global bottlenecks, target test groups (files) with the **lowest TPS** that also contribute significantly to total runtime
- Weight by example count: the speed-up strategy is sharing setup across examples, so more examples = bigger payoff from shared setup
- **TestProf 1.6 ships a built-in TPS profiler** (`TPSProf`) — finds files with the most speed-up potential for minimal refactoring; also usable as a runtime linter to guard vital metrics
- Invocation and output:

```
$ TPS_PROF=20 TPS_PROF_MIN_EXAMPLES=5 bin/rspec
[TEST PROF INFO] Total TPS (tests per second): 16.02
Top 20 slowest suites by TPS (tests per second):
Api::V1::GraphqlRestController (...graphql_rest_controller_spec.rb:72) – 6.36 TPS (02:49.770 / 1080, shared setup time: 00:01.426)
Discovery::Ge...cturedMetadata (...generate_structured_metadata_spec.rb:1) – 0.28 TPS (00:43.582 / 12, ...)
Discovery::GenerateEmbedding (...generate_embedding_spec.rb:1) – 0.51 TPS (00:31.167 / 16, ...)
```

- **List is sorted by potential savings, not raw TPS** — e.g. `graphql_rest_controller_spec` has only ~6 TPS but ~3min total over ~1k examples, so reaching 20 TPS could save ~2min
- Fixing a handful of the listed files: **2m30s → 2min**

## Slow-Spec Fixes (Each Slow Test Is Slow in Its Own Way)

- **`graphql_rest_controller_spec` — per-example ObjectSpace scanning:** a REST-to-GraphQL proxy integration test (~1k examples) stubbed `resolve_type` in a `before` block by iterating `GraphQL::Schema::Union.descendants` and scanning `ObjectSpace.each_object(Module)` (**50k+ modules**) on every example
  - Fix: patch once in `before(:all)` via `singleton_class.prepend` of a `Module` guarded by a global flag (`$graphql_rest_faked`), reset in `after(:all)`
  - Impact: TPS **6 → 27**, run time **2m50s → 40s**
- **`discovery/generate_X` specs (~0.3 TPS) — hidden `sleep`:** factory/setup analysis found nothing; `SAMPLE=2 TEST_RUBY_PROF=1 bin/rspec ...` flat report showed **`Kernel#sleep` at 20% self time** — the services-under-test had exponential-backoff retries using production backoff settings, exercised by many retry-condition tests
  - Fix (incremental, since it's a client codebase — avoid structural refactor): make retry delay configurable, pass a tiny value in specs

```diff
 RSpec.describe Discovery::GenerateEmbedding, type: :service do
-  subject { described_class.call(access_pass: access_pass, metadata: metadata) }
+  subject { described_class.call(access_pass: access_pass, metadata: metadata, retry_delay: 0.01) }
```

- **`fraud_manager/fetch_business_receipts_spec` (1.09 TPS, 16.34s of 16.48s in shared setup):** a `before_all` created **600 records** to test that the service caps at `MAX_LIMIT` (500)
  - Fix: make the limit configurable (2 is enough for tests); never create production-scale data just to hit a boundary condition

## Prevention: Test-Specific AI Agents and Skills

- Alongside v1.6.0, the Whop gig produced **test-specific agents and skills** for their AI-coding setup
- Skills help LLMs generate efficient specs up front; agents review PRs and nudge, e.g. "Replace `let` with `let_it_be`", "Don't create 50 records to test pagination — add `?page_size=2`", "Using `rubocop/rspec/support` is prohibited, here's how to structure the spec"
- Open question whether AI skills/agents alone can keep tests fast over time
