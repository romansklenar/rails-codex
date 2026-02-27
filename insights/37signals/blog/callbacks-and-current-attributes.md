---
title: Callbacks & CurrentAttributes
source:
  type: blog
  title: Globals, callbacks and other sacrileges
  author: Jorge Manrubia
  url: https://dev.37signals.com/globals-callbacks-and-other-sacrileges/
  date: '2023-07-31'
tags:
- rails
- patterns
---

# Callbacks & CurrentAttributes

Use callbacks for secondary concerns. Use CurrentAttributes for request context.

## Callbacks for Side Effects

Callbacks work well for simple, peripheral operations:

```ruby
module Bucketable
  extend ActiveSupport::Concern

  included do
    after_create { create_bucket! account: account unless bucket.present? }
  end
end
```

Don't use callbacks for complex orchestration — use explicit service objects for that.

## CurrentAttributes for Request Context

```ruby
class Current < ActiveSupport::CurrentAttributes
  attribute :account, :person
  attribute :request_id, :user_agent, :ip_address
end
```

Automatic creator assignment without passing params through layers:

```ruby
class Project < ApplicationRecord
  belongs_to :creator, class_name: "Person", default: -> { Current.person }
end
```

## Suppress for Exceptions

Disable default behavior (e.g. event tracking) in rare cases:

```ruby
Event.suppress do
  # No events created during this block
  destination_bucket.record(source_recording.recordable)
end
```

## When Callbacks vs Services

| Use callbacks | Use services |
|--------------|-------------|
| Simple, one-line side effects | Multi-step orchestration |
| Orthogonal concerns (auditing, caching) | Core business logic |
| Always-on behavior | Conditional workflows |
