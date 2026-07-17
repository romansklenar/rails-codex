---
type: insight
title: "AnyCable, Rails, and the Pitfalls of LLM Streaming"
description: "Why Action Cable's at-most-once delivery fails for LLM streaming, and how AnyCable's at-least-once guarantees and Durable Streams protocol fix reliable chunk delivery"
resource: "https://evilmartians.com/chronicles/anycable-rails-and-the-pitfalls-of-llm-streaming"
tags: [anycable, llm, streaming, rails, action-cable, websockets, real-time, ai]
timestamp: "2026-03-02"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Vladimir Dementyev"
  url: "https://evilmartians.com/chronicles/anycable-rails-and-the-pitfalls-of-llm-streaming"
  date: '2025-12-18'
---

# AnyCable, Rails, and the Pitfalls of LLM Streaming

Action Cable's at-most-once delivery guarantee is fundamentally incompatible with reliable LLM response streaming — AnyCable's at-least-once delivery and the emerging Durable Streams protocol provide a production-grade solution.

## The LLM Streaming UX Requirement

- LLM responses stream as tokens or chunks rather than arriving as a single payload
- Streaming dramatically reduces perceived latency — users see progress immediately rather than waiting
- By 2025 virtually every web app with AI features needs real-time token streaming
- WebSockets are the natural transport: persistent connection, low overhead, bidirectional
- Action Cable is the Rails default — but its delivery semantics are the wrong fit for streaming

## Action Cable's Delivery Problem

- Action Cable uses at-most-once delivery: if a client disconnects and reconnects, missed messages are gone
- LLM streaming breaks when the WebSocket drops mid-generation — the partial response is lost
- Network instability, mobile clients, and tab backgrounding all trigger disconnects regularly
- Naively resuming by re-requesting from the LLM is expensive and introduces latency
- Race conditions arise when the broadcast happens before the client's subscription is fully established

## The Accumulated Data Workaround

- Workaround: instead of broadcasting individual chunks, broadcast the accumulated full response so far
- On reconnect, client requests current state and receives everything generated to that point
- Implemented by maintaining a server-side buffer: `$redis.append("llm:#{id}", chunk)`
- On subscribe or reconnect: `ActionCable.server.broadcast(channel, { text: $redis.get("llm:#{id}") })`
- Drawback: re-sends the entire accumulated response on every reconnect — O(n) data retransmission
- Drawback: requires application-level state management; leaks if cleanup is not handled

## AnyCable's Native Solution

- AnyCable provides both message ordering and at-least-once delivery at the transport layer
- Switch from Action Cable to AnyCable with `gem "anycable-rails"` — application code stays identical
- AnyCable assigns sequence numbers to messages on each stream; clients track the last received ID
- On reconnect, clients send `last_message_id`; AnyCable replays missed messages from history
- History is stored in Redis Streams or NATS JetStream — configurable TTL and message limit
- No application-level buffering needed: `ActionCable.server.broadcast(channel, { chunk: token })` just works

## Action Cable Extended Protocol

- AnyCable introduces the "Action Cable Extended" protocol on top of standard Action Cable protocol
- Adds `message_id` field to broadcast messages for client-side sequence tracking
- Adds `history` command for clients to request missed messages since a given ID
- Compatible with existing Action Cable JavaScript clients via `@anycable/web` adapter
- The Rails `anycable-rails` gem adds server-side support for extended protocol fields
- Opt-in: existing apps using standard Action Cable protocol are unaffected

## Durable Streams: The Next Step

- ElectricSQL announced Durable Streams — a standardized HTTP protocol for reliable data streaming
- Goal: standardize the communication contract between clients and servers for ordered, resumable streams
- AnyCable is adopting Durable Streams: implementing the "read" side first
- Clients can consume durable streams via HTTP while publishing still uses the AnyCable broadcast API
- Long-term vision: interoperability between different server implementations using the Durable Streams spec
- AnyCable's Durable Streams support is being rolled out incrementally starting in early 2026

## Implementation Pattern for LLM Streaming

- Generate a unique stream ID per LLM request: `stream_id = SecureRandom.uuid`
- Subscribe the client to `"llm_response_#{stream_id}"` before kicking off generation
- Background job streams chunks: `ActionCable.server.broadcast("llm_response_#{stream_id}", { chunk: token })`
- Send a terminal message when done: `{ done: true, full_text: accumulated }`
- With AnyCable reliable streams: replay on reconnect is automatic; no application code needed
- Cleanup: expire Redis stream key after TTL or on explicit completion signal

## Choosing the Right Transport

- Action Cable: acceptable for fire-and-forget notifications where loss is tolerable
- Action Cable + accumulated workaround: survivable for low-traffic apps with simple retry UX
- AnyCable reliable streams: production choice for LLM streaming — no lost chunks, automatic replay
- Server-Sent Events (SSE): simpler for one-way streaming but no reconnect history; same loss problem as Action Cable
- AnyCable with Durable Streams: future-proof option that aligns with emerging industry standards
