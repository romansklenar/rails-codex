---
title: "Keeping Rails Cool: The Modern Frontend Toolkit"
description: "Evil Martians' silver toolbox for Rails frontend in 2025: Hotwire for CRUD, Turbo Mount for isolated components, Inertia for SPAs, and Vite Ruby as the unifying build layer"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Irina Nazarova"
  url: "https://evilmartians.com/chronicles/keeping-rails-cool-the-modern-frontend-toolkit"
  date: '2024-12-10'
tags: [rails, hotwire, turbo-mount, inertia, vite, react, svelte, vue, frontend, architecture]
---

# Keeping Rails Cool: The Modern Frontend Toolkit

Evil Martians' recommended frontend stack for Rails startups in 2025: a layered approach of Hotwire, Turbo Mount, and Inertia, unified by Vite Ruby — "Cooling down Hot Wires with Inertia."

## The Overarching Philosophy

- No silver bullet — a silver toolbox: frontend tasks are diverse, so different layers serve different needs
- Rails' "big tent" doctrine enables alternative solutions alongside official ones (importmaps vs. Vite, Webpacker history)
- Choosing an alternative path requires trust in maintainers; Evil Martians uses these tools on real client projects
- The toolbox emerged from 2 years of experimentation across dozens of client projects
- All four tools (Hotwire, Turbo Mount, Inertia, Vite) are used, maintained, or contributed to by Evil Martians

## Tool 1: Hotwire / Turbo for Simple and CRUD Pages

- Best for pages where state can be fully delegated to the server
- Best for pages that do NOT resemble a complex existing component in the React/Svelte/Vue ecosystem
- Includes: simple CRUD, admin panels, wizards, screens with little cross-element state entanglement
- Combine with `ViewComponent` or `Phlex` for structured, reusable server-rendered UI components
- Turbo Music Drive demo used to show the upper limit of Hotwire productivity — complex interdependent updates pushed to the edge
- Beyond that limit, Hotwire requires reinventing React in a worse form — that's the signal to use the next tool

## Tool 2: Turbo Mount for Standalone Components

- Use when a specific UI piece needs reactivity that exceeds Hotwire's comfort zone
- Turbo Mount creates a bridge between Rails views and React/Vue/Svelte components at the component level
- Handles prop passing and lifecycle events automatically; embed via `<%= turbo_mount("Player", props: {...}) %>`
- Example: replaced a custom Stimulus music player (`player_controller.js + _player.html.erb`) with a React component in 50 lines of React/TS
- Benefits: leverages existing library components, eliminates custom JS, isolates component code, reduces total codebase size
- Limitation: reactivity is scoped to that component; cross-page or multi-component state still belongs to Inertia

## Tool 3: Inertia for Full SPAs

- Use when the whole page needs reactivity: multiple interdependent widgets, real-time updates, complex shared state
- Inertia.js with Rails: no separate API layer — use existing routing, controllers, and conventions
- Only the view layer changes; backend logic stays intact
- Use React as a pure view layer (not a multi-functional app with its own routes, stores, API clients)
- Benefit: frontend team (or AI tools like Bolt) can own the UI while Rails handles business logic
- Reduces HTTP round-trips: local state for UI (e.g., music player state changes) without server requests
- `Typelizer` gem generates TypeScript types from Rails models/serializers — type-safe data flow from Rails to React/TypeScript frontend
- Inertia supports SSR, enabling HTML-over-the-wire feel when needed with additional setup

## Tool 4: Vite Ruby — The Secret Ingredient

- Vite Ruby is the foundation that makes the entire toolbox viable
- Abstracts specific build tools: uses `esbuild` for dependency pre-bundling, `Rollup` for production bundles (future: `Rolldown`)
- Provides fast development builds, excellent DX, and a flexible plugin system
- Unlike `#nobuild` (importmaps), Vite doesn't lock out gems that require a build step
- Works with all three frontend strategies: Hotwire JS modules, Turbo Mount component bundles, Inertia SPA bundles

## Decision Criteria: Choosing the Right Tool

- Use Hotwire if: state stays on the server, no existing framework components are being recreated, CRUD-style interactions
- Use Turbo Mount if: one isolated component needs heavy reactivity (e.g., a chart, color picker, spreadsheet widget)
- Use Inertia if: the entire page or section is highly interactive with shared local state across many components
- These tools are progressive: start with Hotwire, add Turbo Mount islands, migrate sections to Inertia as complexity grows
- Backend code is designed to stay stable across transitions — controller logic doesn't change when switching view layers

## Practical Compatibility and Migration Path

- Hotwire to Turbo Mount: incremental — add `turbo-mount` gem, register one component, replace its Stimulus controller
- Turbo Mount to Inertia: the Rails controller actions stay the same, only the response format changes (Inertia responses vs. HTML partials)
- Inertia + SSR: optional additional layer, doesn't disrupt Hotwire pages in the same app
- All tools can coexist in one Rails app — different pages can use different strategies

## Evil Martians' Commitment and Community Context

- Turbo Mount: built and maintained by Evil Martians
- Inertia: Evil Martians contribute to the Rails adapter
- Vite Ruby: actively promoted and used across client projects
- Rails Community Survey 2024: Evil Martians' book "Layered Design for Rails Applications" ranked top-3 recommended
- Tools are production-tested through client engagements from Seed stage to IPO
