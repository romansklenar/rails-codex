---
title: "Delegated Types vs View-Based STI"
source: https://dev.37signals.com/the-rails-delegated-type-pattern/
description: "Architectural comparison of delegated_type vs view-based STI patterns"
tags: [rails, architecture]
---

# Delegated Types vs View-Based STI

Comparison of two approaches for polymorphic content types in Rails.

## Delegated Type (Rails Built-in)

```ruby
class Recording < ApplicationRecord
  delegated_type :recordable, types: %w[Message Document Comment]
  # Common: timestamps, creator, bucket, permissions
end

class Message < ApplicationRecord
  # Message-specific fields only
end
```

- Shared parent table (`recordings`) stores metadata
- Child tables store type-specific content
- Single query on `recordings` for pagination, filtering, sorting
- New types = new table + registration, no parent migration

## View-Based STI (UNION ALL)

```ruby
class Fragment < ApplicationRecord
  self.primary_key = :id  # backed by UNION ALL view
end

class Task < Fragment
  self.table_name = 'tasks'
end
```

- No shared parent table — UNION ALL view unifies types
- Each type owns all its columns (no sparse parent table)
- Query via view for cross-type, via table for single-type
- New types = new table + add to view definition

## When Each Fits

| Factor | Delegated Type | View-Based STI |
|--------|---------------|-------------|
| Shared metadata | Many shared columns | Few shared columns |
| Cross-type queries | Fast (parent table) | View-based (slightly slower) |
| Type-specific queries | Join required | Direct table access |
| Adding new types | Register in parent | Update view definition |
| Rails built-in | Yes (`delegated_type`) | Custom pattern |

## Decision Guide

Choose **View-Based STI** when subtypes have significantly different schemas — a shared parent table would be mostly empty columns or require excessive joins. Choose **Delegated Type** when subtypes share many attributes and cross-type queries are frequent.
