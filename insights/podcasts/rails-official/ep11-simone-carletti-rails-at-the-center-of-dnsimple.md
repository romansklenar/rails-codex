---
type: insight
title: "Simone Carletti: Rails at the Center of DNSimple"
description: "Simone Carletti explains how a globally distributed DNS platform keeps a single long-lived Rails app at its core — orchestrating domain and DNS registration through an interactor/service layer — while Go and Erlang handle the edge, and how a 15-person team scaled operations with Shape Up, containerization, and an interactor-driven testing strategy."
resource: "https://podcast.rubyonrails.org/2462975/episodes/18999348-simone-carletti-rails-at-the-center-of-dnsimple"
tags: [architecture, service-objects, dns, polyglot, containerization, docker, testing, shape-up, ai-tooling, structured-logging]
timestamp: "2026-07-17"
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/18999348-simone-carletti-rails-at-the-center-of-dnsimple"
  date: 2026-04-13
---

# Simone Carletti: Rails at the Center of DNSimple

Simone Carletti (CTO of DNSimple) walks through how a 15-engineer team anchors a globally distributed DNS platform — serving ~72,000 queries/sec — on a 15-year-old Rails app that acts as the single entry point for every domain and DNS operation, with Go and Erlang handling the edge.

## The Three-Language Polyglot Stack

- **Rails ~50%** — the main application: UI, API, billing, and the sole entry point for every customer interaction; data lands in PostgreSQL and jobs flow to Sidekiq
- **Go ~30%** — the **zone server**, a lightweight process that loads all DNS zones in memory and replicates data fast across edges; conceptually "a memcached built from scratch, but designed to serve DNS records"
- **Erlang ~20%** — the **name servers** (public face for DNS queries); Erlang's pattern matching lets them decompose a binary DNS packet almost by copy-pasting the RFC definition, and its concurrency/fault tolerance suits high query volume
- **Deliberate heterogeneity as a design tool**: running two name servers, two DNS providers, or two API-client languages forces you to see the design outside the constraints of any single tool — "your brain will not focus on one in particular"
- Each of the three components — Rails app, zone server (Go), name servers (Erlang) — maps to one core piece of the infrastructure, chosen because each language fits its use case naturally

## DNS Infrastructure History: PowerDNS to ErlyDNS

- Started (~2010) on **PowerDNS** with an anycast setup, keeping many instances in sync across servers
- Around **2012** hit PowerDNS limits: services began handing out hostnames (e.g. GitHub Pages `github.io`) instead of IPs, but the CNAME record can't be used at a zone apex — this drove the invention of the **ALIAS record**
- ALIAS required injecting code into PowerDNS's resolution chain via a pipeline backend; the first pipeline was in Ruby (worked poorly), then rewritten in other languages, but PowerDNS was structurally the wrong fit
- Business partner **Anthony** built a name server in Erlang as a fun project; after ~2 years it was production-ready
- **2014**: switched from PowerDNS to **ErlyDNS** (internally "ErlySimple," running on top of the open-source ErlyDNS name server); it's been the primary name-service software since, with a big activity resurgence in the last year
- PowerDNS is **still used** — only for the secondary role: AXFR zone-transfer integration (synchronizing zones to/from third-party providers), rather than reimplementing AXFR internally
- Running two independent DNS implementations surfaces RFC-compliance bugs: they recently spent ~6 months on **empty non-terminals**, discovering that primary vs. secondary returned different responses in certain cases

## Rails as the Orchestration Core

- Rails handles all UI, front-end, and back-end interaction; every DNS record, domain registration, and billing action passes through it directly or indirectly (UI or API) before propagating to the name servers
- The main app is not just front/back-end — it is the **entry point for everything** into DNSimple
- Rails stays because "it works really well" — the longer a stack runs and works, the less reason to replace it; things that didn't fit Rails were extracted rather than forced
- **APIs are now the primary entry point** — likely serving more API requests than UI requests; DNSimple's niche is automation (client libraries for up to ~9 languages), and infrastructure-as-code ecosystems (Terraform, Kubernetes) funnel through the API
- A slice of the API historically ran on **Hanami** (built by Luca Guidi while at DNSimple), mounted as a Rack app on the Rails router; predates Rails' own API-only mode (`--api`), which Rails shipped later
- Rails lets the front end, API, and async jobs **all share the same business logic** behind them

## The Interactor / Service Layered Architecture

- Started like everyone: business logic split between fat controllers and models
- Breaking point came when API v2 (on Hanami) meant a domain could be registered from **both** UI and API — logic buried in controllers couldn't be shared
- **Models** are kept thin: talk to the database, return data, no elaboration; hard rule — **no external HTTP integration goes through models** (models are the DB boundary only)
- **Interactors** (originally called "commands," for a do/undo pattern where only "do" was ever built) are the public API of the DNSimple ecosystem — one interactor per customer-facing action: register domain, transfer domain, enable/disable, sign up, unsubscribe, change card
- Controllers (UI or API) handle only authentication and permission verification, then hand the action + context (user, request type) + subject to the interactor
- **Services** are the internal API — reusable business-logic units (e.g. setting up name servers for a domain, which is shared between register and transfer); they own all external HTTP calls (registry, billing provider)
- A **Result object** — "a bag passed around with state and context" — flows service → interactor → controller; the controller inspects success/failure and serializes appropriately (API: extract & serialize the model; UI: extract into a view response)
- Migrating UI rendering from standard Rails templates toward **view models**; they built a custom view-component library before `ViewComponent` existed and now plan to switch to the maintained library to cut maintenance burden

## Domain Registration Workflow and Transactions

- Registering a domain cascades internally: first an external **registry** call to check availability (e.g. `.com` registry says available/not), then local persistence
- A **high-level PostgreSQL transaction** wraps DB work, but external side effects can't be rolled back in a DB transaction — once you tell the registry "yes, register this," there's no easy undo
- Complex flows moved from **synchronous to asynchronous workflows** — a pipeline of discrete success/failure steps executed one at a time, with explicit rollback points
- The async pipeline model also improves **error handling** (a "nightmare" otherwise) — returning meaningful error messages across many external service interactions

## Testing Strategy

- The modular interactor/service split is the biggest testing win: each responsibility is isolated and independently testable as pluggable units
- Controller tests cover only auth/negotiation; the underlying logic isn't re-tested in every controller test
- **Service abstractions** (facades over registry, billing, etc.) define their own internal API (`add card`, `remove card`, `charge customer`) — tests can cut at that layer and skip real external HTTP calls, working on the guarantee that the abstraction behaves consistently
- Caveat: isolated components can drift — integration tests against the abstraction are still needed, or "the moment you connect them together they talk a different language"
- **RSpec** at ~91–92% code coverage; would consider MiniTest for a greenfield project today (it has matured), but RSpec has served well; prefers built-in libraries until hitting their limits over "shiny" gems
- **parallel_tests** splits the suite into chunks across processes/cores automatically
- Full CI pipeline (tests + integration + container build + asset packaging + ship to CDN) runs in **~5 minutes**; tests alone ~3 minutes; linters/formatting ~30 seconds; runs even on non-deploy merges

## The 12-Year Containerization Journey

- **Three attempts over 12 years**; the third succeeded ~2 years ago when a team member took ownership with a clear north star: *"be able to run all of DNSimple on my machine"*
- Historically resisted containers because name servers are Erlang VMs that behave like their own OS and need **direct network control** — the first thing containers abstract is the network, which is exactly what they don't want abstracted
- ~20 components total (main Rails app, notifier/webhooks, zone server, name servers, separate audit-log app due to storage volume, etc.)
- **Docker Compose local dev**: one command starts the whole ecosystem, seeds the DB with base data, and in ~2 minutes gives a full local infrastructure — you can create a record in the app, watch it propagate to a local name server, and run `dig` against it locally
- Any component can be **paused** — e.g. "start everything except Rails," then run the dev Rails app locally against the containerized rest of the ecosystem
- Skepticism throughout: Simone refused to declare victory until the Rails app ran in a **production** container (the app is complex — Sidekiq, queues, API, UI, telemetry); Go binaries containerize trivially (ship a binary)
- **App changes forced by containers**: ephemeral container filesystems meant assets could no longer be deployed on the serving machines, forcing a move to shipping assets via **CDN** — a good practice they'd never been pushed to adopt
- Name servers are **still not containerized in production** (performance unacceptable) but are containerized for local dev
- **Unexpected payoff**: containerization unlocked working with **external consultants** for the first time (name server, other apps) — you can grant container access without full source access, and specialists get a real feedback loop to verify changes themselves

## Shape Up, the Rotating Bench, and On-Call Ownership

- Adopted **Shape Up** ~3–4 years ago, but customized it — Shape Up was built at 37signals for **feature** work, while DNSimple is an **operational** company facing daily ops challenges
- The **bench**: a rotating group not booked into the main build cycle, working a special queue of small (1–3 day), non-time-sensitive items; they can drop work anytime for incidents, remediation tasks, or cross-team requests, then return
- The bench doubles as a **knowledge-distribution** mechanism — exposes rotating members to components they haven't touched, without the deadline pressure of a build cycle (being refined again in 2026)
- **Categories of risk are codified**: anything putting a customer asset at risk (e.g. a domain about to expire) is a "stop the world" event — which is why bench work must be interruptible without derailing the build cycle
- Two teams: **platform** (infrastructure, ops-at-heart) and **application** (all customer-facing development, including name servers)
- **Every engineer is on-call** (24-hour rotation, replacing an old follow-the-sun model that broke down as people travel/relocate) — this drives a mindset of owning the code and product
- Work is never assigned to a lone individual — every unit of work is a **small team of ~2**, ideally pairing a subject-matter expert with someone less familiar, to avoid bus-factor-one and spread knowledge

## Documentation, AI Adoption, and Structured Logging

- Documentation lived in an internal **wiki** (per-team spaces plus a company space with SOPs, team composition); tickets serve as point-in-time documentation, the wiki as general standard docs
- Started a **2026 pilot to adopt AI internally** — because much of their content is text in repositories (docs are a Nanoc app, blog is Jekyll, tickets are markdown), tools like **Cursor** and **Claude Code** work across the whole org, not just engineering (including the marketing team writing blog posts)
- Key shift: **migrating highly technical docs back into the repository as markdown** (e.g. how to emit an event, write an audit-log entry, use the internal metrics/telemetry abstraction) so AI coding/review tools can follow those conventions as local context — moving from human reviewers catching hardcoded strings to agentic workflows enforcing conventions
- Ran a workshop at the company retreat on using AI tools locally
- Switched wikis from GitHub Wiki (usable only by engineers, no WYSIWYG) to a classic word-processor-style wiki so non-technical staff would actually contribute
- **Structured logging** is a pivotal architectural moment: **lograge** (Mathias Meyer, ex-Travis CI) formats Rails logs into structured JSON; learned about it ~2014–2015 and rolled JSON structured logging across the entire ecosystem, feeding aggregation tools (Papertrail then, OpenTelemetry-style stacks now) — Rails historically lacked structured logging (some event logging arriving in Rails 8.1)
- Other key gems: **Sidekiq** (Enterprise, paid for years) for async jobs

## Scale, Rails Philosophy, and Lessons

- **~72,000 DNS queries/sec** on the origin network (~190 billion queries/month); the edge caching/DDoS-defense layer adds roughly a 1:5 ratio on top
- Approaching **~800,000–1M zones**; one customer has a single zone with **over 2 million records**
- The multi-tenant distribution engine was **re-engineered** to ship only the delta of changes (scoped to the affected RR set — records sharing name and type) instead of whole zones; a 600,000-record zone once killed backup/distribution processes
- **Law of physics** lesson: distributing data at edges cut machine restart from **35 minutes to 60 seconds** (moving data from Chicago to Tokyo was the bottleneck)
- Query logs are retained (not just hit counts) for **query-volume billing** and DDoS anomaly analysis — generating ~15–20 TB compressed per retention period, forcing retention down from a planned 30 days to ~7 days; moving analytics onto **ClickHouse**
- **Rails as accountability**: because Rails keeps evolving with the web, it keeps DNSimple's app from aging — several times Rails shipped a feature (e.g. encrypted secrets) that replaced an internal abstraction they'd built; anticipating the Rails 8 / 8.1 asset pipeline
- Cites Shopify and GitHub as Rails apps at far higher throughput; DNSimple's own request volume is small since most traffic is served by the DNS name servers, not Rails
- Recommended books: *Design Patterns* (Gang of Four), *Eloquent Ruby* (Russ Olson)
