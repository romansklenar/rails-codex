---
type: insight
title: "Jean Boussier: IO-Bound Misconceptions"
description: "Jean Boussier (Shopify Rails infrastructure, Rails Core) dismantles the assumption that Rails apps are IO-bound, explains how Pitchfork and copy-on-write work under the hood, how to measure GVL contention properly, and why treating gems as your own code is a career-defining skill."
resource: "https://podcast.rubyonrails.org/2462975/episodes/17496711-jean-boussier-io-bound-misconceptions"
tags: [performance, concurrency, gvl, threading, ruby-internals, instrumentation, background-jobs, rails-core, pitchfork, gems]
timestamp: "2026-03-02"
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/17496711-jean-boussier-io-bound-misconceptions"
  date: 2025-07-14
---

# Jean Boussier: IO-Bound Misconceptions

Jean Boussier (Senior Staff Engineer at Shopify, Rails Core member) dismantles the reflex assumption that Rails apps are IO-bound, walks through the mechanics of copy-on-write preforking, explains how to measure GVL contention accurately, and gives direct advice on gems, background jobs, and contributing to open source.

## Background: Who Jean Is

- Senior Staff Engineer at Shopify on the Rails infrastructure team — "infrastructure in the sense of all the bricks Shopify developers use to build Shopify"
- Not working on product features; focus is framework performance, developer productivity tooling, and upstream Rails/Ruby contributions
- Has been writing Rails since ~2007 (Rails 1.2); started with PHP (no framework, FTP deploys), a short stint with Django, then Rails — "never moved on from it"
- Self-describes as doing "system programming" for the last ~10 years: mostly underlying architecture, rarely writes application code directly
- Works remotely from Paris, France, on a different timezone from most of Shopify; has optimised his workflow to minimise synchronous dependencies: "I try to figure out things by myself. Whenever I need to synchronise with someone else, it's a bit of a stop in my productivity"
- Shopify runs Rails Edge: "If we come up with a Rails shortcoming and fix it in Rails, we directly upgrade it and developers can use it immediately — we don't have the 'you'll get it next year when you upgrade' thing"

## Shopify's Scale and Blind Spots

- Shopify is famous for having a large Rails monolith, but also has "a whole slew of much smaller apps, some internal, some more external"
- Every new Rails release triggers hundreds of apps to upgrade — Jean's team built automated tooling to handle 80–90% of the upgrade work so developers can "finish the rest and merge a PR"
- Shopify migrated away from Rails' view layer (Action View) to React and GraphQL years ago — this means Jean has "zero experience running that stack at scale": a real blind spot for Rails' modern front-end story (Hotwire, etc.)
- "I still write web apps like it's 2008" — Jean uses classic server-rendered Rails for personal projects; finds Hotwire and Turbo unfamiliar
- Observation on ecosystem health: "We do a lot, but we have a blind spot. There's definitely a place for other companies to come up and be more ambitious with contributing — we'd benefit from companies that use the view layer at scale filing issues and contributing improvements"

## The Ruby Ecosystem Maintenance Loop

- Jean runs CI against Ruby trunk (nightly, actually every hour) to catch regressions early — either gems doing things that "were working but were not specified" or Ruby making a change it shouldn't have
- "I racked up contributions in several hundred gems. There's often a joke from colleagues that whenever they go look at the GitHub of whatever gem they're using, I'm the last committer on it"
- This kind of work only makes economic sense at scale: "There's no point having a Ruby infrastructure team when you have 10 developers. When you have 1,000 developers, committing 10 people is a drop in the ocean — but shaving 1% performance or productivity basically pays for the salaries"

## "Your Gems Are Your Code Too"

- Jean's core philosophy, shared in talks and writing: "When you do `gem install something`, you're using code you don't immediately have access to — but you're still running it in production. If it doesn't work, it's your responsibility"
- The analogy: it's no different from code written by a colleague who is on vacation — you don't wait two weeks, you jump on it
- Practical workflow with Bundler: fork the repo, point your Gemfile at the fork (`gem 'foo', github: 'you/foo'`), ship the fix; the actual merge and publishing can happen later
- `bundle open <gemname>` opens the gem in your editor — "go look at it, put print statements in the middle, it's fine"
- "If you are able to write a Rails application, you should be able to figure out what's wrong in that gem. You just put statements everywhere and figure it out"
- Gem code is a good learning environment because it requires a different mindset — you can't take shortcuts, APIs must not make too many assumptions about how they're used
- 15-minute experiment Jean recommends: pick a gem you're curious about, run `bundle open <name>`, browse the source, drop a `puts` somewhere — "just go see for yourself"

## How to Evaluate a Gem Before Adding It

- Stars are "very low signal"
- Don't look at raw count of open issues — look at the last 10 issues (including closed ones) and check if they're being addressed
- Some gems haven't been updated in 10 years and "work perfectly fine — the software is mostly final and just needs updating every five years when something breaks compatibility"
- What matters: is the project healthy? Are issues being triaged and responded to?
- Jean personally just reads the code: after 17 years he has intuition — "I look at the code and I say: this is someone who knows what they're doing. Sometimes I see smells and I'm not confident"
- Concrete example: evaluating a JSON serialiser gem for `shippit_engine` (his open-source deployment tool): "Someone suggested a gem that looked cool. I opened it and realised it was lots of C code for performance. I've seen so much C code segfault in production — it's fast but not worth it. I stuck with `active_model_serializers`"
- On transitive dependencies: upper-bound version locks are an anti-pattern — "Something that tests against Rails 8 and declares `< 9` because they don't know what Rails 9 will look like. One or two years from now Rails 9 ships and you're blocked on upgrading because the gem pinned it. Better to assume compatibility continues on the major version"

## Pitchfork: Why Shopify Didn't Use Puma

- Pitchfork is Shopify's fork of Unicorn (itself from ~2009) — Shopify maintains it because large companies like Shopify, GitHub, Zendesk all ran Unicorn for their big monoliths
- People assume they stuck with Unicorn because of thread-safety concerns — "We could be thread-safe if we wanted. It's much deeper than that"
- The real reason: **Shopify's app is not very IO-intensive** — on a typical 100ms request, ~60–70ms is spent actually executing Ruby, and only ~30ms doing IO
- With Puma at 2 threads: when one request grabs the GVL to crunch CPU (e.g. render a template), the second request stalls waiting for it — "Your 100ms request suddenly responds in 110ms. You're 10% slower. Your latency degraded"
- The throughput/latency trade-off: Puma threads improve throughput (more requests per minute) by reclaiming IO wait time; Unicorn/Pitchfork preserves lower latency per request at the cost of more processes

## Copy-on-Write and Memory Math

- The cost of more processes: with 2 threads in 1 process = 1GB; spawning a second process naively = 2GB
- But `fork()` has been doing copy-on-write (CoW) for ~40–50 years: it creates a pointer/reference to the original memory pages, and only copies a page when one of the two processes actually writes to it
- Ruby's GC is much better at this than Python: Python uses reference counting, so every object access modifies the object (updating the ref count), which constantly invalidates CoW pages — "Python really wants to get rid of the GIL because multiprocessing with Python invalidates memory like crazy"
- Ruby's GC doesn't touch read-only objects, so CoW pages stay shared across processes
- Jean's production measurements with Unicorn at Shopify: "40–60% of memory is shared between processes"
- Worked example: 24 processes × 1GB app, with 50% CoW sharing = 500MB shared by all + (24 × 500MB) = **~12.5GB total**, far less than the naive 24GB
- "1.5 processes per core" strategy: on a 16-core server, spawn 24 processes; the OS scheduler notices a Ruby process is doing IO, preempts it, and runs another — better CPU utilisation than 16 processes × 2 Puma threads
- Pitchfork = Unicorn + Shopify-specific improvements; Unicorn/Pitchfork wins on latency when the app is CPU-heavy; Puma wins when the app genuinely spends most time waiting on IO

## Latency vs. Throughput: "Faster Is Too Vague"

- "I really want to insist on latency versus throughput — a lot of people get this wrong in performance discussions"
- Latency: how long it takes to serve one request (time per user)
- Throughput: how many requests the system can handle per hour
- The Ferrari vs. bus analogy: "A Ferrari ships someone 100km in 30 minutes — low latency. But if you have 200 people to move, the Ferrari going back and forth won't cut it. A bus or even bikes will get there faster if you have 100 people"
- "If you don't care about memory usage, Unicorn/Pitchfork is going to be faster than Puma — it'll answer faster per request. But that doesn't mean it'll handle more customers simultaneously"
- Most published benchmarks focus on throughput — which is also what people worry about for traffic spikes — but many apps should care more about latency per user
- "It's important to understand that 'faster' can mean a lot of things in different contexts. Otherwise it's impossible to have a proper performance discussion"

## The IO-Bound Self-Fulfilling Prophecy

- Puma was built on the assumption that most Rails apps are mostly IO-bound — "just a small proxy to the database"
- The default of 5 threads was actually a reduction from the historical default of ~30, advocated for by Nate Berkopec
- Puma was also started by someone working on Rubinius (a Ruby implementation without a GVL) — "there was also a long-term view that eventually the GVL will be gone and we should write threaded code"
- Jean's blog post argues that for the vast majority of apps, the IO-bound assumption is false: "If you recently enabled [YJIT](../../blogs/37signals/yjit-performance.md) and saw a 20–25% improvement — YJIT doesn't speed up IO, it only speeds up Ruby code. So if YJIT improved your app that much, you're not doing that much IO"
- YJIT also holds the GVL when executing (it's still executing Ruby), so fast YJIT speedups = significant CPU time in the Ruby runtime
- True IO-bound apps exist but are rare: "I've discussed with a few people who have them — they're literally proxies. There's a Rails app that just takes a request, calls a weather API, does a bit of transformation, and sends it back. That's a genuine Puma or even Falcon use case"
- The math on 5 Puma threads: "If only one thread can execute at a time and you have 5 threads, a request is only allowed to use the CPU 20% of the time. That assumes 80% IO — and in the best case, because requests might want their 20% CPU at the same time, causing contention. To use 5 threads without contention you probably need ~85–90% IO, which is really hard to achieve unless you're a proxy or you have serious query problems"

## How to Actually Measure Whether You're IO-Bound

- The naive measurement approach is broken: "Before IO, take time; after IO, subtract — 'I did IO for 10ms.' But did you? For Ruby to compute the subtraction it needs to reacquire the GVL. If it was waiting on another thread for 50ms, you'll think you did 50ms IO, but you were actually CPU-exhausted"
- The correct tool: **`gvltools`** (Shopify open-source gem, `Shopify/gvltools`) — uses an API Jean added to CRuby in Ruby 3.1 or 3.2 that instruments the GVL at the C level
- How it works: a semaphoric timer — whenever a thread is waiting to acquire the GVL, it increments the timer; wrap a request with before/after reads of the timer to see actual GVL wait time
- The API was intentionally designed for APM vendors to consume: "I had no intent to integrate this into Rails or whatever. My intent was that companies like AppSignal, Datadog, Sentry, Honeybadger would use it — it's their turf, they know how to present that data to their customers"
- AppSignal already integrates `gvltools` — "I'm really happy they did it. I hope they show a request timeline decomposed into: time on DB, time executing Ruby, and — separately — time waiting for GVL. GVL queuing is exactly the same thing as request queuing. Literally the threads are in a queue in the Ruby VM waiting to get the GVL"
- The second hard problem: you won't see GVL contention until all threads are busy simultaneously — "You might configure 5 threads but on average only 1–2 are used, then you get a traffic spike and all 5 are busy and everything slows down. The real question is: when all your servers are fully busy, are request latencies degrading?"
- That requires realistic load simulation: "Some endpoints might be CPU-heavy (rendering), others IO-heavy (slow query) — when you get a traffic spike, which is the bottleneck? You need instrumentation so that when one night response times go through the roof, you can say: GVL contention went up, meaning we over-configured Puma and it would have been better to queue requests at the entrance rather than run them in parallel when they can't all execute"

## Background Jobs: When and Why

- Jean's rule: "Anything that can be put in a job should probably be put in a job"
- Absolute rule #1: "Never call a third-party service from your controller or the request cycle — anything that you don't control, that could be slow, that could fail and need to be retried, should be in a background job"
- The IO vs. CPU distinction matters here: "IO that releases the GVL (network socket reads in native C extensions) is genuinely safe in threads; Ruby-level processing that holds the GVL is not"
- Jean's `shippit_engine` (open-source, a deployment tool that synchronises with GitHub): "You'd think it's impossible to do it without any API calls from a request — it literally scans your repo and tells you about undeployed commits. But it's built around the idea that NO API calls happen in the request cycle. Everything is done from background jobs that constantly mirror GitHub state into the database"
- The architecture: jobs receive webhooks or poll, mirror external state into the local DB, and the request just queries the DB — "so the app is snappy. Previously we had a Node.js app that did API calls on the fly and was sometimes very slow to answer"
- This introduces reconciliation complexity but is worth it for UX: "If the tab is inactive, why poll every 5 seconds? I cut server usage by more than half once by using the browser Page Visibility API to reduce polling to every 30 seconds for inactive tabs"
- Optimisation is contextual: "It's about knowing what you need to do and doing nothing more than that — and knowing what you can spare not doing"

## `ActiveRecord::Relation#load_async` — Jean's Rails Core Contribution

- Jean's breakthrough contribution to Rails Core; what "earned him the invitation" to join
- Use case: if you have a slow query you cannot optimise further for whatever reason, you can schedule it to run on a background thread and get back a "future" (like JavaScript's Promise)
- "It's useful in specific contexts — if you have a well-optimised database, many queries are a fraction of a millisecond and not worth going through the overhead. But for genuinely slow queries it lets you overlap DB wait time with other request work"
- A targeted async primitive that doesn't require a full job queue infrastructure

## The Twitter / "Rails is Slow" Debate

- "Rails is slow" is "the bricks of not very experienced people"
- The right framing: developer salaries vs. server costs — "If you migrate to Rails and need twice as many servers but your developers make twice as many features, maybe that's what you need right now"
- The Twitter exit: "They were not making any money. They didn't even have ads. They were scaling traffic like crazy. It had a relatively small feature set that didn't evolve much. It makes total sense to optimise as much as you can. I love Ruby but in their situation I would have done the same"
- Shopify's situation is different: "Customers pay a sizable subscription, merchants pay with their credit cards and we take a cut. Yes, making Ruby 10x faster would be wonderful, but that's not the only metric"
- The real economic question: "How much does it cost me to serve one million requests, and how much money does saving those requests bring me? As long as the economics are positive, it's fine. It's not about being fast for the sake of being fast. You want to respond in a decent amount of time — but you need to be fast enough. That's the real thing"

## GraphQL and Shopify's Front-End Architecture

- Shopify migrated to GraphQL + React several years ago for the admin; Action View is no longer used at Shopify scale
- GraphQL API is used heavily, but mostly by API integrations and third-party tools, not by end users browsing the admin
- Jean's honest assessment: "GraphQL is very pleasant to use as a consumer. It's very painful to implement as a server — you give so much flexibility that customers always come up with a new weird data access pattern that's hard to optimise"
- Operational challenge with GraphQL: "Everything is on the same endpoint as a POST — you can't just retry it like a GET. You get blobs of queries arriving at the same endpoint and need to figure out how to deal with them. That makes debugging and observability harder" (referencing a Shopify colleague's post about this)
- Jean's personal preference: "If I build something myself, I'm just going to do good old server-rendered HTML. Maybe I'm too conservative. But using React was also an economic decision — React became an industry standard, so it's easy to hire"

## Rails Core Team: How It Works

- Jean's path: first commit ~2011 (a typo fix in docs); first real contribution ~2013 (a race condition in ActiveRecord counter caches); joined Rails Core after `load_async` and sustained grinding contribution through Shopify Rails upgrades
- "I was just on top of lots of bugs. I was slowly climbing the top contributors list"
- What Core membership means: "You get on the Core team not because you have a million contributions. It's because you've demonstrated you're trusted to develop new features in line with the general design — it's a signal that you got it right, you understand how it's supposed to work"
- Day-to-day reality: "I do way more maintaining than steering. But I feel empowered to voice my opinions much more than before"
- There's no formal turf ownership, but people have different familiarity: "If I need something with ActiveRecord connection management, Eileen did a big refactor a couple years ago so I'll mention it to her. Matthew Draper is also often in that area. Anything involving front-end, you have to talk to DHH — he has very strong opinions about everything front-end"
- How Jean collaborates: "I often just need someone to bounce the idea off — like a rubber duck. I need confirmation I'm not crazy. It's a lot of one-on-one conversations, not a very formal thing"
- The Rails Error Reporting API: another Jean contribution — a generic interface so Sentry, AppSignal, Datadog etc. can integrate with Rails error reporting uniformly; motivation was that Rails sometimes rescues errors internally (e.g. cache read failure → treat as cache miss) but needs a way to report those rescued errors to the developer without raising and breaking the app

## "Rails Is Not Magic"

- Jean's biggest pet peeve: "whenever someone mentions the word magic with Rails — it really gets me started"
- "Just open the thing, go look at it. There are a few hairy parts — callbacks are like the dragon's den, I wouldn't touch them with a 10-foot pole because I don't fully understand how they work and I don't want to break them. But most of Rails is really not that hard to understand"
- The DSL layer is thin: "Many APIs use a bit of DSL to look nice. I'm not always fond of it, but it's a very thin layer. Once you pry open that method and look at it, it's not that complicated"
- Rails Core is essentially "a club of people who have similar taste in API design"

## On Open Source Contribution

- Jean's view is deliberately contrarian: "Don't contribute just to contribute"
- Quoting old-school open source ethos: "Open source is about scratching your own itches — if it's not itchy, don't scratch it"
- Rails itself is "an extraction framework — we don't want features you just dreamed of and think would be cool. You should have tried it in your app, found that many other people have the same use case, and then extracted it"
- What Jean contributes: "I only contribute when I run into a bug, or my employer runs into a bug, a performance issue, or a limiting feature — I don't go around implementing stuff nobody needs"
- The pragmatic entry point for beginners: issue triage and bug fixing — "If someone reported a bug they can't fix themselves and you think you can, that's always useful"
- Warning: "Contributing just to contribute is the best way to burn out. You'll make contributions nobody wants to merge, you'll say 'I'm not doing this again.' Don't feel like it's a necessity"

## Recommended Resources

- **Crafting Interpreters** (Robert Nystrom) — free online (HTML + PDF); "absolutely brilliant, a kind of tutorial where you create your own interpreted language from scratch — the best technical read of my career. Really helped me understand how Ruby works and dig deeper into it"
- Jean's blog: `byroot.github.io`
- Social: Bluesky `@byroot.ruby.social`, Twitter/X `@_byroot`
