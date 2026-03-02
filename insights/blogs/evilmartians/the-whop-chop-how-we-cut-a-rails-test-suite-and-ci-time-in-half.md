---
title: "The Whop Chop: How We Cut a Rails Test Suite and CI Time in Half"
description: "Case study of halving a large Rails CI test suite using TestProf profiling, factory optimization, SQL logging fixes, and migration from parallel_tests to test-queue"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/the-whop-chop-how-we-cut-a-rails-test-suite-and-ci-time-in-half"
  date: '2025-09-03'
tags: [rails, testing, performance, ci, testprof, rspec, factory-bot, parallelization, profiling]
---

# The Whop Chop: How We Cut a Rails Test Suite and CI Time in Half

A real-world case study of systematically halving a client (Whop) Rails test suite runtime using profiling, factory optimization, parallelization strategy changes, and flaky test elimination.

## Profiling with TestProf

- `TestProf` is the primary toolbox for Ruby test profiling — integrates StackProf, RubyProf, and Vernier
- Start with `TEST_STACK_PROF=1 rspec` to get a sampling profile of the entire suite run
- `StackProf` report immediately pointed to logger-related activity as the main bottleneck
- Use `TEST_PROF_EVENTS=factory.create rspec` to measure factory creation overhead per example
- `TestProf`'s `TPSProf` (time-per-example) profiler identifies the slowest individual test files
- Run FactoryDefault profiler on slowest files to surgically identify factory waste: `FACTORY_DEFAULT_PROF=1`
- Combine profilers: first identify slow files, then drill into factory and I/O causes

## Hidden Logging Overhead

- The primary culprit was Rails' verbose SQL logging enabled in the test environment
- Rails logs every SQL query by default even in tests — this is I/O-heavy and slows suites significantly
- Fix: set `config.log_level = :warn` in `config/environments/test.rb` to suppress SQL noise
- Check `Rails.logger.level` and `ActiveRecord::Base.logger` — both can emit independently
- StackProf call graphs surface logger-related stack frames as hot paths when logging is the bottleneck
- Removing excessive logging can yield 10–20% speedup with no test changes

## Factory Optimization

- Factory overhead is typically the second biggest bottleneck after I/O
- `let_it_be` (from `test-prof` gem) creates records once per example group, not per example — drops DB calls drastically
- `create_default(:model)` from TestProf registers a factory-created record as the default for associations, avoiding re-creation
- Use `FactoryBot.lint` in CI to catch unused or broken factories early rather than at runtime
- Audit `create` calls vs `build` vs `build_stubbed` — prefer `build_stubbed` for unit tests that don't need DB
- `before_all` block (TestProf) wraps a group's setup in a transaction, rolling back rather than re-creating

## Parallelization: From parallel_tests to test-queue

- `parallel_tests` splits test *files* across workers — imbalanced files cause idle workers waiting for one slow file
- `test-queue` creates a central queue of individual test *examples*; workers grab the next example immediately upon finishing
- Switching to `test-queue` removed the file-splitting imbalance and kept all workers saturated
- `test-queue` forces exposure of shared state and ordering dependencies — every leaky global state becomes a failure
- The migration process revealed hidden dependencies that were masked by `parallel_tests`' file-level isolation
- Result: significantly higher worker utilization and more predictable suite runtimes

## Addressing Flaky Tests

- Switching to `test-queue` surfaced order-dependent flaky tests that passed only in a specific file sequence
- Flaky tests from global state: `Thread.current`, class-level memoization, `Rails.cache` not cleared, `Time.zone` not reset
- Use `--bisect` in RSpec to isolate minimal reproduction sets for order-dependent failures
- Add `DatabaseCleaner` strategy per-example for system tests; use transactions for unit/integration tests
- `Timecop.freeze` / `ActiveSupport::Testing::TimeHelpers#freeze_time` must be paired with proper `teardown`
- Record and replay flakiness: log random seeds, re-run with `--seed <n>` to reproduce failures

## CI Infrastructure Optimizations

- Cache bundled gems between CI runs using the `Gemfile.lock` hash as the cache key
- Separate asset precompilation into its own CI step and cache the output
- Run the test profiling step (e.g., `TEST_STACK_PROF=1`) only on branch pushes, not every commit, to reduce overhead
- Use test result artifacts (JUnit XML) to track per-file timing trends over time
- Ensure CI workers have adequate memory for Chrome (system tests) and PostgreSQL — memory pressure causes spurious failures
- Consider sharding the suite across multiple CI jobs by stable timing data rather than file count

## Results and Lessons

- Total CI time cut in half — combination of logging fix, factory optimization, and better parallelization
- Each optimization was measured independently: profile, fix, re-profile to confirm improvement
- The StackProf → logging → factory → parallelization discovery sequence is a repeatable playbook
- "You can't optimize what you don't measure" — always start with profiling before guessing at bottlenecks
- `test-queue` is a higher-friction but higher-reward alternative to `parallel_tests` for large suites
- Open-source TestProf tooling: `gem 'test-prof'` with documentation at test-prof.evilmartians.io
