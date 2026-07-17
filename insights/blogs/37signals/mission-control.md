---
type: insight
title: 'Mission Control: Operational Middleware'
description: "Middleware-based operational control for feature degradation during incidents"
resource: "https://dev.37signals.com/mission-control-web/"
tags:
- rails
- operations
timestamp: "2026-03-02"
source:
  type: blog
  title: Mission Control -- Web
  author: Lewis Buckley
  url: https://dev.37signals.com/mission-control-web/
  date: '2024-05-09'
---

# Mission Control: Operational Middleware

Use middleware + admin dashboard to control web traffic during incidents without redeploying.

## Pattern

- Middleware intercepts requests, checks deny-list via shared store (Redis/DB)
- Admin dashboard manages blocked paths with regex patterns
- Changes propagate instantly across all app instances

## Use Cases

- Disable expensive endpoints during load spikes
- Block specific paths during incidents
- Feature degradation without full downtime

## Architecture

```
[Admin Dashboard] → [Shared Store] ← [Middleware (per request)]
```

Two components share state but deploy independently.
