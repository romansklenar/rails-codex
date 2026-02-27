---
title: "Reliable Export Jobs"
source: https://dev.37signals.com/making-export-jobs-more-reliable/
description: "Interruptible long-running jobs with waypoint progress, server affinity, bounded execution"
tags: [rails, jobs]
---

# Reliable Export Jobs

Patterns for long-running background jobs that survive interruptions.

## Interruptible Jobs

- Set a time deadline at job start; periodically check elapsed time
- When deadline approaches, raise an interrupt and re-enqueue the job
- 15-minute intervals work well: 98% of jobs complete within one window

```ruby
interrupt_at = Time.now + 15.minutes

items.each do |item|
  process(item)
  raise ProgressInterruption if Time.now >= interrupt_at
end
```

## Progress via Waypoints

- Use artifacts on disk (or DB) as the source of truth for completed work
- On resumption, scan for completed markers and skip already-processed items
- Avoids maintaining complex state machines or progress counters
- Overhead stays minimal: a three-day export spends only 2-3 minutes on resumption logic across dozens of interruptions

## Server Affinity for Stateful Jobs

- Pin interrupted jobs to their originating server via server-specific queues
- Ensures resumed jobs access their scratch directories or local state

```ruby
queue_as do
  if export.interrupt_count > 0
    :"production_export_#{hostname}"
  else
    :production_export
  end
end
```

## Key Principles

- **Idempotent steps** — each chunk must be safely re-runnable
- **Retryable exceptions** — use `retry_on` for transient failures; re-enqueue for interruptions
- **Minimal state** — let output artifacts define progress, not in-memory variables
- **Bounded execution** — never assume a job will run to completion in one pass
