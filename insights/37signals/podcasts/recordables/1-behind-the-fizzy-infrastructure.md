---
title: Behind the Fizzy Infrastructure with Kevin McConnell
description: "How 37signals explored a per-tenant SQLite + replication architecture for Fizzy, what worked, what broke, and why they shipped on MySQL instead"
source:
  type: talk
  title: Behind the Fizzy Infrastructure with Kevin McConnell
  author: Kevin McConnell
  url: https://www.youtube.com/watch?v=QeGFqx4i_AU
  date: ''
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

# Behind the Fizzy Infrastructure with Kevin McConnell

37signals built and then abandoned a per-tenant SQLite + replication architecture for Fizzy two days before launch, shipping on MySQL instead — and kept the best parts.

## The Two Goals Driving the Architecture Exploration

- **Dual-mode product**: Fizzy should work as both SaaS (37signals-hosted) and self-hosted (once, customer-run), without maintaining two divergent codebases
- **Data locality for speed**: Put each customer's data geographically close to them to reduce latency — the same property self-hosted users get automatically

## Why Latency Mattered

- Edinburgh → Chicago round trip: ~150ms before the server does any work (theoretical speed-of-light minimum ~60ms)
- Rule of thumb Kevin uses: requests under 100ms feel fast; over 200ms feel noticeably slow
- Edinburgh → Amsterdam round trip: ~25ms — same 50ms page render now lands well under the 100ms threshold
- Basecamp read/write ratio: ~94% reads, ~6% writes — making reads fast covers the vast majority of interactions

## Three Architectures Considered

| Option | Description | Decision |
|---|---|---|
| MySQL in self-hosted container | Squeeze SaaS database setup into the ONCE Docker container | Rejected — solves packaging, not latency |
| Per-customer Docker containers on SaaS | Run one container per tenant, spread around regions | Rejected — 100k customers = 100k idle containers; would be reinventing fly.io |
| Per-tenant SQLite databases | Give each customer their own SQLite file; move files close to them | Pursued seriously for months |

## Per-Tenant SQLite: Why It Was Appealing

- **In-process queries**: SQLite runs inside the Rails process — no network hop, no IPC. Queries hit memory cache or disk directly, noticeably faster than MySQL client-server round trips
- **Write concurrency solved by isolation**: SQLite's one-write-at-a-time limit applies per database — one customer can't block another
- **Portable data unit**: each customer's data is a single file; move the file, move the data
- **SQLite WAL mode** is required for this to work well

## SQLite Write Lock Gotcha (Campfire Lesson)

- Holding a transaction open while doing Ruby work in between SQL statements keeps the write lock for the entire duration
- In a single-tenant SQLite (self-hosted Campfire), this is survivable — one customer, fast operations
- In multi-tenant SaaS on a shared SQLite, this causes visible request queuing
- Fix: keep write operations short, commit transactions quickly, don't interleave Ruby work inside open transactions

## What They Actually Built (the SQLite Architecture)

- Custom SQLite replication system called **Beamer** (not yet open-sourced at time of recording)
- One writer app server + multiple read replicas per region, replication over the network
- Replication lag handling: instead of pinning reads to the writer for N seconds after a write (pessimistic), they track the last written transaction ID and optimistically serve from the reader — only falling back to the writer if the replica doesn't yet have that transaction
- **Cloudflare** used as geo-routing layer to direct traffic to the nearest data center
- Custom load balancing features built into **Kamal Proxy** for dynamic per-customer request routing

## Why the Per-Tenant SQLite Architecture Was Abandoned

Two reasons combined:

1. **Not operationally ready**: no runbooks for replication lag, machine failure, or data recovery scenarios; benchmarking under launch-day load was insufficient; team felt unable to recover quickly if something went wrong with real customer data
2. **Cross-tenant requests become hard**: anything that spans tenants (login, global user identity, per-person profile picture) requires knowing which machine holds which database — what seemed simple kept growing edge cases

The call was made two days before launch. Kevin messaged David on a Sunday evening. A ~10-person "Plan B" week followed.

## The MySQL Migration (Plan B)

- Switched to Trilogy MySQL adapter
- Removed Beamer replication
- Re-added `belongs_to :account` on every model that had been implicit in the tenant database (e.g. `Board` had no account scope because the database was the scope)
- All queries like `Board.all` became `current_account.boards` throughout
- Wrote migration scripts to import data from individual per-tenant SQLite files into the shared MySQL database (beta testers' data had to be preserved)
- One week, ~8–10 engineers involved

## What Shipped from the Exploration

- **Optimistic read-after-write consistency** (transaction ID tracking): ported from the SQLite architecture to the MySQL side — Fizzy still has this improvement
- **Enhanced Kamal Proxy load balancing**: dynamic request routing features built for the SQLite architecture were kept and now power Fizzy's six Kamal Proxy load balancers on MySQL
- **Active Record multi-tenant gem** (built by Mike Dellesio, discussed in a companion episode)

## Future Plans

- Regional MySQL sharding: instead of one global MySQL database, use 3–5 regional databases (EU, East US, West US) and route customers to their nearest shard using the load balancer routing already built — gets the data-locality benefit without per-tenant file management complexity

## Lessons

- Sunk-cost attachment is real: Kevin acknowledges he chased the SQLite path longer than he should have because he was emotionally invested and it *mostly* worked
- The absence of a single blocking failure made it hard to stop — it was "tiny pebbles not a huge wall"
- Operational readiness (runbooks, chaos testing, benchmarking under realistic load) should be a first-class deliverable, not deferred until after the architecture is "done"
- Exploration with no shipped output is not waste: the load balancer work, the replication consistency pattern, and the multi-tenant tooling all outlived the architecture that motivated them
