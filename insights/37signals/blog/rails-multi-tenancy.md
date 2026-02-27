---
title: Rails Multi-Tenancy
description: "Tenant isolation, cross-tenant safety, framework integration points for multi-tenant Rails"
source:
  type: blog
  title: Rails Multi-Tenancy
  author: Kimberly Rhodes, Fernando Olivares, Mike Dalessio
  url: https://dev.37signals.com/rails-multi-tenancy/
  date: '2026-02-13'
tags:
- rails
- architecture
---

# Rails Multi-Tenancy

Patterns for tenant isolation, schema switching, and safe cross-tenant boundaries. 37signals built `active_record-tenanted` for this.

## Tenant Isolation Principles

- **Every query must include tenant context** — without it, data leaks between customers
- **Explicit over implicit** — models must declare they are tenanted; silent defaults hide bugs
- **Fail loud when unscoped** — accessing data outside a tenant context should raise, not return global results

```ruby
# GOOD — explicit tenant scoping block
ApplicationRecord.with_tenant("acme") do
  User.first  # scoped to acme's schema/data
end

# BAD — no tenant context, risk of cross-tenant leak
User.first
# => Should raise: "Can't query tenanted model while untenanted"
```

## Cross-Tenant Write Prevention

Validate tenant ownership at save time, not just read time:

- Compare the object's tenant against the current connection context
- Raise on mismatch before hitting the database
- Prevents bugs where an object loaded in one tenant context is accidentally saved in another

```ruby
# Raises: "User belongs to tenant acme, but connected to tenant globex"
ApplicationRecord.with_tenant("globex") do
  user_from_acme.update(name: "X")
end
```

## Tenant Resolution (Middleware)

Resolve tenant identity early in the request lifecycle via Rack middleware:

- **Subdomains**: `acme.app.com` -> tenant "acme"
- **URL paths**: `/acme/resource` -> tenant "acme"
- **Custom logic**: lambda/callable for non-standard resolution
- Raise/404 if tenant is missing or invalid — never fall through to a default tenant

## Framework Integration Points

Every Rails subsystem that stores or caches data needs tenant awareness:

| Subsystem | Risk | Mitigation |
|-----------|------|------------|
| **Fragment caching** | Records with same ID across tenants share cache | Include tenant ID in cache keys |
| **Active Storage** | Files mixed across tenants | Prefix blob paths: `{tenant}/{blob_id}` |
| **Action Text** | Rich text joins cross tenant boundary | Store in same tenanted schema |
| **Action Cable** | Notifications leak to wrong users | Route WebSocket through tenant middleware |
| **Background jobs** | Worker connects to wrong tenant DB | Pass tenant context with every job |

## Migration & Schema Consistency

- Creating a new tenant must run all pending schema migrations automatically
- All tenants must stay at the same schema version
- Each tenant schema must mirror the same table structure

## Alternative: Schema-Based Tenancy

Instead of separate databases, PostgreSQL `search_path` switching offers a lighter-weight approach:

```ruby
# Switch PostgreSQL search_path per request
ActiveRecord::Base.connection.schema_search_path = "tenant_acme,shared,public"
```

Key differences from the separate-database approach:
- **Single database** — no connection pool per tenant, just schema switching
- **Shared tables possible** — `public` schema for cross-tenant data (users, config)
- **Same migration risks** — all schemas must stay in sync; run migrations per schema
