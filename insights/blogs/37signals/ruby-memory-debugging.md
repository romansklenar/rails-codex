---
title: Ruby Memory Leak Debugging
description: "Heap dump analysis with rbtrace, ObjectSpace, heapy, sheap for diagnosing Ruby memory leaks"
source:
  type: blog
  title: My adventures hunting down a Ruby memory leak
  author: Jacopo Beschi
  url: https://dev.37signals.com/adventures-hunting-down-ruby-memory-leak/
  date: '2024-03-07'
tags:
- ruby
- debugging
---

# Ruby Memory Leak Debugging

Systematic approach to diagnosing Ruby memory leaks using heap dumps and object retention analysis.

## Symptom Recognition

- Gradual memory growth over days without deployment
- Memory does not return to baseline after GC runs
- `heap_available_slots` increases after GC instead of stabilizing

## Debugging Toolkit

| Tool | Purpose |
|------|---------|
| `rbtrace` | Attach to running process without restart |
| `ObjectSpace.dump_all` | Export full heap as JSON for offline analysis |
| `ObjectSpace.trace_object_allocations_start` | Track where each object was allocated |
| `heapy diff` | Compare sequential heap dumps to find retained objects |
| `sheap` | Trace object dependency trees to find retention paths |

## Step-by-Step Process

1. **Capture heap dumps** without stopping the app:
   ```ruby
   # Via rbtrace — attach to a running worker PID
   bundle exec rbtrace -p $worker_pid -e '
     Thread.new {
       GC.start
       require "objspace"
       File.open("/tmp/heap_0.json", "w") { |f|
         ObjectSpace.dump_all(output: f)
       }
     }
   '
   ```

2. **Enable allocation tracing** for richer dumps (single host only):
   ```ruby
   ObjectSpace.trace_object_allocations_start
   ```
   - Significantly increases memory and slows response times
   - Enable on one host; monitor closely; isolate from load balancer if needed

3. **Collect sequential dumps** (e.g., 15min, 40min, 60min post-deploy) to diff retained objects over time

4. **Diff with heapy** to identify which file/line retains the most objects:
   ```bash
   heapy diff heap_0.json heap_1.json
   ```

5. **Trace retention paths** with sheap to find the root reference holding objects in memory

## Key Lessons

- **Retention path matters more than allocation site** -- an object allocated in your code may be retained by a runtime component (YJIT, C extension, global cache)
- **Sequential snapshots beat single dumps** -- one dump cannot distinguish leaks from normal working set
- **Trade performance for diagnostics temporarily** -- allocation tracing is expensive but essential; limit to one host
- **GC behavior is diagnostic** -- if `GC.start` does not reclaim expected objects, something holds a reference
