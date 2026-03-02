---
title: "5 Tips for Dealing with Heavy ActiveRecord Dashboards in Rails"
description: "Performance techniques for Rails dashboard views: building explicit data structures, restricting view API to prevent N+1 queries, eager loading with association load guards, selective column loading, and denormalization via PostgreSQL materialized views"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Kir Shatrov"
  url: "https://evilmartians.com/chronicles/5-tips-for-activerecord-dashboards"
  date: '2016-01-12'
tags: [rails, activerecord, performance, postgresql, n-plus-one, dashboards, optimization]
---

# 5 Tips for Dealing with Heavy ActiveRecord Dashboards in Rails

Performance techniques for Rails dashboards that aggregate many models — from explicit data structures and API restriction to selective column loading and database-level denormalization.

## Core Insight

- "Using ActiveRecord for fetching data doesn't mean you have to operate with ActiveRecord objects in views"
- Dashboard views often carry the full weight of ActiveRecord objects when they only need a few fields
- The view layer should receive pre-built, immutable data structures — not live AR models with lazy-load capabilities

## Tip 1: Build Explicit Data Structures

- Instead of multiple `@instance_variables` (one per model collection), construct a single hash representing the full page state
- Example structure:
  ```ruby
  {
    stages: [{ id: 1, title: "Initial", slug: "initial" }],
    users:  [{ id: 1, visible: false }],
    posts:  [{ id: 1, tags: [] }]
  }
  ```
- Benefits: explicit shape, immutability, easier to serialize to JSON for client-side frameworks, simpler to test
- Makes the controller's data contract with the view explicit and reviewable

## Tip 2: Limit the API Exposed to Views

- Restrict what the view can do with the data to prevent uncontrolled queries
- Anti-pattern to avoid: `user.posts.first(5).map(&:title).join(", ")` — triggers queries from within the view
- Options: use value objects or plain structs instead of AR models in view locals; use `ActiveModel::Model` for non-DB-backed presenters
- Presenters or decorators that only expose pre-computed values prevent callers from accidentally traversing associations
- In the extreme: pass only primitives (strings, integers, arrays of hashes) — zero chance of lazy queries

## Tip 3: Preload Records and Guard Against N+1

- Use `includes(:association)` to eager-load associations before rendering
- Add defensive guards in views/components to verify associations are loaded:
  ```ruby
  @users = User.all.includes(:posts)
  @users.each do |user|
    raise "association not preloaded" unless user.association(:posts).loaded?
    user.posts.each(&:title)
  end
  ```
- The guard raises an error during development/test if someone removes the `includes` — catches regressions early
- Combine with the `n_plus_one_control` gem (RSpec matchers) to write automated N+1 regression tests
- For complex dashboards, consider using `ActiveRecord::Associations::Preloader` directly for fine-grained control

## Tip 4: Load Only Required Columns

- Loading full AR objects for dashboards that only display 2-3 fields wastes memory and slows serialization
- Use `select(:id, :name, :status)` to load only needed columns: `User.select(:id, :name).where(...)`
- Reduces memory consumption proportionally to the number of unused columns per record
- Use `model.accessed_attributes` (or manually inspect usage) to identify which fields are actually read in the view
- For read-only dashboard display: `pluck(:id, :name)` returns arrays of scalars — even less overhead than AR objects
- Trade-off: `select` still returns AR objects (with associations), `pluck` returns plain Ruby arrays

## Tip 5: Denormalize Data at the Database Level

- For aggregations and summary data: compute and cache at the database level rather than in Ruby
- **PostgreSQL Materialized Views**: pre-compute expensive joins/aggregations, refresh on schedule or on demand
  - `CREATE MATERIALIZED VIEW dashboard_summary AS SELECT ...`
  - `REFRESH MATERIALIZED VIEW dashboard_summary` (run via cron or after data changes)
  - ActiveRecord can query materialized views just like tables
- **MySQL alternative**: SQL functions and triggers to maintain denormalized summary columns
- **Elasticsearch**: for complex denormalized aggregations, full-text search, and faceting — offload analytics entirely
- Denormalization trades write complexity for read simplicity — appropriate for data that changes infrequently but is read heavily

## Bonus: Plain SQL with POROs

- For the most performance-critical dashboard sections, bypass ActiveRecord entirely
- Execute raw SQL and map results to POROs (Plain Old Ruby Objects) or `Struct` instances
- Example: `ActiveRecord::Base.connection.execute(sql).map { |row| DashboardRow.new(**row) }`
- POROs have no association-loading machinery — zero risk of N+1, minimal memory overhead
- This approach is appropriate for read-only analytics views where the full AR model lifecycle is unnecessary overhead
