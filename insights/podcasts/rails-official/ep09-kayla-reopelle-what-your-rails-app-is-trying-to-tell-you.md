---
type: insight
title: "Kayla Reopelle: What Your Rails App Is Trying To Tell You"
description: "OpenTelemetry gives Rails developers a vendor-neutral way to collect traces, metrics, and logs that reveal what their app is doing in production — and how to act on those signals."
resource: "https://podcast.rubyonrails.org/2462975/episodes/18215229-kayla-reopelle-what-your-rails-app-is-trying-to-tell-you"
tags: [observability, opentelemetry, tracing, metrics, logging, rails, instrumentation, active-support-notifications, ruby-agent]
timestamp: "2026-03-02"
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/18215229-kayla-reopelle-what-your-rails-app-is-trying-to-tell-you"
  date: 2025-11-19
---

# Kayla Reopelle: What Your Rails App Is Trying To Tell You

Kayla Reopelle (lead engineer at New Relic, working on the Ruby Agent and OpenTelemetry RubyGems) explains how observability differs from monitoring, why OpenTelemetry is the right abstraction layer for Rails apps, and how to start reading — and responding to — the signals your app is already emitting.

## What Observability Actually Means

- Monitoring answers known unknowns; observability (per Charity Majors) answers unknown unknowns — questions you don't yet know to ask
- Concrete definition: the ability to observe the internal state of a system by examining its external outputs
- Observability data is an archive — it lets you reconstruct what happened when a specific variable was in play
- A "human-friendly system" is designed with empathy for users, teammates, and future engineers — observability is the mechanism that enables that empathy
- Signs your app is trying to tell you something: abandoned shopping carts, slow pages, angry user reports, team confusion about existing features, deployed features with unknown usage

## OpenTelemetry as the Vendor-Neutral Layer

- OTel is a drop-in replacement for vendor-specific agents (New Relic, Datadog, AppSignal) — same data, no lock-in
- Multiple exporters can run simultaneously; the same telemetry data can be sent to several backends at once
- The goal: no vendor-specific code in the SDK or API — only in vendor-built collector components
- OTel was formed from a merger of OpenCensus and OpenTracing; Jaeger and Prometheus integrations reflect that legacy
- Vendors are now competing on pricing, storage, and visualization UX rather than proprietary data collection
- OTel is governed by the Cloud Native Computing Foundation; no single company can hold more than two seats on the Technical Committee or Governance Committee

## The Three Signals: Traces, Metrics, Logs

- **Traces** — the full story of a request, broken into spans; stable in Ruby OTel
- **Metrics** — aggregated time-series data (counters, histograms, gauges); experimental in Ruby OTel but basic instruments are usable
- **Logs** — timestamped text records; experimental but near-stable; `opentelemetry-instrumentation-logger` bridges the Ruby logger into OTel format (OTLP)
- Span = a single step in a request: controller action, ActiveRecord call, view render, external API call, Rack middleware, background job
- Errors produce span events (not separate spans) carrying stack traces; most UIs highlight the erroring span in red within the full trace
- Profiling was donated to OTel by Elastic ~2024; Ruby implementation not yet started

## How ActiveSupport Notifications Powers Rails Instrumentation

- `ActiveSupport::Notifications` is a pub/sub interface that OpenTelemetry uses as the backbone of its Rails instrumentation
- OTel subscribes to built-in notifications (ActiveRecord, ActiveJob, ActionMailer, ActionCable, ActiveStorage, etc.) to create spans automatically
- Custom notifications work too: `opentelemetry-instrumentation-active_support` accepts user-defined notification names and creates spans for them
- Good candidates for custom notifications: service objects, anything outside Rails' built-in sub-gems
- Monkey patching (module prepend, alias method chaining) is still used for cases where notifications don't reach; covered in depth in _Metaprogramming Ruby 2_
- Rails' upcoming [structured logging (event reporter)](../../rails/8_1_highlights.md) adds attributes to logs — making them filterable by fields like `user_id` or controller name without regex parsing of message strings

## Practical Starting Points for Rails Developers

- Use `OpenTelemetry::SDK.configure` in an initializer; call `use` for specific instrumentation gems or `use_all` to auto-enable everything compatible
- Compare an ActiveSupport notification and an OTel custom span side by side in one method to feel the interface difference and check for any performance delta
- For background jobs: wrap `perform` with an up-down counter — increment on start, decrement on finish — to track active job count in real time
- Add dimensions (queue name, job class) to metrics so you can facet data per worker type
- Use an observable gauge for queue depth: it samples asynchronously on a configurable interval (e.g., every 20–60 seconds) without being tied to a specific method call
- For local development: add custom spans around two competing implementations to benchmark them directly inside the trace, complementing explicit benchmarking tools

## Testing Instrumentation and Local Backends

- Few teams write tests for their telemetry; OTel provides an in-memory exporter and a console exporter to assert on what spans were created
- `opentelemetry-instrumentation-logger` bridges existing Ruby logger calls into OTel without rewriting log statements
- Structured logs in OTLP format correlate log entries to the trace/span context, adding duration data that plain log lines lack
- Open-source backends for local or self-hosted use: Grafana (full stack), Prometheus (metrics), Jaeger (tracing — also under CNCF, with built-in OTel interoperability)
- OTel also has tooling to observe test suites: CI tracing can reveal frequently failing tests and track test suite performance over time

## Controlling Data Volume and Cost

- Observability always carries some overhead — network calls, memory, CPU; instrument thoughtfully rather than capturing everything
- Span processors let you intercept and modify spans before export; an `on_ending` hook (in development) will allow dropping spans based on attributes — useful for excluding free-tier users from detailed tracing
- Feature flags are a viable way to toggle instrumentation on or off without a full redeploy
- Data retention is managed by the backend vendor or self-hosted store, not by OTel itself — OTel handles only collection and standardization
- Multiple tracers can be instantiated per concern, allowing selective shipping of telemetry from specific subsystems

## OpenTelemetry Ruby Ecosystem and Community

- Ruby OTel meets weekly via a special interest group (SIG); find the calendar link in the `Community` repo under the `opentelemetry` GitHub org
- Stability levels: traces = stable; logs = near-stable (one or two spec gaps); metrics = in active development, basic instruments ready
- Reaching "stable" requires full spec compliance and a Technical Committee review — plus real production usage to battle-test the implementation
- End users (app developers) and vendors collaborate in the same SIG; both groups contribute instrumentation gems
- Declarative file-based configuration (planned) will replace the current initializer-heavy setup once metrics and logs reach stability
- The OTel collector has hundreds of components, many vendor-specific — data portability between collectors is an open problem the community is actively working through
