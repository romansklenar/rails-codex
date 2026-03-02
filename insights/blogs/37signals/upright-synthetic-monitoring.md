---
title: 'Upright: Synthetic Monitoring'
description: "Open-source Rails-based synthetic monitoring — Playwright/HTTP/SMTP probes, multi-location"
source:
  type: blog
  title: 'Introducing Upright: An Open Source Synthetic Monitoring System'
  author: Lewis Buckley
  url: https://dev.37signals.com/introducing-upright/
  date: '2026-02-16'
tags:
- monitoring
- devops
---

# Upright: Synthetic Monitoring

Summary of 37signals' open-source synthetic monitoring tool. Reference for monitoring strategy, not a coding standard.

## What It Is

- Rails engine for multi-location synthetic monitoring
- Probes: Playwright (browser flows), HTTP (health checks), SMTP (mail server), Traceroute (network paths)
- Stack: SQLite + Solid Queue + Kamal + Prometheus + AlertManager

## Architecture Pattern

- Each deployment node operates autonomously, identified via environment variable
- Probes run from every location -- compare results to distinguish regional vs global outages
- Metrics feed to redundant Prometheus instances across datacenters

## Relevance

- Available as MIT-licensed gem (`upright`) if synthetic monitoring is needed
- Demonstrates the "Rails for everything" pattern: even monitoring infrastructure runs as a Rails app with Solid Queue
- Low cost: 5 global sites for ~$110/month using affordable VPS providers
