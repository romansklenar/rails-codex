# 37signals Dev Blog

> Curated insights from 37signals — the company manifesto, the *thoughts* essays, and the dev.37signals.com engineering blog: Rails patterns, Hotwire, deployment (Kamal), performance, and product philosophy.

## Insight files

* [37signals Manifesto](_manifesto.md) - 37 principles on product development, work culture, business philosophy, and decision-making
* [37signals Thoughts](_thoughts.md) - Long-form essays on shipping, decisions, profit, communication, and influences
* [Action Push Native](action-push-native.md) - Push notifications to APNs/FCM via Rails gem with HTTP/2 persistent connections
* [Better Navigation Patterns](better-navigation.md) - Trusted referrer back navigation, hierarchical safety nets, simpler over clever
* [Callbacks & CurrentAttributes](callbacks-and-current-attributes.md) - Callbacks for secondary concerns, CurrentAttributes for request context, Event.suppress
* [Card Table Responsive: Native Mobile Adaptation](card-table-responsive.md) - Native mobile adaptation patterns, triage toggle UX, constraint-driven scope
* [Cloud Exit](cloud-exit.md) - Cloud-to-on-prem migration strategy, cost analysis, Kamal deployment, datacenter overview
* [Concerns](concerns.md) - Semantic test, file location rules, and PORO delegation for Rails concerns
* [Console Data Protection](console-data-protection.md) - Active Record Encryption, Console1984 audit logging, mandatory justification for data access
* [Character-Based Breakpoints](css-character-breakpoints.md) - Prefer ch units over pixels for content-responsive media query breakpoints
* [CSS Custom Property Variants](css-custom-property-variants.md) - Component variants via CSS custom properties with fallback values
* [:has() Selector for State-Based Styling](css-has-selector.md) - :has() pseudo-class for state-based styling without JavaScript
* [Input Device Media Queries](css-input-device-queries.md) - Hover/pointer media queries for touch vs mouse adaptation
* [OKLCH Dynamic Opacity](css-oklch-opacity.md) - OKLCH dynamic opacity technique using CSS custom property triplets
* [Data Infrastructure](data-infrastructure.md) - S3 migration, Harbor registry, Pure Storage monitoring — Rails as orchestration layer
* [Delegated Types vs View-Based STI](delegated-types-comparison.md) - Architectural comparison of delegated_type vs view-based STI patterns
* [Development Environment](development-environment.md) - Team structure, six-week cycles, async communication, constraints as features
* [Domain-Driven Naming](domain-driven-naming.md) - Bold domain naming, role-based concerns, business language in code
* [Faster Pagination via Index Strategy](faster-pagination.md) - Two-query pagination with covering indexes to reduce disk I/O on large datasets
* [Fizzy Architecture Decisions](fizzy-architecture.md) - Per-customer SQLite multi-tenancy experiment — lessons on architectural pivots and operational readiness
* [Fractal Code Quality](fractal-code-quality.md) - Four qualities at every abstraction level — domain-driven, encapsulated, cohesive, symmetric
* [Capability Predicates](fragment-capabilities.md) - Capability predicates on subtypes instead of type-checking
* [The Gift of Constraints](gift-of-constraints.md) - Fixed time/variable scope, small teams as constraints, good enough over perfect
* [Homographic Spoofing Detection](homographic-spoofing.md) - Unicode homograph attack detection for domains and emails via basecamp/homographic_spoofing gem
* [Hotwire: Minimal JavaScript](hotwire-minimal-js.md) - Layer Stimulus on existing behavior, server-rendered state, minimal client-side JS
* [Hotwire Native v1.2](hotwire-native-v1-2.md) - The biggest Hotwire Native update since launch — RouteDecisionHandlers, built-in server-driven historical location commands, and official native bottom tabs for iOS and Android
* [Hotwire Spark](hotwire-spark.md) - Live reloading for Rails dev — morphs HTML, swaps CSS, hot-reloads Stimulus controllers
* [Imperative Infrastructure](imperative-infrastructure.md) - Prefer explicit step-by-step infra over declarative state magic, Kamal over K8s
* [Kamal Deployment](kamal-deployment.md) - Kamal 2 container deployment with kamal-proxy, zero-downtime deploys, SSL, multi-app hosting
* [Lexxy: Rich Text Editor for Rails](lexxy-rich-text.md) - Lexical-based Action Text editor with proper HTML semantics, Markdown support, configurable editor interface
* [Mission Control -- Jobs](mission-control-jobs.md) - Dashboard for background job monitoring, queue management, bulk retry/discard, recurring tasks
* [Mission Control: Operational Middleware](mission-control.md) - Middleware-based operational control for feature degradation during incidents
* [PR Review Practices](pr-review-practices.md) - Review naming, idiomatic style, and consistency — the middle ground linters can't reach
* [Prometheus Monitoring for Rails](prometheus-monitoring.md) - Yabeda gems for Rails Prometheus metrics, PID cardinality fix, alerting patterns, OTel collector
* [QA Practices](qa-practices.md) - Guided exploration over scripted QA, late involvement, accessibility validation, suggestion-based feedback
* [Query Objects](query-objects.md) - PORO query wrappers for complex multi-model queries beyond simple scopes
* [The Radiating Programmer](radiating-programmer.md) - Proactive async communication, non-blocking decisions, push information outward
* [Rails Multi-Tenancy](rails-multi-tenancy.md) - Tenant isolation, cross-tenant safety, framework integration points for multi-tenant Rails
* [Reliable Export Jobs](reliable-export-jobs.md) - Interruptible long-running jobs with waypoint progress, server affinity, bounded execution
* [Ruby Memory Leak Debugging](ruby-memory-debugging.md) - Heap dump analysis with rbtrace, ObjectSpace, heapy, sheap for diagnosing Ruby memory leaks
* [Solid Cache](solid-cache.md) - SQL-backed cache store with higher capacity and lower infrastructure cost
* [Solid Queue](solid-queue.md) - Database-backed background jobs with FOR UPDATE SKIP LOCKED polling, bulk enqueue, lifecycle hooks, monitoring
* [Testing Philosophy](testing-philosophy.md) - Pragmatic testing with real dependencies, confidence over coverage
* [Thruster](thruster.md) - HTTP/2 proxy wrapping Puma — automatic TLS, asset caching, X-Sendfile, gzip compression
* [Turbo 8: Morphing & Page Refreshes](turbo-8-morphing.md) - Turbo 8 feature overview, morphing vs streams decision guide, why client-side morphing over server-side diffing
* [Turbo for Mobile](turbo-mobile.md) - Web content in native apps via Turbo-iOS/Android, when web vs native
* [Turbo Progressive Enhancement Hierarchy](turbo-progressive-enhancement.md) - Turbo hierarchy — Drive → Morphing → Frames → Streams — choose simplest
* [Upright: Synthetic Monitoring](upright-synthetic-monitoring.md) - Open-source Rails-based synthetic monitoring — Playwright/HTTP/SMTP probes, multi-location
* [Vanilla Rails Stack](vanilla-rails-stack.md) - Minimize dependencies, use what Rails provides, nobuild philosophy
* [YJIT Performance](yjit-performance.md) - Enable YJIT for 15-20% faster Rails responses — runtime enable, memory sizing, Ruby 3.3+ threshold
