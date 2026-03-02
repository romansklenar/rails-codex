---
title: Behind the Fizzy Infrastructure
description: "How 37signals explored a per-tenant SQLite + replication architecture for Fizzy, pivoted to MySQL two days before launch, and kept the best parts"
source:
  type: talk
  title: Behind the Fizzy Infrastructure
  author: Kevin McConnell
  url: https://dev.37signals.com/fizzy-infrastructure/
  date: '2026-02-26'
tags:
- rails
- infrastructure
- sqlite
- mysql
- multi-tenant
- replication
- kamal
- deployment
- performance
- architecture
---

# Behind the Fizzy Infrastructure

37signals built and then abandoned a per-tenant SQLite + replication architecture for Fizzy two days before launch, shipping on MySQL instead — and kept the best parts.

## Two Goals Driving the Exploration

- **Dual-mode product**: Fizzy must work as both SaaS (37signals-hosted) and self-hosted (ONCE-style) without maintaining two divergent codebases
- **Data locality for speed**: put each customer's data geographically close to them — the latency advantage self-hosted users get automatically

## Why Latency Mattered

- Edinburgh → Chicago: inherently exceeds 100–150ms before the server does any work
- Edinburgh → Amsterdam: ~25ms — same page render now lands well under the perceptible threshold
- Rule of thumb: requests under 100ms feel fast; over 200ms feel slow
- Basecamp read/write ratio: ~94% reads, ~6% writes — making reads fast covers the vast majority of interactions

## Architectures Considered

| Option | Description | Decision |
|---|---|---|
| MySQL in self-hosted container | Squeeze SaaS DB setup into the ONCE Docker container | Rejected — solves packaging, not latency |
| Per-customer Docker containers | One container per tenant, spread across regions | Rejected — 100k customers = 100k idle containers; reinventing fly.io |
| Per-tenant SQLite databases | Each customer gets their own SQLite file; move files near them | Pursued seriously for months |

## Per-Tenant SQLite: Why It Was Appealing

- **In-process queries**: SQLite runs inside the Rails process — no network hop, no IPC; queries hit memory cache or disk directly, faster than MySQL client-server round trips
- **"If you're using SQLite and your data is where your app server is, then you get the fastest data."**
- **Write concurrency solved by isolation**: SQLite's one-write-at-a-time limit applies per database — one customer can't block another
- **Portable data unit**: each customer's data is a single file; move the file, move the data
- SQLite WAL mode required for this to work well

## What They Built (the SQLite Architecture)

- **Beamer**: custom replication system for syncing SQLite DBs across servers (not yet open-sourced)
- One writer app server + multiple read replicas per region, replication over the network
- **Transaction-aware read routing**: tracks the last transaction ID the user wrote; optimistically serves from replica, falls back to writer only if replica hasn't caught up yet — avoids pessimistic N-second writer pinning
- **CloudFlare** for geo-routing: directs traffic to the nearest data centre
- Custom load balancing features built into **Kamal Proxy** for dynamic per-customer request routing

## SQLite Write Lock Lesson (from Campfire)

- Holding a transaction open while doing Ruby work between SQL statements keeps the write lock for the entire duration
- In a single-tenant self-hosted setup this is survivable; in multi-tenant SaaS it causes visible request queuing
- Fix: keep write operations short, commit transactions quickly, don't interleave Ruby work inside open transactions

## Why They Pivoted (2 days before launch, November 19th)

Two compounding reasons:

1. **Not operationally ready**: no runbooks for replication lag, machine failure, or data recovery; benchmarking under realistic load was insufficient; team felt unable to recover quickly if something went wrong with real customer data
2. **Cross-tenant features became hard**: anything spanning tenants — login, global user identity, per-person profile pictures (not per-account) — required unexpected DB coordination across customer instances; edge cases kept growing

- "A year from now when the app's growing...are we going to be kicking ourselves for setting it up in this particular way?"
- Emotional sunk-cost was real: "There's a thing where the more time you spend on a project, you also get a little bit emotionally attached to it."
- No single blocking failure made it hard to stop — "tiny pebbles, not a huge wall"

## The MySQL Migration (Plan B)

- Switched to Trilogy MySQL adapter; removed Beamer replication
- Re-added `belongs_to :account` on every model (previously implicit in the tenant DB — `Board` had no account scope because the database *was* the scope)
- All queries like `Board.all` became `current_account.boards` throughout
- Wrote migration scripts to import per-tenant SQLite data into the shared MySQL database (beta testers' data preserved)
- ~one week, ~8–10 engineers involved

## What Survived the Pivot

| Artefact | Status |
|---|---|
| Kamal Proxy enhancements | Shipped — 6 load balancers now use the improved routing features |
| Transaction-aware read routing | Ported from SQLite architecture to MySQL side |
| Beamer | Functional but unpublished; Kevin plans future open-source release |

## Future Directions

- Regional MySQL sharding: EU, East US, West US segmented databases rather than per-customer instances — gets data-locality benefit without per-tenant file management complexity
- Route customers to their nearest shard using the load balancer routing already built

## Lessons

- Operational readiness (runbooks, chaos testing, realistic load benchmarking) is a first-class deliverable, not a post-architecture afterthought
- Cross-tenant concerns surface late and compound quickly — map them before committing to a per-tenant data model
- "We learned a lot from this that I think informed how we would do it again."
- Exploration with no shipped output is not waste: load balancer work, replication consistency pattern, and multi-tenant tooling all outlived the architecture that motivated them
