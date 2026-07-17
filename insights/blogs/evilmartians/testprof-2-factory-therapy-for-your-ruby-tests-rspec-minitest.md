---
type: insight
title: "TestProf II: Factory Therapy for Your Ruby Tests"
description: "Deep dive into diagnosing and eliminating factory cascades in Ruby/Rails test suites using FactoryProf flame graphs, FactoryDefault, and AnyFixture to achieve fixture-like performance from factories"
resource: "https://evilmartians.com/chronicles/testprof-2-factory-therapy-for-your-ruby-tests-rspec-minitest"
tags: [ruby, rails, testing, rspec, minitest, test-performance, testprof, factory-bot, factories, profiling, fixtures]
timestamp: "2026-03-02"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/testprof-2-factory-therapy-for-your-ruby-tests-rspec-minitest"
  date: '2024-08-12'
---

# TestProf II: Factory Therapy for Your Ruby Tests

TestProf's factory-focused tools diagnose and eliminate the cascade of unnecessary database records created by nested factory associations, making factories competitive in speed with fixtures.

## Installation

- Add `gem 'test-prof'` to the `:test` group in `Gemfile` — the only required setup
- Works with both RSpec and Minitest without framework-specific configuration
- All profilers activated via environment variables, no code changes needed

## Measuring Factory Time with EventProf

- `EVENT_PROF="factory.create" bundle exec rspec` — tracks time spent in every `FactoryBot.create` call
- Output shows total factory time, percentage of overall test time, total event count, and top-5 slowest suites
- Real-world finding: 85% of total test time occupied by factory creation — not uncommon in factory-heavy suites
- Reports top spec files by factory time with record counts per file: e.g., `UsersController — 00:10.119 (581 events / 248 examples)`
- Works with Minitest via the same `EVENT_PROF` env var interface

## Understanding Factory Cascades

- Factory cascade = uncontrollable creation of excess records through nested factory associations
- Example: `create(:comment)` with associations for `author`, `answer`, `question`, `account` creates **10 database records** for a single top-level call
- Cascade breakdown: comment(1) + author(1) + account(1) + answer(1) + author(1) + account(1) + question(1) + author(1) + account(2) = 10 records
- `create_list(:comment, 10)` multiplies this: 100 records for 10 comments
- Associated models created through `after(:create)` callbacks make cascades even worse — never use AR callbacks to create associations in factories
- The cascade can be visualized as a tree (factory tree): each node is a factory invoked by its parent

## FactoryProf: Finding Cascade Culprits

- `FPROF=1 bundle exec rspec` — runs FactoryProf, listing all factories with `total` and `top-level` usage counts
- `total` = all invocations including those from other factory associations; `top-level` = only explicit `create(...)` calls in tests
- A large gap between `total` and `top-level` for a factory indicates it is being invoked heavily as a cascade dependency
- Example: `account` factory with total=1298 but top-level=2 means it's almost always created implicitly via associations

## FactoryFlame: Interactive Cascade Visualization

- `FPROF=flamegraph bundle exec rspec` — generates an interactive HTML flame graph at `tmp/test_prof/factory-flame.html`
- Each column = a factory stack (pre-order traversal of the factory tree flattened to a list)
- Column width = frequency that stack appeared in the test suite — wider means more frequent cascade
- Root cell shows total number of top-level `create` calls
- "Skyscraper" shaped report = many deep cascades (bad); "flat Dutch countryside" shape = minimal cascades (ideal)
- Factory stacks are built: top-level `create(:x)` initializes a new stack; every nested factory call pushes to it

## Fixing Cascades: Explicit Associations

- Remove all implicit associations from factory definitions; require callers to pass them explicitly:
  ```ruby
  factory :comment do
    sequence(:body) { |n| "Comment ##{n}" }
    # no author or answer declared
  end
  create(:comment, author: user, answer: answer)  # explicit
  ```
- Pro: factories become maximally lean and fast
- Con: factories lose ergonomics — every test must specify all required associations
- Best practice: always remove *optional* associations from factories; be selective about required ones

## Fixing Cascades: Association Inference

- Infer one association from another when they share a relationship (useful for denormalized data):
  ```ruby
  factory :question do
    author
    account { author&.account }  # inferred from author
  end
  ```
- Use `after(:build)` callbacks with `transient` attributes for bidirectional inference (if author set, infer account; if account set, infer author)
- Tradeoff: efficient but makes factories harder to read; suitable for core tenant/ownership relationships

## FactoryDefault: Implicit Association Reuse

- `create_default(:account)` — creates a record *and* registers it as the default for that factory type
- Subsequent `create(:author)` or `create(:question)` calls within the same example group will reuse the default account implicitly without modifying factory definitions
- No factory code changes needed — only test code changes (`create` → `create_default` for top-level shared records)
- `FACTORY_DEFAULT_PROF=1 bin/rspec` — profiler that identifies which associated factories are candidates for `create_default`:
  ```
  factory   count  total time
  user      17     00:12.010
  user[admin] 15   00:11.560
  Total associations created: 33 / Total uniq: 3
  ```
- Best used for top-level tenant/shared entities (e.g., account in multi-tenancy apps); keep `create_default` calls at the top of test groups
- Introduce carefully — adds implicit magic that can hurt test readability

## AnyFixture: Factory-Generated Persistent Fixtures

- For factories used in nearly every test (e.g., `room` and `user` appearing in 524/524 examples), create them once using `AnyFixture`
- `fixture(:room) { create(:room) }` — generates the record once per suite run and caches it; AnyFixture cleans the database at the end of the run
- Integrates with RSpec shared contexts for reusable fixture setup:
  ```ruby
  RSpec.configure do |config|
    config.before(:suite) do
      fixture(:room) { create(:room) }
      fixture(:user) { create(:user, room: fixture(:room)) }
    end
  end
  ```
- Activate per-group via shared context tags: `describe CitiesController, :user do`
- Effect: `room` and `user` factory `top-level` usage drops from 516/549 to 1/1 — total records created plummets
- Best of both worlds: factory DSL for data definition, fixture speed for data loading

## Factories vs Fixtures: A Synthesis

- Factories: flexible, maintainable, easy to evolve with schema changes; default choice for most teams
- Fixtures: fast (loaded once), but brittle (static YAML, hard to keep in sync with schema)
- TestProf's position: use factories for flexibility, but wrap hot paths with AnyFixture or `before_all` to get fixture-level performance
- Factory-generated "fixtures" via AnyFixture remove the false dichotomy between the two approaches
