---
title: "Nikky Southerland: Lessons from 13 Years of Rails at the Auto Shop"
description: "How Shop-Ware's small team maintains and evolves a 13-year-old, couple-hundred-thousand-line Rails monolith for auto-shop management — migrating Backbone to React, unwinding a regretted two-codebase API split, shifting from biweekly to daily deploys, and rethinking Postgres connection and hosting strategy off Heroku."
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/19319172-nikky-southerland-lessons-from-13-years-of-rails-at-the-auto-shop"
  date: 2026-06-30
tags: [monolith, legacy-rails, backbone, react, frontend-migration, api-design, rest, deployment, continuous-deployment, feature-flags, postgres, connection-pooling, heroku, multi-tenancy, observability, llm, activerecord, seed-data, websockets]
---

# Nikky Southerland: Lessons from 13 Years of Rails at the Auto Shop

Nikky Southerland, lead engineer at Shop-Ware (part of Vehlo), explains how a ~10-person team maintains and evolves a 13-year-old Ruby on Rails monolith — SaaS software that runs automotive service shops (estimates, approvals, inspections, technician labor tracking, payments) — where the first line of code was Rails and 12-to-13-year-old lines still ship in production.

## Platform and Codebase Shape

- **Domain**: SaaS for auto-repair shops — service advisors inspect vehicles (photo-heavy inspections), build and get estimates approved (down payments for large jobs), hand off to technicians who track labor hours, and collect payments; mostly internal operations, with some customer-facing communication (inspection photos, texting), not marketing or public sites
- **Founded ~2013** as a Rails 3 app; Rails has grown with the company from the first line of code
- **Scale today**: a couple hundred thousand lines of code, ~90%+ Rails; remainder is platform services and AWS Lambdas
- **Team**: ~10–12 engineers including contractors — down from roughly double that a few years ago
- **Customer base**: both individual shops and entities owning multiple shops; range from pen-and-paper businesses to sophisticated shops migrating off legacy systems (Windows XP / Windows 95 terminal apps still in active use because "the system works for them")

## Why Rails, 13 Years In

- **Opinionated framework as a decision filter**: strong conventions mean the team isn't bikeshedding; going "extremely against" the Rails way is possible but the friction (something taking 4× as long) is a built-in prompt to pause and reconsider whether the deviation is worth it
- **Active Record** is the biggest win — a well-intentioned, familiar data layer that onboarding developers (even non-Rails ones) pick up extremely fast
- **MVC separation** gives a "bright line" that keeps a growing codebase organized and clarifies ownership/expertise — provided the team takes care to enforce it
- **Full-stack team enabled by convention**: all engineers are full-stack; the consistent architecture lets someone work application-layer code one day and HTML/CSS the next, moving freely across the codebase
- **Rails helps recover institutional knowledge**: when colleagues leave (and the team shrank significantly), Rails' forced organization gets you "part of the way, but not all the way" back to understanding unfamiliar code

## Frontend: The Backbone-to-React Migration

- **Original framework was Backbone** (with Backbone-relational, which fit the Rails model), chosen as a best-guess bet on what would survive — now unmaintained, and no current developers know what it does
- **Actively migrating Backbone → React** in the same repository (no separate frontend repo, no React-on-Rails); most of the app has moved to React already
- **Migration is deliberate and slow** because power users have highly optimized workflows built around a few core pages; new React must be performant, reliable, and non-disruptive from day one — a broken core page has real business impact on shops
- **Assets still compiled and coupled to backend releases**; team is working toward decoupling frontend from backend deploys, but baked-in assumptions and libraries make it hard to unwind
- **On framework churn anxiety**: being burned repeatedly by dead frameworks "keeps me up at night," but React is judged safe for the foreseeable future — strong momentum, corporate backing, community; deprecation would come with ample notice
- **LLM angle**: simple CRUD Backbone views are seen as good candidates for LLM-assisted conversion to React (enough Backbone training data exists); automating the routine conversions frees humans for the business-critical core pages

## API Design: A Regretted Two-Codebase Split

- **Public API** serves both application users and third-party integrators; predates GraphQL's popularity, so it's REST/REST-ish and staying that way — GraphQL would be the choice for a greenfield build, but there's no demand or push to migrate
- **The regret**: the API was built as a *separate codebase* from the main Rails app — a decision the team "regretted almost the minute it was made"
- **Duplicated logic is the core pain**: model changes, validations, and service-level calculations in the main app must be re-known by the API app
- **Sync mechanisms**: an automatic script syncs model code and the schema file to "keep us somewhat honest," plus occasional manual copy-pasting of service-level calculators (no Git submodules)
- **Request lifecycle**: the API app is essentially a *proxy* — a write/POST makes a separate POST request to internal monolith APIs ("secret APIs") that perform the actual write with full data-integrity rules; reads come back over a read-only database connection
- **No internal consumers** of the public API
- **Direction**: broad team consensus that the next major API effort will fold it back into the main application

## Deployment: From Biweekly Waterfall to Daily

- **The old model (biweekly deploys)** was universally hated: a ~week-long QA regression per release, last-minute feature-shoving with delayed release-candidate cuts, and bug fixes stuck waiting up to 2 weeks unless a special release was cut; heavy engineering + QA time, unhappy product team
- **Switched to daily deploys** a few years ago after weighing pros/cons: code is deployed daily by an engineer, and almost all engineers are deployers — which also means they're on call and close to production
- **Effect on engineering behavior**: removing the big manual QA regression backstop makes engineers write defensively and stay "blast-radius sensitive," because they'll be the ones paged if something breaks
- **Tighter feedback loop**: ship today, see a new Sentry exception tomorrow, and you still have full context on what you changed — versus being on a different epic weeks later
- **Outcome**: faster bug fixes, incremental product rollout, less time on broad QA and more targeted QA "against things that actually matter," even decreased defects (no more cramming code to hit a 2-week window), and rollbacks scoped to a day rather than 2 weeks
- **Team size is not the gating factor** for frequent deploys — what matters is everyone buying in that pushed code is close to production; stability matters intensely because shops can't run their business (repair cars, order parts, take payment) if the app is down

## Feature Flags and Multi-Tenancy

- **LaunchDarkly** for feature flags — took a few years to get the workflow right, now considered very helpful
- **Product team owns flag rollout**, fully decoupled from engineering: enables frequent deploys because UI/logic changes ship dark, then product rolls out per-tenant, to early-access adopters, or to everyone
- **Permanent engineering flags** double as kill switches for third-party integrations — a slow or down integrator can be shut off via flag until it recovers, protecting app responsiveness
- **Custom-code philosophy**: the team resists tenant/shop-specific code (every conditional "doubles complexity"); customer requests are evaluated for broad relevance and generalized, with feature flags providing the early-access path for pushed-for features
- **One huge Postgres database** for all tenants; benefits when it runs well (almost always), but tenant size imbalance (very small to very large shops) makes indexes unwieldy — experiments with Postgres partitioning by tenant ID hit walls on Heroku (no access to the needed administrative tools), a driver toward AWS where sharded, isolated tenants become feasible

## Postgres, Connections, and Leaving Heroku

- **Connection-count orthodoxy revisited**: the classic teaching is that Postgres connections are precious and expensive (memory/CPU), pushing teams toward a proxy like PgBouncer (or Heroku's) — but proxies can hit CPU saturation that is "extremely not observable" when it happens
- **New stance**: stop over-fearing connections; go back to the Rails way of managing connections (accept somewhat more of them) to keep the app stable rather than saturating middleware that takes the whole app down
- **Legacy constraint origin**: early Heroku days imposed very low connection limits (~20), which drove aggressive use of Rails connection balancing plus a bouncer
- **Hosting evaluation underway**: Heroku signaled (~weeks before the recording, early 2026) it won't invest further in evolving the platform — read as maintenance mode; the team had already started pursuing alternatives the prior year
- **Likely destination**: AWS or similar container-based hosting for elastic scale-up/down — attractive because the workload is highly time-dependent (US shops open ~9-to-5 across time zones; the large database sits nearly idle at 3 AM Pacific)
- **Current state**: still on the default Heroku stack; a containerization effort is in progress as the first step toward more dependable hosting

## Observability, Seeds, and Scaling Tools

- **Observability heritage**: New Relic (dropped in a gem, drilling into individual controllers, queries, and EXPLAINs) felt "like magic" coming from PHP/WordPress land and still anchors the team's close connection between code and production behavior
- **Error reporting via Sentry**: near-real-time exceptions sometimes let the team fix an issue before support even hears about it — a big confidence and shipping-speed multiplier
- **Seed strategy grew organically over a decade**: a reliable, clean seed file matters for the "wipe the DB, start dev from scratch" workflow; specs verify the seed file runs cleanly and fail on merge if, e.g., a dropped table isn't removed from seeds
- **Onboarding pain persists**: a smaller team onboards rarely, so each new setup surfaces some new service/key/database quirk; documentation is organically grown by each onboarding developer (the host is currently living this after breaking a laptop)
- **Stress testing**: Ruby/Rails scripting makes it easy to seed hundreds of thousands of associated records to reach a near-production scale where Postgres uses real indexes instead of sequential scans; a strong QA team provides good reproduction steps for defects

## LLM Adoption: "Lukewarm Water"

- **Overall stance is cautiously experimental** — a large, heavily separated codebase means significant work is needed to inform agents where helpers and service classes live and to stop them rewriting methods that already exist
- **Where it works well**:
  - **Writing specs** — draft specs first to guide the work, then revisit to catch missed edge cases; the team is comfortable with "too many" fast unit tests over too few
  - **Early PR review via GitHub Copilot** — catches syntax issues, unused variables, misspellings, and misused methods so humans focus on structural concerns
  - **Greenfield / proof-of-concept** — spun up a test interface for a new API in ~10 minutes; useful for product-team UI prototypes
  - **Integrating third-party APIs** — considered LLM "bread and butter"; getting from step 1 to step 10 on understanding and wiring up an external API
  - **Rubber duck / unblocking** — easier than searching Stack Overflow; resolves questions that once needed a standup parking lot
- **Where it's hit-or-miss**: code generation *inside the mainline monolith* — heavy separation of concerns means the files relevant to a change are "way far away," so large-scale refactors are hard for the model to fully contemplate; workflow is throw-away-and-retry POCs until something sensible emerges, then hand a working-but-rough POC to a human to harden
- **Cultural side effect flagged**: on an all-remote team that fosters pairing and huddles, LLMs can create a siloing effect — a colleague knows the code from 10 years ago is no longer how things are done and gives a relevant answer; the LLM only pattern-matches and may confidently suggest a long-dead approach

## Governance of a Long-Lived Codebase

- **Three checkpoints keep code aligned with intended architecture**: (1) engineers scope epics/tickets up front — UI through backend through deployment strategy — reviewed for direction (often by Nikky); (2) the code is written by whatever means; (3) code review as the final backstop
- **PRs matter more than ever**: previously code was human-written or Stack-Overflow-pasted; now it may be produced "through any means," so the PR is the final check that it fits organizational/architectural intent — author and approver are held equally responsible for what ships
- **Human review catches what LLMs miss**: someone steeped in a change can't back out and see the decisions being made; a second person spots use of a deprecated service pattern or an outdated approach
- **Legacy pattern drift** (e.g., old service-object approaches vs. a newer architecture) is a pre-existing large-team problem that LLMs may both expedite and complicate — keeping every contributor (human or model) on the same "we're moving this way" page is the challenge

## Integrations and Gems in a Specialist Industry

- **Off-the-shelf gems rarely fit** the automotive integrations — which is a silver lining: the team fully controls integration code, knows exactly what it does, and can be defensive and configure it precisely, rather than fighting a gem that isn't quite right
- **Atypical integrations** for a Rails developer: purchasing parts from automotive wholesalers, and VIN-based motor-vehicle lookups returning rich standardized data (engine, transmission type, submodel, trim IDs) from a handful of niche providers
- **Data migration is core value**: shops arrive from a myriad of legacy systems; the team invests in easy import/export, with some migrations requiring bespoke care and some source data essentially un-migratable
- **Legacy integration upkeep**: third-party vendors upgrade their own APIs (e.g., retiring a decade-old SOAP interface), and a smaller team must absorb that ongoing maintenance — an area where LLM-assisted API integration genuinely helps

## The "Atypical Thing" — Pre-Action Cable Realtime

- **Asynchronous/realtime updates predate Action Cable** and the app never migrated to it — a frequent source of confusion for developers who assume Action Cable is in use
- **Implementation via a third-party service (Stream)**: third-party client code opens a WebSocket and listens for updates; the app pushes updates to the provider (which presumably runs Redis) to fan them out — "essentially Action Cable, but pre-Action Cable"
- This is the one thing Nikky would put in a handover letter to an incoming senior Rails engineer as the surprising, non-standard piece of the Shop-Ware codebase

## Recommended Reading

- **"Digital Apollo" by David Mindell** — on the design and architecture of the Apollo guidance computer (DSKY), one of the first mission-critical, publicly known pieces of computer hardware; a reminder that 30-to-50-year-old design decisions still inform the ones engineers make today
