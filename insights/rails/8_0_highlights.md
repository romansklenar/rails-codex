---
type: insight
title: Rails 8.0 Highlights
description: "No-PaaS deployment stack — Kamal 2, Thruster, the Solid trio, Propshaft by default, and a built-in authentication generator"
resource: "https://guides.rubyonrails.org/8_0_release_notes.html"
tags:
- rails
- release-notes
- deployment
- kamal
- solid
timestamp: "2026-07-17"
source:
  type: guide
  title: Ruby on Rails 8.0 Release Notes
  author: Rails Core Team
  url: https://guides.rubyonrails.org/8_0_release_notes.html
  date: 2024-11-07
---

# Rails 8.0 Highlights

Rails 8.0 makes "one person can ship and run a production app" the default — no PaaS, no Redis, no separate job framework. Curated from the official release notes; distills the majors and the changes most likely to bite on upgrade.

## Headline Features

- **Kamal 2** — ships preconfigured for deployment. `kamal setup` turns a fresh Linux box into an app/accessory server. Bundled **Kamal Proxy** replaces the launch-era Traefik option.
- **Thruster** — proxy in the default Dockerfile, sits in front of Puma for X-Sendfile acceleration, asset caching, and asset compression.
- **Solid Cable** — DB-backed pub/sub for Action Cable, replaces Redis. Retains messages ~1 day by default.
- **Solid Cache** — DB-backed HTML fragment cache store, replaces Redis/Memcached.
- **Solid Queue** — DB-backed jobs, replaces Redis + Resque/DelayedJob/Sidekiq. Built on `FOR UPDATE SKIP LOCKED` (PostgreSQL 9.5+, MySQL 8.0+, SQLite).
- **Propshaft is the default asset pipeline**, replacing Sprockets.
- **Authentication generator** — scaffolds a session-based, password-resettable, metadata-tracking auth system (PR #52328). Starting point, not a gem.

## The "Solid" Thesis

- The three Solid libraries + Kamal + Thruster together remove Redis and a separate job runner from the default stack — a small app runs on just a database and one box.
- Solid stores lean on modern SQL locking (`FOR UPDATE SKIP LOCKED`) rather than an in-memory server, trading raw latency for operational simplicity.

## Notable Changes

- **`params#expect`** — safer, explicit strong-params API: `params.expect(table: [:attr])` replaces `params.require(:table).permit(:attr)`. Raises on malformed/ tampered param shapes instead of silently coercing.
- **`db:migrate` on a fresh database now loads the schema first**, then runs pending migrations. Use `db:migrate:reset` for the old drop-recreate-from-scratch behavior.
- **`Regexp.timeout` defaults to `1s`** — mitigates ReDoS (Regexp Denial-of-Service) out of the box.

## Deprecations & Removals (upgrade watch-list)

- **Deprecated** — `enqueue_after_transaction_commit` (Active Job); internal `SuckerPunch` adapter (use the gem's); Azure backend for Active Storage; `Benchmark.ms`; `SQLite3Adapter` `retries` option (use `timeout`); drawing routes with multiple paths; `bin/rake stats` → `bin/rails stats`.
- **Removed** — `enum` defined with keyword arguments; `ActiveSupport::ProxyObject`; several long-deprecated `config.active_record.*` flags; `config.read_encrypted_secrets`; passing `nil` to `form_with(model:)`.

## Upgrade Notes

- Upgrade to **Rails 7.2 first**, confirm the app runs, then jump to 8.0.
- The fresh-DB `db:migrate` schema-load change is the most common surprise — CI that assumed migrations-from-scratch may need `db:migrate:reset`.

→ Full details: [Rails 8.0 Release Notes](https://guides.rubyonrails.org/8_0_release_notes.html)
