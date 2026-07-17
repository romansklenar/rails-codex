# 37signals RECORDABLES

> Curated insights from the RECORDABLES video series — 37signals engineers walking through architecture and infrastructure deep-dives.

## Insight files

* [Behind the Fizzy Infrastructure](1-behind-the-fizzy-infrastructure.md) - How 37signals explored a per-tenant SQLite + replication architecture for Fizzy, pivoted to MySQL two days before launch, and kept the best parts
* [Rails Multi-Tenancy](2-rails-multi-tenancy.md) - How 37signals built the active_record_tenanted gem to make Rails multi-tenancy safe, efficient, and framework-wide
* [Moving Mountains of Data off S3](3-moving-mountains-of-data-off-s3.md) - How 37signals migrated 5 petabytes and 5 billion objects out of S3 in under 10 days using a custom Rails app, DuckDB, rclone, and Pure Storage FlashBlade
* [The Rails Delegated Type Pattern](4-rails-delegated-type-pattern.md) - How 37signals uses delegated types, immutable recordables, and a tree of recordings to build a content system that scales without rewrites
* [The ONCE App Server](5-the-once-app-server.md) - How 37signals turned single-app self-hosted installs into a Nintendo-cartridge-style console that runs multiple Dockerized web apps on one machine with gapless deploys, SQLite storage, and near-zero configuration.
