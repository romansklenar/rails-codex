---
title: The Rails Delegated Type Pattern
description: "How 37signals uses delegated types, immutable recordables, and a tree of recordings to build a content system that scales without rewrites"
source:
  type: talk
  title: "The Rails Delegated Type Pattern with Jeffrey Hardy"
  author: Jeffrey Hardy
  url: https://www.youtube.com/watch?v=m90sl-Uvu0Y
  date: ''
tags:
- rails
- active-record
- polymorphism
- delegated-type
- patterns
- basecamp
- architecture
---

# The Rails Delegated Type Pattern

Basecamp's entire content system — documents, messages, comments, uploads — runs on one recordings table that delegates to typed recordables, a pattern that has survived 10+ years and multiple product versions without a rewrite.

## Core Concept: Recordings + Recordables

- `recordings` is the primary table: stores metadata only (recordable_id, recordable_type, creator_id, timestamps, color). No text columns. No type-specific data.
- A **recordable** is the delegated type target — a `Message`, `Document`, `Comment`, `Upload`, etc., each with its own table.
- Rails' `delegated_type` declaration (one line in a concern) wires this up: `has_delegated_type :recordable, types: RECORDABLE_TYPES`
- The `Recording` model itself is ~42 lines. The `Recordable` concern (mixed into every concrete recordable class) is ~100 lines.

## Comparison: STI vs Polymorphic vs Delegated Type

| | Single Table Inheritance | Polymorphic | Delegated Type |
|---|---|---|---|
| Schema change on new type | Yes — add columns to big table | No | No — new table only |
| Cross-type querying | One query | Complex UNION | One query on recordings |
| Pagination across types | Trivial | Hard | Trivial |
| Table growth risk | Width (columns) | Separate tables | Depth (rows, no text) |
| Works from the parent side | Yes | No (child-centric) | Yes |
| Rails built-in support | Yes | Yes | Yes (`delegated_type`) |

## Key Design Rules

- **Recordables are immutable.** Editing a document creates a new recordable row; the recording pointer is updated to reference it.
- **Recordings are mutable,** but only their pointer (recordable_id), timestamp, and presentational fields (e.g. color) change.
- **Recordings form a tree.** Parent-child relationships are between recordings, not recordables. Children are always recordings.
  - Example path: `bucket → message_board recording → message recording → comment recording`
- **Recordables are dumb.** They have no associations and no access control. Nothing points to them except recordings and events. Some recordable tables have only an `id` column.
- **Buckets** are a parallel delegated type: a `Project`, `Template`, or `Ping` is a bucketable. Buckets hold recordings; access control lives on the bucket, not the recordable.

## Events System

- An `Event` links a recording to a recordable at a point in time, building a full audit trail.
- To restore a past version: update the recording's `recordable_id` to point back to the older immutable recordable.
- Events power the document changelog UI — each event shows which recordable was current at that moment.

## Querying Patterns

```ruby
# Filter recordings by type
bucket.recordings.messages           # → recordings with recordable_type = "Message"
message_board_recording.children.messages  # → child recordings that are messages

# Fetch the concrete recordable when you know the type
recording.document                   # raises if recordable is not a Document
recording.recordable                 # generic — works for any type

# Cross-type timeline in one query, paginated
Recording.where(recordable_type: %w[Message Document Comment]).page(1)
```

- The recordings table has no text columns, so cross-type queries are cheap even at billions of rows.
- Preload recordables per type to avoid N+1: one query per type, not one per row.
- The design is intentionally N+1 by type — fetch thin recordings first, then batch-load recordables.

## Capability System

Recordables declare their own capabilities by overriding boolean methods defined in the `Recordable` concern:

```ruby
# Default in Recordable concern
def commentable? = false
def subscribable? = false
def copyable?     = false
def exportable?   = false

# Document overrides
class Document < ApplicationRecord
  include Recordable
  def commentable? = true
  def subscribable? = true
  def exportable?   = true
end
```

- Controllers (e.g. `RecordingsController`, a single comments controller) gate actions on these capability checks — no type-specific controllers needed.
- Adding a new feature to a type is often just `def commentable? = true`.

## Generic Operations — Single Controller, Any Type

Operations that work uniformly across all recordables:
- **Trash / archive / restore** — one `RecordingsController`
- **Copy** — one copier; creates a new recording pointing to the *same* recordable (zero content duplication). If a message is copied 100 times, there is still one message row.
- **Move** — update the recording's parent pointer
- **Export** — exporter calls `recordable.write_export_format`; each type defines its own format
- **Caching** — `cache recording do … end` in every view; cache key is the recording, identical pattern for all types

## Mobile / API Benefits

- A single recordings JSON API returns all content types; mobile clients filter by type.
- Adding a new recordable type requires no mobile app release — the client handles unknowns generically (title, icon, archive state).

## Schema Evolution

- `recordings` table schema is essentially frozen after initial setup — new types add new tables, never new columns to `recordings`.
- Domain-specific shared attributes (e.g. `starts_at`, `ends_at` for calendar events) go on the recordings table when *all* types in that context share them, enabling single-query date-range fetches.

## Tradeoffs and Costs

- **Higher onboarding curve** — new developers open a `Message` model and find almost nothing; behavior is defined generically in concerns.
- **Recordables need recording context for some operations** — e.g. a comment needs its recording passed in to compute its title from the parent recording.
- **Not universally applicable** — best fit for domains with many content types sharing a uniform set of operations (CMS, wiki, Notion-like tools). Not every model in Basecamp uses this pattern.
- **Migration into existing apps is possible but painful** — better to start with it. Migration path: introduce the recordings table, rename existing models (e.g. `Comment` → `RecordableComment`), backfill recording rows.

## Origin and Adoption

- Invented by DHH, motivated by two concrete pains in Basecamp 2: slow/expensive copying and inability to paginate a mixed-type timeline with one query.
- Lived in Basecamp application code for 1–2 years before being extracted into Rails as `delegated_type`.
- Basecamp 3 has run on this architecture for over 10 years; Basecamp 4 and 5 are built on the same chassis without a rewrite.
- The same pattern is used in HEY under different names: `Entry` delegates to `Entryable`.
