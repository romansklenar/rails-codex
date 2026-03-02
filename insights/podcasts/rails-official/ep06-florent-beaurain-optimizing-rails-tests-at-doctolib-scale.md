---
title: "Florent Beaurain: Optimizing Rails Tests at Doctolib Scale"
description: "How Doctolib cut a 7-minute engine test run to under 1 minute by returning to Rails defaults — transactional tests, fixtures over factories, and parallel minitest."
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/17891804-florent-beaurain-optimizing-rails-tests-at-doctolib-scale"
  date: 2025-10-07
tags: [testing, performance, factories, fixtures, minitest, ci, monolith, database, packwerk, flaky-tests]
---

# Florent Beaurain: Optimizing Rails Tests at Doctolib Scale

Florent Beaurain from Doctolib — home to one of Europe's largest Rails monoliths — explains how flame-graph analysis revealed that factories and database resets consumed ~80% of test time, and how returning to Rails defaults brought one engine from 7 minutes to under 1 minute.

## The Scale of the Problem

- Doctolib: 3 million+ lines of Rails code, 400–500 engineers on the monolith, 12-year-old codebase
- 84,000 tests per commit; full CI run consumes 100–130+ CPU hours
- Pipeline takes 40–45 minutes per PR; no merge queue — a red main branch shuts everyone down
- At peak parallelization: 315 CI servers launched for a single commit
- Test count grew linearly from ~5,000 when Florent joined 8 years ago, driven by culture of writing many end-to-end tests
- Running the full suite locally is impossible; test selection by diff is the primary mitigation

## Root Causes Identified via Flame Graphs

- Flame graph analysis on a single engine (~300–400 tests, M4 Max) showed ~7 minutes — vs. seconds for a vanilla Rails app with thousands of tests
- Three bottlenecks identified: database resets, factories, and accumulated test-setup "bloat"
- Database resets accounted for ~30% of unit test time — worse because Doctolib resets 10 databases per test, not one
- Factories (FactoryBot) accounted for ~50% of test time — cascade object creation, Docker-hosted Postgres on macOS compounding slowness
- Accumulated helpers and safeguards added over 12 years — each adds 1–3ms but multiplies across 80,000 tests

## Returning to Rails Defaults

- The fix was a "hard reboot": new base test classes built directly on vanilla Rails test classes with no extra configuration
- Transactional tests: replaced custom truncation logic with Rails' built-in transaction rollback strategy — each test wraps in a transaction, rolled back at end; far faster than truncating all tables
- Fixtures: began migrating away from FactoryBot back to YAML fixtures — ongoing, not yet complete
- Parallel testing: added minitest parallelization to extract additional throughput from M4 cores
- Result: one representative engine went from ~7 minutes → ~2 minutes with the new framework → under 1 minute with parallelization enabled

## Factory vs. Fixture Trade-offs

- Factories feel ergonomic but that flexibility is their main cost: cascade creation, database writes per test, non-deterministic data
- Fixtures feel inflexible (YAML, static data) but that inflexibility is their strength — deterministic, zero DB writes at test start
- Preferred middle-ground: Shopify's `factory_fixtures` gem — declare a factory that returns a tweaked version of an existing fixture (`User.like(:bob, admin: true)`), covering edge cases without full factory overhead
- Doctolib currently runs both: FactoryBot retained for compatibility, fixtures being introduced incrementally
- Fixtures as seeds: the same YAML fixture files also seed local development environments via `seeds.rb`

## CI Migration Strategy

- Chose a representative engine the team owned (no approval dependencies), recent code, moderate end-to-end coverage — not too easy, not too hard
- Proved the concept with one engine, then got org-wide buy-in from the demo
- Migration of remaining ~90% of the codebase done by one teammate (Francois) in ~3 months using search-and-replace, per-engine CI runs, and LLM-assisted migration guided by a changelog document
- Opted to maximize backward compatibility in the new framework rather than force teams to rewrite tests — traded some performance gain for faster rollout

## Flaky Test Management

- ~20,000 end-to-end tests; flakiness is the primary reason this number is no longer growing
- Nutri-score-style flakiness rating computed from main branch metrics — teams receive ranked lists of flaky tests with percentage failure rates
- Automated enforcement: a test that fails twice in a row on CI is auto-skipped and a bug ticket is filed with the owning team
- ~70–75% of flakiness traced to React SPA/Capybara race conditions: clicking elements before JavaScript finishes rendering
- `capybara-lockstep` (open-sourced by a German company): synchronizes Capybara with browser state — waits until pending Ajax and DOM mutations are settled before proceeding; significantly reduced this class of flakiness
- Future improvement: Selenium WebDriver BiDi protocol will give direct browser-state visibility, enabling more reliable synchronization without client-side patches

## Database Sharding at Scale

- Aurora Postgres; currently 10 writers, each with up to 15 read replicas — some writers have hit the 15-reader limit
- Automatic read routing: parse each query, check if it is a SELECT with no preceding write to the same tables in the same request; if safe, route to a replica; otherwise keep on the writer to avoid replication-lag staleness
- Tables are migrated between writers in domain-coherent groups (preserving joins and foreign keys), using internal tooling built to make the process repeatable
- 40 TB on the main writer; the bottleneck is IO operations per second, not storage volume
- Safe migrations enforced via `safe-pg-migrations` (open source) plus internal tooling — column renames, table renames, and many ALTER operations are forbidden; multi-step rollout is mandatory
- Migrations that would lock tables are blocked in production; teams must backfill asynchronously

## Feature Switches

- Feature switches are used for everything: rolling out new queries, enabling/disabling features per country, releasing to traffic cohorts (1%, 10%, etc.)
- Stored in the database; cached at request level and worker level — overhead is negligible in steady state
- Expiration dates are required on every feature switch; an AI-assisted workflow opens cleanup PRs and pings owning teams when switches expire
- Investigating LLM-driven auto-rollback: monitor Datadog and Sentry for 10–15 minutes after enabling a switch, then have an LLM decide whether to roll back

## Rails Upgrade Process

- Started at Rails 4→5; now current on every major release; a dedicated platform team owns upgrades
- Process: start from alpha; run `bin/rails app:update`; get CI green; link every code change to its upstream Rails commit/PR with explanation — no "it passes now, ship it"
- Backport safe preparatory changes to main before the dual-boot merge to minimize the final diff
- Dual-boot strategy: all environments (local, CI, staging, pre-prod) run the new version while production stays on the previous one until confidence is established
- Biggest upgrade friction: gems with hard-coded ActiveRecord version constraints (e.g., `bullet`) — removed rather than waited on
- Advice: read Rails source with `bundle open`; follow the diff and PR context to understand why a change was made, not just that it was made

## Packwerk and Modularization Lessons

- Doctolib adopted Rails engines (similar to Shopify's "components") to partition the monolith into team-owned packages with declared public APIs
- Packwerk added static dependency enforcement on top — violations are surfaced as CI failures
- Reality: zero-dependency packages are a chimera in a large, long-lived app; reaching zero violations requires massive refactoring that often makes code worse (forced event-driven indirection degrades debuggability)
- Packwerk is static analysis only — a package that passes Packwerk checks can still fail CI due to dynamic Ruby references that Packwerk cannot see
- Verdict: still useful, still in use; but do not expect it to enable running just one engine's tests and being confident — cross-engine coupling persists
