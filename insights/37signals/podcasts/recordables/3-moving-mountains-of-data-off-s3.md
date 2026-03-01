---
title: Moving Mountains of Data off S3
description: "How 37signals migrated 5 petabytes and 5 billion objects out of S3 in under 10 days using a custom Rails app, DuckDB, rclone, and Pure Storage FlashBlade"
source:
  type: talk
  title: "Moving Mountains of Data off S3"
  author: Jeremy Daer
  url: https://dev.37signals.com/moving-mountains-of-data-off-s3/
  date: '2026-01-08'
tags:
- rails
- s3
- storage
- migration
- cloud-exit
- active-storage
- duckdb
- rclone
- kamal
- solid-queue
- active-job
- flash-storage
---

# Moving Mountains of Data off S3

~5 petabytes of unique data, ~5 billion objects, hundreds of S3 buckets — migrated in under 10 days with zero downtime using a bespoke Rails app as the command-and-control layer.

## Scale and Constraints

- ~5 PB unique data; ~5 billion objects; average object size 1.1 MB
- Hundreds of S3 buckets across multiple AWS accounts
- 90-day egress window negotiated with AWS bandwidth waiver program — credits only provided if all data transferred successfully within the window
- AWS Direct Connect cannot be used for egress; must use public internet
- S3 rate limit: 5,500 GET requests/sec per bucket partition — smaller, unpartitioned buckets hit this during load testing; large buckets pre-partitioned by contacting S3 with key layout info did not
- Sequential bucket listing would take days; S3 Inventory Reports are the only practical alternative for bulk operations
- Third-party migration services quoted at tens to hundreds of thousands of dollars; ruled out

## Migration Architecture: "Nostos" (Rails App)

Custom Rails app built instead of expensive third-party services. Five-stage pipeline:

1. **Inventory** — S3 Inventory Reports (CSV/Parquet) used as source manifest; generated daily, scheduled automatically
2. **Partition** — DuckDB splits inventory into size-weighted 10 GB batches (cumulative sum on byte size, not object count); streams S3 Parquet glob → window function → writes to S3-compatible staging bucket; no local disk, minimal memory
3. **Dispatch** — ActiveJob dispatches copy jobs to workers via Solid Queue; ActiveStorage wraps batch files
4. **Copy** — Workers invoke `rclone` per batch; stdout/stderr captured and stored per job ID for live inspection
5. **Reconcile** — S3 Inventory vs. FlashBlade listing compared; live sync run until zero objects remain
6. **Cut over** — Dual-write mode disabled after complete verification; single-write to new destination

Rails app responsibilities: credentials management (Active Record Encryption), job supervision, state tracking per bucket/inventory/batch, dashboard, and error visibility. Kamal deployed the app and accessories (database, OpenTelemetry, logging) to VMs as a single-developer operation.

## Key Tools

### DuckDB

- Streamed petabyte-scale S3 inventory CSVs with a single invocation
- Replaced approaches that required local disk or ran out of memory (e.g. in-memory windowing on multi-hundred-GB inventory reports)
- "Like somebody discovering SQLite for the first time, although DuckDB is like SQLite on whatever next generation steroids."
- Partitioning that was expected to take hours ran in minutes

### rclone

- Resilience-first design; open source; bandwidth and metadata-operation efficient
- Configurable verification: basic checksum (S3 ETag vs. destination ETag) through complete bit-by-bit validation (download from destination, recompute locally)
- HEAD-request avoidance to sidestep S3 rate limits and unnecessary API costs
- 37signals contributed a Pure Storage FlashBlade backend, now merged into rclone upstream

### S3 Inventory Reports

- Efficient bucket listings without sequential API calls
- Sequential listing of a billion-object bucket would take days; Inventory Reports eliminate this

### S3 Fast List

- AWS-maintained tool, adapted by 37signals to support non-S3 storage (e.g. FlashBlade, which has no inventory report equivalent)
- Parallel prefix-based listing; turns days of sequential listing into ~30 minutes
- Available on 37signals GitHub

## Hardware: Pure Storage FlashBlade

- Chosen over spinning-disk HDDs (MinIO on HDDs) after TCO analysis over 5–10 year lifecycle: lower power, less rack space, cost-competitive with HDD when total cost factored in
- Metadata throughput (hundreds of thousands of metadata ops/sec) enabled fast reconciliation without bandwidth cost
- Bottleneck during transfer was the 100 Gbps VLAN, not the storage — hit ~80 Gbps, briefly affecting other data centre systems

## Execution

| | Target | Actual |
|---|---|---|
| Transfer window | 90 days | Under 10 days |
| Remaining buffer | — | Used for reconciliation and verification before deletion |

## Verification and Deletion

- Compare S3 Inventory Report to FlashBlade listing
- Run live sync (rclone) until it reports zero objects remaining
- Disable dual writes; run one more sync to confirm nothing is still writing
- Set S3 bucket permissions to read-only to catch stray writers before deletion
- Sampled a subset of batches with full byte-level checksum verification; no discrepancies found
- "When you press delete, then it's... Somebody else take the wheel. It's just all happening now."
- Zero downtime achieved

## Migration Sequencing

1. Pre-window rehearsal with smaller, representative apps — validates the process end-to-end before the egress clock starts
2. Criticality-first ordering during the window: most business-critical, largest apps first (most time needed, least room for unknowns)

## AWS Account Structure Lesson

- Separate AWS accounts per application preserves per-app migration flexibility
- Shared accounts force migrating everything at once, preventing per-application tailoring

## Post-Migration Storage Architecture

| Site | Role | Vendor |
|---|---|---|
| Primary | Live read/write | Pure Storage FlashBlade |
| Secondary | Live async replication + disaster recovery | Pure Storage FlashBlade |
| Tertiary (planned) | Vendor diversification | MinIO |

- 3-2-1 rule: 3 copies, 2 media types, 1 offsite
- Two sites on the same vendor is still a single point of failure for firmware bugs; third site with a different vendor (MinIO) addresses this
- Tape rejected: requires a gateway layer for object storage and restores take weeks — operational complexity not worth it

## Key Insight

"The migration's real difficulty centred on modelling, coordination, and risk management rather than programming sophistication. Developers with Rails expertise could undertake similar projects successfully."
