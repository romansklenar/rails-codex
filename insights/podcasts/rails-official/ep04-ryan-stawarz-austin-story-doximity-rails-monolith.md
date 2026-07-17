---
type: insight
title: "Ryan Stawarz & Austin Story: Inside Doximity's 15-Year Rails Monolith"
description: "How Doximity scaled a single Rails monolith to 100–150 engineers by adopting GraphQL Federation for mobile-safe API evolution, Packwerk for domain isolation, and pragmatic service extraction over premature microservices."
resource: "https://podcast.rubyonrails.org/2462975/episodes/17653501-ryan-stawarz-austin-story-inside-doximity-s-15-year-rails-monolith"
tags: [rails-monolith, graphql, graphql-federation, packwerk, actioncable, database-migrations, scaling, healthcare]
timestamp: "2026-03-02"
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/17653501-ryan-stawarz-austin-story-inside-doximity-s-15-year-rails-monolith"
  date: 2025-08-12
---

# Ryan Stawarz & Austin Story: Inside Doximity's 15-Year Rails Monolith

Doximity grew from ~20 Rails engineers in 2016 to 100–150 today on a single 15-year-old monolith, and the engineering decisions behind that scale — GraphQL Federation, Packwerk packs, AnyCable for realtime, and deliberately pragmatic service extraction — reveal a repeatable playbook for large-scale Rails.

## Team and Application Scale

- Doximity monolith has been in continuous development for 15+ years; Ryan joined ~2016, Austin joined within 6–9 months of Ryan
- Rails engineers touching the monolith: 100–150 (total engineering ~200)
- Engineering team was ~20 Rails engineers when Ryan and Austin joined in 2016
- The monolith contains versioned API namespaces (v1, v2, v3) that evolved independently — inconsistent type contracts across versions drove the push toward GraphQL
- Multiple separate supporting services exist alongside the monolith; all Rails apps are Dockerized so developers don't notice infrastructure dependencies at spin-up
- 42+ staging environments (one per QA engineer, shared mobile/dev sets); staging data is nightly-wiped and reseeded from sample data generators

## Frontend Evolution: Backbone → Vue → GraphQL

- Historical path: jQuery → Backbone + CoffeeScript → Vue (current) for the web SPA
- Vue was selected after a team-split prototype competition against Angular and React; Vue won because it allowed deviating from conventions without "getting ugly fast"
- Vue is used selectively — not on admin tooling, simple pages, or marketing pages where ERB/Slim templates suffice
- Doximity ships `docs-frontend` as an internal Rails engine; adding it to an app provides Vue, analytics tracking, metrics, tracing, and authentication out of the box
- Teams that don't need SPA interactivity use plain Rails templates with minimal JavaScript; Vue components are sprinkled in only where needed

## Why GraphQL: Mobile Safety and Type Contracts

- Primary driver was preventing accidental breaking changes to iOS/Android clients — REST APIs made it too easy to iterate on the backend and crash mobile without warning
- GraphQL-Ruby gem powers the implementation; graphql-batch (Shopify's batch_loader gem) is used server-side to resolve N+1 queries that arise because GraphQL field resolution order is not predetermined
- `batch_loader` defers DB queries by accumulating IDs across the resolver tree, then fires a single batched query when the result is actually accessed during JSON rendering
- REST is still used where it's the right fit; mobile developers actively prefer GraphQL because request/response types, error codes, and field contracts are explicit and validated
- GraphQL sat inside the monolith initially; teams mapped external microservice data into monolith types via gems — this required up to 4 coordinated deploys per small change

## GraphQL Federation: Escaping the Monolith Bottleneck

- Austin gave a talk on Doximity's move to GraphQL Federation at RailsConf 2023
- Trigger for federation: a database migration on one team caused a full outage for a completely unrelated team due to transitive dependencies through the monolith's shared GraphQL layer
- Federation acts as an edge router / "phone book" — each subgraph service exports its own schema; the federation layer routes incoming queries to the correct service and assembles responses
- After federation: teams ship their service, automation picks up the new schema and promotes it to staging and production — one deploy, not four
- Federation enabled service extraction that was previously impractical: services that needed monolith data to serve GraphQL can now own their own data and join the graph independently
- New products are now spun up as independent Rails apps from day one, with async data sync from the monolith, rather than being embedded first

## Monolith vs. Service Extraction Decision Framework

- Default: new work goes into the monolith and is isolated with the Packwerk gem (domain-driven packs with explicit dependency boundaries)
- Doximity built tooling around Packwerk packs so teams can do everything — models, controllers, jobs, specs — within a pack without leaving the monolith
- Spin up a separate service only when there is a compelling, written case: dedicated uptime requirement (Residency Navigator is cited — a physician residency matching tool), HIPAA isolation for patient/medical data, or a self-contained business domain with its own release cadence
- "Incubate in the monolith, extract when the business case is proven" — launching on the wrong data store twice in two months is preferable to three months of upfront infra analysis
- Austin's rule: "I don't like microservices. If it's a self-contained logical unit that serves a business purpose, it's generally a good service."

## Realtime Features: ActionCable and AnyCable

- ActionCable (with Redis pub/sub adapter) is used for admin apps and lower-scale realtime needs
- AnyCable is used for the Dialer product (Doximity's video/voice platform) where WebSocket connection continuity across Rails deploys is critical; they self-host the AnyCable Go service within their container infrastructure
- AnyCable's Go service keeps WebSocket connections open during Rails app restarts/deploys; Rails still communicates via the standard ActionCable API — the Go service is transparent to developers
- Push notifications for mobile use Firebase; most messaging features (clinical messaging) do not require true realtime because physicians send and check asynchronously — polling was tried and abandoned as too expensive
- Most of the platform deliberately does not implement realtime; product decisions are driven by actual clinician behavior patterns, not assumed requirements

## Database Migrations and Data Backfills at Scale

- Schema principle: DDL migrations only change structure; data changes are always separate asynchronous tasks (Rake or Thor tasks), never embedded in migrations
- Doximity uses the `departure` gem, which wraps `pt-online-schema-change` (pt-osc), for any production migration that would lock a table or migrate foreign keys
- Data backfill tasks can run for 2+ days; they execute as separate Kubernetes pods via the internal "Maestro" deployment platform, independent of the running Rails app
- The same backfill task is auto-triggered on all 42+ staging environments on next deploy via a platform YAML config — stress-tests the task against divergent, "bad" staging data before production
- Staging data is nightly-wiped and regenerated from seed scripts; this means staging schema is always current and data migrations don't need to handle staging history

## Developer Experience: Seed Data and One-Off Tasks

- Two-tool seed strategy: (1) seed scripts generating realistic-ish data exported as fast-reseed database snapshots; (2) `dox-tasks` internal Rails engine (development/staging only) backed by the public `rake-ui` gem providing a UI to trigger scenario-specific data tasks (e.g., inject an ad card into the local newsfeed)
- Each product team owns their domain's seed scripts, which double as fixtures in specs; the platform/SRE team orchestrates running all seeds together and capturing snapshots
- One-off Rake/Thor tasks live in a `lib/rake/one-offs/` directory — the folder name signals intent; teams clean them up monthly/quarterly but Git history preserves them
- Ryan prefers Thor over Rake for one-off tasks because of simpler CLI syntax and easier testability; one-off tasks always have RSpec specs to validate behavior before running in production

## Organizational Patterns for Consistency at Scale

- Pattern adoption is evidence-based, not prescriptive: Austin's platform team watches for recurring bugs, postmortems, and proposals before committing engineering time to a new tool or convention
- New platform tools are rolled out by recruiting 2–3 teams to implement them as real projects — this surfaces API gaps before broad adoption and creates internal champions
- Ideas propagate through: Google Sheets "needs assessments" (public, subscribable), quarterly planning proposals, and in-person company offsites where cross-team conversation surfaces duplicate problems
- Quarterly planning uses capacity math: people × weeks × 0.67 (cutting for support load and interruptions) = available person-weeks; projects are sized, ordered, and tracked against explicit "when it's done" goalposts
- Organization is intentionally flat — any engineer can contact any other engineer, including CTO/CEO; cross-team relationships built at offsites reduce coordination friction year-round
- Rails upgrades (3→4, 4→5, 5→6, 6→7, 7→8 currently in progress) are managed by Austin's platform team; working through large-app upgrade pain (e.g., cookie parsing changes between versions) is how the team builds deep Rails internals knowledge
