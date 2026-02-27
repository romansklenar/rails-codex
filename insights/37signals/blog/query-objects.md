---
title: "Query Objects"
source: https://dev.37signals.com/active-record-nice-and-blended/
description: "PORO query wrappers for complex multi-model queries beyond simple scopes"
tags: [rails, patterns]
---

# Query Objects

Wrap complex query logic in Plain Ruby objects when a scope isn't enough.

## When to Use

- Query spans multiple models or requires conditional logic
- Query needs fallback strategies or optimization branches
- Scope chain would exceed 3-4 chained scopes
- Query is reused across controllers/jobs

## Pattern

```ruby
# app/models/case/activity_feed.rb
class Case::ActivityFeed
  def initialize(record, since: 1.week.ago)
    @record = record
    @since = since
  end

  def entries
    Fragment
      .where(case: @record)
      .where('created_at > ?', @since)
      .includes(:author, :comments)
      .order(created_at: :desc)
  end
end

# Usage
Case::ActivityFeed.new(@case, since: 2.days.ago).entries
```

## File Location

Follow the model-namespaced pattern from the concerns standard:
- `app/models/case/activity_feed.rb` for Case-specific queries
- `app/models/queries/` for cross-model queries

## Keep Simple Queries as Scopes

```ruby
# Still a scope — simple, single-model, chainable
scope :recent, -> { where('created_at > ?', 1.week.ago) }

# Query object — complex, multi-model, optimization logic
class Case::ActivityFeed ... end
```
