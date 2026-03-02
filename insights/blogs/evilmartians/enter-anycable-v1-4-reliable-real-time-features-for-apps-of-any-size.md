---
title: "Enter AnyCable v1.4: Reliable Real-Time Features for Apps of Any Size"
description: "AnyCable v1.4 adds Reliable Streams, Resumable Sessions, long-polling fallback, HTTP RPC mode, enhanced Hotwire integration, and OCPP protocol support"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/enter-anycable-v1-4-reliable-real-time-features-for-apps-of-any-size"
  date: '2023-07-14'
tags: [anycable, websockets, real-time, rails, hotwire, turbo-streams, action-cable, reliability]
---

# Enter AnyCable v1.4: Reliable Real-Time Features for Apps of Any Size

AnyCable v1.4 upgrades delivery guarantees from at-most-once to at-least-once, adds long-polling fallback, HTTP RPC mode, and OCPP support — making AnyCable a compelling default even before traffic demands it.

## Motivation and Context

- Action Cable uses at-most-once delivery — messages lost during network interruptions are gone
- AnyCable historically recommended only when Action Cable performance became a bottleneck
- v1.4 changes the recommendation: now worth adopting from project day one due to reliability improvements
- Core protocol extended with message IDs and acknowledgment mechanisms baked into the foundation
- Application code stays unchanged when switching from Action Cable to AnyCable

## Reliable Streams

- Guarantees at-least-once message delivery — clients never miss messages during network instability
- Server assigns monotonic message IDs to each broadcast on a given stream
- Clients track the last received ID and send it on reconnect to request missed messages
- Server replays messages from a configurable history window (backed by Redis streams or NATS JetStream)
- `anycable-go` caches the stream history in memory with configurable `--streams_history_ttl` and `--streams_history_limit`
- Configure in Rails: `config.anycable.reliable_streams = true`

## Resumable Sessions

- Clients can resume an interrupted WebSocket session without re-authenticating
- Session state (subscriptions, identifiers) is preserved server-side for a configurable TTL
- Reconnecting client passes a session token issued on the original connection
- Avoids full RPC handshake on reconnect — dramatically reduces recovery time under flaky connections
- Compatible with Hotwire: Turbo Streams subscriptions resume transparently

## Long-Polling Fallback

- New HTTP long-polling transport for clients behind corporate firewalls or proxies blocking WebSockets
- Client sends a regular HTTP request; server holds it open until a message arrives or timeout
- Automatic transport negotiation: `@anycable/web` JavaScript client tries WebSocket first, falls back to long-polling
- No server-side code changes required — same channels and streams work over both transports
- Particularly useful for enterprise deployments where WebSocket is blocked at the network level

## HTTP RPC Mode

- Alternative to gRPC for apps that cannot or do not want to use gRPC
- `anycable-go` calls back to the Rails app over plain HTTP instead of gRPC
- Enables one-command deployment on Heroku and other PaaS platforms that don't support gRPC
- Configure with `--rpc_impl=http` on `anycable-go` and `ANYCABLE_HTTP_RPC_MOUNT_PATH` in Rails
- Performance is slightly lower than gRPC but acceptable for most workloads
- Simplifies Docker setups — no need to expose a gRPC port separately

## Hotwire and Turbo Streams Integration

- Turbo Streams channels work with Reliable Streams out of the box — no JS or Ruby changes needed
- `Turbo::StreamsChannel` is a thin wrapper; AnyCable handles reliability at the transport layer
- Resumable sessions mean Turbo Stream subscriptions survive page visibility changes and network drops
- `anycable-rails-hotwire` gem wires together the Rails side: `gem "anycable-rails-hotwire"`
- Presence tracking for Hotwire apps: subscribe to `presence_channel` using AnyCable's built-in presence API

## OCPP Protocol Support

- OCPP (Open Charge Point Protocol) is the standard for EV charger-to-server communication
- AnyCable v1.4 adds an OCPP gateway mode — chargers connect via WebSocket using OCPP dialect
- AnyCable translates OCPP messages into Action Cable channel calls on the Rails side
- Enables Rails apps to serve EV charging infrastructure without a separate OCPP server
- Configured via `--ocpp` flag on `anycable-go`; no Rails gem changes required

## Deployment Simplifications

- New `anycable-go` Docker image with HTTP RPC enabled by default for PaaS targets
- Heroku buildpack updated to support HTTP RPC mode with zero-config setup
- `AnycableRails::TestHelper` extended with helpers to assert reliable stream messages in tests
- `anycable-go` embeds NATS server for pub/sub — no external Redis required for basic deployments
- Fly.io and Render one-click deployment templates updated for v1.4
- Health check endpoint at `/_anycable/health` for load balancer integration

## Migration from Action Cable

- Drop-in replacement: same `ApplicationCable::Channel` API, same `ActionCable.server.broadcast` calls
- Add `gem "anycable-rails"` to Gemfile; run `rails anycable:setup` for guided configuration
- Enable reliable streams: `config.anycable.reliable_streams = true` in `config/cable.yml`
- `anycable-go` binary replaces the Action Cable server process — configure via environment variables
- Existing Action Cable tests work unchanged; add `AnycableRails::TestHelper` for reliable stream assertions
- Gradual rollout supported: route a percentage of traffic to AnyCable while keeping Action Cable running
