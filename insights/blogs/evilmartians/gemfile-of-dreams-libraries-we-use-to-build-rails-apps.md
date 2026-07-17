---
type: insight
title: "Gemfile of Dreams: The Libraries We Use to Build Rails Apps"
description: "Evil Martians' curated 2024 Rails gem stack covering authentication, authorization, configuration, background jobs, real-time, testing, database, frontend, service objects, and monitoring"
resource: "https://evilmartians.com/chronicles/gemfile-of-dreams-libraries-we-use-to-build-rails-apps"
tags: [rails, gems, ruby, architecture, testing, authentication, authorization, background-jobs, real-time, database]
timestamp: "2026-03-02"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/gemfile-of-dreams-libraries-we-use-to-build-rails-apps"
  date: '2024-05-28'
---

# Gemfile of Dreams: The Libraries We Use to Build Rails Apps

Evil Martians' regularly-updated opinionated gem stack for Rails apps — covering every layer from authentication to monitoring, with rationale for choosing less-popular alternatives over Rails defaults.

## Authentication

- `devise` is the de facto standard — "nine out of ten readers have Devise in their bundles" — but carries significant magic and complexity
- `sorcery` is the Evil Martians alternative: less magical, pluggable architecture, explicit over implicit — recommended for new projects
- `has_secure_password` (Rails built-in) is the minimal option: use when auth needs are simple and a full gem is overkill
- `rodauth` is the most powerful and standards-compliant option — recommended for complex auth requirements (multi-factor, OAuth)
- For API-only apps: JWT via `jwt` gem + `anyway_config` for secret management; avoid stateful session overhead

## Authorization

- Historically: `pundit` — policy objects with a clean, minimal API
- Current recommendation: `action_policy` — "Pundit on steroids" with caching, scopes, memoization, and better performance
- `action_policy` provides composable policy chains: `policy_for(record).apply(:manage?)`
- Official GraphQL integration: `action_policy-graphql` gem wires policies into `graphql-ruby` type definitions
- Policy objects in `app/policies/` — one file per resource, fully testable in isolation
- `pundit` is still valid; `action_policy` is preferred for new projects due to built-in caching and Rails 7+ compatibility

## Configuration Management

- `anyway_config`: typed configuration classes that load from ENV, YAML, and Rails credentials
- Define config classes: `class AppConfig < Anyway::Config; attr_config :api_key, :timeout; end`
- Replaces raw `ENV[]` access throughout the codebase — configuration is validated at boot time
- Supports multiple environments, per-environment overrides, and secret backends
- Avoids "ENV hell" — all config in one place, discoverable, documented
- Works with `dotenv` for local development; integrates with Rails credentials for production secrets

## Service Objects and Domain Logic

- `dry-initializer`: declarative, typed constructor parameters for service objects with coercion
- `dry-monads`: Result objects (`Success`/`Failure`) work exceptionally well with Ruby 3 pattern matching
- `dry-effects`: algebraic effects for managing side effects — advanced option for complex service pipelines
- `retriable`: retry logic with exponential backoff for external API calls: `retriable(on: Faraday::Error) { ... }`
- `nanoid`: generate URL-safe unique IDs (shorter than UUID) — useful for public-facing record identifiers
- `rubanok`: params-based transformation DSL for filtering/sorting in controllers (see dedicated article)

## Background Jobs

- `sidekiq`: the industry standard for high-throughput background processing — requires Redis
- `good_job`: PostgreSQL-backed job processing — no Redis required, decent feature set for typical apps
- `solid_queue`: Rails 8's built-in DB-backed queue (backed by MySQL or PostgreSQL) — zero infrastructure
- Evil Martians preference: `good_job` for PostgreSQL shops (no extra infrastructure), `sidekiq` for high-volume
- `sidekiq-fair_tenant` (Evil Martians gem): fair multi-tenant prioritization of Sidekiq jobs
- `sidekiq-grouping`: buffer and batch enqueued jobs — useful for high-rate, non-urgent processing like re-indexing

## Real-Time and WebSockets

- `anycable-rails`: drop-in Action Cable replacement with at-least-once delivery, resumable sessions, and horizontal scaling
- `anycable-rails-hotwire`: integrates AnyCable with Turbo Streams for Hotwire apps — signed streams, presence
- `kredis`: typed, structured data in Redis — arrays, enums, counters, flags as first-class Rails attributes
- Feature flags / toggles: `flipper` for database-backed feature flags with UI; `feature_toggles` for simpler needs
- `redlock`: distributed Redis-backed locking — prevents race conditions in multi-process deployments

## Database and PostgreSQL

- `pg_trunk`: manages PostgreSQL objects (views, functions, triggers, types) via ActiveRecord migrations
- `store_model`: wraps JSON/JSONB columns as ActiveModel-like objects with typed attributes and validations
- `store_attribute`: typed accessors on `hstore`/JSONB store columns: `store_attribute :settings, :theme, :string`
- `activerecord-postgres_enum`: maps PostgreSQL enum types to Rails string enums — database-level constraints
- `active_record_doctor`: detects database issues (missing indexes, incorrect nullability, extraneous indexes)
- `isolator`: raises an error when non-atomic operations (HTTP calls, jobs) happen inside DB transactions
- `evil-seed`: creates partial anonymized database dumps using model relations — safe for staging/development

## Frontend and Asset Pipeline

- `vite_rails`: Vite as the Rails asset pipeline — "the best build tool for Rails" — fast HMR, modern JS
- `view_component`: encapsulated, testable UI components — each component is a Ruby class + template
- `view_component-contrib` (Evil Martians): meta-gem adding extra tooling and patterns for `view_component`
- `pagy`: the fastest, most memory-efficient pagination gem — replaces `kaminari` and `will_paginate`
- `alba`: fast JSON serializer — significantly faster than `active_model_serializers` or `blueprinter`
- Modern asset choice: `propshaft` + `importmap-rails` for apps that don't need complex JS bundling

## Monitoring and Observability

- `yabeda` (Evil Martians): Ruby instrumentation framework — metrics, counters, histograms for Prometheus/DataDog/NewRelic
- `yabeda-rails`, `yabeda-sidekiq`, `yabeda-anycable`: framework-specific yabeda plugins for automatic instrumentation
- `lograge`: structured single-line request logging — replaces Rails' multi-line log format for log aggregation
- `sentry-ruby` + `sentry-rails`: error tracking with full Rails context capture
- `rack-attack`: request throttling and IP blocking — protects against brute force and DDoS
- `bullet`: detects N+1 queries and unused eager loading in development

## Testing

- `rspec-rails` + `factory_bot_rails`: Evil Martians are RSpec fans; factories preferred over fixtures
- `test-prof` (Evil Martians): profiling and optimization toolbox for slow test suites — `FactoryProf`, `RubyProf` integration
- `capybara` + `cuprite`: system tests without Selenium — `cuprite` uses Chrome DevTools Protocol directly
- `rubocop` + `rubocop-rails` + `rubocop-rspec`: static analysis; `standard` gem for opinionated defaults
- `webmock`: HTTP request stubbing in tests — prevents accidental external calls
- `timecop` or `ActiveSupport::Testing::TimeHelpers`: freeze/travel time in tests for temporal logic
