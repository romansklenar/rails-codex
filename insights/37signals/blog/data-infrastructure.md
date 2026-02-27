---
title: Data Infrastructure
description: "S3 migration, Harbor registry, Pure Storage monitoring — Rails as orchestration layer"
source:
- type: blog
  title: Moving Mountains of Data off S3
  author: Kimberly Rhodes, Fernando Olivares, Jeremy Daer
  url: https://dev.37signals.com/moving-mountains-of-data-off-s3/
  date: '2026-01-08'
- type: blog
  title: Running our Docker registry on-prem with Harbor
  author: Farah Schuller
  url: https://dev.37signals.com/running-our-docker-registry-on-prem-with-harbor/
  date: '2025-08-24'
- type: blog
  title: Monitoring 10 Petabytes of data in Pure Storage
  author: Victor Bogo
  url: https://dev.37signals.com/pure-storage-monitoring/
  date: '2025-01-02'
tags:
- infrastructure
- devops
---

# Data Infrastructure

Summary of 37signals' large-scale data migration and storage operations. Infrastructure-scale stories with limited direct coding applicability.

## S3 Migration (10 PB)

- **Tools**: Rclone (transfer), DuckDB (inventory partitioning), Rails app "Nostos" for orchestration
- **Key pattern**: Verification requires as much effort as copying -- reconcile with inventory reports + live sync + permission locks + checksum sampling
- **Lesson**: Use Rails (Solid Queue) for job orchestration even in infrastructure tasks -- conventions for state tracking, retries, and credential management (Active Record Encryption) beat custom scripts

## Docker Registry (Harbor)

- On-prem Harbor replaced Docker Hub; image pull times dropped by 25 seconds
- Two-way replication between datacenters with S3 bucket replication as backup
- Retention policies reduced storage from 9 TiB to 1.5 TiB

## Storage Monitoring (Pure Storage + Prometheus)

- Split Prometheus jobs per metric path (`/metrics/array`, `/metrics/usage`, etc.) to reduce scrape overhead
- Label extraction via `metric_relabel_configs` regex to parse hierarchy from metric names
- Capacity forecasting with `predict_linear` for proactive alerts

## Applicable Takeaway

**Rails as orchestration layer**: even for infrastructure tasks, a Rails app with Solid Queue provides better state management, retry logic, observability, and credential handling than shell scripts or ad-hoc tooling.
