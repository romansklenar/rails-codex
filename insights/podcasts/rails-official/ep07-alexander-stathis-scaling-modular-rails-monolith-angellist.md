---
type: insight
title: "Alexander Stathis: Scaling a Modular Rails Monolith at AngelList"
description: "How AngelList evolved a Rails monolith into a modular engine structure using Packwerk, Sorbet, and explicit service-layer patterns to manage a deeply interconnected financial domain."
resource: "https://podcast.rubyonrails.org/2462975/episodes/17978596-alexander-stathis-scaling-a-modular-rails-monolith-at-angellist"
tags: [rails-engines, packwerk, sorbet, modular-monolith, background-jobs, graphql, service-objects, angellist]
timestamp: "2026-03-02"
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/17978596-alexander-stathis-scaling-a-modular-rails-monolith-at-angellist"
  date: 2025-10-21
---

# Alexander Stathis: Scaling a Modular Rails Monolith at AngelList

AngelList's principal software engineer Alexander Stathis explains how a ~40-person team tamed a complex financial Rails monolith — merging a microservice into a Packwerk-enforced engine structure, adopting Sorbet at scale, and deliberately avoiding Rails "magic" to keep code legible across a constantly churning team.

## Monolith Architecture and Engine Structure

- Core product is a Rails monolith with a few floating microservices (authentication, etc.); frontend is Next.js apps co-located in the same repo under `/frontend`, Rails app under `/backend`
- One major microservice was absorbed back into the monolith as a Rails engine after the two became too tightly coupled across the network boundary — easier to unwind entanglement within a single repo than across an API
- Multiple small products are also shipped as separate Rails engines within the same monolith application
- Monolith uses Packwerk (originally built at Shopify) as a static analysis tool to enforce dependency boundaries between engines/modules in CI — catches cross-boundary calls the same way a type checker catches type errors
- Dependency graph is maintained as a near-linear tree; modules call "down" the tree, never sideways or up
- Separation of concerns is domain-driven (legal/economic structures vs. marketing/pre-fund flows), not team-driven — Conway's Law is acknowledged but not the primary motivation

## Avoiding Rails Magic and Service-Layer Patterns

- Deliberately avoids ActiveRecord callbacks because they create implicit side effects that are hard to trace without deep Rails internals knowledge; incoming engineers unfamiliar with Rails find callback chains especially opaque
- No heavy use of multiple inheritance, deep `include` chains, or metaprogramming — code is written to be readable without knowing Rails internals
- Business logic lives in `app/services` as modules with class methods (not instantiated service objects), keeping the style close to functional/procedural
- Typical mutation flow: GraphQL mutation → thin controller → `WidgetService::Create.create(...)` → model — no fat model, no fat controller
- Sequential calls within the service layer substitute for callbacks; async side effects (cache updates, index syncs) are explicitly kicked off as Sidekiq/GoodJob jobs at the end of the service method
- Uses `create!` (bang methods) and transactions for operations that must stay consistent; prefers explicit `ActiveRecord::Base.transaction` blocks narrowly scoped to only the records that must be atomic
- Nested transactions are automatically flattened by Rails/Active Record — deep failures unroll the entire outer transaction, which can cause subtle inconsistent states; mitigation is keeping transaction blocks as narrow as possible

## ERD-First Domain Modeling

- Financial/legal domain is highly graph-connected; getting the ERD right is treated as a prerequisite to correct business logic — "if you get the ERD right, the code falls out of it"
- Models map closely to legal and economic contracts: AngelList tracks complex fund/LP/GP structures where even edge-case legal interpretations must be supported
- Inconsistent state is more expensive to recover than to prevent — prefer loud failures (raising exceptions, surfacing validation errors) over swallowing errors and leaving half-created object graphs
- Multiple databases in play: older MySQL databases being migrated to Postgres; separate service databases were preserved when the microservice was absorbed as an engine
- Multi-database transactions require stacking transactions across connections, adding complexity; this is a known pain point and one motivation for keeping transaction scopes narrow

## Sorbet and Type Safety

- Sorbet is used heavily; it changes the way Ruby is written — less metaprogramming, fewer `ActiveSupport::Concern` `included` hooks, more explicit class methods on modules
- Sorbet's static analyzer cannot easily introspect `class_eval` or dynamic DSLs, so heavy reliance on Rails magic becomes incompatible with full type coverage
- Broad refactors are dramatically safer with Sorbet — commenting out a method and running `srb tc` immediately surfaces every call site
- Sorbet is disabled in test files because FactoryBot's `create(:factory_name)` DSL is not easily representable in RBI files
- Tapioca (Shopify's RBI generator) is used for generating type definitions; run via `make rbi` in Makefiles to regenerate after model changes
- The default ActiveRecord Tapioca compiler generates all attributes as nullable (100% type-safe but ergonomically painful) — every persisted-record assumption requires `T.must(...)` or a nil check

## Boba Gem: Community Tapioca Compilers

- Stathis created the `boba` gem (a play on "boba" and "tapioca") to host custom Tapioca compilers that Shopify declined to accept into the main Tapioca repo
- Primary motivation: AngelList's ActiveRecord compiler needed non-nullable types for attributes validated as present at the database level, eliminating tens of thousands of `T.must` assertions
- Boba ships compilers for ActiveRecord (non-nullable variant), Kaminari, money, state_machine, paper_clip, and others contributed by the community
- Long-term ideal: each gem ships its own Tapioca compiler as part of the gem itself, so Tapioca auto-discovers and runs it — not yet practical due to limited Sorbet adoption in the wider Ruby community

## Asynchronous Job Strategy

- No single job backend fits all workloads; AngelList runs multiple systems and considers this a deliberate choice rather than tech debt
- Sidekiq: fast fire-and-forget jobs backed by Redis; drawback is that completed/failed jobs disappear from the queue — limited post-hoc observability; also had issues with Sidekiq Unique Jobs digest getting stuck
- GoodJob: Postgres-backed, provides queryable history and an admin dashboard; drawback is poor performance under high throughput of small jobs and occasional table-level lock contention that freezes the dashboard
- Temporal (Temporal.io managed): used for complex, long-running workflows requiring guaranteed delivery, observability, and sequential activity execution; more expensive (billed per workflow run) and less ergonomic than Active Job
- Currently on Ruby 3.4 and Rails 7.2.x; also adopted Falcon in one microservice
- Would consider Solid Queue as a GoodJob replacement for fire-and-forget work after Rails 8 stabilization
- Ideal future state: Temporal for complex processing workflows, Solid Queue or Sidekiq for transient quick jobs — accepting that the right tool varies by job type

## GraphQL Ruby and N+1 Prevention

- GraphQL Ruby is the primary API layer for Next.js frontends; internal inter-service APIs use RESTful/RPC controllers to avoid GraphQL parsing overhead
- Key benefit: clients declare exactly what data they need, avoiding over-fetching on computationally expensive object graphs
- N+1 prevention via `graphql-batch` gem (written by an ex-AngelList engineer); fields are wrapped in batch loaders that lazy-evaluate and load related records as a batch rather than per-record
- Each GraphQL field has its own Datadog span via instrumentation — flame graphs make performance bottlenecks immediately visible as the longest bars in a sequential Rails execution chain
- Custom internal field wrapper auto-detects `through` associations using Rails' own preloader reflection, reducing the need to manually specify preloads on every field

## Local Development Environment and Data Management

- ASDF manages Ruby, Node, and PNPM versions per directory; Docker containerizes databases and Redis
- Tonic (self-hosted) is used for dev data: it reads production databases, scrambles/removes PII columns, subsets the data, and outputs a TAR of the database files — downloaded and swapped into local Docker containers via `make setup`
- Tonic preserves primary keys so cross-database foreign key references stay consistent across multiple services running locally
- Data setup still requires ongoing maintenance ("gardening") — new tables must be added to Tonic's subset configuration, and the snapshot must be regenerated periodically
- Stathis's principle: any dev data solution requires a designated "gardener" — one person accountable for keeping seeds/snapshots up to date; without that role the setup inevitably rots
- Team uses Linear for tracking platform and DX work; a dedicated platform team owns dev experience, CI/CD, design system, and core authentication service
