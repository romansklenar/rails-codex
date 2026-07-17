---
type: insight
title: "Jay Tennier: How Testing Platform Rainforest QA Tests Itself"
description: "Jay Tennier walks through how Rainforest QA — a browser-based test execution platform — applies its own product to test itself, and the hard-won architectural lessons from running a long-lived Rails monolith through multiple team contractions."
resource: "https://podcast.rubyonrails.org/2462975/episodes/18317355-jay-tennier-how-testing-platform-rainforest-qa-tests-itself"
tags: [testing, monolith, background-jobs, data-management, api-design, third-party-integration, team-scaling, activerecord]
timestamp: "2026-03-02"
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/18317355-jay-tennier-how-testing-platform-rainforest-qa-tests-itself"
  date: 2025-12-09
---

# Jay Tennier: How Testing Platform Rainforest QA Tests Itself

Jay Tennier (Engineering Manager at Rainforest QA) explains how a platform that sells browser-based test execution applies its own product at the top of its test pyramid, and shares the architectural scars accumulated over eight years of a Rails monolith surviving team sizes from 50 engineers down to 7.

## Rainforest QA's Stack and Architecture

- Core product: a Rails monolith powering all back-end logic, with a fully separate React app (split out ~8 years ago) making HTTP requests to Rails APIs built with Grape
- VM infrastructure: dedicated servers at Leaseweb (US) and Hetzner (Germany) running ~20 VMs each across ~200 servers; US servers added specifically to reduce latency during interactive test authoring
- Supporting Rails services: VManager (VM lifecycle management) and VControl (low-level OS interaction with VMs), kept separate because they are not user-facing
- Non-Rails services: an Erlang service for tester job dispatch (mediates between available human testers and queued jobs) and a Go CLI (cross-platform distribution requirement)
- All front-end traffic is routed through the monolith — VManager and VControl are never directly exposed to the React app, which centralises auth and logging in one place
- Email and SMS inboxes for test execution (tests often trigger emails/SMS that need to be received and acted on) are thin standalone Rails apps, primarily used for their GoodJob admin UI

## Background Job Architecture and the Q Classic Legacy

- Most services have migrated to GoodJob; the main monolith is split approximately 50/50 between GoodJob and Q Classic
- Q Classic is a database-backed job processor created at Rainforest and open-sourced when no mature database-backed alternative existed; it is now unmaintained — the org no longer actively maintains it, so Rainforest forks and versions it privately via Q Classic Plus (a wrapper adding transactional semantics)
- The team is evaluating Solid Queue (Rails 8) as a path to consolidate onto a single maintained job backend rather than completing a partial migration to GoodJob
- Lesson: building an internal gem for infrastructure needs works in the short term but creates orphaned dependencies when the team that built it shrinks or leaves

## How Rainforest Tests Rainforest

- Test pyramid: ~10,000 RSpec unit/integration specs at the base; ~220 Rainforest browser tests at the top
- The same 220 Rainforest tests run against both back-end and front-end deployments — any release to either layer triggers the full Rainforest suite
- The monolith's admin (Haml templates, Bootstrap, legacy CoffeeScript) still has view-level RSpec tests; these are being migrated to system tests because HTML view tests are fragile and expensive to maintain
- Rainforest's own testing philosophy: tests execute against real VMs with a real mouse, using image matching to find elements rather than hardcoded DOM selectors — more resilient to UX changes but scoped to what is visually rendered

## The "Wet Tests" Philosophy

- Jay advocates for explicit, readable ("wet") RSpec tests over heavily DRY tests built with nested `context`, `let`, and `subject` blocks
- Problems with deeply nested DRY specs: the `subject` is memoized (calling it twice does not re-execute), `let` blocks are overwritten across contexts without clear indication, and by line 2,500 of a 3,000-line spec file you are tracking 6 contexts with a mutated subject in your head
- Generic variable names (`client`) are overwritten by context blocks and become indistinguishable; explicit names like `unsubscribed_client` communicate intent directly
- Preferred approach: write each example with all its collaborators stated explicitly; extract setup into well-named helper methods within the file rather than relying on DSL memoisation
- Factory Bot trade-off: useful for getting objects into a required state, but hides associations — creating a leaf-node object like a job can silently create 15 parent records, making tests slow and masking what is actually being tested
- Using Factory Bot for database seeds is a historical mistake at Rainforest — client associations were not consistently threaded through, creating orphaned records belonging to the wrong client

## API Design: Stable Public vs. Purpose-Built Private Endpoints

- Grape is the API layer for both public and private endpoints; the public API (used by the CLI and some clients) has been stable at `/api/v1` for years because breaking it was never worth the migration cost
- Private API endpoints have evolved toward purpose-built, front-end-specific endpoints rather than generic RESTful resources — this avoids the N+1 of fetching a resource then fetching related resources in follow-up requests
- The trade-off: private endpoint proliferation without documentation (no Grape/Swagger setup for private routes); the small team compensates by directly asking front-end engineers which endpoint they use
- GraphQL was prototyped once (~8 years ago) and abandoned; at 7 engineers (2 front-end, ~2.5 back-end, 1 ops), the team is small enough to communicate directly and iterate on specific endpoints rather than maintaining a schema layer

## Data Retention, Deletion, and the Two-Terabyte Problem

- Database size: over 1 TB, approaching 2 TB — accumulated because everything was soft-deleted and no data retention policy was ever formally defined
- Key insight: "if you don't have a data retention policy, your policy is to retain all data forever" — an absence of policy is itself a policy that must be consciously changed
- Rainforest's adopted policy: client data may be deleted within 90 days of account closure; communicating this to clients and enforcing it required significant upfront product and engineering work
- Client de-provisioning uses the dry-monads Result pattern to sequence deletion steps (edges first, then parent records) with guaranteed propagation of failure up the call stack
- S3 objects were not tagged with client IDs, so deletion required fetching all object keys from the database and deleting them individually — background jobs for some clients ran for two weeks
- Multi-tenancy (separate database per client) was considered but rejected as too expensive; the appeal was trivial client data deletion, but the cost of running per-client database instances outweighed the benefit

## Third-Party Service Coupling and the Adapter Pattern

- Labrador (metrics, acquired by SolarWinds) sent a shutdown notice; because calls were scattered across all services without an adapter, replacing it required finding every call site across the entire codebase
- Amplitude was replaced by Mixpanel; routing through Segment was supposed to abstract this but was not implemented consistently
- Current practice: any third-party service call should be wrapped behind a namespace named after what the service *does*, not what the vendor is — e.g., a payments adapter should be named `PaymentProcessor`, not `Stripe`, so that vendor replacement only requires changes inside the adapter
- Lint rule idea: flag any direct vendor gem usage outside a designated adapter directory — keeps coupling visible and architectural violations immediately apparent
- The business case for adapters: vendor lock-in is not just a technical risk; pricing changes, acquisitions, and shutdowns are regular events, and the engineering cost to switch often exceeds the monthly savings, causing teams to stay on inferior platforms indefinitely

## Microservices, Consolidation, and the Integrations Warning

- An Integrations service (Slack, Jira, Facebook notifications) was extracted as a separate app at "peak microservices"; it was pulled back into the monolith just before Jay joined
- Benefit of consolidation: integrations can now be changed and shipped in a single deployment without coordinating two release pipelines
- Cost of consolidation: the service was written with a different abstraction philosophy — deeply indirected, with its own model-layer lookalikes — and is now fully unwalled from the main app, making it a well-known hazard zone for new engineers
- A Phoenix LiveView service ("Oracle") used for ML model training data was shut down after the team that built it departed; keeping unmaintained polyglot services alive creates ongoing ops overhead without proportional value
- Standing rule at Rainforest: if nobody will take ownership of a service and it is not actively delivering product value, delete it

## Team Scaling, Hiring, and Rails Culture

- Engineering team trajectory: ~40–50 at peak, down to ~15–20 after first contraction, now 7 — decisions made for a 50-person team persist as debt for a 7-person team
- At current size, Jay prefers to hire domain-expert Rails engineers rather than strong generalists unfamiliar with Ruby — a 7-person team cannot absorb the mentoring overhead needed to bring a non-Rails developer up to idiomatic Rails code quality
- Risk of hiring outside the ecosystem: developers who dislike Ruby may produce Rails-in-name-only code (correct structure, non-idiomatic Ruby), and there is no team bandwidth to correct it through PR review
- Recommended books: Avdi Grimm's *Confident Ruby* and *Exceptional Ruby* (structuring methods and handling errors idiomatically); Michael Feathers' *Working Effectively with Legacy Code* (finding seams to break dependencies — actively used for the current payment processing refactor)
- Active Record is identified as Rails' single most valuable feature: the ORM's expressiveness, recent Arel improvements for composable query building, and ActiveModel's serialisation and column-level wrapping capabilities justify the framework choice above all else
