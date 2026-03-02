---
title: Concerns
description: "Semantic test, file location rules, and PORO delegation for Rails concerns"
source:
  type: blog
  title: Good concerns
  author: Jorge Manrubia
  url: https://dev.37signals.com/good-concerns/
  date: '2022-10-10'
tags:
- rails
- patterns
---

# Concerns

## Semantic Test

A concern must pass the "has trait" or "acts as" test:
- `Case` **acts as** `Closable` ✔
- `Task` **is** `Sortable` ✔
- `User` **has trait** `SolverStats` ✔
- `Case::HelperMethods` ✘ (arbitrary container, not a domain concept)

If you can't describe the concern as a trait or role, it's probably a code dump. Refactor into proper objects.

## File Location

**Single-model concerns** — live under the model directory:
```
app/models/case/closable.rb        # module Case::Closable
app/models/user/solver_stats.rb    # module User::SolverStats
```

**Multi-model concerns** — stay in `app/models/concerns/`:
```
app/models/concerns/sortable.rb    # included in Task, TaskList
app/models/concerns/pagination.rb  # included in ApplicationRecord
```

**Controller concerns** — `app/controllers/concerns/`

## Concern as Domain API

When a concern grows complex, keep the concern as a thin API layer and delegate to PORO classes:

```ruby
# app/models/case/closable.rb
module Case::Closable
  extend ActiveSupport::Concern

  def close!(reason:)
    Case::Closing.new(self).execute(reason:)
  end
end

# app/models/case/closing.rb
class Case::Closing
  def initialize(record)
    @record = record
  end

  def execute(reason:)
    # complex multi-step logic here
  end
end
```

This keeps the model API clean while allowing the logic to grow without bloating the concern.

## Naming

- No `Concern` suffix (`Sortable`, not `SortableConcern`)
- Use adjectives or verb-derived names: `Closable`, `Sortable`, `Pagination`
- Use `Has*` for data-bearing traits: `HasLegacyDocument`
