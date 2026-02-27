---
title: Solid Cache
description: "SQL-backed cache store with higher capacity and lower infrastructure cost"
source:
  type: blog
  title: Solid Cache
  author: Donal McBreen
  url: https://dev.37signals.com/solid-cache/
  date: '2023-10-03'
tags:
- rails
- caching
---

# Solid Cache

SQL-backed cache store. More capacity, less infrastructure.

## Key Differences from Redis/Memcached

| | Solid Cache | Redis/Memcached |
|---|-----------|----------------|
| Storage | Disk (SQL) | RAM |
| Capacity | 6x larger at 80% lower cost | Limited by RAM price |
| Read speed | ~40% slower per-op | Faster per-op |
| Cache retention | Months | Days |
| Hit rate | Higher (more fits) | Lower (evicts sooner) |

## Real-World Impact

Basecamp p95 dropped from 375ms → 225ms — driven by higher cache hit rates, not raw speed.

## Deployment Options

1. Shared with application database
2. Dedicated separate database
3. Sharded across multiple databases

## Best For

- Apps with heavy fragment caching
- Teams wanting fewer infrastructure dependencies
- When cache size constraints cause frequent misses
