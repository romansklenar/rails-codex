---
title: Faster Pagination via Index Strategy
description: "Two-query pagination with covering indexes to reduce disk I/O on large datasets"
source:
  type: blog
  title: Faster pagination in HEY
  author: Donal McBreen
  url: https://dev.37signals.com/faster-paging-in-hey/
  date: '2022-11-07'
tags:
- rails
- performance
---

# Faster Pagination via Index Strategy

Optimize pagination queries by reducing disk I/O through index design, not by changing pagination style.

## Core Problem

Paginated queries on multi-tenant tables perform poorly when matching rows are scattered across many database pages. The DB must load all matching rows, sort them, then return one page. More tenants = more scattered data = slower filesorts.

## Two-Query Pattern

Split expensive paginated queries into two steps:

1. **ID query** — fetch only IDs from a covering index (fast, index-only scan)
2. **Data query** — fetch full records by primary key for just that page (fast, direct lookups)

```ruby
# Step 1: IDs from index (lightweight)
ids = Case
  .where(tenant_id: Current.tenant.id, status: :opened)
  .order(created_at: :desc)
  .limit(PAGE_SIZE)
  .offset(offset)
  .pluck(:id)

# Step 2: Full records by PK (direct lookups, no filesort)
Case.where(id: ids).order(created_at: :desc)
```

## Covering Index Design

A **covering index** contains all columns the query needs, avoiding table lookups entirely.

```ruby
# Migration: index covers tenant_id, filtering, and sorting
add_index :cases, [:tenant_id, :status, :created_at, :id],
          name: "index_cases_on_tenant_pagination"
```

- Column order matters: tenant filter first, then filter columns, then sort column, then PK
- The query planner can satisfy WHERE + ORDER BY + SELECT from the index alone
- PostgreSQL calls this an "Index Only Scan" (equivalent to MySQL's "Using index")

## PostgreSQL Notes

The original post uses MySQL's `FORCE INDEX`. PostgreSQL equivalents:

- Use `EXPLAIN ANALYZE` to verify Index Only Scans
- Ensure `VACUUM` runs to keep visibility map current (required for index-only scans)
- Consider `INCLUDE` columns in indexes for covering without affecting sort order:

```ruby
add_index :cases, [:tenant_id, :status, :created_at],
          include: [:id],
          name: "index_cases_on_tenant_pagination"
```

## When to Apply

- Paginated listing pages with > 10k rows per tenant/scope
- Queries showing sequential scans or bitmap heap scans in `EXPLAIN`
- Standard OFFSET-based pagination is acceptable for small datasets, but consider the two-query pattern at scale
- Cursor-based pagination (`before`/`after`) avoids OFFSET overhead entirely for infinite scroll
