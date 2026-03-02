---
title: "Flying Free: A Tale of Partitioning with Canaries in PostgreSQL"
description: "Canary-based PostgreSQL partitioning strategy for a 140GB, 60M-row table — combining gradual user rollout with bidirectional table synchronization, query linting via ActiveSupport Notifications, and Sidekiq job routing"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Denis Lifanov, Alexander Baygeldin"
  url: "https://evilmartians.com/chronicles/flying-free-a-tale-of-partitioning-with-canaries-in-postgresql"
  date: '2024-07-23'
tags: [postgresql, rails, partitioning, canary-deployment, performance, sidekiq, activerecord, database-migrations]
---

# Flying Free: A Tale of Partitioning with Canaries in PostgreSQL

A production story of migrating an 800K-user platform's 60M-record, 140GB table to a partitioned schema using a canary rollout strategy — routing a subset of users to the new table while keeping both synchronized, then gradually expanding.

## Project Context and Motivation

- Platform: 800,000+ users, table: 60 million records, size: 140GB
- High growth caused progressive query performance degradation requiring database redesign
- Three blockers prevented a standard "big bang" migration:
  1. No query statistics/analysis tooling to identify exactly which queries were slow
  2. No ability to freeze features during active development
  3. Complex legacy codebase requiring broad developer coordination
- Solution: "canary-based partitioning" — combine database partitioning with progressive canary rollout

## Query Analysis Linter

- Built a custom linter using `ActiveSupport::Notifications` and the `pg_query` gem (PostgreSQL query parser)
- Linter subscribes to `sql.active_record` events and checks whether queries on partitioned tables include the partition key in `WHERE` clauses
- Queries missing the partition key cause full partition scans — the linter surfaces these in production logs
- Sampling logic for production: only check a configurable percentage of queries to avoid overhead
- Example subscriber: `ActiveSupport::Notifications.subscribe('sql.active_record', PartitionKeyReporter.new('resources', 'user_id'))`
- Provides real-time visibility into which code paths need fixing before full cutover

## Database Setup Steps

1. Create `resources_partitioned` table with the same structure as `resources`
2. Add triggers on `resources` that copy every INSERT/UPDATE/DELETE to `resources_partitioned`
3. Migrate existing data in chunks (background job) to avoid downtime
4. Establish **bidirectional** synchronization: changes in either table propagate to the other
5. Bidirectional sync enables safe rollback — flip routing back, data in `resources` is always current

## Index Management

- Add indexes **after** populating the partitioned table (not before) — adding indexes to empty partitions is faster
- Estimate index creation time on staging with production-volume data before attempting in production
- Temporarily disable triggers during index creation to reduce performance impact during the copy phase
- After index creation, sync records changed during the copy phase using `updated_at` timestamps
- Audit and remove unused indexes — partitioned tables often make some old indexes redundant

## Foreign Key Constraints

- Use `NOT VALID` flag when adding foreign key constraints: `ALTER TABLE ... ADD CONSTRAINT ... FOREIGN KEY ... NOT VALID`
- `NOT VALID` adds the constraint without scanning existing rows — zero downtime
- Validate separately with `ALTER TABLE ... VALIDATE CONSTRAINT ...` during a low-traffic window
- Partitioned tables require **composite foreign keys**: partition key + original primary key
- Create `NOT VALID` foreign keys per partition, then validate the parent table constraint

## Application-Level Routing (Canary)

```ruby
class Resource < ApplicationRecord
  if ENV['CANARY']
    self.table_name = :resources_partitioned
    self.primary_key = :id
  else
    self.table_name = :resources
  end
end
```

- `ENV['CANARY']` is set per-process based on which user cohort the process is serving
- Network-level: implement proxy-based routing using the partition key (user ID from JWT token in request headers)
- Start with a whitelist of specific user IDs hardcoded as canaries; expand to ID ranges as confidence grows
- One production approach: alphabetical ordering of user IDs for deterministic, gradual expansion

## Background Job Routing (Sidekiq)

- More complex than request routing — jobs don't inherently carry user context
- Option 1: route by job type, migrating job classes one at a time
- Option 2: custom Sidekiq client middleware that inspects job arguments and routes to `default` or `default_partitioned` queue based on user ID
- Workers for each queue run in separate process groups, each with the appropriate `CANARY` env var set
- Gradually migrate queues until all job types run through the partitioned path

## Canary Selection Criteria

- Choose active users but not top-tier/VIP accounts — avoid high-visibility failures
- Start with a very small group (e.g., 1% of users) to catch bugs before they affect many people
- Expand incrementally: 1% → 5% → 20% → 50% → 100% ("all users become happy canaries")
- Monitor error rates, query performance, and deadlock frequency at each expansion step

## RSpec Matcher for Partition Key Usage

```ruby
RSpec::Matchers.define :use_partitioning do |table_name, partition_key|
  match do |actual|
    success = true
    callback = lambda do |event|
      query = event.payload[:sql]
      next unless query.match?(/\s+"?#{table_name}"?\s+/)
      next if query.match?(/"?#{table_name}"?\."?#{partition_key}"?\s+(=|BETWEEN|IN)/)
      success = false
    end
    ActiveSupport::Notifications.subscribed(callback, 'sql.active_record') { actual.call }
    success
  end
end
```

- Use in tests: `expect { Resource.where(user_id: 1).load }.to use_partitioning('resources', 'user_id')`
- Catches regressions where code removes the partition key from queries

## Advantages of Canary-Based Partitioning

- **Real-time statistics**: query linter provides production data on problematic queries before full cutover
- **Gradual risk reduction**: each cohort expansion validates fixes on real traffic
- **Rollback capability**: bidirectional sync means flipping `CANARY` env var reverts routing instantly with no data loss
- **Flexible testing**: can target any specific user cohort for testing (e.g., internal users first)

## Drawbacks and Mitigations

- **Doubled storage**: both `resources` and `resources_partitioned` exist simultaneously — 2x disk usage
- **Doubled write load**: every write goes to both tables via triggers — monitor DB server load carefully
- **Deadlock risk**: concurrent updates to the same row via different workers (one in canary, one not) can deadlock; careful operation ordering in triggers and application code required
- All developers must understand the dual-table architecture — schema changes (new columns, index changes) must be applied to both tables and their triggers

## Rails 7.1 Composite Key Support

- Rails 7.1.0 introduced native composite primary and foreign key support (`query_constraints`, composite `has_many`)
- Beneficial for partitioned schemas where `(partition_key, id)` is the composite primary key
- Requires careful testing when adopting in an existing partitioned setup

## Key Principle

- "All-or-nothing" partitioning carries enormous risk on large production systems
- Canary partitioning treats each user cohort as a controlled experiment — measurable, reversible, gradual
- The approach scales the migration effort: small teams can safely partition huge tables without feature freezes
