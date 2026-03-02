---
title: "Jean Boussier: IO-Bound Misconceptions"
description: "Jean Boussier challenges the assumption that Rails apps are always IO-bound, explaining how to properly measure GVL contention, reason about latency vs. throughput, and use instrumentation before reaching for concurrency solutions."
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/17496711-jean-boussier-io-bound-misconceptions"
  date: 2025-07-14
tags: [performance, concurrency, gvl, threading, ruby-internals, instrumentation, background-jobs, rails-core]
---

# Jean Boussier: IO-Bound Misconceptions

Jean Boussier (Senior Staff Engineer at Shopify, Rails Core member) dismantles the reflex assumption that Rails apps are IO-bound, and explains why measuring before optimizing — using real GVL instrumentation — is the only reliable path to better concurrency.

## Rails Infrastructure Work at Shopify

- Jean's role sits at the intersection of Rails Core and Shopify's production infrastructure — fixing Ruby/Rails issues that show up at Shopify scale but benefit the whole ecosystem
- Shopify runs one of the largest Rails monoliths in the world; performance problems there become upstream Rails/Ruby contributions
- The `pitchfork` server is Shopify's fork of Unicorn, reengineered for their specific infrastructure needs — copy-on-write memory optimisation is a key differentiator from Puma
- Shopify uses GraphQL extensively to structure and query API data at scale, which shapes how they think about request concurrency

## "Your Gems Are Your Code Too" (11:46)

- Gems in `Gemfile` are not black boxes — you own them the moment you depend on them
- You can read gem source, patch it, fork it, and treat it as first-party code when necessary
- Understanding gem internals is how senior engineers debug subtle production issues that gem authors never anticipated
- Jean's own Rails contributions (e.g., `ActiveRecord::Relation#load_async`) came from deeply understanding existing code rather than treating it as magic
- *Crafting Interpreters* (Robert Nystrom) is recommended for building mental models of how Ruby itself works at the interpreter level

## Latency vs. Throughput: "Fast" Is Too Vague (28:40)

- "Make it faster" is not an actionable goal — latency (time per request) and throughput (requests per unit time) are different problems requiring different solutions
- The Ferrari vs. bus analogy: a Ferrari has low latency (fast for one passenger) but low throughput; a bus has higher latency but moves far more people — choosing the wrong metric leads to the wrong fix
- A system can have excellent p50 latency but terrible throughput under load, or vice versa — instrument both separately
- Over-optimising for latency at the expense of throughput is a common mistake in Rails apps that don't measure under realistic concurrency

## The IO-Bound Self-Fulfilling Prophecy (34:23)

- The common belief — "Ruby/Rails apps are IO-bound, so the GVL doesn't matter" — is often asserted without measurement
- It becomes a self-fulfilling prophecy: teams don't instrument GVL contention because they assume it's not a problem, so they never discover it is
- An app can be IO-bound on average but CPU-bound in bursts; the GVL blocks all threads during CPU-heavy moments even if most time is spent waiting on DB/network
- Ractors are Ruby's parallel execution primitive but remain experimental; they require shared-nothing data models that don't map cleanly onto typical Rails app state
- The practical concurrency choice today is still Puma threads (with GVL) vs. preforking (Unicorn/Pitchfork) — the right answer depends on your actual workload profile, not on assumptions

## Why Instrumentation Matters (37:03)

- `gvltools` (Shopify open-source gem) measures thread contention in live Ruby processes — quantifies how much time threads spend waiting to acquire the GVL
- AppSignal integrates with GVL instrumentation, surfacing contention metrics alongside traditional APM data
- Instrumentation is the missing piece for most teams: they tune thread counts, switch servers, or add async jobs based on intuition rather than measured contention data
- The first step to any concurrency investigation is attaching `gvltools` and observing actual GVL wait time before making architectural changes

## Background Jobs and External API Calls (40:00)

- Background jobs are the correct solution for long-running external API calls that would otherwise hold a Puma thread (and the GVL) while waiting
- The distinction matters: IO that releases the GVL (network socket reads in native extensions) is genuinely safe in threads; Ruby-level processing that holds the GVL is not
- Using background jobs with intention means understanding *why* you're offloading — latency reduction for the user, or thread/GVL pressure relief on the server — and confirming the job actually solves that problem
- `ActiveRecord::Relation#load_async` (Jean's Rails Core contribution) backgrounds slow queries onto a thread pool, overlapping DB wait time with other request work — a targeted async primitive that doesn't require a full job queue

## Contributing to Rails Core (53:04)

- The path into Rails Core starts with deeply reading Rails source and using it as a reference, not just an API
- Practical contributions come from real production pain: identifying a bottleneck at Shopify scale, fixing it in Rails itself, so every app benefits
- Understanding how the framework works internally — not just how to use it — is what makes meaningful contribution possible
- Rails is not a black box; it is a system you can study, shape, and improve with growing confidence the more you read it
