---
type: insight
title: "Miguel Conde & Peter Compernolle: Inside Gusto's Rails Biolith"
description: "How Gusto runs two Rails monoliths — a 'biolith' — at 600+ engineer scale, using Packwerk, Sorbet, and service-layer patterns to enforce domain boundaries without going full microservices."
resource: "https://podcast.rubyonrails.org/2462975/episodes/18061147-miguel-conde-peter-compernolle-inside-gusto-s-rails-biolith"
tags: [architecture, monolith, packwerk, sorbet, domain-boundaries, event-driven, rails-at-scale, service-layer, hipaa, graphql]
timestamp: "2026-03-02"
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/18061147-miguel-conde-peter-compernolle-inside-gusto-s-rails-biolith"
  date: 2025-11-03
---

# Miguel Conde & Peter Compernolle: Inside Gusto's Rails Biolith

Gusto operates two Rails monoliths — a "biolith" — at 600+ engineer scale, with patterns for enforcing domain boundaries, taming god objects, and progressively extracting services without the operational overhead of full microservices.

## What Is a Biolith

- A biolith is two monoliths rather than one: ~80% of code/engineers in the main app, ~20% in a separate benefits app called Hawaiian Ice (HI)
- The benefits monolith was split out before Peter joined, primarily for HIPAA compliance — all PHI (Personal Health Information) lives in a separate data store, inaccessible from the public internet by default
- Rails didn't support multiple databases at the time, so a second app was the practical solution; this turned out to be a lucky architectural decision
- HI gives the benefits team a smaller, faster-moving codebase — easier to reason about than the ~12-year-old main monolith
- The two apps communicate via GraphQL for front-end data; they have progressively moved from tight runtime coupling (circular data syncing) to eventual consistency with no runtime dependencies
- Over five years: tightly coupled pair of apps → very loosely coupled pair of apps

## Extracting Services from the Main Monolith

- Miguel leads extraction of the "time" product (time off, scheduling, time tracking) — scheduled to become the first extracted service from the main monolith
- The main monolith is ~11–12 years old; changes risk unknown propagating side effects across deeply coupled code; a locked deploy pipeline blocks all teams, even unrelated ones
- Extraction boundary criteria: can this subsystem tolerate eventual consistency from its dependencies? If a piece of data is required synchronously for the system to function, it belongs inside; if it can be an async side effect, it can be a separate system
- The time domain was carved into three atomic units — scheduling, time tracking, time off — each operable independently despite shared communications
- Packwerk helped identify external dependencies during extraction: first for isolation within the monolith (preventing direct cross-pack model calls), then to generate a list of public Ruby APIs that must be migrated to Kafka or GraphQL before extraction can complete

## Packwerk + Sorbet for Enforcing Boundaries

- Ruby defaults to public visibility for everything — years of unintentionally public APIs accumulate; Packwerk surfaces these relationships at CI/build time
- Sorbet (static typing) multiplied Packwerk's value: typed signatures force developers to declare the concrete type of arguments and return values, making cross-pack dependencies visible and auditable
- Peter's analogy: Sorbet + Packwerk is like bulldozing a mountain of dirt into hills — you can see hotspots and dig into them, rather than facing undifferentiated complexity
- Gradual Sorbet adoption is the only practical path at this scale: per-file strictness levels (`ignore`, `false`, `true`, `strict`); teams add types to hotspots first, not the whole app at once
- Sorbet enables safe refactoring at scale: removing a method surfaces all 17 callers instantly, just like a compiled language would — critical when modifying a 12-year-old codebase
- Meta-programming is effectively forbidden on benefits (HI); any that exists is encapsulated in gems with well-defined APIs

## Service-Repository Pattern and Immutable Structs

- Time team enforces a strict service-repository pattern: models (ActiveRecord) stay as thin as possible — only basic presence validations, no business logic; all business logic lives in the service layer
- Services are the sole public API: `get_schedule`, `modify_schedule`, etc. — callers must go through the service, never touch models directly
- Service methods return Sorbet Structs (immutable) rather than mutable ActiveRecord objects, preventing downstream mutation of data that the service doesn't control
- Directory structure: `models/` → thin AR layer, `services/` → all business logic and external calls, `lib/` → internal Rake tasks and tooling, `graphql/` → dumb authorization + signature translation layer
- Packwerk + Sorbet enforce this: CI can detect any pack reaching around the service layer directly to a model

## Explicit ActiveRecord and Published Model Builders

- Peter open-sourced `explicit_active_record` (at rails-at-scale) — a concern that raises an error on any write to the record unless the caller uses `with_explicit_persistence`, passing in the specific instance
- This pattern makes all write sites grep-able: search `with_explicit_persistence` to find every place modifying a legacy god model, enabling strangler-fig refactoring
- ActiveRecord models are named with a `Record` suffix by convention (e.g., `PolicyRecord`) and marked private to their owning namespace — consumers must use the service API to get data
- "Published Model Builders" (internal, not open-sourced): a pattern where consumers define a Sorbet Struct subclass listing only the attributes they need; the owning pack decides which attributes to expose — builds a read-only snapshot from the god model, prevents writes, and teaches the team which attribute groups cluster together for future decomposition
- An employee model with 15+ attributes can be decomposed into `EmployeeDemographics` (name, address, birthday) and `Dependents` modules — consumers include only what they need, surfacing actual usage patterns

## Temporal Data and Bi-Temporal Tables

- All time-domain tables are temporal by nature; many are bi-temporal: `effective_start/effective_end` (when the data takes hold in the real world) and `version_start/version_end` (when the system recorded that state)
- Bi-temporality enables retroactive corrections: "what did the system think this was at time T?" vs. "what is the authoritative value as of date D?" — critical for payroll audit trails and disputed time sheets
- Benefits domain confronts the same dimension-of-time problem: a benefits submission process can span 3+ months; storing only an employee ID is ambiguous — address or demographics may have changed, affecting carrier eligibility
- Benefits uses denormalization for data that must be snapshotted at submission time (e.g., address at enrollment), and effective-dating for data that changes legitimately during the window
- Paper trail is used for audit, not for "what was the data at time T" queries — it doesn't perform well enough at scale for runtime use

## Eventual Consistency and Event Architecture

- Moving to eventual consistency removes runtime cross-service dependencies: services emit events (currently via an internal eventing system being migrated to Kafka), consumers update their own tables asynchronously
- `after_commit_everywhere` gem (by Evil Martians) solves a critical monolith problem: a service method may be called inside a parent transaction; Kafka/event emission inside that method must not fire if the parent rolls back; the gem defers block execution until the outermost transaction commits
- Sidekiq's Transactional Push uses `after_commit_everywhere` under the hood, but doesn't support multiple databases — HI has two databases and must manually decide which DB's commit to anchor on
- Kafka introduction created a new local dev dependency: if a core flow now emits a Kafka message, local dev fails without a running broker — tooling is catching up to architectural decisions
- The goal: services built to tolerate dependency unavailability — background jobs queue writes and retry; UI shows degraded states (e.g., a padlock icon) rather than hard failures when a sensitive data store is unreachable

## Company Pool and Local Development at Scale

- "Company Pool": a system that scrubs production data of all sensitive fields while preserving company shape (number of employees, associations, etc.) — limited to 25 companies locally; gives realistic data for development without real PII
- Every new column must declare sensitivity at CI time: sensitive columns get sanitization functions (default bogus values; custom functions for format-preserving fakes like SSNs); legal and compliance review changes to sensitive-column handling
- Three employee/company identifiers in the data warehouse, chosen based on sensitivity level, to prevent cross-domain re-identification
- "Demo Scenarios": scripts that build up a full universe of data (factory-bot backed) for product/design review in ephemeral environments; also used locally to simulate large-company edge cases (e.g., 1,000-employee pagination test)
- Extraction complicates Company Pool: it was designed for a single database; new services have no local AR models to map to, and cross-service factory-bot calls will need to become network calls — currently being redesigned

## GraphQL Federation Trade-offs

- Front-end is React + TypeScript SPA backed by GraphQL federation; GraphQL schema changes cannot be committed simultaneously with UI changes (CI enforces this)
- GraphQL federation lets front-end developers ignore which service resolves which field — valuable for velocity, but obscures fault-tolerance requirements as the number of backing services grows
- Peter's concern: a page depending on 5 services needs explicit degraded-state design for each combination of availability; GraphQL makes it easy to skip that thinking until failures happen in production
- Miguel: REST controllers absorb dependency failure at the service layer; with GraphQL, the UI becomes the caller and must handle partial resolution failures — e.g., a hard-deleted employee in one service that another service still references by ID
- GraphQL schema changes are decoupled from UI deploys via CI constraint — prevents broken front-ends from schema changes that haven't propagated yet

## Testing Strategy and Observability

- Three testing levels: unit (edge cases + happy path for individual functions), integration (GraphQL layer + service wiring), end-to-end (headless browser smoke tests for critical flows)
- Extraction breaks the existing integration test model: tests rely on factory-bot helpers from the monolith that won't be available in extracted services; end-to-end tests assume a monolith boot — being redesigned
- Quarterly engineering sentiment surveys track CI speed, documentation quality, and code comprehensibility by team; broken down by team to expose localized pain rather than drawing false org-wide conclusions
- Datadog SLOs applied to both product endpoints (latency, error rate) and foundation metrics (CI duration, deploy frequency, survey trend direction)
- Cyclometric complexity of diffs, code throughput per engineer, and deploy frequency tracked as objective counterweights to subjective sentiment data
