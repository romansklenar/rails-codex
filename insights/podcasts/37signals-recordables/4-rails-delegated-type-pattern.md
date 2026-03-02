---
title: The Rails Delegated Type Pattern
description: "How 37signals uses delegated types, immutable recordables, and a tree of recordings to build a content system that scales without rewrites"
source:
  type: talk
  title: "The Rails Delegated Type Pattern"
  author: Jeffrey Hardy
  url: https://dev.37signals.com/the-rails-delegated-type-pattern/
  date: '2025-12-19'
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

Jeffrey Hardy (Principal Programmer, 18 years at 37signals) on the delegated type pattern powering Basecamp and HEY — a 10-year-old architecture that has never needed a foundational rewrite.

## Core Concept: Recordings + Recordables

- `recordings` is the primary table: lightweight, minimal columns — timestamps, creator IDs, recordable references. No text columns. No type-specific data.
- A **recordable** is the delegated type target — `Message`, `Document`, `Comment`, `Upload`, etc., each in its own table with type-specific data.
- Rails wires it up with one declaration:

```ruby
Recording: has_delegated_type :recordable
Recordable concern: defines all types and shared capabilities
```

- "You have recordings, and this is a table of records that stores all the metadata and common information between recordable types like messages and documents and uploads, but it doesn't have any specific information."
- The `Recording` model itself is ~42 lines. The `Recordable` concern (mixed into every concrete class) is ~100 lines.

## Comparison: STI vs Polymorphic vs Delegated Type

| Pattern | How | Problem |
|---------|-----|---------|
| STI | All types in one table | Table grows wider with each new type; slow migrations |
| Polymorphic | One record belongs to multiple types | Inverted — less efficient for content systems |
| Delegated Type | Parent (recording) references one of many types | Lean recordings table, isolated type tables |

Additional detail on cross-type behaviour:

| | STI | Polymorphic | Delegated Type |
|---|---|---|---|
| Cross-type querying | One query | Complex UNION | One query on recordings |
| Pagination across types | Trivial | Hard | Trivial |
| Schema change on new type | Add columns to big table | No | No — new table only |
| Works from the parent side | Yes | No (child-centric) | Yes |

## Key Design Rules

- **Recordables are immutable** — content is never modified in place; editing creates a new recordable row and the recording pointer is updated to reference it.
- **Recordings are mutable** (pointer only) — only `recordable_id`, timestamps, and presentational fields (e.g. color) ever change.
- **Recordings form a tree** — parent-child relationships are between recordings, not recordables. Example path: `message_board recording → message recording → comment recording → attachment recording`.
- **Recordables are "dumb"** — no associations; all rich behaviour lives in generic concerns. Some recordable tables have only an `id` column.

## Events System (Version History)

- An `Event` links a recording to a recordable at a point in time, building a full audit trail.
- "We track that in an event model. The event has a reference to the recording and it has a reference to a recordable... we can look at the history of a recording and see all of its changes."
- To restore a past version: update `recording.recordable_id` to point back to the older immutable recordable.
- Powers Basecamp's document changelog UI and version history.

## Querying Patterns

```ruby
# Filter recordings by type
bucket.recordings.messages                     # recordable_type = "Message"
message_board_recording.children.messages      # child recordings that are messages

# Fetch the concrete recordable
recording.document                             # raises if not a Document
recording.recordable                           # generic — any type

# Cross-type timeline in one query, paginated
Recording.where(recordable_type: %w[Message Document Comment]).page(1)
```

- Recordings table has no text columns — cross-type queries are cheap even at billions of rows.
- Preload recordables per type to avoid N+1: one query per type, not one per row.

## Capability System

Recordables declare features via boolean methods defined in the `Recordable` concern:

```ruby
# Defaults in Recordable concern
def commentable?  = false
def subscribable? = false
def copyable?     = false
def exportable?   = false
def publishable?  = false

# Individual types override as needed
class Document < ApplicationRecord
  include Recordable
  def commentable?  = true
  def subscribable? = true
  def exportable?   = true
end
```

- Generic controllers ask "Is this recording commentable?" before accepting comments — no type-specific controllers needed.
- Adding a new capability to a type is often just one line.

## Generic Operations — One Controller for All Types

| Operation | Detail |
|-----------|--------|
| Trash / archive / restore | Single `RecordingsController` |
| Copy | New recording points to the *same* recordable — zero content duplication; 100 copies = 1 recordable row |
| Move | Update the recording's parent pointer |
| Export | `recordable.write_export_format`; each type defines its format |
| Caching | `cache(recording)` pattern, identical across all types |

- "You can build entirely new features that should take months in like a week, two weeks."

## Mobile / API Benefits

(Fernando Olivares, mobile team)

- Single recordings JSON API — mobile clients filter by `recordable_type`.
- Adding a new content type requires no mobile app release; the client handles unknowns generically (title, icon, archive state).
- "We add a new type and we don't need to issue a new build of the mobile apps."

## Schema Evolution

- `recordings` table stays lean/frozen — only foreign key references; new types add new tables, never new columns.
- Domain-specific shared fields (e.g. `starts_at`, `ends_at` for calendar events) go on recordings when all types in that context share them, enabling single-query date-range fetches.
- Heavy content (large text, files) stays in specialised type tables.

## Performance

- Recordings table: billions of rows, mainly FK references — efficient indexing.
- Immutable recordables enable deduplication across copies.
- No text columns means cross-type queries stay fast at scale.

## Tradeoffs and Costs

- **Higher onboarding curve** — new developers open a `Message` model and find almost nothing; behaviour is distributed across generic concerns.
- **Recordables need recording context** — e.g. a comment needs its recording passed in to compute its title from the parent.
- **Not universally applicable** — best fit for content-centric apps (wikis, CMS, collaborative platforms). Not every model in Basecamp uses this pattern.
- **Migration is painful** — better to start with it from inception. Migration path: introduce recordings table, rename existing models, backfill recording rows.

## Origin and Adoption

- DHH conceived the idea when frustrated by two concrete pains in Basecamp 2: slow/expensive copying and inability to paginate a mixed-type timeline with one query.
- 1–2 year incubation in Basecamp application code before extraction into Rails as `delegated_type`.
- 10-year track record across Basecamp 3, 4, 5 — no foundational rewrites.
- HEY uses the same pattern under different names: `Entry` delegates to `Entryable`.
- Rails documentation exists but is "kind of terse... describes a shallow version of the benefits."

## When to Use

- Similar content types with shared operations (CMS, wiki, Notion-like tools)
- Efficient copy/move across types matters
- Timeline and pagination across mixed types
- Small teams maintaining complex systems
- New feature velocity is important
