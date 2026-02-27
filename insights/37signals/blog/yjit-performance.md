---
title: "YJIT Performance"
source: https://dev.37signals.com/yjit-is-fast/
description: "Enable YJIT for 15-20% faster Rails responses — runtime enable, memory sizing, Ruby 3.3+ threshold"
tags: [ruby, performance]
---

# YJIT Performance

Enable YJIT for 15-20% faster Rails responses with zero code changes.

## Results (Basecamp)

- Median response time: **22% faster**
- Average: **16% faster**
- p90: **16% faster**
- Overall: **18% improvement**

## Configuration

### Enable at Runtime (Recommended)

Disable at boot, enable after initialization for faster startup:

```ruby
# config/application.rb or an initializer
RubyVM::YJIT.enable
```

```bash
# In RUBYOPT or Dockerfile
RUBYOPT="--yjit-disable"
```

Rails calls `RubyVM::YJIT.enable` automatically after boot (Rails 7.2+).

### Memory Sizing

- Default: 128 MiB (may be insufficient for large apps)
- Measure first, then adjust:
  ```ruby
  RubyVM::YJIT.runtime_stats[:code_region_size]
  ```
- Set via: `RUBYOPT="--yjit-exec-mem-size=192"`

### Ruby Version

- **Ruby 3.3+** is the threshold -- YJIT execution ratio jumps from ~43% to ~98%
- Always use the latest stable Ruby for best YJIT results

## Checklist

- [ ] Ruby 3.3+ in production
- [ ] YJIT enabled (Rails 7.2+ does this automatically)
- [ ] Measure `code_region_size` in production
- [ ] Increase `--yjit-exec-mem-size` if code region exceeds default
- [ ] Monitor response times before/after to confirm gains
