---
title: "TestProf III: Guided and Automated Ruby Test Profiling"
description: "Updated TestProf profiling playbook, TestProf Autopilot CLI for scripted multi-run profiling, MemoryProf for RSS/allocation tracking, and Vernier integration for next-generation flamegraph analysis"
source:
- type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev, Travis Turner"
  url: "https://evilmartians.com/chronicles/test-prof-3-guided-and-automated-ruby-test-profiling"
  date: '2024-08-13'
tags:
- ruby
- rails
- testing
- rspec
- test-performance
- testprof
- profiling
- ci
- automation
- memory-profiling
- vernier
- stackprof
---

# TestProf III: Guided and Automated Ruby Test Profiling

TestProf's third installment introduces a formal profiling playbook and the TestProf Autopilot CLI for scripted, automated multi-run profiling across large test suites.

## The TestProf Profiling Playbook

- A formal, repeatable framework for approaching slow test suites developed from dozens of Evil Martians Rails client engagements
- Full playbook available at `test-prof.evilmartians.io/playbook`
- Step 1: "Eye profiling" — review application configuration and `Gemfile` for known slow gems/patterns before running any tools
- Step 2: Analyze `StackProf` samples via Speedscope to identify hot call paths and suspicious callbacks
- Step 3: Run TestProf's own profilers in sequence: `TagProf` → `EventProf` → `FactoryProf` → targeted fixes
- Core finding from the series: `let_it_be` vs `let!` and `before_all` vs `before(:each)` remain the highest-ROI changes after 6+ years
- Formalizing the process is the prerequisite for automation

## TestProf Autopilot: CLI for Scripted Profiling

- `auto-test-prof` — a CLI tool and gem for scripting multi-step TestProf profiling scenarios in Ruby
- Scenarios are plain Ruby scripts stored in e.g. `spec/.test-prof/`; run via: `bundle exec auto-test-prof -i spec/.test-prof/my_scenario.rb`
- Scenario DSL: `run :stack_prof, boot: true, sample: 10` — runs StackProf profiling with given options
- `save report, file_name: "stack_prof_boot"` — saves report to a named file
- `aggregate(3) { run :stack_prof, sample: 100 }` — runs the block 3 times and merges/aggregates results
- Designed to be kicked off and left unattended, freeing developers to do other tasks while profiling runs

## Autopilot: Real-World Scenario Examples

- Boot-time + sampled profiling in one script:
  ```ruby
  run :stack_prof, boot: true, sample: 10
  save report, file_name: "stack_prof_boot"
  aggregate(3) { run :stack_prof, sample: 100 }
  save report, file_name: "stack_prof_sample"
  ```
- Factory hotspot targeting scenario: run `EventProf` for `factory.create`, then compute a 50% time threshold and collect only the spec files responsible for that 50%, reducing scope from 497 files to 26 files (5% of files = 50% of run time)
- The scenario uses plain Ruby to compute: `total_run_time`, `threshold = 0.5 * total_run_time`, and iterates `report.raw_report["groups"]` until the threshold is crossed
- Result: `Selected groups: 26 / Total groups: 497` — dramatically narrows optimization scope

## Autopilot: CI Integration and Report Merging

- Run Autopilot on CI and store profiling reports as build artifacts
- `--merge` option: `auto-test-prof --merge tag_prof --reports tag_prof_*.json` — merges multiple TagProf JSON reports from parallel CI nodes into a single unified report
- Enables full-suite `TagProf` analysis across sharded CI runs without a single-process full run
- Example CI scenario: `run :tag_prof, events: ["factory.create"]` then `save report, file_name: "tag_prof_#{ENV['CI_NODE_INDEX']}"`
- Future direction: `#upload` method for cloud report storage (potentially TestProf Cloud)

## MemoryProf: Memory Usage Profiling

- New profiler added in v1.3.0 — `MemoryProf` identifies examples and groups responsible for RSS spikes or high object allocation counts
- Use case 1: optimize CI infrastructure costs by reducing per-worker memory footprint
- Use case 2: identify production memory leaks via test-environment profiling
- Activated via env var like other TestProf profilers; reports top-N examples and groups by memory impact

## Vernier Integration

- `Vernier` — next-generation Ruby sampling profiler with better multi-threading, GVL (Global VM Lock), and GC event support compared to StackProf
- TestProf integrates Vernier as a drop-in profiler via env var activation
- Key feature: `ActiveSupport::Notifications` integration — Rails events appear inline in stack traces, making it possible to see e.g. `load_config_initializer.railties` as a cause of slow boot
- Compatible with Firefox Profiler UI for interactive visualization (alternative to Speedscope)
- Real usage example: Vernier flamegraph analysis revealed `Sentry.capture_message` as the cause of an unexpected test suite slowdown

## let_it_be and before_all: Still the Core Recipe

- `let_it_be` — like `let!` but creates data once per describe/context block and reuses it across all examples; functions as a "local fixture"
- `before_all` — like `before(:each)` but runs once per group, wrapped in a transaction that rolls back after the entire group completes
- These two helpers remain the highest-impact optimizations after 6+ years across dozens of Rails applications
- `RSpecDissect` profiler (`RD_PROF=1 bin/rspec`) quantifies time spent in `let`/`let!` and `before(:each)` per suite to identify which files benefit most from migration

## Mock Suey and Future Roadmap

- `Mock Suey` gem — companion toolkit to make mocks more reliable and prevent false positives in test suites
- Planned: `test-prof-audit` — automated tool that analyzes project configuration and dependencies and suggests specific optimizations (e.g., detecting unnecessary logging, Wisper, other known slow integrations)
- AI integration: AI-assisted TestProf playbook automation is in early development ("goes amazingly well")
- TestProf v1.0 released 3+ years ago; now stable at v1.3.0/v1.4.0; v2.0 has conceptual plans but no timeline
- Core philosophy: test optimization is about narrowing the search space iteratively, not about heroic one-time refactors
