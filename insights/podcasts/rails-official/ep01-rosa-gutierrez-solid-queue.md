---
title: "Rosa Gutiérrez: Solid Queue"
description: "How 37signals built and migrated to Solid Queue — a database-backed ActiveJob backend replacing 7 Resque gems — running 20M+ daily jobs in production on Hey and Basecamp."
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/17305252-rosa-gutierrez-solid-queue"
  date: 2025-06-24
tags: [solid-queue, background-jobs, activejob, resque, migration, database, kamal, rails-8]
---

# Rosa Gutiérrez: Solid Queue

Rosa Gutiérrez, principal programmer at 37signals and author of Solid Queue, explains the production reasoning, incremental migration strategy, and job design patterns behind replacing a 7-gem Resque setup with a database-backed ActiveJob backend.

## Why Replace Resque

- 7 separate gems in production: resque, resque-pool, resque-scheduler, plus multiple custom forks to handle edge cases
- Complexity had become unmanageable — David Heinemeier Hansson saw the list and said "what is this, this cannot be so complicated"
- Resque is very old, supports any Ruby app (not just Rails), so it reimplements things ActiveJob already provides: retries, error handling, serialization
- Redis data structures (lists) make it hard to filter jobs by class within a queue — e.g. fetching all jobs of a specific type for cleanup requires awkward workarounds
- Solid Cache (database-backed Rails cache) had already proven the database-as-backend concept in production — David wanted to apply the same idea to jobs

## Why Not GoodJob or Sidekiq

- Sidekiq uses Redis — the explicit goal was to eliminate Redis as a dependency
- GoodJob uses Postgres-specific features (notably `LISTEN/NOTIFY`) that are unavailable in MySQL and SQLite
- 37signals uses MySQL — GoodJob wasn't compatible, and backporting MySQL support would have made GoodJob significantly worse
- Investigated contributing MySQL support to GoodJob; spent several days on the codebase; confirmed with GoodJob author Ben Sheldon at Rails World Amsterdam that it wasn't a viable path
- Building on top of ActiveJob meant retries, error handling, and argument serialization came for free

## Migration Strategy: Hey First, Then Basecamp

- Chose Hey (email service, launched 2019) as the migration target rather than Basecamp — same 7 gems, but lower job criticality margin than Basecamp's main data
- Ran Resque and Solid Queue simultaneously throughout the entire migration period
- ActiveJob's per-job queue adapter setting (`:queue_adapter` can be set per class) allowed moving individual job classes one at a time
- Started with zero-user-impact jobs: "incineration" (permanent deletion after soft-delete periods — 25 days for emails, 60 days for accounts after cancellation)
- Those early jobs required only two features: enqueue and schedule-in-future — formed the initial implementation target
- Migration overlapped with the Hey → Kamal cloud exit; paused Solid Queue work entirely for several months until Kamal migration settled, then resumed
- For scheduled future jobs (including retry-delayed jobs), manually migrated anything scheduled more than 12 hours out by fetching from Resque and bulk-inserting into Solid Queue
- Once a job class was fully moved to Solid Queue, removed that queue from the Resque config entirely

## Database Architecture Decision

- Initially shared the application database — enables transactional integrity: enqueuing a job inside a transaction means the job isn't visible until the transaction commits, preventing "job runs before data exists" races
- GoodJob uses the same-database approach by default for the same reason
- Switched to a separate dedicated database after calculating write load from concurrency controls — too risky to add that write pressure to the main application DB
- Production scale at Hey: ~20M jobs/day; dedicated Solid Queue DB: 32 CPUs, 64 GB RAM, 350 GB disk with two replicas
- Recommended default is now a separate database; starting with the same DB would have saved significant migration pain

## Job Design Philosophy

- Keep job `perform` methods minimal — ideally one or two lines; all logic lives in the model
- Test the model directly for job logic; use ActiveJob test helpers to verify enqueue arguments, retry delays, and scheduling
- Prefer many small independent jobs over one large job that orchestrates a sequence — easier to retry, no reentrant concerns
- Avoid using the job system as an orchestrator (jobs depending on other jobs) — hard to debug, hard to trace failures
- Solid Queue does not yet have batch/flow features (jobs triggering downstream jobs) — intentional, because 37signals doesn't use that pattern
- Coming soon: open-source library (by Donald Pinckney) for easily interrupting and resuming long-running jobs — avoids the need for job dependency chains

## Recurring Jobs vs. Future-Scheduled Jobs

- Do not self-schedule recurring jobs (job enqueues its next run at completion) — if enqueue fails, the recurrence is silently lost forever; Hey had recycler jobs break this way
- Use Solid Queue's built-in recurring jobs (defined in a YAML config file, Cron-like but run by Solid Queue — no Unix cron process needed) for any task that must reliably repeat
- Self-scheduling was originally needed because Resque Scheduler (the recurring plugin) was hard to run inside a Docker/Kamal container; Solid Queue solved this natively
- Future-scheduled deletion jobs create "zombie" enqueues: delete → restore → delete again leaves two jobs in queue; both must defensively check whether the record is still in the correct state and due for deletion
- Preferred pattern: store a `due_at`-style column on the record; a recurring job sweeps for anything due — logic change takes effect immediately on next sweep, no stale future-jobs to reason about

## Debugging and Observability

- Solid Queue stores job state explicitly in separate database tables: ready, scheduled, running, failed, blocked
- Standard ActiveRecord queries replace Resque's awkward Redis API for inspection and cleanup
- During migration at ~50% jobs moved, detected a self-DDOS from an automatic scanner creating a flood of jobs of one type — identified and cleaned up via SQL in minutes; same investigation in Resque would have been far harder
- Mission Control Jobs (the 37signals job dashboard gem) needed to be updated to support Solid Queue before the migration could proceed — became a hard blocker; the team stopped all other Solid Queue work until Mission Control supported it
- Mission Control Jobs provides: queue inspection, in-progress jobs, job history, failed job retry/discard — essential for on-call intervention without console access
- Alerts: simple check on the `solid_queue_failed_executions` table (count > 0 triggers notification); mirrors how Resque stored failures separately in Redis

## Testing Background Jobs

- Job classes themselves contain almost no logic — test the underlying model methods, not the job
- Use ActiveJob test helpers (`assert_enqueued_with`, `assert_performed_with`) to verify enqueue arguments, queue name, delay on retry
- Add job-specific tests reactively: when a bug is found (e.g. retry not happening with expected delay), fix it and add the regression test
- Notable external gem: `acidic_job` (Stephen Margheim, "the SQLite guy") for idempotent jobs; companion gem `chaotic_job` for chaos-testing jobs by injecting random errors and failures during execution
- 37signals does not yet use `chaotic_job` but Rosa views it as high-potential for testing failure scenarios

## Long-Running Job Handling (Exports)

- Data exports (Hey and Basecamp) can take hours for large accounts — interrupted by Kamal deploys (grace period stops old containers before new ones start)
- Kamal does not allow two code versions to run simultaneously (except during the brief grace period), so long jobs must be resumable
- Solution: pin export jobs to a specific server/VM using the queue name — all export jobs enqueue into a named queue that runs only on one server with a mounted Docker volume
- Progress stored as a file on that volume in a per-export directory; on restart, job reads the file, finds its last position, and resumes
- Export record in the database tracks status: pending, resuming, interrupted, complete
- This pattern works for any long-running job; database tracking is an equally valid alternative to file-based state
