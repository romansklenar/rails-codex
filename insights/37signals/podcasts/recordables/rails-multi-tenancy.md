---
title: Rails Multi-Tenancy with Mike Dalessio
description: "How 37signals built the active_record_tenanted gem to make Rails multi-tenancy safe, usable, and framework-wide"
source:
  type: talk
  title: Rails Multi-Tenancy with Mike Dalessio
  author: Mike Dalessio
  url: https://www.youtube.com/watch?v=J1I3puqWDEw
  date: ''
tags:
- rails
- multi-tenancy
- sqlite
- active-record
- database
- architecture
- fizzy
- once
---

# Rails Multi-Tenancy with Mike Dalessio

37signals built a new multi-tenancy gem for Rails after finding the existing `apartment` gem too old, inefficient, and too narrow — covering only ActiveRecord while leaving the rest of Rails unaware of tenant context.

## The Problem with Shared Databases

- Default Rails SaaS pattern: all customers co-mingled in one database, isolated only by `account_id` scoping in queries
- Any forgotten `WHERE account_id = ?` in production leaks data across customers — silent in tests, explosive in production
- Scaling requires increasingly large database machines with expensive replication (Basecamp and Hey both run on large replicated MySQL clusters)
- No tenant isolation = no easy customer data export or deletion (files all land in one S3 bucket / directory)

## Why the `apartment` Gem Falls Short

| Issue | Detail |
|---|---|
| Age | ~12 years old, shows its age |
| Thread safety | Not fully thread-safe in all circumstances |
| Connection handling | Closes and reopens connections on tenant switch instead of pooling |
| Scope | Only patches ActiveRecord — fragment cache, Action Cable, Active Storage all remain unaware |
| API | Global singleton (`Apartment.switch`) — can't handle multiple tenancy dimensions in one app |

## What `active_record_tenanted` Fixes

- Tenant methods live on application model classes, not a global singleton — enables multiple tenancy dimensions in one app simultaneously
- Rack middleware intercepts requests, reads the tenant from the subdomain (or any custom lambda), and connects to the right database before the request hits Rails
- Connection pool is kept open and reused across tenant switches — no close/reopen overhead
- Tenant name used as both subdomain key and database filename — network and database layers unified by convention

## Framework-Wide Tenant Awareness

The gem patches all Rails subsystems that can cross tenant boundaries:

- **Fragment cache**: cache keys automatically scoped to tenant — prevents account A's cached view serving to account B when both have record ID 1
- **Active Storage**: blob keys prefixed with `tenant_id/` — enables per-tenant directory on disk or in S3, clean account deletion/export
- **Action Text / rich text**: Rails internal models (normally in a separate class hierarchy) injected as "subtenants" so joins across `ActionText::RichText`, `ActiveStorage::Blob`, and application models work within a single tenanted database
- **Action Cable**: tenant context propagated to WebSocket connections — still needs per-app wiring validation

## Safety Checks

- Querying the database outside any tenant context raises an exception immediately — no silent queries returning wrong-tenant data
- Saving a model object loaded from tenant A while connected to tenant B raises a safety exception at runtime — cross-stream writes blocked at the framework level
- Goal: make it structurally impossible for a developer to accidentally co-mingle customer data

## Tenant Resolution is Pluggable

```ruby
# Default: subdomain
# foo.rightbook.com → tenant "foo" → storage/foo.sqlite3

# Fizzy's approach: first path segment (like Basecamp)
# app.fizzy.com/123456/... → tenant "123456"

# Custom: pass any lambda that receives the request and returns a tenant name
```

## Multi-Dimensional Tenancy (Advanced)

The model-scoped API unlocks multiple tenancy dimensions within a single app:

- Fizzy used `ApplicationRecord` tenanted by customer `account_id` (SQLite file per customer)
- Solid Queue databases tenanted by region (`SolidQueueRecord.with_tenant("us-east") { ... }`) — job workers connect to the geographically local queue database
- Both dimensions active simultaneously in the same process with no conflicts

## SQLite Multi-Tenancy: What Worked vs. What Blocked Launch

| Layer | Status |
|---|---|
| Per-customer SQLite files in Rails | Working — gem solid after ~6 months internal use on Fizzy |
| Single-machine deployment | Fully functional — could have shipped day one |
| Global replication (read replicas) | Working |
| Write routing across regions | Blocked — coupling between network routing and database routing requires a unified stack |
| Automatic failover | Incomplete — edge cases found weekly; `primary/passive` mode concept exists but not productionized |

Fizzy launched with MySQL instead. SQLite multi-tenancy was not discarded — it was not finished in time.

## Converting an Existing App (Writebook Demo)

Changes needed to make the open-source Writebook app multi-tenant with per-tenant SQLite databases:

1. Add `tenanted` to `ApplicationRecord`
2. Update `database.yml` to use `%{tenant}` format specifier in the database path
3. Rack middleware wires subdomain → tenant automatically

Result: `ApplicationRecord.create_tenant("foo")` creates the database file and runs all migrations. Active Storage files land in `storage/foo/` automatically. Total code change: ~5 minutes.

## Path to Rails Core

- Mike's goal: upstream `active_record_tenanted` into Rails as an opt-in feature
- Prerequisite: production mileage — plan is to convert all ONCE products (Writebook, Campfire, etc.) to multi-tenant SQLite to prove the gem in production
- Missing Rails primitive needed first: a first-class `primary/passive` mode concept for failover — currently reimplemented in Hey, Solid Queue fork, and Beamer separately
- Replication daemon (`Beamer`, written in Go by Kevin McFadden) needs to be open-sourced and stabilized before SQLite multi-tenancy can be recommended at scale
