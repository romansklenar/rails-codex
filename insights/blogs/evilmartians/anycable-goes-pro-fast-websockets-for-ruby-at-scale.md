---
type: insight
title: "AnyCable Goes Pro: Fast WebSockets for Ruby, at Scale"
description: "AnyCable Pro introduces binary protocol support (Msgpack, Protobuf), Apollo GraphQL compatibility, O(1) memory per connection via epoll/kqueue, JWT authentication, and signed streams"
resource: "https://evilmartians.com/chronicles/anycable-goes-pro-fast-websockets-for-ruby-at-scale"
tags: [anycable, websockets, ruby, rails, performance, binary-protocols, graphql, jwt, go]
timestamp: "2026-03-02"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/anycable-goes-pro-fast-websockets-for-ruby-at-scale"
  date: '2021-06-16'
---

# AnyCable Goes Pro: Fast WebSockets for Ruby, at Scale

AnyCable Pro launches with three pillars — binary protocol support, GraphQL compatibility, and a goroutine pool + epoll/kqueue architecture — reducing memory footprint by an additional 40% over the already-lean open-source server.

## Why AnyCable Pro

- AnyCable OSS already uses 3x less memory than Action Cable's default Puma-backed server
- Pro reduces memory further — from O(N) utility memory per connection to O(1)
- Open-source core stays free forever; Pro adds commercial features for high-scale workloads
- Going Pro: reduce memory footprint by 40%, save bandwidth costs, get priority support
- Beta period: Pro features available free to evaluate before general availability (GA: October 1, 2021)
- Commercial licensing targets organizations running thousands of concurrent WebSocket connections

## Connection Architecture: Goroutine Pool + epoll/kqueue

- OSS used "two goroutines per connection" — one for reading, one for writing; memory scales with N connections
- Pro rewrites to "goroutines pool + epoll/kqueue" — a fixed pool of goroutines handles all connections
- `epoll` (Linux) and `kqueue` (macOS/BSD) are OS-level event notification APIs — no goroutine blocked per socket
- Result: utility memory (goroutine stack overhead) reduced from O(N) to O(1) regardless of connection count
- Client state memory still grows linearly — that's unavoidable; goroutine overhead is eliminated
- Benchmark: 10,000 connections — Pro uses ~40% less memory than OSS at the same load

## Binary Protocol Support

- OSS AnyCable supports only JSON encoding over WebSockets
- Pro adds Msgpack and Protocol Buffers (Protobuf) encoders
- Binary encoding reduces payload size significantly — fewer bytes over the network, lower bandwidth costs
- Client must negotiate the encoding at connection time via a subprotocol header
- `@anycable/web` JavaScript client supports binary encoders with the corresponding codec plugin
- Server automatically detects client encoding preference and serializes accordingly

## Apollo GraphQL Compatibility

- Pro adds an Apollo GraphQL protocol adapter at the `/graphql` WebSocket endpoint
- Translates incoming Apollo `connection_init`, `start`, `stop` messages into Action Cable channel actions
- Rails side uses standard `graphql-ruby` subscriptions — no Pro-specific server code needed
- `graphql-anycable` gem wires Rails subscriptions to AnyCable broadcasts
- Clients connect with any Apollo WebSocket client: `new WebSocketLink({ uri: 'wss://app/graphql' })`
- AnyCable handles subscription fan-out; `graphql-ruby` handles resolver execution

## JWT Authentication (Originally Pro, Later OSS)

- JWT identification: clients pass a signed token at connection time via query param or HTTP header
- `anycable-go` verifies the token signature and TTL without making an RPC call to the Rails app
- On valid token: extracts `identifiers` claim and stores in connection metadata — skips Ruby handshake
- Speed improvement: 2x+ faster connection establishment vs. full gRPC RPC round-trip
- `anycable-rails-jwt` gem generates tokens: `AnycableRailsJwt.encode(user)`
- Client: `new Cable({ url: 'wss://app/cable?jid=<token>' })`
- Moved to OSS in December 2021 after Pro GA launch

## Signed Streams (Originally Pro, Later OSS)

- Signed streams allow subscribing to a named stream without any RPC call using a signed token
- Stream name is signed with HMAC-SHA256: `AnyCable.signed_stream_name("stream:#{id}")`
- Client subscribes by passing the signed name — `anycable-go` verifies the signature and subscribes
- Combined with JWT auth: entire connection + subscription flow requires zero Ruby app calls
- Enables AnyCable to act as a standalone pub/sub server for Hotwire/Turbo Stream apps
- `anycable-rails-hotwire` gem provides Rails helpers: `turbo_stream_from @record` uses signed streams
- Moved to OSS in December 2021

## Performance Numbers

- OSS AnyCable vs. Action Cable: 3x less memory at equivalent connection counts
- Pro vs. OSS: additional 40% memory reduction at scale (10k+ connections)
- Binary encoding (Msgpack): ~30-50% payload size reduction vs. JSON for typical application messages
- JWT auth: eliminates RPC latency for connection establishment — from ~5ms to sub-millisecond
- Signed streams: zero-RPC subscription — eliminates per-subscribe gRPC call overhead entirely
- Benchmark tool: `xk6-cable` (k6 extension by Evil Martians) for load testing WebSocket workloads

## Open Source Commitment

- AnyCable core protocol, `anycable-go` OSS server, and `anycable-rails` gem remain MIT-licensed
- Pro is a commercial layer on top — not a fork; OSS and Pro share the same codebase
- Features first shipped in Pro that proved broadly useful (JWT, signed streams) were moved to OSS
- `graphql-anycable` and `anycable-rails-jwt` gems are MIT-licensed regardless of server tier
- Philosophy: monetize the server binary for high-scale users; keep the Rails integration free
