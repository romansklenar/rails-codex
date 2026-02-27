---
title: Fizzy Architecture Decisions
description: "Per-customer SQLite multi-tenancy experiment — lessons on architectural pivots and operational readiness"
source:
  type: blog
  title: Behind the Fizzy Infrastructure
  author: Kimberly Rhodes, Fernando Olivares, Kevin McConnell
  url: https://dev.37signals.com/fizzy-infrastructure/
  date: '2026-02-26'
tags:
- architecture
---

# Fizzy Architecture Decisions

Summary of 37signals' exploration of per-customer SQLite databases for multi-tenant SaaS. Architectural decision story, not a coding standard.

## What Was Tried

- Per-customer SQLite databases for multi-tenant isolation
- Custom replication system ("Beamer") tracking transaction IDs
- Geographically distributed read replicas via CloudFlare routing

## Why It Was Abandoned (2 Days Before Launch)

- Cross-tenant operations (auth, shared profiles) created friction
- Insufficient operational readiness (no runbooks, incomplete benchmarking)
- Emotional attachment extended the project beyond prudent timelines

## Reusable Lessons

- **Set a kill date for architectural experiments** -- recognize when to pivot before launch pressure forces it
- **Cross-tenant operations are the hard part** of per-database multi-tenancy
- **Operational readiness matters as much as code readiness** -- if you cannot write a runbook for failure scenarios, you are not ready
- **Exploration produces reusable parts** -- even abandoned architectures yield components (transaction tracking, load balancing improvements) that survive in the final system
