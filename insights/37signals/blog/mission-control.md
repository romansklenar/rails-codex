---
title: "Mission Control: Operational Middleware"
source: https://dev.37signals.com/mission-control-web/
description: "Middleware-based operational control for feature degradation during incidents"
tags: [rails, operations]
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
