---
title: 'Hotwire: Minimal JavaScript'
description: "Layer Stimulus on existing behavior, server-rendered state, minimal client-side JS"
source:
  type: blog
  title: Building Basecamp project stacks with Hotwire
  author: Nicklas Ramhoj Holtryd
  url: https://dev.37signals.com/building-basecamp-project-stacks-with-hotwire/
  date: '2023-11-07'
tags:
- hotwire
- stimulus
---

# Hotwire: Minimal JavaScript

Layer Stimulus on existing behavior. Don't rewrite — enhance.

## Pattern

1. Server renders HTML with standard CRUD actions
2. Turbo Streams handle DOM updates from controller responses
3. Stimulus controllers add only the JS that HTML can't do (drag-drop, keyboard shortcuts)

## Keep Controllers Small

Basecamp added drag-and-drop stacking in 37 lines of JS by:
- Reusing existing positioning logic (server-side)
- Returning `turbo_stream.replace` from the controller
- Stimulus only handles the drag event → POST form data

## Anti-pattern

Don't build client-side state management. If the server knows the state, let the server render it.

```ruby
# Controller returns Turbo Streams — no client-side state
respond_to do |format|
  format.turbo_stream
end
```
