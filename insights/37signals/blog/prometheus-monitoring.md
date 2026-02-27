---
title: "Prometheus Monitoring for Rails"
source: 
  - https://dev.37signals.com/kamal-prometheus/
  - https://dev.37signals.com/prometheus-metrics-at-37signals/
description: "Yabeda gems for Rails Prometheus metrics, PID cardinality fix, alerting patterns, OTel collector"
tags: [monitoring, devops]
---

# Prometheus Monitoring for Rails

Patterns for exposing and collecting Prometheus metrics from Rails applications.

## Rails Integration with Yabeda

Use the **yabeda** gem family for Rails metric export:

```ruby
# Gemfile
gem "yabeda-prometheus-mmap"  # mmap-based, handles high worker churn
gem "yabeda-puma-plugin"      # Puma thread/worker metrics
gem "yabeda-rails"            # Request rate, latency, status codes
```

Metrics exposed at `localhost:9394/metrics` in Prometheus format.

### PID Cardinality Fix

With many Puma workers, file-per-PID causes thousands of metric files. Use a surrogate PID provider:

```ruby
require "prometheus/client/support/puma"
Prometheus::Client.configuration.pid_provider =
  Prometheus::Client::Support::Puma.method(:worker_pid_provider)
```

## What to Monitor

- **Request rates and latencies** (via yabeda-rails)
- **Background job success/failure counts**
- **Puma thread pool saturation** (via yabeda-puma-plugin)
- **YJIT stats** (custom metric if needed)

## Alerting Patterns

- **Latency thresholds**: alert on `avg_over_time(...[30m])` exceeding target (e.g., 100ms)
- **Capacity forecasting**: `predict_linear(...[730h], 3600*24*30)` to project when a resource runs out within 30 days
- **Severity escalation**: single failure = chat notification; multiple failures of same type = page

## Architecture Notes

- **Pull-based scraping** (Prometheus pulls from app) over push
- **File-based service discovery** (`file_sd`) integrates with config management
- **Thanos** for long-term retention beyond Prometheus's 30-day window
- **OpenTelemetry Collector** as aggregation sidecar when running multiple containers per host (discovers containers via Docker socket, relabels with container ID, exposes single scrape endpoint)
