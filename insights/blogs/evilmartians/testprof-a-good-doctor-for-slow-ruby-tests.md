---
type: insight
title: "TestProf: A Good Doctor for Slow Ruby Tests"
description: "Introduction to the TestProf gem toolbox for profiling and optimizing slow Ruby/Rails test suites using tag profiling, event profiling, factory analysis, and automated tagging"
resource: "https://evilmartians.com/chronicles/testprof-a-good-doctor-for-slow-ruby-tests"
tags: [ruby, rails, testing, rspec, minitest, test-performance, testprof, factory-bot, profiling, ci]
timestamp: "2026-03-02"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/testprof-a-good-doctor-for-slow-ruby-tests"
  date: '2024-08-11'
---

# TestProf: A Good Doctor for Slow Ruby Tests

TestProf is a Ruby test profiling toolbox that bundles tips and tools for identifying and fixing test suite bottlenecks in Rails applications.

## The Problem: Slow Tests Kill Productivity

- Survey of Ruby developers (2017): ~50% of suites run under 5 minutes, but for suites with 1000+ tests, ~50% run over 10 minutes and ~30% over 20 minutes
- Typical Rails apps have 10K–20K tests; even running 100 examples before a commit adds ~1 minute to the feedback loop
- CI parallelism helps but costs money; the goal is to improve TPM (tests per minute) rather than add parallel workers
- Real-world example: Fountain project — 750 tests in ~5 minutes (150 TPM) before optimization; after optimization achieved 800 TPM with 5x parallelism, a 5x relative speed increase
- Slow tests affect both local TDD feedback loops and deployment pipelines via CI queues

## General Profiling with Tag Profiler

- `TAG_PROF=type rspec` — runs TestProf's **Tag Profiler** grouped by RSpec's built-in `type` tag (controller, service, model, job, etc.)
- Output shows: time, total examples, `%total` (share of examples), `%time` (share of time), and avg time per example
- Identifies which test types contribute most to overall run time so you can focus optimization efforts there
- Example: controller tests at 34% of time with 39% of examples; service tests at 25% of time with 19% of examples
- Use `TAG_PROF=<any_tag>` to group by any custom RSpec metadata tag

## Generic Ruby Profilers via TestProf

- TestProf integrates with `StackProf`, `RubyProf`, and `Vernier` without manual setup — just set an env var
- `TEST_RUBY_PROF=1 bundle exec rake test` — runs StackProf and generates two reports in `tmp/test_prof/`:
  - `stack-prof-report-wall-raw-boot.dump` — use with `stackprof` CLI
  - `stack-prof-report-wall-raw-boot.json` — use with [Speedscope](https://www.speedscope.app/) for flamegraph visualization
- Profiling slows down the test suite itself, so run it against a small random subset: `SAMPLE=10 bundle exec rspec` samples 10 random RSpec example groups
- Common hotspots found in flamegraphs: `BCrypt::Engine#__bc_crypt` (encryption too strong in test env), `ActiveSupport::Notifications::Instrumenter#instrument`, `Arel::Visitors::Visitor#dispatch`
- Fix: lower BCrypt cost in test environment (e.g., Sorcery or Devise) — one-line change yielding ~20% speed boost

## Event Profiler for Database Usage

- `EVENT_PROF=sql.active_record rspec` — runs **EventProf**, which collects `ActiveSupport::Notifications` instrumentation during the test run
- Reports total SQL time, total events count, and top-N slowest suites and examples
- Output is similar to `rspec --profile` but scoped to a specific event
- Example: 20% of total test time spent in database queries — suspicious (typical healthy range: 10–15%)
- Also works for any custom `ActiveSupport::Notifications` event, not just SQL

## FactoryDoctor: Finding Unnecessary Database Writes

- `FDOC=1 rspec` — runs **FactoryDoctor**, which flags tests that use `create` (hitting the DB) when they don't need to
- Reports "potentially bad examples" and total wasted time per example, showing how many records were created
- Common fix: switch `create(:user)` to `build_stubbed(:user)` or `User.new` for unit tests that don't need persistence
- Note: FactoryDoctor produces false negatives in some cases; treat output as a guide, not gospel

## Reducing Setup Overhead with before_all

- Heavy `let!` setups that run before every example waste time: creating the same 4 Beatles before each of 15 examples = 60 factory calls
- `before_all` helper from TestProf runs setup once for the entire group, wrapped in a transaction that is rolled back after all examples in the group finish
- Unlike `before(:all)`, `before_all` handles database cleanup automatically via transaction wrapping
- Example:
  ```ruby
  describe BeatleSearchQuery do
    before_all do
      @paul = create(:beatle, name: 'Paul')
      # ...
    end
    # 15 examples — data created only once
  end
  ```
- For cross-group shared data, use **AnyFixture**: generates fixtures from factory code, stored once per test run

## Factory Cascades

- Factory cascades = nested factory associations creating excess database records uncontrollably
- A single `create(:user)` may trigger cascading `create` calls for associated models (address, profile, organization, etc.)
- TestProf's factory profiling tools (covered in [TestProf II](testprof-2-factory-therapy-for-your-ruby-tests-rspec-minitest.md)) detect and quantify cascade waste
- Cascade problems are a leading cause of test suite slowdowns in Rails apps with complex models

## Background Job Profiling

- Common pattern: `Sidekiq::Testing.inline!` in tests runs all jobs synchronously, adding significant overhead
- `EVENT_PROF=sidekiq.inline bundle exec rspec spec/requests` — profiles time spent running inline Sidekiq jobs
- Example output: 24% of test time spent in `sidekiq.inline` events — a major optimization target
- Fix: disable inline globally, use RSpec metadata to opt in per example:
  ```ruby
  config.before(:each) do |ex|
    ex.metadata[:sidekiq] == :inline ? Sidekiq::Testing.inline! : Sidekiq::Testing.fake!
  end
  ```

## RSpec Stamp: Automated Tag Insertion

- Manually adding `sidekiq: :inline` to every affected example is impractical for large suites
- **RSpec Stamp** (`RSTAMP=sidekiq:inline bundle exec rspec`) automatically identifies failing specs and inserts the tag into source files
- Uses **Ripper** (Ruby's built-in AST parser) to parse and modify source files safely
- Output: `Total patches: 62 Total files: 30` — shows how many examples and files were modified
- Eliminates manual migration effort when changing global test configuration (e.g., migrating from `inline!` to `fake!`)

## TestProf Ecosystem and Installation

- Gem: `test-prof` on rubygems.org; source on GitHub at `test-prof.evilmartians.io`
- Works with both RSpec and Minitest
- All profilers activated via environment variables — zero code changes required for basic profiling
- Reports output to `tmp/test_prof/` directory by default
- Part one of a three-part series: Part II covers factory optimization; [Part III](test-prof-3-guided-and-automated-ruby-test-profiling.md) covers guided and automated profiling
