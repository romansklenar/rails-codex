---
title: "Card Table Responsive: Native Mobile Adaptation"
source: https://dev.37signals.com/bringing-card-table-to-the-small-screen/
description: "Native mobile adaptation patterns, triage toggle UX, constraint-driven scope"
tags: [native, responsive]
---

# Card Table Responsive: Native Mobile Adaptation

Product/process story about native Android development, not a web CSS standard. Summary retained for reference.

## Context

37signals adapted their Card Table (Kanban board) feature for mobile using **Jetpack Compose** (Android native), not responsive web CSS. The post covers design iteration and scope management within a six-week cycle.

## Key Takeaways for Product Development

- **Native over embedded web** — for interaction-heavy features (drag-and-drop, gesture-driven), native implementation outperforms embedded web views
- **Constraint-driven scope** — the two-person team (one dev, one designer) deliberately cut features for v1: no card context menus, simplified column reordering with buttons instead of drag-and-drop
- **Triage toggle pattern** — on small screens, collapse secondary columns and let users toggle between "triage" and "in-progress" views rather than showing everything at once
- **Prototype-first with declarative UI** — Compose's declarative model enabled fast design iteration with a designer who could read the code
