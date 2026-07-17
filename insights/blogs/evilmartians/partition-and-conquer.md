---
type: insight
title: "Partition and Conquer"
description: "Migrating a multi-million-row PostgreSQL table to a view-based partitioned schema in production using PL/pgSQL triggers, country-and-month child tables, and a strict deployment methodology"
resource: "https://evilmartians.com/chronicles/partition-and-conquer"
tags: [postgresql, rails, performance, partitioning, database, migrations, production, plpgsql]
timestamp: "2026-03-02"
source:
  type: blog
  title: "Martian Chronicles"
  author: "Sara Dolgan, Denis Lifanov"
  url: "https://evilmartians.com/chronicles/partition-and-conquer"
  date: '2017-11-07'
---

# Partition and Conquer

How to partition a multi-million-row PostgreSQL orders table in a live production system using database views and PL/pgSQL triggers, with zero-downtime switchover and a rigorous deployment process.

## When to Partition

- Partition when tables reach several million rows with expected continued growth
- Partition when queries consistently filter or group by the same dimensions (time range, geography, category)
- Partitioning provides little benefit for queries that only filter by primary key or unrelated foreign keys
- The goal: split one large slow table into many small fast child tables, transparent to the application

## Initial Schema

- `orders` table with: `id SERIAL`, `country VARCHAR(2)`, `type VARCHAR DEFAULT 'delivery'`, `scheduled_at TIMESTAMP WITHOUT TIME ZONE`, `cost NUMERIC(10,2) DEFAULT 0`, `data JSONB DEFAULT '{}'`
- Existing index on `(country, scheduled_at)` supports the most frequent query pattern
- Partition strategy: child tables per country + month (e.g., `orders_partitioned_us_2017_11`)

## Three Approaches Evaluated

| Approach | Problem |
|---|---|
| Insert into master + child, delete from master | Performance degradation; double writes |
| Modify ActiveRecord adapter (`insert_returning = false`) | Affects all tables application-wide; too broad |
| Database view with `INSTEAD OF INSERT` trigger | **Chosen** — ActiveRecord works with views as if they're normal tables |

## View-Based Partitioning Architecture

- Create `orders_partitioned` as a clone: `CREATE TABLE orders_partitioned (LIKE orders INCLUDING ALL)`
- Create a view: `CREATE OR REPLACE VIEW orders_partitioned_view AS SELECT * FROM orders_partitioned`
- Set column defaults on the view so ActiveRecord's `INSERT ... RETURNING` behavior works correctly:
  - `ALTER VIEW orders_partitioned_view ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass)`
  - Same for `cost`, `type`, `data`
- Attach an `INSTEAD OF INSERT` trigger to intercept all inserts and route to correct child table

## PL/pgSQL Trigger Function

```sql
CREATE OR REPLACE FUNCTION orders_partitioned_view_insert_trigger_procedure()
RETURNS TRIGGER AS $BODY$
  DECLARE
    partition TEXT;
    partition_country TEXT;
    partition_date TIMESTAMP;
  BEGIN
    partition_date := date_trunc('month', NEW.scheduled_at);
    partition_country := lower(NEW.country);
    partition := TG_TABLE_NAME || '_' || partition_country || '_'
                 || to_char(partition_date, 'YYYY_MM');

    IF NOT EXISTS(SELECT relname FROM pg_class WHERE relname = partition) THEN
      EXECUTE 'CREATE TABLE IF NOT EXISTS ' || partition || ' (CHECK (
        country = ''' || NEW.country || ''' AND
        date_trunc(''minute'', scheduled_at) >= ''' || partition_date || ''' AND
        date_trunc(''minute'', scheduled_at) < ''' || partition_date + interval '1 month' || '''))
        INHERITS (orders_partitioned);';

      EXECUTE 'CREATE INDEX IF NOT EXISTS ' || partition || '_scheduled_at_idx
               ON ' || partition || ' (scheduled_at);';
    END IF;

    EXECUTE 'INSERT INTO ' || partition || ' SELECT(orders ' || quote_literal(NEW) || ').*';
    RETURN NEW;
  END;
$BODY$
LANGUAGE plpgsql;
```

- `date_trunc('month', NEW.scheduled_at)` determines partition period
- `lower(NEW.country)` normalizes country code for table naming
- `CHECK` constraints on each child table allow PostgreSQL query planner to skip irrelevant partitions (constraint exclusion)
- Per-partition index on `scheduled_at` for range query performance
- `RETURN NEW` (not `NULL`) is required for ActiveRecord compatibility with `INSERT ... RETURNING`

## Trigger Attachment

```sql
CREATE TRIGGER orders_partitioned_view_insert_trigger
INSTEAD OF INSERT ON orders_partitioned_view
FOR EACH ROW EXECUTE PROCEDURE orders_partitioned_view_insert_trigger_procedure();
```

## Migrating Historical Data

- Only migrate recent data (typically current month onward) to avoid long migration window:
  ```sql
  INSERT INTO orders_partitioned_view
  SELECT * FROM orders
  WHERE scheduled_at >= date_trunc('month', now());
  ```
- Old historical data stays in the original `orders` table and can be queried separately or archived

## Production Switchover

```sql
ALTER TABLE orders RENAME TO orders_partitioned;
CREATE OR REPLACE VIEW orders AS SELECT * FROM orders_partitioned;
```

- Renames original table to `orders_partitioned` (which the new view also reads from)
- Creates a `orders` view that still reads from the original data — application sees no change
- Minimal downtime: these two DDL statements execute quickly
- Rollback: drop the view, rename table back — all data is preserved

## Production Deployment Methodology

- The article emphasizes: "writing migration code is only half of the job — the other half is making sure your team is prepared"
- Required before deploying: operations engineer on duty, DBA present, comprehensive monitoring active (disk I/O, RAM, CPU, network, DB query times, app request rates, background job queues, logs)
- Release plan reviewed by a peer or team lead; all steps manually reproducible
- Developer available to support migration code questions; team lead aware and present
- Documented rollback procedure ready to execute at any moment

## Alternative PostgreSQL Tooling

- `pg_pathman` — suitable for simpler single-column partitioning on older PostgreSQL versions
- PostgreSQL 10+ **declarative partitioning** (`PARTITION BY RANGE/LIST/HASH`) — eliminates need for triggers entirely
- `pg_party` gem — ActiveRecord integration for PostgreSQL 10+ declarative partitioning; preferred when a PG version upgrade is feasible
- For new projects on PostgreSQL 10+: use declarative partitioning + `pg_party` instead of the trigger-based approach

## Key Lessons

- Avoid raw SQL in application code where possible — ORM-level abstractions make infrastructure changes (like partitioning) transparent
- Database views allow partitioning to be entirely invisible to Rails/ActiveRecord
- Constraint exclusion (via `CHECK` constraints on child tables) is what makes partitioned queries fast — without them, PostgreSQL scans all partitions
- Test the full switchover on a staging environment with production-volume data before deploying
