---
title: Vanilla Rails Stack
description: "Minimize dependencies, use what Rails provides, nobuild philosophy"
source:
  type: blog
  title: A vanilla Rails stack is plenty
  author: Jorge Manrubia
  url: https://dev.37signals.com/a-vanilla-rails-stack-is-plenty/
  date: '2024-12-12'
tags:
- rails
- architecture
---

# Vanilla Rails Stack

Minimize dependencies. Use what Rails provides.

## Stack Principles

- **Frontend:** Hotwire (Turbo + Stimulus), no React/Vue/Angular
- **CSS:** Vanilla CSS/SASS, no Tailwind/Bootstrap
- **JS bundling:** Importmaps + Propshaft (#nobuild)
- **Background jobs:** Solid Queue (database-backed, no Redis)
- **Caching:** Solid Cache (SQL-backed)
- **WebSockets:** Solid Cable (database-backed)
- **Models:** Rich ActiveRecord with concerns, not anemic + services

## Anti-patterns

- Don't default to service objects, interactors, or command patterns
- Don't add gems for things Rails already does
- Don't separate persistence from domain logic without reason

## When to Add Complexity

Only when the vanilla approach demonstrably fails. "The burden of proof is on the new abstraction."
