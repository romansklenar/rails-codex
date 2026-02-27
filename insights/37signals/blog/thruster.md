---
title: Thruster
source:
  type: blog
  title: Thruster is now open source
  author: Kevin McConnell
  url: https://dev.37signals.com/thruster-released/
  date: '2024-03-07'
tags:
- deployment
- performance
---

# Thruster

HTTP/2 proxy that wraps Puma. Handles TLS, caching, compression, and static file serving so Rails doesn't have to.

## Usage

```bash
# Instead of: rails server
thrust rails server

# With automatic SSL via Let's Encrypt:
SSL_DOMAIN=example.com thrust rails server
```

## What It Provides

| Feature | Detail |
|---|---|
| **HTTP/2** | Protocol upgrade in front of Puma |
| **TLS/SSL** | Automatic Let's Encrypt provisioning and renewal |
| **Asset caching** | HTTP caching for public assets |
| **Static files** | X-Sendfile support with gzip compression |

## Key Design Decisions

- **Process wrapping** — ties Thruster's lifetime to Puma's. Container restart = both restart. No separate process management
- **Modular features** — each feature is independently toggleable. Already have SSL termination (e.g., behind a load balancer)? Disable it and keep caching + compression
- **No Nginx/Caddy needed** — replaces the typical reverse proxy layer in simple deployments

## Setup

```ruby
# Gemfile
gem "thruster"
```

## When to Use

- Single-server or container deployments where you want TLS + caching without a separate Nginx/Caddy
- Kamal deployments (Thruster is the default proxy in Rails 8 / Kamal 2)
- Not needed behind an existing reverse proxy that already handles TLS and caching (but X-Sendfile + compression may still be useful)
