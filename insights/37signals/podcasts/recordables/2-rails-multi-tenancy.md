---
title: Rails Multi-Tenancy
description: "How 37signals built the active_record_tenanted gem to make Rails multi-tenancy safe, efficient, and framework-wide"
source:
  type: talk
  title: Rails Multi-Tenancy
  author: Mike Dalessio
  url: https://dev.37signals.com/rails-multi-tenancy/
  date: '2026-02-13'
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

# Rails Multi-Tenancy

Mike Dalessio (Security Infrastructure and Performance team, previously at Shopify on Ruby performance) discusses multi-tenant database architecture in Rails and the `active_record_tenanted` gem he built for 37signals.

## Why Multi-Tenancy Matters

- Keeps customer data separate and private
- Prevents developers from accidentally exposing one customer's data to another
- Enables clean per-tenant data export and deletion (files land in separate directories, not one shared bucket)
- Default Rails SaaS pattern — all customers co-mingled, isolated only by `account_id` scoping — is fragile: one forgotten `WHERE` clause leaks data silently

## The Fizzy SQLite Vision

- Original goal: per-customer SQLite file per database (local disk vs. network latency)
- Core complication: SQLite allows only one writer at a time → complex routing when requests come from multiple regions worldwide
- Required coupling network-layer routing with database-layer connection management — architecturally awkward
- Also needed: replication, failover, and consistency mechanisms

## Why the `apartment` Gem Falls Short

| Issue | Detail |
|---|---|
| Age | Mature but showing age |
| Thread safety | Not thread-safe in all circumstances |
| Connection handling | Closes and reopens connections on switch instead of pooling |
| Scope | Only patches ActiveRecord — fragment cache, Action Cable, Active Storage remain unaware |
| API | Global singleton — cannot handle multiple tenancy dimensions simultaneously |

## `active_record_tenanted` (Mike's Solution)

- Efficient connection pooling — no close/reopen overhead on tenant switch
- Thread-safe operations
- Rack middleware extracts tenant identifier from requests (subdomain, path, or custom lambda) and connects to the right database before the request hits Rails
- Framework-wide tenant awareness across all relevant Rails subsystems

### Framework-Wide Integration

- **Fragment cache**: cache keys automatically scoped to tenant — prevents account A's cached view serving to account B
- **Active Storage**: blob storage paths automatically include tenant ID — clean per-tenant directories
- **Action Cable**: tenant context propagated to WebSocket connections

### Safety Mechanisms

- Raises exceptions when accessing an untenanted database outside any tenant context — no silent wrong-tenant queries
- Validates model instances match their connection's tenant context
- Prevents saving objects to incorrect tenant databases
- Safeguards for Action Cable connections

## Tenant Resolution API

- Lambda-based, pluggable
- Default: subdomain (`foo.rightbook.com` → tenant `"foo"`)
- Fizzy uses path-based approach (first path segment, like Basecamp)
- Multi-dimensional: can tenant by customer account AND by geographic region simultaneously

```ruby
# Default: subdomain
# foo.rightbook.com → tenant "foo" → storage/foo.sqlite3

# Fizzy's approach: first path segment
# app.fizzy.com/123456/... → tenant "123456"

# Custom: any lambda receiving the request and returning a tenant name
```

## Multi-Dimensional Tenancy

- Model-scoped API (not a global singleton) enables multiple tenancy axes in one process simultaneously
- Example: `ApplicationRecord` tenanted by customer `account_id`, Solid Queue databases tenanted by geographic region (`us-east`, etc.)
- Both dimensions active at the same time with no conflicts

## Live Demo: Converting Writebook to Multi-Tenant

Two code changes required:

1. Mark the database as tenanted (add `tenanted` to `ApplicationRecord`)
2. Update database path config to include tenant identifier (`%{tenant}` in `database.yml`)

System automatically creates separate database files and organises static assets by tenant.

## Why Fizzy Launched Without SQLite

| Layer | Status |
|---|---|
| Per-customer SQLite files in Rails | Working — gem solid after internal use on Fizzy |
| Single-machine deployment | Fully functional |
| Global replication (read replicas) | Working |
| Write routing across regions | Blocked — coupling between network and database routing |
| Automatic failover | Incomplete — edge cases appeared weekly |

- Emergent complexities arose during replication + failover implementation
- Unexpected combinations from coupling SQLite + Rails tenanting + global replication + network routing + automatic failover produced edge cases approximately weekly
- Time constraints → launched with MySQL instead; SQLite multi-tenancy was not discarded, it was not finished in time

## API Design

- Went through 3 iterations before achieving a natural Rails feel
- Goal: make multi-tenancy feel like a first-class Rails concern rather than a bolt-on

## Path to Rails Core

- Plan: use ONCE products (Writebook, Campfire, etc.) to accumulate production experience with multi-tenant SQLite
- Missing Rails primitive: "primary versus backup mode" for failover/replication — currently reimplemented separately in Hey, Solid Queue fork, and Beamer
- Upstream into Rails core once production-proven

## Open Source

- `active_record_tenanted`: available on GitHub
- Fizzy: open-source codebase with full implementation history
- Writebook: usable as an example multi-tenant app
