---
title: "TimescaleDB: Integrating Time-Series Data with Ruby on Rails"
description: "Practical guide to using TimescaleDB with Rails via the timescaledb-ruby gem, covering hypertables, continuous aggregates, data retention policies, and 10-100x query speedups over plain PostgreSQL"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Iana Ivanisevych"
  url: "https://evilmartians.com/chronicles/time-series-data-using-timescaledb-with-ruby-on-rails"
  date: '2021-11-16'
tags: [rails, postgresql, timescaledb, time-series, database, performance, active-record, analytics]
---

# TimescaleDB: Integrating Time-Series Data with Ruby on Rails

A hands-on guide to adding TimescaleDB to an existing Rails app for 10–100x faster time-series queries, covering hypertable setup, the `timescaledb-ruby` gem, continuous aggregates, and data retention policies.

## What is TimescaleDB

- TimescaleDB is a PostgreSQL extension — runs on top of standard Postgres, not a separate database
- Designed for time-series data: metrics, events, logs, IoT readings, financial ticks
- 10–100x faster time-series insertions and queries compared to vanilla PostgreSQL, InfluxDB, or MongoDB
- Supports full SQL including JOINs, subqueries, window functions, and secondary indexes
- Open-source (Apache 2) with a commercial cloud offering at Timescale Cloud
- Install via `apt`/`homebrew` as a Postgres extension; enable per-database with `CREATE EXTENSION timescaledb`

## Hypertables

- A **hypertable** is a TimescaleDB abstraction that partitions a regular Postgres table into time-based chunks automatically
- `SELECT create_hypertable('events', 'created_at')` converts a regular table into a hypertable (partitioned by time column)
- Chunks are small internal tables (~1–2GB by default) — TimescaleDB queries only relevant chunks based on WHERE clauses
- Adding data: insert into the hypertable exactly like a regular table — no application code changes needed
- `chunk_time_interval` defaults to 7 days; adjust based on data volume: `chunk_time_interval => INTERVAL '1 day'`
- Create hypertable in a Rails migration after `create_table` using the `timescaledb-ruby` gem's migration helpers

## The timescaledb-ruby Gem

- `gem 'timescaledb'` — Evil Martians-contributed gem providing ActiveRecord integration and migration helpers
- Add to model: `acts_as_hypertable time_column: 'created_at'` — unlocks TimescaleDB-aware scopes
- Migration helper: `create_table :events do |t| ... end; add_hypertable :events, :created_at`
- The gem enhances Rails' schema dumper to emit `create_hypertable` calls — schema.rb round-trips correctly
- Provides time-bucket scopes: `Event.time_bucket('1 hour')` → groups by hour using `time_bucket()` SQL function
- `acts_as_hypertable` adds class methods: `.chunks`, `.hypertable`, `.compression_settings`

## Migrations and Schema

- Convert an existing table: `add_hypertable :table_name, :time_column` in a migration
- Must have no existing data (or migrate in batches) — `create_hypertable` requires an empty table by default
- With existing data: use `migrate_data: true` option, but this locks the table during migration
- Index on time column is created automatically by TimescaleDB; additional indexes (e.g., on `user_id`) are replicated across chunks
- Unique constraints must include the partitioning column (`created_at`) — TimescaleDB limitation for cross-chunk uniqueness
- Use SQL schema (`config.active_record.schema_format = :sql`) for full fidelity with TimescaleDB-specific DDL

## Time Bucket Queries

- `time_bucket('1 hour', created_at)` is TimescaleDB's equivalent of `DATE_TRUNC` but aware of chunk boundaries
- Usage in ActiveRecord: `Event.select("time_bucket('1 hour', created_at) AS bucket, COUNT(*) AS count").group("bucket")`
- `timescaledb-ruby` gem provides: `Event.time_bucket('1 hour').select_count.map(&:attributes)`
- Supports arbitrary intervals: `'5 minutes'`, `'1 day'`, `'1 month'` — uses PostgreSQL interval syntax
- Combine with WHERE clauses: `Event.where(created_at: 1.week.ago..).time_bucket('1 hour')`
- `time_bucket_gapfill` fills missing intervals with NULL or interpolated values — useful for charting

## Continuous Aggregates

- A **continuous aggregate** is a materialized view refreshed automatically by a background TimescaleDB worker
- `CREATE MATERIALIZED VIEW hourly_stats WITH (timescaledb.continuous) AS SELECT time_bucket(...) ...`
- Refreshes only the changed chunks — not a full re-materialization like standard Postgres materialized views
- Refresh policy: `add_continuous_aggregate_policy('hourly_stats', start_offset => '3 hours', end_offset => '1 hour', schedule_interval => '1 hour')`
- `timescaledb-ruby` allows defining continuous aggregates as ActiveRecord models with `acts_as_continuous_aggregate`
- Query continuous aggregates like any ActiveRecord model — they behave as read-only tables

## Data Retention Policies

- `add_retention_policy('events', INTERVAL '90 days')` — TimescaleDB automatically drops chunks older than 90 days
- Chunk-level drops are nearly instant (DROP TABLE on the chunk) — no row-by-row DELETE overhead
- Combine retention with compression: compress old chunks, then drop after retention window
- `timescaledb-ruby` provides: `Timescaledb::RetentionPolicy.create(hypertable: 'events', drop_after: '90 days')`
- Verify policies: `SELECT * FROM timescaledb_information.jobs` to see scheduled policies
- Custom retention logic: use Rails `cron`/`whenever` to call `DROP CHUNKS` for more granular control

## Compression

- TimescaleDB native compression converts chunks to a columnar format — typically 90–95% size reduction
- Enable: `ALTER TABLE events SET (timescaledb.compress, timescaledb.compress_segmentby = 'user_id')`
- `compress_orderby` defines the sort order within compressed chunks (default: time column)
- `add_compression_policy('events', INTERVAL '7 days')` — auto-compresses chunks older than 7 days
- Compressed chunks are queryable normally — decompression is transparent but slower for full-chunk scans
- `timescaledb-ruby` exposes: `Event.hypertable.compression_stats` for size reporting

## Real-World Integration Pattern

- Evil Martians used TimescaleDB in a social iOS app (`FEED`) to store user stats and ratings
- Schema: `ratings` hypertable with `(user_id, rated_at)` — partitioned by `rated_at`
- Continuous aggregate computes daily rating averages per user — queried at runtime without re-aggregating
- Retention policy drops raw ratings after 1 year — aggregate view retains daily summaries indefinitely
- Migration path: add TimescaleDB extension → run `create_hypertable` → update model with `acts_as_hypertable`
- No application query code changes needed — existing ActiveRecord queries work against hypertables unchanged
