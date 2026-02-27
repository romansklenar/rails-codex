---
title: "Fractal Code Quality"
source: https://dev.37signals.com/fractal-journeys/
description: "Four qualities at every abstraction level — domain-driven, encapsulated, cohesive, symmetric"
tags: [process, code-quality]
---

# Fractal Code Quality

Good code repeats the same qualities at every abstraction level.

## Four Qualities

1. **Domain-driven** — names reflect business concepts, not implementation
2. **Encapsulated** — clear interfaces, hidden details
3. **Cohesive** — single responsibility from the caller's perspective
4. **Symmetric** — operations at consistent abstraction levels

## Example: Event Relay

```ruby
# Top level — orchestration
def relay_now
  relay_to_or_revoke_from_timeline
  relay_to_webhooks_later
  relay_to_customer_tracking_later
end

# One level down — still domain language
def relay_to_or_revoke_from_timeline
  if should_appear_on_timeline?
    Timeline::Relayer.relay(self)
  else
    Timeline::Revoker.revoke(self)
  end
end
```

Each method deals with one thing. Names stay in domain language at every level.

## Symmetric Classes

Mirror classes reduce cognitive load: `Timeline::Relayer` / `Timeline::Revoker`.

## Extract Even Single-Line Methods

If extraction preserves abstraction level consistency, do it — even for one-liners.
