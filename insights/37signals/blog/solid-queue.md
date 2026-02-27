---
title: Solid Queue
source:
- type: blog
  title: Introducing Solid Queue
  author: Rosa Gutierrez
  url: https://dev.37signals.com/introducing-solid-queue/
  date: '2023-12-18'
- type: blog
  title: Solid Queue 1.0 released
  author: Rosa Gutierrez
  url: https://dev.37signals.com/solid-queue-v1-0/
  date: '2024-09-26'
tags:
- rails
- jobs
---

# Solid Queue

Database-backed background jobs. No Redis required.

## How It Works

- Jobs stored in relational DB (PostgreSQL, MySQL, SQLite)
- Workers poll with `SELECT ... FOR UPDATE SKIP LOCKED`
- Multiple workers fetch and lock jobs simultaneously without blocking
- Job states isolated into separate tables (ready, scheduled, failed, blocked)

## Performance at Scale

37signals (HEY) processes ~20M daily jobs with:
- 800 workers, 4 dispatchers, 2 schedulers across 74 VMs
- Dedicated Solid Queue database: 32 CPUs, 64GB RAM, 350GB disk (primary + 2 replicas)
- Covering indexes for ordered queues and priorities

## Features

- Delayed scheduling
- Concurrency controls
- Queue pausing
- Numeric priorities
- Recurring tasks (cron-like)
- **Bulk enqueueing** via `enqueue_all` / Active Job `perform_all_later`
- **Batch operations** -- atomic discard, retry, and unblock (integrated with Mission Control -- Jobs)
- **Lifecycle hooks** -- supervisor and worker lifecycle callbacks (e.g., start metrics server on boot)
- **Proper logging and instrumentation** -- structured logging built in

## Deployment Configuration

Environment-specific job pools via config files:

```yaml
# Kamal deploy config
solid_queue_jobs:
  cmd: bin/jobs -c config/solid_queue/<%= ENV.fetch("JOB_POOL", "default") %>.yml
```

## Monitoring

- Export metrics via Prometheus + Yabeda (failed job counts, scheduled execution delays)
- Use lifecycle hooks to start metrics servers alongside workers

## Why Not Redis

- Single gem replaces 7 (resque, resque-pool, resque-scheduler, etc.)
- Debugging via ActiveRecord -- standard Rails tooling
- No additional infrastructure to operate
- "Having everything stored in a relational DB has made debugging job-related issues significantly easier"
