---
title: "Kamal Deployment"
source: https://dev.37signals.com/kamal-2/
description: "Kamal 2 container deployment with kamal-proxy, zero-downtime deploys, SSL, multi-app hosting"
tags: [deployment, devops]
---

# Kamal Deployment

Container deployment to VMs/bare metal without Kubernetes. Language and framework agnostic.

## Architecture

- **kamal-proxy** replaces Traefik (Kamal 2.0) -- imperative command-to-proxy design instead of declarative discovery
- Proxy handles HTTPS via Let's Encrypt, zero-downtime deploys, and multi-app routing on a single server
- Scales from 5 apps on 1 server to 1 app on 50 servers

## Key Capabilities

- **Gapless deployments** -- proxy switches between app versions without dropping requests
- **Automatic SSL** -- Let's Encrypt certificate provisioning built into the proxy
- **Multi-app hosting** -- multiple applications on a single server behind the proxy
- **Maintenance mode** -- proxy-level request handling during deployments or incidents
- **Canary deployments** -- gradual traffic shifting between versions
- **Request pausing** -- hold requests during version switches instead of dropping them

## Secrets Management

- Dedicated secrets commands with password manager integration
- Secrets are injected at deploy time, not baked into images

## When to Use

- You want to own your infrastructure (VMs, bare metal) without cloud PaaS lock-in
- You need zero-downtime deploys without Kubernetes complexity
- You want one tool for SSL, proxying, and container orchestration

## When Not to Use

- Managed platforms (Heroku, Render) already handle this
- You need auto-scaling (Kamal manages fixed server fleets)
