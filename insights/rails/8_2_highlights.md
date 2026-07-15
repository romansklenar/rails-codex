---
title: Rails 8.2 Highlights
description: "In-development: header-based CSRF via Sec-Fetch-Site, Rails.app + creds/revision, Argon2 for has_secure_password, has_json schemas, attachment analysis before validation"
source:
  type: guide
  title: Ruby on Rails 8.2 Release Notes (in development)
  author: Rails Core Team
  url: https://edgeguides.rubyonrails.org/8_2_release_notes.html
  date: 2026-07-15
tags:
- rails
- release-notes
- security
- csrf
- edge
---

# Rails 8.2 Highlights

**Status: unreleased / edge (main branch).** These notes track the in-progress 8.2 release notes as of this snapshot — items may change or be dropped before GA. Curated from the edge release notes.

## Security

### Header-based CSRF protection
- New modern CSRF strategy using the **`Sec-Fetch-Site`** header to verify same-origin requests without an authenticity token.
- `protect_from_forgery using:` — `:header_only` (default for new 8.2 apps) or `:header_or_legacy_token` (falls back to token verification for older browsers).
- **Deprecations tied to this**: calling `protect_from_forgery` without a strategy is deprecated (the `:null_session` default is inconsistent with `default_protect_from_forgery = :exception`); `InvalidAuthenticityToken` deprecated in favor of `InvalidCrossOriginRequest`.

### Argon2 for `has_secure_password`
- `has_secure_password algorithm: :argon2` — Argon2 has **no password length limit**, unlike BCrypt's 72-byte cap.
- New `ActiveModel::SecurePassword.register_algorithm` API to register custom password-hashing algorithms.

## Application & Config

- **`Rails.app`** — alias for `Rails.application`.
- **`Rails.app.revision`** — version identifier for error reporting, monitoring, and cache keys; reads a `REVISION` file or the local git SHA by default.
- **`Rails.app.creds`** — combined access to credentials from ENV *or* the encrypted credentials file, with `require` and `option` methods.

## Active Record

- **PostgreSQL `DROP DATABASE` now uses `FORCE`** on supported versions — disconnects clients first, so `bin/rails db:reset` works without shutting down running app instances/consoles.
- **SQLite3 data-loss fix** — table alterations with `ON DELETE CASCADE` child foreign keys no longer silently trigger CASCADE deletes on child tables during schema changes.
- **`implicit_persistence_transaction`** hook — protected method wrapping `save`/`destroy`/`touch`; override per model to set an isolation level or skip transaction creation when one is already open.

## Active Model / JSON

- **`has_json` and `has_delegated_json`** — schema-enforced access to JSON attributes with type casting and default values.

## Active Storage

- **Analyze attachments before validation** — metadata (width, height, duration, …) available to model validations. Timing via `analyze: :immediately` (default) / `:later` / `:lazily`.
- **`process: :immediately`** — generate variants during attachment rather than lazily or in a background job.
- **Deprecated** — `preprocessed: true` variant option → use `process: :later`.

## Active Job

- **`enqueue_after_transaction_commit` un-deprecated** and now defaults to `true` for new apps — jobs enqueue after commit, fixing jobs that ran against uncommitted/rolled-back records. (Deprecated in 8.0, non-functional in 8.1, now a working boolean config.)
- **Removed** — built-in `sidekiq` adapter (use the `sidekiq` gem).
- **Deprecated** — built-in `queue_classic`, `resque`, `delayed_job`, `backburner`, `sneakers` adapters (move to each gem's own adapter). Relates to the DB-backed default → see [[solid-queue]].

## Active Support / Testing

- **`SecureRandom.base32`** — case-insensitive, human-unambiguous keys.
- **Deterministic parallel-test worker assignment** (round-robin) makes flaky failures from test interdependence reproducible; opt into `work_stealing: true` for idle workers to steal tests and cut runtime.

## Other

- **Action View** — pass a block when rendering a collection; the block runs for each rendered element.
- **Action Text** — Trix-specific classes/methods deprecated (`TrixAttachment`, `to_trix_html`, …); use the editor-content equivalents (`to_editor_content_attachment_partial_path`).

## Upgrade Notes

- Upgrade to **Rails 8.1 first**, confirm the app runs, then move to 8.2.
- Set `config.action_controller.default_protect_from_forgery_with = :exception` (or pass an explicit strategy) to clear the new `protect_from_forgery` deprecation warning.

→ Full details: [Rails 8.2 Release Notes (edge)](https://edgeguides.rubyonrails.org/8_2_release_notes.html)
