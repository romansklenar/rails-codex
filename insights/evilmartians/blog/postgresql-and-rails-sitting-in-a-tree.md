---
title: "PostgreSQL and Rails, Sitting in a Tree"
description: "Efficiently importing and storing 1M+ hierarchical records in PostgreSQL using COPY FROM with binary format, and choosing Closure Table over Nested Set or Materialized Path via closure_tree and pg_closure_tree_rebuild"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Viktor Sokolov"
  url: "https://evilmartians.com/chronicles/postgresql-and-rails-sitting-in-a-tree"
  date: '2016-03-09'
tags: [postgresql, rails, ruby, activerecord, performance, hierarchical-data, closure-tree, bulk-import]
---

# PostgreSQL and Rails, Sitting in a Tree

How to bulk-import 1M+ unsorted hierarchical records into PostgreSQL and query them efficiently using the Closure Table pattern with a custom fast rebuild tool.

## The Problem

- Real-world case: importing Russian postal address data (regions, cities, streets, houses) — 1,188,483 unsorted records
- Required operations: fetch all streets within a region, retrieve full ancestor path (house → street → city → region)
- Standard `INSERT` loops are too slow for millions of records
- Standard hierarchical gems' rebuild tools are too slow for millions of records

## Fast Bulk Import with PostgreSQL COPY FROM

- `COPY FROM` is PostgreSQL's native bulk-load command — far faster than multiple `INSERT` statements
- Accepts CSV or binary format; **binary format is faster** due to reduced parsing overhead
- PostgreSQL documentation: https://www.postgresql.org/docs/current/populate.html
- Use the `pg_data_encoder` gem to convert Ruby data to PostgreSQL binary format
- Use the `sequel` gem for lightweight database access during import scripts (avoids ActiveRecord overhead)
- Run via `bundle exec rails runner import.rb`

## COPY FROM Import Script Pattern

```ruby
db = Sequel.connect(ActiveRecord::Base.connection_config)
encoder = PgDataEncoder::EncodeForCopy.new

records.each { |line| encoder.add(line) }

db.copy_into(
  "tax_authorities",
  columns: %i[id parent_id name],
  format: :binary,
  data: encoder.get_io
)
```

- For large datasets: chunk the import in a read-copy loop to limit memory usage
- Use `use_tempfile: true` in `PgDataEncoder::EncodeForCopy.new` to buffer via filesystem instead of RAM

## Hierarchical Storage Pattern Comparison

| Pattern | Gem | Speed | Complexity | Concurrency | Notes |
|---|---|---|---|---|---|
| Nested Set | `awesome_nested_set` | Slow | High | Locking required | Author: "Anything but this" |
| Materialized Path | `ancestry` | Fast reads | Medium | OK | `ltree` native PG support; slow rebuild |
| Closure Table | `closure_tree` | Good reads | Low | OK | **Recommended** — simplest algorithm |

## Nested Set: Why Not

- Requires complex update algorithm touching many rows on every insert/move
- Concurrent inserts require exclusive table locks
- Performance degrades as tree grows
- Algorithm is difficult to understand and debug

## Materialized Path with ancestry

- Stores ancestor IDs as a string path in `ancestry` column, depth in `ancestry_depth`
- PostgreSQL native support via `ltree` extension makes queries fast
- `#build_ancestry_from_parent_ids!` rebuilds ancestry from `parent_id` column
- **Performance problem**: rebuilding 1,188,483 records took **44 minutes** — unacceptable
- Fast for reads, but initial bulk population is too slow

## Closure Table with closure_tree

- Separate `hierarchies` table stores all ancestor-descendant pairs with `ancestor_id`, `descendant_id`, `generations` columns
- Every node has a self-referential row (`generations: 0`), plus rows for every ancestor
- Example: node 1 has rows `(1,1,0)`, `(2,1,1)` if node 2 is parent
- Queries: descendants = `WHERE ancestor_id = ?`; ancestors = `WHERE descendant_id = ?`
- No schema changes to the source table — hierarchy lives in the separate `hierarchies` table
- Supports foreign keys for referential integrity
- Default `closure_tree`'s `#rebuild!` is too slow for millions of records

## pg_closure_tree_rebuild: Fast Bulk Closure Table Rebuild

- Custom gem by Evil Martians: https://github.com/gzigzigzeo/pg_closure_tree_rebuild
- Algorithm: (1) fetch all `id`/`parent_id` from source table in one `SELECT`; (2) calculate all descendants in-memory; (3) write results via `COPY FROM` binary
- Result: **3.5 minutes** (203 seconds) for 1,188,483 records — **12.5x faster** than Materialized Path rebuild

### CLI Usage
```bash
bundle exec rake closure_tree:rebuild \
  DATABASE_URL=postgres://localhost/tax_authorities \
  TABLE=tax_authorities
```

### Programmatic Usage
```ruby
PgClosureTreeRebuild::Runner.new(
  Sequel.connect(ActiveRecord::Base.connection_config),
  'tax_authorities'
).run
```

## Performance Results Summary

- Materialized Path rebuild: ~44 minutes
- Closure Table with `pg_closure_tree_rebuild`: 3.5 minutes
- Speed improvement: **12.5x** faster
- Default `closure_tree` `#rebuild!`: hours (unusable for production scale)

## Final Recommendations

- Use `COPY FROM` with binary format (`pg_data_encoder` + `sequel`) for any bulk table population
- Choose Closure Table (`closure_tree` gem) for hierarchical data that needs both ancestor and descendant queries
- Replace `closure_tree`'s built-in `#rebuild!` with `pg_closure_tree_rebuild` for datasets over 100K rows
- Avoid Nested Set entirely — complexity and locking make it unsuitable for concurrent Rails apps
- Materialized Path (`ancestry`) is acceptable for smaller trees where rebuild time is not a concern
