---
title: "Railing Against Time: Tools and Techniques That Got Us 5X Faster Tests"
description: "Case study of a 5x test suite speedup (53 min to 11 min) at Power Home Remodeling using StackProf, TestProf, callback disabling patterns, factory trait refactoring, AnyFixture, and let_it_be"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vitalii Yulieff, Travis Turner"
  url: "https://evilmartians.com/chronicles/railing-against-time-tools-and-techniques-that-got-us-5x-faster-results"
  date: '2024-08-14'
tags: [ruby, rails, testing, rspec, test-performance, testprof, factory-bot, stackprof, profiling, case-study, ci, active-record]
---

# Railing Against Time: Tools and Techniques That Got Us 5X Faster Tests

A real-world Evil Martians engagement that cut a Rails test suite from 53 minutes to 11 minutes in two weeks using three targeted PRs combining StackProf analysis, callback disabling, factory refactoring, and `let_it_be` migration.

## The Client and Starting Point

- Client: Power Home Remodeling ("POWER") — largest exterior home remodeler in the US, modular monolith Rails architecture with dozens of components
- Starting test suite run time: **53 minutes** total
- Goal: meaningfully reduce CI feedback loop and deployment wait times
- Tools used: `StackProf`, `Speedscope`, `TestProf` (`FactoryProf`, `EventProf`, `RSpecDissect`, `AnyFixture`), RSpec metadata tagging

## The Three-Pillar Optimization Mindset

- Pillar 1: **Search for highest-value targets** — optimizing a factory used across all tests beats optimizing a single rarely-run spec file
- Pillar 2: **Find low-hanging fruit; avoid over-optimization** — if 4 hours of work yields 1 second of improvement, reconsider priorities
- Pillar 3: **Always measure before and after** — surprises happen; a "fix" can sometimes make things worse; record baselines
- Approach: three sequential PRs, each targeting a different optimization layer (global callbacks → factories → per-file)

## Initial Analysis: Stackprof Flamegraph

- Command: `TEST_STACK_PROF=1 SAMPLE=1000 bin/rspec` — generates a StackProf report while sampling 1 in every 1000 events
- Load into Speedscope's "Sandwich" view for immediate insight without flamegraph expertise
- Findings from the flamegraph: two suspicious AR callbacks dominating call time:
  - `History#auto_add_history` — triggered on nearly every model mutation
  - `NitroSearch::Elastic::Indexing` — Elasticsearch indexing callback running in tests
- Also visible: heavy `ActiveRecord` low-level calls (`#exec_prepare`, etc.) and `FactoryBot#create` overhead
- `FPROF=flamegraph bin/rspec` revealed the FactoryFlame "skyscraper" pattern — deep cascades from `project` and `estimate` factories, especially via `create(:candidate_interview)`

## PR 1: Disabling Expensive Callbacks (53 min → 33 min)

- Problem: `History#auto_add_history` and `NitroSearch::Elastic::Indexing` ran in ~100% of tests but were only needed in ~1%
- Solution: the **testability pattern** — a dedicated `Testing` module with a fake/real toggle interface modeled on `Sidekiq::Testing`:
  ```ruby
  module History::Testing
    class << self
      def fake? = @fake
      def fake! = @fake = true
      def real! = @fake = false
    end
  end

  def auto_add_history
    return if History::Testing.fake?
    # ...
  end
  ```
- In `rails_helper.rb`: call `History::Testing.fake!` globally; use `before(:each)` + RSpec metadata to conditionally restore real behavior:
  ```ruby
  config.before(:each) do |example|
    example.metadata[:auto_history] ? History::Testing.real! : History::Testing.fake!
  end
  ```
- Opt-in per test: `it "records history", :auto_history do ... end`
- Applied the same pattern to `NitroSearch::Elastic::Indexing`
- Result: **53 minutes → 33 minutes** (38% reduction from callbacks alone)

## PR 2: Factory Optimization (33 min → 21 min)

- FactoryProf identified `project` and `estimate` as the two slowest and most-used factories
- Root cause: both factories declared `home` and `association :owner, factory: :user` as default associations — created on every `create(:estimate)` even when not needed
- Diagnostic technique: comment out associations and count how many tests fail — ~50 failures out of thousands, a manageable migration
- Fix: move optional associations into **traits**, keep factory lean:
  ```ruby
  factory :estimate do
    trait :with_home do
      home
    end
    trait :with_owner do
      association :owner, factory: :user
    end
  end
  ```
- Tests that need the association: `create(:estimate, :with_owner)`; all others get a clean, fast factory
- FactoryFlame after: stacks visibly shorter — "skyscraper" turned into low-rise buildings
- Additional fix: **AnyFixture for `nitro_user`** — a default user (`User.current`) was recreated on nearly every test; moved to a suite-level fixture:
  ```ruby
  config.before(:suite) do
    fixture(:nitro_user) { FactoryBot.create(:nitro_user) }
  end
  config.include_context "fixture:nitro_user"
  ```
- Also: replaced `before(:all)` with `before_all` (transactional) to fix database state leaks between tests
- Added an optional `CLEAN_DB=1` env var + `DatabaseTasks.truncate_all` hook for clean-slate starts on dirty branches
- No third-party database cleaners — pure ActiveRecord with transactional fixtures
- Result: **33 minutes → 21 minutes** (~36% additional reduction)

## PR 3: Per-File let_it_be Migration (21 min → 11 min)

- `let_it_be` — like `let!` but creates data **once** for the entire describe/context block, reused across all examples; acts as a scoped fixture
- `RSpecDissect` profiler: `RD_PROF=1 bin/rspec` — shows time spent in `let`/`let!` and `before(:each)` per spec file, ranked by wasted time
- Example: `HiringRequisition` spec spends 4.1 seconds (82%) of its 5.0 second run time in `let` expressions — the top candidate for `let_it_be` migration
- Before refactoring `hiring_requisition_spec.rb`:
  ```
  Total time: 00:03.368 (out of 00:07.064)
  user: 237 total / 109 top-level (3.89s)
  office_location: 86 total / 41 top-level (2.33s)
  ```
- After: replaced `let(:office_location) { create(...) }` with `let_it_be(:office_location) { create(...) }` and added `let_it_be(:default_user) { create_default(:user) }`
  ```
  Total time: 00:01.039 (out of 00:04.341)
  office_location: 11 total / 11 top-level (0.16s)
  ```
- 3 seconds saved in one file (~50% per-file reduction); factory time dropped from 3.0s to 1.0s
- `create_default(:user)` makes a user record the implicit default for all factory associations in the group — combining with `let_it_be` eliminates repeated creation across examples
- Applied same pattern to dozens of files (out of hundreds); sufficient to reach target
- Result: **21 minutes → 11 minutes** (~48% additional reduction)

## Final Results and Summary

- Total improvement: **53 minutes → 11 minutes** — approximately **5x faster**
- Timeline: two working weeks of engineering effort
- Three PR breakdown:
  - PR 1 (callbacks): 53 → 33 min via `History::Testing` + `NitroSearch` testability patterns
  - PR 2 (factories): 33 → 21 min via trait refactoring + AnyFixture + `before_all`
  - PR 3 (per-file): 21 → 11 min via `let_it_be` + `create_default` on ~dozens of files
- Key tools: `TEST_STACK_PROF=1` + Speedscope, `FPROF=flamegraph`, `RD_PROF=1`, `AnyFixture`, `let_it_be`, `before_all`
- Principle: surgical targeting of the highest-impact bottlenecks at each layer yields compounding gains
