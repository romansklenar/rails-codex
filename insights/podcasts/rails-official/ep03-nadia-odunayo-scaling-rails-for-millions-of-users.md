---
type: insight
title: "Nadia Odunayo: Scaling Rails for Millions of Users as a Solo Dev"
description: "How Nadia Odunayo built and scaled The StoryGraph — a Goodreads alternative with 4M+ registered users and 1M+ daily unique visitors — entirely solo on Rails, covering the PWA failure, Turbo Native adoption, in-app purchase complexity, the Heroku exit, the YugabyteDB migration, and the philosophy of deliberate solo operation."
resource: "https://podcast.rubyonrails.org/2462975/episodes/17575580-nadia-odunayo-scaling-rails-for-millions-of-users-as-a-solo-dev"
tags: [scaling, solo-developer, turbo-native, database, background-jobs, mobile, infrastructure, yugabytedb, in-app-purchases, performance]
timestamp: "2026-03-02"
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/17575580-nadia-odunayo-scaling-rails-for-millions-of-users-as-a-solo-dev"
  date: 2025-07-28
---

# Nadia Odunayo: Scaling Rails for Millions of Users as a Solo Dev

One developer built The StoryGraph — a Goodreads alternative with over four million registered users — entirely on Rails, validating the framework's "one-person framework" claim at serious production scale.

## Origin Story: From PPE Degree to Solo Rails Developer

- Nadia's undergraduate degree was in philosophy, politics, and economics (Oxford) — no CS background whatsoever
- First exposure to code came through a free program called **Code First Girls**, run by startup accelerator Entrepreneur First in London; the curriculum covered CSS, HTML, and Ruby
- Won a competition on Twitter for a free place at a 12-week software boot camp (worth £8,000 at the time); the advertisement mentioned Ruby on Rails
- Nearly didn't go: she had a mental model that to be a "real" developer you had to have started coding at age three — she was 21 and thought it was too late
- The motivating insight: she had been running an e-publication called Storyraph at university and felt "so restricted" waiting on a WordPress developer friend to make changes; learning to code meant removing that dependency
- Boot camp ran September–December 2013; Rails was the curriculum — she has used it for everything web-related since
- After the boot camp, worked at **Pivotal** (the consultancy) for a year and a half; did some Swift on side projects and worked on **Cloud Foundry** (Ruby and Go), but web development was always Rails
- The name "StoryGraph" was recycled: the original Storyraph e-publication had been formally incorporated (won grants and awards); when her mother advised keeping the dormant company alive, the name became available to repurpose for the app — originally called "Read Lists" before expanding scope

## Starting the StoryGraph and the Rails Ecosystem Advantage

- Coding on the StoryGraph codebase began in earnest in **2019** — started as a side project for customer research, Rails was the obvious tool to get something out quickly
- Key gems from day one: **Devise** (authentication out of the box), **Sidekiq** (background jobs) — "there are so many tools that I use that are open source, it's just incredible"
- **Heroku** was critical in year one: as a solo developer she didn't need to hire a DevOps person; Rails developers already knew Heroku well; it removed all infrastructure decisions from her plate
- On Heroku's $50/month database tier in early beta, hitting performance walls; community member Andy Croll (via her newsletter) pointed out that with her write volume the $50 plan would never be sufficient — "sometimes throwing money at it is actually the solution"; upgraded to the $200 plan and the problem vanished
- The company is **100% bootstrapped** and profitable — no outside funding

## The PWA Failure and Why It Was Inevitable

- The StoryGraph pushed a **Progressive Web App** strategy for an extended period before eventually giving up — Rob (co-founder) was its biggest proponent and would paste a canned response every time someone on Twitter complained the app wasn't in the App Store: "we do, it's a PWA, XYZ"
- The fundamental problem: "as long as people have gone to a website and saved it as a bookmark, even though it fundamentally behaved as an app in most ways, people psychologically, if they didn't get it from the App Store or the Play Store, it's not a real app. It's a website bookmark."
- They were following the Epic Games vs. Apple discourse and hoping regulatory pressure would shift the ecosystem toward PWAs — it didn't
- Pre-app store: many users wrote in saying "it's not available in my country" — they had gone straight to the App Store or Play Store and found nothing; anecdotally, people in conversation would immediately open the App Store and ask "what's it called?" the moment they heard about it
- PWA discoverability has no equivalent to app store rankings; there is no list of "top five web apps" the way there is a ranked charts page in the App Store

## Turbo Native: The Decision That Made Solo Mobile Possible

- The push to actually try [Turbo Native](../../blogs/37signals/turbo-mobile.md) came from **Rob**, not Nadia — he was the one managing the PWA social media responses and did the research one night; spun up a demo Android app and pitched her: "I know this is still in beta but look — I, who am not a developer, was able to spin up the demo app. Imagine what you could do with this."
- Nadia was nervous; the confidence signal was that **Hey** was already built on it — "if Hey is built on this thing even though it's in beta, surely it's going to stick around. Let's go for it."
- Adopted Turbo Native **while it was still in beta**
- Result: she runs the website, iOS app, and Android app as a single developer — "that is the thing that means that I am running a website, an iOS app and an Android app"
- No API layer was ever built — "we immediately went to just using the web as basically having a hybrid app"; the web view-backed model meant no separate mobile codebase
- Most feature deployments are web deployments — when she pushes to the server, all three platforms get the update simultaneously; users sometimes ask "will we get this on Android?" not realising it's already there
- She now owns three phones (iPhone as personal device, plus Android devices) — eventually bought a physical Android device because she couldn't keep relying on the simulator
- If Turbo hadn't existed, she had considered: (a) learning Swift herself (she had already started and was interested in becoming an independent iOS developer), (b) RubyMotion (cross-platform iOS/Android in Ruby)
- Still on Rails 7; hasn't moved to Rails 8 yet; doesn't feel she's getting the most out of Turbo Native — hasn't started using **Strada** yet; has bookmarked Hotwire articles on features like real-time collaborative chat but hasn't had time to implement them

## In-App Purchases: The Hardest Technical Problem

- In-app purchase implementation took **six weeks of focused work** — the longest Nadia had gone without shipping anything; she was genuinely worried users would think "StoryGraph is dead"
- Users' reaction was the opposite: "Oh, they must be working on something very exciting because that's the only reason why they'd be quiet for so long" — attributed to the trust built by consistent transparency
- The core technical challenge: **authentication is server-side but purchases are device-based** — reconciling a purchase token (lives on device, issued by Apple/Google) with a user account in the Rails app
- Email-based matching doesn't work: people's Apple ID / Google account email addresses are frequently different from the email they used to sign up on StoryGraph
- Solution required: passing user IDs back and forth in webhooks and callbacks between native code and the web server; going through Apple and Google documentation for all the different message types; wiring them together to connect device purchase tokens to Rails user records
- No resources existed online for doing this with Turbo Native in beta — "the first time where I couldn't find anything online about anybody doing this"
- Got help from **Joe Maselotti** (Turbo Native expert) via Twitter DMs; he didn't know who she was at the time; they're now friends; later engaged him more formally to audit the app and advise on making it feel indistinguishable from a native app
- Also couldn't get the **JavaScript bridge** working initially and reached out to Joe on that too

## Platform Differences: Apple vs. Google Subscription Management

- Apple: **no API to cancel a user subscription** as a developer — "there's no API, there's nothing I can do"; when users write in wanting to cancel an Apple subscription, they have to be redirected to the App Store
- Google: can cancel and do partial refunds via API, but cannot extend a user's billing date
- Apple: can extend a billing date, but it's extremely manual — requires generating a key, producing a token, and making raw `curl` requests from the command line; "Apple is very technical in terms of management. There's no nice dashboard."
- Google: has a dashboard but it only supports cancel and refund; cannot search by purchase token — Nadia stores the purchase token in her Rails database but cannot use it to look up a subscription in the Google Play Console; can only search by email or order ID; has to copy the purchase token manually to cross-reference
- **Cloudflare bot protection incident**: when StoryGraph was DDoS'd and Cloudflare bot protection was enabled, it accidentally blocked Apple and Google webhook callbacks — resulted in a batch of subscriptions without associated users; Stripe retried automatically and reconciled itself; Apple/Google IAP did not, requiring manual reconciliation as affected users wrote in
- Gifting subscriptions: gifting was intentionally left on **Stripe** (not in-app purchases) to avoid dealing with multiple product types in the IAP system; this caused a Google Play violation years later because the app contained a link to redeem a gift subscription — Google detected the external payment link; the same link had previously been hidden from the iOS app after an Apple violation, meaning it had been Apple-compliant for years before Google noticed

## Why In-App Purchases Are Worth Keeping Despite the Complexity

- Apple Pay and Google Pay handle **currency conversion automatically** — no need to maintain separate price points per country
- **PayPal comes built in** with in-app purchases (via Apple/Google wallet support) — this resolved a major user request; StoryGraph had significant demand for PayPal from global users who don't primarily use credit cards; iDEAL (Netherlands) is possible via Stripe but PayPal was the bigger ask
- With paying customers already on Apple/Google subscriptions, migrating them to Stripe is essentially impossible — payment tokens can't be transferred; prompting users to re-enter payment details creates a churn moment
- Strategy going forward: use the lowest common denominator of what's acceptable on both platforms rather than optimising separately for each; Apple's loosened policies on external payment links don't change the practical calculus much when Google still enforces the old rules
- Stripe is "a couple major versions behind" and needs upgrading — doing so requires careful review of breaking changes to avoid breaking subscription flows; Stripe's retry/callback system is robust (self-healed during the Cloudflare incident) but IAP webhooks are not

## Scale: The Numbers

- 4 million+ **registered users** (up from 2 million at the time of her Rails World 2024 talk)
- Approximately one-third are **monthly active users** — "a very healthy active rate"; uses monthly active rather than daily because the average user reads one book a month
- **60% of users are on mobile apps** (iOS + Android combined); Android leads — makes sense for a global app since Android has higher global market share
- On their busiest days: **over 1 million unique visitors**
- 98–99% of users are on the **free tier**
- Global website rank ~11,000; US rank ~4,000 (from a Simple Icons pull request that referenced Similarweb/similar traffic data)
- Have been **#1 in the App Store in the Books category** in the UK and #2 in the US following press coverage; generally in the top 20; have been featured by Apple for Black History Month multiple times

## Exiting Heroku

- Moved off Heroku before even launching a premium plan — was paying ~**$8,000/month** on one of Heroku's highest plans; deemed unsustainable given the growth trajectory
- The Heroku pricing model (per-dyno) was the constraint alongside database tier limits
- Also hit the ceiling on **Heroku's managed Elasticsearch** — was on the highest available plan and it wasn't sufficient; support was poor; metrics were opaque; eventually moved Elasticsearch off managed services entirely and now self-hosts it on their own hardware

## The Database Scaling Journey: Postgres → YugabyteDB

- **January 1st is always their biggest day** — new year reading resolutions drive massive traffic spikes; everyone wants to start a new reading challenge; it's "like going to the gym"
- Peak problem: the app was effectively down for the first couple of weeks of every January; database was the bottleneck
- Investigation path before YugabyteDB:
  - Query optimisation — "it just wasn't doing enough"
  - Rails built-in **multi-DB setup** — configured it, but couldn't get it working because it requires strict read/write separation at the controller level; Nadia's controller code isn't that clean (e.g., viewing a giveaway page increments a view/impression counter — that's a write on a GET request); refactoring every controller wasn't worth it
  - **Makara** (Ruby gem for database proxy-level read/write splitting) — discovered and tried it, but replication lag was too high; the time window was wide enough that users would notice stale data; abandoned it
- Rob researched alternatives and found **YugabyteDB** — a PostgreSQL-compatible distributed SQL database designed for horizontal scaling
- Key selling point: "you won't really have to change your code because it's like a Postgres adapter and it will enable us to scale horizontally. We can just easily increase and decrease servers based on our load."
- YugabyteDB migration outcome:
  - **January 1st after migration: no crash** — supported 12,000–13,000 concurrent users vs. the previous ~6,000 before crashing; roughly double the capacity; ~1 million operations per second
  - Certain queries were not written for distributed databases and required rewriting
  - Had to convert many queries to use **CTEs (Common Table Expressions)**
  - Needed significantly more **indexes** than Postgres required
  - New bottleneck discovered: **network bandwidth between database servers** — a category of problem that didn't exist on single-node Postgres; required ordering custom server hardware (which took weeks to arrive)
  - Still actively working through performance issues and query optimisation at the time of recording
- Infrastructure approach under time pressure: "let's just throw money at it, we have the money, let's just throw it at it and worry about it next time" — at peak they had ~50 database servers provisioned for January, then cut back sharply; ended up overprovisioned again when day-to-day traffic was higher than the reduced configuration could handle

## Performance Focus and the Feature Freeze

- App reviews increasingly cite slowness: "I love this app, but it's so slow" — Nadia's response was to **freeze new features** and dedicate time exclusively to performance, stability, and maintenance
- Performance work is fundamentally different from feature work: requires deep context and long uninterrupted focus; can't be done in 20–30 minute blocks
- Practical changes: cutting back on meetings (she "rarely takes meetings anyway"), declining podcast interviews (made an exception for this one), protecting calendar blocks for deep coding time
- Biggest self-identified challenge: "wondering whether I'm spending my time well" — the hardest thing about being a solo developer running a business is context management across roles (developer, product manager, support lead, social media manager)

## Project Management and Tooling

- Recently migrated from **Pivotal Tracker** to **Linear** — used Pivotal Tracker because she came from Pivotal the consultancy and it was what she knew; acknowledged it's "a lot for a one person dev team"; a few weeks into Linear at the time of recording and likes it
- Development philosophy: **pain-driven development** — features and fixes get prioritised when enough users complain or when the pain becomes undeniable; bookmarks relevant blog posts (e.g. Hotwire articles) and links them to Linear stories to return to when that pain point arises
- Calendar-driven daily structure: "I live by my calendar and everything is in there"

## The Solo Developer Philosophy

- The solo developer identity is **deliberate and ongoing**, not a temporary phase — "I'm happy for now"
- The "one-woman dev team building a Goodreads alternative" narrative is genuinely valuable for the brand: positions the product against Amazon in a sympathetic way; benefits from anti-big-tech sentiment
- Condition for hiring: "I would never not hire someone if I thought it was to the detriment of the company and the product" — but the bar is: "if I ever get to the point that I feel like I'm at the peak of my productivity and it's still not enough, then I'll seriously look into hiring extra dev support"
- Hired a designer on a consulting basis recently; the onboarding, arrangement-figuring, check-ins, issue-handling, and work review consumed significant time she wasn't accounting for — concrete illustration of the hidden cost of even a single contractor
- Co-founder Rob manages all infrastructure and handles AI/machine learning work; he exposes APIs that Nadia integrates into the Rails app; Nadia is the sole web developer
- Still on **Rails 7** (not 7.2/8); deliberately not chasing the latest version — "it's still fine, it's good"
- Community use: rarely asks for help due to a long-held belief that "this is my business, other people have their work, I just need to get on and do it"; has paired with friends when truly stuck; reached out to Joe Maselotti on Twitter about Turbo Native in-app purchases when she couldn't find any documentation
- Andy Croll is cited as a community friend whose newsletter reply ("That's your problem — you're on the $50 plan") saved her significant optimisation effort early on

## Recommended Reading

- **Ruby Under a Microscope** by Pat Shaughnessy — recommended for peers who want to understand Ruby internals at a deeper level; was the inspiration for Nadia's own "debug series" of conference talks; she and Ceeron Yarak interviewed Shaughnessy on the Ruby Book Club podcast; Shaughnessy's motivation for writing the book was that he didn't know Ruby internals himself and learned by writing it
- **99 Bottles of OOP** — mentioned as a classic for people learning to code
- For beginners: standard classics; for peers: Ruby Under a Microscope specifically
