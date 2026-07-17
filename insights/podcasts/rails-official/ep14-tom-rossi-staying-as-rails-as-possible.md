---
type: insight
title: "Tom Rossi: Staying as Rails as Possible"
description: "Tom Rossi, co-founder of Buzzsprout, explains how a small team hosting 472,000 podcasts stays deliberately close to vanilla Rails — minimizing dependencies, monkey-patching Active Storage for public assets, and adopting ClickHouse — treating framework defaults as a pragmatic business advantage rather than a purity exercise."
resource: "https://podcast.rubyonrails.org/2462975/episodes/19156473-tom-rossi-staying-as-rails-as-possible"
tags: [active-storage, olap, clickhouse, caching, cdn, hotwire, dependencies, payments, multiple-databases, small-teams]
timestamp: "2026-07-17"
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/19156473-tom-rossi-staying-as-rails-as-possible"
  date: 2026-05-15
---

# Tom Rossi: Staying as Rails as Possible

Tom Rossi (co-founder of Buzzsprout, one of several SaaS products under the Higher Pixels umbrella) walks through nearly two decades of building podcast-hosting infrastructure on Rails, and the throughline that every architectural decision defaults to "as vanilla Rails as possible" — not out of purity, but pragmatism.

## Higher Pixels, Buzzsprout, and the Small-Team Setup

- Higher Pixels pivoted from client services (~2001) into building its own SaaS products; the portfolio grew faster than headcount ("more products than people"): a first .NET product later rebuilt in Rails, then Tick (time tracking), Donor Tools (nonprofit donation tracking), and Streamcare (medical)
- Buzzsprout was built in 2008, launched 2009 as a small side product; it exploded as podcasting went mainstream and became the company's flagship
- Scale: ~472,000 podcasts hosted, of which ~125,000 are actively uploading; the single biggest drop-off is podcasters who never publish episode one (the "7-episode hump" was not borne out in their own data)
- Buzzsprout team: 2 SREs, 3 programmers, 2 designers — small relative to competitors who "have hundreds of people" for comparable or smaller footprints; Streamcare runs on a single developer
- Rossi started with Rails pre-1.0 (~2005) after the "Build a Blog" screencast, coming from a .NET shop; the pitch that sold him was Rails addressing exactly the pain points they hit building apps in .NET

## The "As Rails as Possible" Philosophy

- Framework's value is that it holds opinions on things that don't differentiate the business (column types, table naming) so the team can spend its opinions on podcasting
- Early self-inflicted lessons: the first Rails projects where they "wrote configuration" to override defaults are exactly the decisions that "came back and bit them later"
- Following vanilla Rails means new framework capabilities (fragment caching, Hotwire, Solid Cache, multiple databases) can be adopted immediately as they ship, rather than fighting a bespoke stack to integrate them
- Business framing: staying vanilla is a competitive advantage for a deliberately small team — Rails productivity plus AI is described as "a multiplier on top of a multiplier"

## Paperclip → Active Storage: What Broke in Production

- Migrated off Paperclip to Active Storage as soon as it hit general release (not on edge) — reflexively following Rails' opinion; in hindsight "the wrong move" because Active Storage was designed for a different domain model
- Active Storage assumes Basecamp-style **private, authenticated** assets served through the app; Buzzsprout's assets (episode artwork, MP3s in RSS feeds) are overwhelmingly **public**
- Deploy took the site down: with Paperclip, public asset links pointed directly at the asset URL and never touched the Rails server; with Active Storage, every asset URL routed through Rails. Every RSS feed carries hundreds of links (artwork, MP3s per episode), so request volume grew exponentially and the servers had no capacity to serve it. This happened before they had an SRE, so a team of "just Rails coders" rolled it out, watched it crash, rolled back, redeployed, crashed again — the vendor diagnosed the exponential request growth
- **First monkey patch:** override Active Storage to link directly to the asset for public assets (in RSS feeds and a few other places), restoring the bypass-the-server behavior
- **Second wave — CDN:** once traffic justified a CDN, they had to monkey-patch Active Storage to emit CDN links rather than redirect to S3; Active Storage's built-in CDN "support" downloads the asset onto the web server so it can be cached, which is backwards for their needs — getting Active Storage to cache properly at the CDN is their next big push
- **Migration mechanics:** with millions of assets, they duplicated everything into a new bucket so Paperclip and Active Storage could run in parallel, then ran console "true-up" scripts to reconcile assets created/deleted between runs; it was effectively all-or-nothing (not a phased 10%-of-customers rollout) and was broken for a while
- Why the risk was tolerable: most feed traffic is machines (feed readers, Apple ingestion), not logged-in users staring at a screen — "more wiggle room" than migrating confidential HR or tax data

## Contributing Back: The "Immediate Variants" PR

- Higher Pixels are Rails Foundation members; they support the ecosystem because everything they build sits on top of Rails, and have recently started trying to contribute upstream ("you have to put a different brain in your head" — thinking meta about framework code is very different from app code)
- First merged Rails PR was in Active Storage and took about a year to land
- Problem it solves: when episode artwork is uploaded they resize it to 2–3 variants; the default behavior scheduled a background job to create variants lazily. But the moment artwork is uploaded it's requested thousands of times (feed readers polling for new episodes), and each of those requests triggered the variant-creation job — a thundering herd
- The PR ("immediate variants") creates the variants synchronously on upload, before the asset begins serving, so the variants are ready before the flood of requests arrives — pushing their long-standing monkey patch upstream in the spirit of how 37signals gives back

## Audio Processing and Direct Uploads

- Audio tooling predates Active Storage and remains custom: uploads of any format are post-processed with FFmpeg into MP3 using industry-standard settings so non-technical podcasters don't have to understand formats
- Origin lesson: within Buzzsprout's first weeks a user uploaded a 600 MB WAV for a 30-minute episode, exhausting disk space — proof they'd reached a non-geek audience and needed robust post-processing
- Direct upload is the one Active Storage feature Rossi praises unreservedly: large files upload straight to S3 and only become an S3 key the app processes afterward, eliminating the old fight with Apache/Nginx upload-size limits and the manual "upload then move it ourselves" transport dance
- Remaining direct-upload friction is attributed to Amazon, not Rails: non-US podcasters hit latency depending on bucket location

## Minimizing Dependencies and Payment-Vendor Independence

- Deliberately few gems; asked which they'd install on a fresh project, the main answer was VCR (record/replay of external API interactions for tests)
- Guiding principle: don't be beholden to a vendor for anything mission-critical, and be able to switch. Gems that die burn you — an FFmpeg wrapper gem lost support, prompting a move to calling FFmpeg themselves
- Payments: they use the Stripe gem to talk to Stripe but wrote their own subscription/billing logic (declines, reprocessing) — this predates Stripe's existence (they launched on Authorize.net) and predates Active Merchant
- Coupling contrast between codebases: **Buzzsprout** (2008/2009) has Stripe-specific columns (`stripe_id`) scattered through the schema — swapping processors "would be painful." **Donor Tools** (2015) isolated processor columns into a **delegated-type table**, making merchant swaps easy — validated when WePay (chosen specifically to avoid Stripe) was bought by Chase and shut down, forcing a migration to Stripe that the abstraction made straightforward
- Advice framing: think not just about swapping vendors but adding them (ACH, PayPal for markets without credit cards); real payment coupling gets "really complicated when you become really reliant on taking money"

## ETags and Serving Machine Traffic Cheaply

- RSS feeds are hammered by feed readers and Apple's ingestion (a single feed hit thousands of times per hour despite rarely changing) — pure polling that doesn't respect conditional requests re-downloads and re-parses the whole feed each time
- Rails' out-of-the-box ETag / conditional-GET support was a ~2-line change: after deploying ETags they immediately saw feed readers receiving 304 Not Modified and hitting the CDN instead of the origin, cutting bandwidth costs sharply
- "I'm not a genius for doing that — it just came with Rails. If you stick with vanilla, you get this business benefit"
- Caveat: Apple runs two ingestion engines, one of which respects the ETag and one that doesn't; a competitor product that omits ETags entirely forces consumers to refetch every episode to detect any change

## Analytics at Scale: From Summary Tables to ClickHouse (OLAP)

- Stats evolution: from 2009 a single incremental download count per episode; from 2014 advanced analytics deriving location, player app (Apple Podcasts, Spotify), etc. from IP and user agent — requiring every play event to be stored
- Podcast analytics are uniquely unforgiving: unlike server metrics, old data never goes "cold" — podcasters expect exact 2015 download numbers to stay instantly queryable forever, so the ever-growing table must stay fresh and fast
- First solution was **hourly summary tables** (episodes by date, by location, by user agent); it worked until the summary tables themselves grew unbounded and the summarization job — which runs every hour — began taking close to an hour to complete
- Kubernetes and more CPU (adopted 2020 during the pandemic surge) bought horizontal headroom but not a real fix; the answer was recognizing this as an **OLAP** problem, with ClickHouse as the chosen engine
- **Pipeline:** raw play data from logs is processed in Ruby (bot filtering, deduping repeat requests from the same IP within a window) and written to the relational DB; an hourly job then bulk-inserts ~50,000 rows/hour into ClickHouse. They deliberately avoided a Kafka streaming pipeline for now because the simple batch insert works, though Kafka remains a possible future step
- The summarizer still runs in parallel for a few remaining queries; full cutover to ClickHouse is scheduled for the next 6-week cycle
- Rails made multiple databases nearly free — "2 lines of configuration" (credited to Shopify's upstream work) — and it "feels natural" to pull ActiveRecord objects from an OLAP second database
- Mental shift required: OLAP inverts relational instincts — instead of normalizing and joining, you **denormalize into one big wide table** (user agent and derived podcast-app column side by side; location ID alongside city/state/country) and rewrite all queries for column-oriented aggregation; this enables queries that were never performant against summary tables

## Hotwire, Caching, and Staying Deliberately Small

- Hotwire let a web-first team ship the iOS Buzzsprout app in ~6 months and the Android app in ~3 months, reusing existing design work; the apps feel native where needed via Stimulus while sharing the Rails backend
- Payments are deliberately excluded from the mobile apps ("companion app" model) to sidestep Apple/Google in-app-purchase cuts; approval was contested at launch despite prior approvals, and they've avoided adding payment features since to stay safe
- Solid Cache plus fragment caching means very little cache "ejection" — much content is served straight from cache, another capability adopted for free by staying current with Rails
- Guiding maxim "don't solve problems you don't have" (attributed to DHH/Jason Fried) — the 2020 surge forced them into exactly the scaling problems they'd previously deferred
- Build-vs-buy ethos: keep mission-critical capabilities (subscriptions) in-house to avoid vendor lock-in, but "you can always build it later" — a new SaaS today should use Stripe subscriptions and bring billing in-house only once it matters. Their AI features (auto-generating titles, descriptions, chapter markers, social posts, blog drafts from uploaded audio) started with a third-party vendor, then were brought in-house for control, quality, and lower pricing
- Downside of staying small: hard to match Basecamp-style around-the-clock support in-region without spreading staff across time zones — and an excellent support team is itself "a massive feature with no code involved"
- Most-recommended reading: Sandi Metz's *Practical Object-Oriented Design in Ruby* (POODR) and her talks, plus everything from 37signals / Rework
