---
title: Moving Mountains of Data off S3
description: "How 37signals migrated 5 petabytes and 5 billion objects out of S3 in under 10 days using a custom Rails app, DuckDB, rclone, and Pure Storage FlashBlade"
source:
  type: talk
  title: "Moving Mountains of Data off S3 with Jeremy Daer"
  author: Jeremy Daer
  url: https://www.youtube.com/watch?v=BnhVXGZepA8
  date: ''
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

5 petabytes of unique objects, 5 billion files, hundreds of S3 buckets — migrated in under 10 days with no downtime using a bespoke Rails app as the command-and-control layer.

## Scale and Context

- ~10 PB total across all buckets (5 PB deduplicated unique objects)
- ~5 billion objects, average size 1.1 MB
- Hundreds of S3 buckets across multiple AWS accounts
- 90-day egress waiver window negotiated with AWS (free egress only if all data leaves within the window)
- AWS Direct Connect cannot be used for egress credit — must use public internet
- Third-party migration services quoted at tens to hundreds of thousands of dollars; ruled out

## Why S3 Was the Last Thing Moved

- High trust: S3 is extremely durable and reliable — replacing it means taking on that risk yourself
- High cost to replace: hardware purchase in the hundreds of thousands to millions; needed proof of concept before committing
- Egress lock-in: AWS charges egress bandwidth; the EU-driven waiver program provides credits only if you exit completely within the negotiated window

## AWS S3 Rate Limit Gotchas

- S3 enforces **5,500 GET requests/second per bucket partition** — hit this limit during load testing on smaller, unpartitioned buckets
- Large buckets pre-partitioned (by contacting S3 ahead of time with key layout info) did not hit the rate limit during load tests
- S3 uses key prefixes to auto-shard partitions; uniform random hash keys make this easy for AWS to split evenly
- Listing a billion-object bucket sequentially takes **literally days** — S3 Inventory Reports (daily, paid) are the only practical alternative for bulk operations

## Migration Architecture: Custom Rails App ("Nostos")

The copy system is a classic map-reduce pipeline orchestrated by a dedicated Rails app:

1. **Inventory** — S3 Inventory Reports (CSV or Parquet) used as the source manifest; generated daily and scheduled automatically
2. **Partition** — DuckDB splits the inventory into 10 GB size-weighted batches (cumulative sum on byte size, not object count) and writes them to an S3-compatible staging bucket, all streaming without local disk
3. **Dispatch** — ActiveStorage records wrap the batch files; ActiveJob dispatches copy jobs to workers via Solid Queue
4. **Copy** — Workers invoke `rclone` (open source) per batch; stdout/stderr captured and stored per job ID for live tail inspection
5. **Reconcile** — S3 Inventory Report vs. FlashBlade listing compared; final live sync run until zero objects remain to copy
6. **Cut over** — Dual writes turned off; single-write to new destination; final sync run to verify nothing changed

Rails app responsibilities: credentials management (Active Record Encryption), job supervision, state tracking per bucket/inventory/batch, dashboard, and error visibility.

## Why Rails Over Scripts

- Started with scripts; immediately needed to rebuild a credentials manager — switched to Rails instead
- Rails credentials management handles multiple AWS accounts and destination credentials cleanly
- ActiveJob + Solid Queue provided job distribution without custom queue infrastructure
- Kamal deployed the app and accessories (database, OpenTelemetry, logging) to VMs as a single-developer operation
- ActiveStorage accommodated batch files written by DuckDB directly (feeding it the key rather than uploading through AS)

## DuckDB: The Critical Tool

DuckDB replaced a custom multi-step pipeline:

| Approach | Problem |
|---|---|
| In-memory windowing (e.g., Polars) | OOM on a multi-hundred-GB inventory report |
| Custom download → split → re-upload pipeline | Many moving parts, local disk required |
| DuckDB single invocation | Streams S3 Parquet glob → window function → writes to S3-compatible store; no local disk, minimal memory |

- Single `duckdb` invocation: point at a glob of S3 Parquet files, cumulative-sum window to split by 10 GB batch size, write output back to remote object store — all streaming
- Partitioning went from "expected hours" to minutes

## rclone: The Copy Tool

- Used for the actual object copies; open source; bandwidth and metadata-operation efficient
- Checksum verification modes: (1) compare S3 ETag to destination ETag, or (2) download from destination and recompute checksum locally ("really be careful mode")
- Tunable: skip HEAD requests against S3 to avoid rate limits and unnecessary API costs
- 37signals contributed a **Pure Storage FlashBlade backend** to rclone upstream — now built in

## S3 Fast List (Parallel Listing)

- Tool forked from AWS samples, available on 37signals GitHub; adapted for non-S3 storage
- Estimates key prefixes, issues thousands of parallel listing requests instead of one sequential pass
- Turns a multi-day listing into ~30 minutes
- Used for listing FlashBlade buckets (FlashBlade has no inventory report equivalent) to reconcile against S3 inventory

## Destination Storage: Pure Storage FlashBlade

- Considered spinning-disk HDDs (MinIO on HDDs) but chose FlashBlade — custom flash modules, cost-competitive with HDDs when factoring in power/cooling/rack over a 5–10 year TCO horizon
- FlashBlade's metadata throughput (hundreds of thousands of metadata ops/second) enabled fast reconciliation without bandwidth cost
- Network bottleneck hit at ~80 Gbps on the shared 100 Gbps VLAN — slightly impinged other traffic; the storage system itself was not the bottleneck

## Migration Sequencing

1. **Pre-window**: Migrate smaller, representative applications first — validates the process end-to-end without the egress clock running
2. **Window opens**: Start with the most business-critical, largest apps (Basecamp) immediately — they need the most time and leave the least room for unknowns
3. **Per-app recipe**: dual writes → bulk copy from inventory → reconcile → final live sync → cut to single write → verify → delete S3 objects

## Verification and Deletion (The Hard Part)

- The actual copy is simpler than expected; reconciliation and verification dominate the effort and wall-clock time
- "Belt and suspenders" verification:
  - Compare S3 Inventory Report to FlashBlade listing
  - Run live sync (rclone) until it reports zero objects remaining
  - Turn off dual writes; run one more sync to confirm nothing is still writing
  - Set S3 bucket permissions to **read-only** to catch any straggler writers before deletion
- Sampled a subset of batches with full byte-level checksum verification (downloading from destination); did not find any discrepancies
- Final deletion of S3 objects was the most nerve-wracking step; no data loss, no downtime

## Account Structure Lesson (Do This Upfront)

- Avoid sharing AWS accounts across applications — use separate accounts per application or blast-radius scope
- Shared accounts force you to migrate everything at once, preventing per-application tailoring
- Modern apps: build migration into ActiveStorage at the application level (dual-write + background ActiveJob copy) rather than needing a separate orchestration layer

## Post-Migration Storage Architecture

| Site | System | Role |
|---|---|---|
| Primary | Pure Storage FlashBlade (site 1) | Live read/write |
| Secondary | Pure Storage FlashBlade (site 2) | Live async replication; failover target |
| Tertiary (planned) | MinIO on HDDs or different flash vendor | Vendor diversity; insurance against shared-vendor firmware bugs |

- 3-2-1 backup rule adapted: two sites same vendor is still a single point of failure for firmware bugs; third site with a different vendor (MinIO) addresses this
- Tape backup considered and ruled out: object storage requires a gateway layer and restores from tape are weeks-long — viable only for true catastrophic recovery scenarios
