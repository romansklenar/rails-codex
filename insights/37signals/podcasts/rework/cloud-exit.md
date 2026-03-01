---
title: Cloud Exit
description: "37signals' migration from cloud to owned hardware: rationale, process, outcomes, cost savings, ops culture, Linux transition, and vendor independence philosophy"
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast
tags:
- infrastructure
- cloud
- on-prem
- costs
- linux
- ops
---

# Cloud Exit

## Why They Left the Cloud

- Cloud spend reached ~$3.2M/year (~$38,000/week) for a highly optimized bill — unoptimized would have been $6–10M+
- For HEY alone, just database + search infrastructure cost $600,000/year on AWS
- Cloud never delivered on its core promise: operations team size stayed at ~10 people whether running on cloud or own hardware
- Predictable, stable load (no Black Friday-style spikes) makes cloud economics worse, not better — burst capacity is the cloud's main advantage
- AWS support at $275–300K/month spend: slow ticket responses, impersonal; on-prem data center provider (Deft, 10–12 year relationship): phone answered immediately
- Mandatory AWS upgrade treadmill (Kubernetes clusters, DB clusters) consumed significant ops team time on someone else's schedule
- Monthly cloud spend reports took multiple days to produce; constant vigilance required to prevent cost blowouts
- Cloud created false sense of security — security, resilience, and networking knowledge still required regardless
- Philosophical driver: concentration of internet infrastructure in a handful of hyperscalers is antithetical to the internet's decentralized design; US-East-1 outages take down half the internet
- Jeff Bezos held a minority stake in 37signals — they had maximum negotiating leverage with AWS and still couldn't make the math work
- Startup cloud pitch works at two extremes only: zero-to-one (no ops team needed) and massive spike businesses (Shopify-style); everything in the middle is overpaying
- Variable cloud costs sneak up invisibly: a monitoring vendor grew from ~$40K to $88K/year unnoticed through overages; a runaway query can generate a $50,000 invoice overnight
- DHH's framing: cloud costs that feel disproportionate are literally disgusting — "a sausage that fell on the ground and has hair on it"; disgust as a useful motivational heuristic for cost audits
- Cloud exit was partly aesthetic, not just financial: waste in vendor-locked spend offended a sensibility for clean, well-run systems independent of investor pressure

→ Episodes: leaving-the-cloud, leaving-the-cloud-part-2, leaving-the-cloud-the-finale, spending-in-the-clouds, its-time-to-care-about-costs

## Hardware Economics

- 12 TB of NVMe storage purchased for $3,000 — the same capacity would have cost tens of thousands just 7–8 years earlier
- Hardware costs have dropped orders of magnitude; AWS rental prices have not followed
- Two pallets of Dell servers (half-million dollar order) delivered to two data centers — 37signals never touched them; Deft's on-site staff unpacked, racked, cabled, and connected everything
- 8 racks across 2 data centers (4 per site: Ashburn, VA and near Chicago, IL); power, bandwidth, and physical space rented — hardware owned
- New machines: 192 threads per machine, dual CPUs — enough to run multiple services per physical host via KVM VM slicing
- Servers purchased for Basecamp 3 launch (~6 years prior to the migration) were still running fine and fully depreciated — zero ongoing rental cost
- Fixed capacity = no surprise bills; a runaway query cannot generate a $50,000 invoice the way it can in the cloud
- Reserved instances on AWS gave 40–50% discount but still required year-long prepayment contracts; exiting before contract expiry means paying for unused capacity
- Data center co-location in Ashburn, VA is physically ~0.5 miles from AWS US-East-1 — direct fiber connection with sub-millisecond latency enabled hybrid/bridged migration approach
- Framework laptop (repairable, upgradeable down to CPU and motherboard) as hardware philosophy applied to developer workstations: own hardware you can service rather than soldered-down rentals that require vendor permission to fix

→ Episodes: leaving-the-cloud, leaving-the-cloud-part-2, leaving-the-cloud-the-finale, for-the-love-of-linux

## Cloud Cost Optimization (Before Exit)

- Systems administrator Blake Stoddard audited bills line-by-line and saved $500–700K off a ~$3M annual bill; another $200K+ in pending savings
- Legacy app suite (Basecamp Classic, Backpack, Campfire, Tadalist, Highrise): spending $550K/year, cut to ~$250K via right-sizing + reserved instances — $300K saved
- Right-sizing method: analyzed 3 years of traffic decline on legacy apps, reduced instance specs to match actual load
- Cross-region S3 replication monitoring (CloudFormation stack): $13,000/month discovered line-by-line, rewritten in a week, reduced to $15/month
- Google Stackdriver metrics bill: $10,000/month traced to a misconfigured Elasticsearch pod sending thousands of metrics per minute — removed
- AWS bills ran 40+ pages, dense with acronyms and vague SKU descriptions; required a data team script to bucket costs before human review
- Monthly cloud spend reports: 2+ days of work per cycle between bill collection, automated bucketing, manual line review, and company-wide posting
- Even after all optimization levers (reserved instances, private S3 pricing, enterprise agreements, Jeff Bezos ownership leverage): bill was $3.2M — "top 1–5% most optimized" cloud bill
- Total ops cost for cloud was still ~5x the equivalent on-prem bill for the same workloads
- DHH reviews the monthly books with the CFO line-by-line; multiplies monthly SaaS costs by 12 to see annual impact, then by 3 for 3-year TCO — the multiplication exercise converts small numbers into meaningful sums

→ Episodes: spending-in-the-clouds, leaving-the-cloud, leaving-the-cloud-part-2, its-time-to-care-about-costs

## Migration Process

- Original plan: use a third-party vendor + Kubernetes self-managed — scrapped when vendor pricing was sized for banks and governments, not an 80-person company
- Pivoted to: basic Docker containers + KVM for VM slicing on bare metal + Kamal (new in-house deployment tool built on Capistrano principles) for zero-downtime deploys
- Rejected Kubernetes self-managed: too many moving parts, upgrade complexity, and risk of being stranded in a failure state — wrong technology tier for a company of 80
- Criticality ladder: always start with the lowest-criticality app first, learn and hone the process, then ascend
  - Tadalist (2005, free, ~1,000 users/week, no new signups for 12+ years) → Writeboard → Backpack → Campfire → Basecamp Classic → HEY
- Tadalist went first into the cloud and first back out — used as the canary in both directions
- HEY moved in 4–6 discrete steps (caching servers → some DB servers → job queues → remaining DB → mail routing); rolled back several times mid-move to fix issues before re-attempting
- Geographic proximity (Ashburn facility 0.5 miles / <1ms from AWS US-East-1) allowed bridged partial moves — DB queries routed cross-facility without latency penalty during transition
- Peak parallelism: 3 apps in simultaneous migration, each with dedicated sub-team
- Full ops team + most of SRE team pointed at the same goal simultaneously — unusual for 37signals, credited as key to speed
- Three new ops hires at end of prior year hit their 3-month mark just as migration intensified, providing incremental additional capacity
- Migration of 7 major applications (6 heritage + HEY) completed in 6 months vs. the multi-year expectation; cloud → on-prem took 2–3x less time than on-prem → cloud had taken
- Basecamp 4 migration to Kamal was still in progress post-cloud-exit (the largest app, expected to take 2–3 ops cycles); split into two workstreams: app preparation + infrastructure provisioning

→ Episodes: leaving-the-cloud-part-2, leaving-the-cloud-the-finale, listener-questions-ops-edition

## Tooling Built

- **Kamal**: open-source deploy tool built by 37signals; wraps Docker for zero-downtime deploys to own hardware; successor to Capistrano for the container era; no vendor lock-in
- **KVM**: used to slice high-core-count machines (192 threads) into per-service VMs — necessary because new hardware is powerful enough to host multiple services per box
- **Docker**: containers provide portability and consistent packaging; simpler operational model than Kubernetes for a team of 10
- **Chef**: configuration management / automation tool used across the ops team; automation compensates for a deliberately small team headcount
- Backups: per-database backup servers in-rack + cold storage shipped to AWS S3 as off-site copy; out-of-band (IPMI) access to all servers and network gear for remote intervention
- Deft (data center partner, 14+ year relationship): handles all physical operations — unpacking, racking, cabling; 37signals never physically visits the data centers
- **BGP Anycast**: network routing technology routing user traffic to the nearest data center; in use for Basecamp for 10+ years; being extended to HEY and the Amsterdam outpost

→ Episodes: leaving-the-cloud-part-2, leaving-the-cloud-the-finale, listener-questions-ops-edition

## Network Architecture & Resilience

- Two primary data centers: Chicago (original) + Ashburn, VA — site selection driven by DHH's "if Chicago gets hit by an asteroid, Virginia must survive" mandate; far enough for disaster independence, close enough for low-latency DB sync
- All flagship apps (Basecamp versions, HEY) run active in both data centers; Basecamp runs active-active: one site is the write primary, the other is a read replica; traffic failover tested regularly — not just a DR plan on paper
- BGP Anycast routes reads to the nearest data center automatically; DHH (in North Carolina) reads from Virginia, writes go to Chicago
- Amsterdam "outpost": a third, smaller read-only site for HEY European customers; not a full failover target — purpose is latency reduction for European reads; next planned expansion: Japan outpost for Pacific customers
- On-call rotation structured as a "follow the sun" model: Team Americas, Team Atlantic (Europe), Team Pacific cover overlapping windows so the primary on-call engineer is not paged during sleep hours Mon–Fri; weekends: primary on-call is solo but has 24h coverage from regional teams during business hours
- DDoS incident handled in 2024; resulted in delayed Amsterdam launch but led to improved defenses
- Ops team size at post-cloud-exit: 11 people (including director) across three regional teams — still considered lean relative to the infrastructure and customer base managed

→ Episodes: listener-questions-ops-edition, leaving-the-cloud-part-2

## Outcomes & Lessons

- Projected savings: $7M over 5 years (napkin math comparing cloud vs. on-prem total cost)
- On-prem monthly bill for running Basecamp (their largest app) is roughly one-fifth of what the equivalent cloud bill was — and migration is expected to raise that by only 50–75%, still dramatically cheaper
- Operations team count: unchanged at ~10 — the cloud did not reduce headcount and exiting the cloud did not require adding headcount
- Work eliminated by exiting: monthly cloud spend reporting (2+ days/cycle), AWS upgrade treadmill (Kubernetes + DB cluster mandatory upgrades), reactive cost-spike firefighting
- Remaining cloud footprint post-migration: 8 petabytes in AWS S3 (file storage); planned exit in 2025 — a major standalone project given data volume; still being worked on 2+ years after the initial exit
- Some search/logging infrastructure (Amazon OpenSearch) still in cloud at time of finale episode; targeted for migration within ~6 weeks
- Psychological lock-in is as real as technical lock-in: teams who started in the cloud lack mental models for on-prem and treat it as exotic/dangerous; it is neither
- Cloud's actual model: "someone else's computers + someone else's ops staff" — you can simply buy both instead of renting both once you reach whole-unit quantities
- Hyperscalers employ thousands of people doing the same manual ops work as any on-prem team; the automation narrative is marketing
- The cloud is correct for: (1) pre-ops-team startups using fully managed platforms (Heroku, Render), (2) businesses with 50–100x traffic spikes (Shopify/Black Friday); everyone else should run the math
- Key prerequisite 37signals had: never fully abandoned on-prem (Basecamp 4 never moved to cloud) — ops muscle memory and tooling stayed intact; organizations that went all-in on cloud face a steeper re-entry
- Alternative on-ramp for others: lease dedicated servers from Hetzner (Germany), Digital Ocean, or OVH before committing to hardware purchase; co-locate a few owned boxes next to leased capacity
- Post-cloud ops team runs in six-week cycles like the rest of the company; projects that span multiple cycles are declared upfront rather than forced into artificial scope — e.g. Basecamp 4 → Kamal expected to take 2–3 cycles

→ Episodes: leaving-the-cloud, leaving-the-cloud-part-2, leaving-the-cloud-the-finale, spending-in-the-clouds, listener-questions-ops-edition

## Incident Response & Ops Culture

- Baseline uptime for Basecamp 3 before the 2018 Big Integer outage: 99.998% — ops team handled incidents with minimal drama because calm was the default mode, not crisis mode
- Big Integer outage (November 2018): events table hit the 32-bit integer ceiling (2,147,483,647 rows) — app went read-only for ~5 hours; diagnosed in 8 minutes, fix took 3+ hours to execute; known risk that had not been fully mitigated
- Incident command structure: one person owns investigation, one owns alerting, one owns status site updates, one keeps support informed — explicitly divided roles prevent duplicate work and dropped balls
- DHH's rule during outages: no blame-seeking questions mid-crisis; "how did this happen" conversations wait until after resolution; mistakes trace to system design, not individuals
- Support fielded 1,800 emails during 5-hour Big Integer outage (normal weekly volume); customer response was overwhelmingly supportive — trust built over years of fast human responses absorbed the shock
- Token strategy: if you reach for the "this is catastrophic" token publicly, customers reach for the "actually it's okay" token; capitulate completely and early
- Three-outage cluster (August 2020): a novel networking bug cascaded into two further bugs across three incidents in a week; cause was partly slow-growing usage on Basecamp during HEY launch period going unmonitored
- Credential stuffing attack: ops + SIP team used old-school UNIX tools (sed, awk, grep, join) to parse billions of leaked credential records; matched against hashed Basecamp passwords; reset ~5% of accounts proactively
- Public post-mortems published on Signal v. Noise after outages — written for the affected customer, not as a defensive technical brief; transparency only has value if followed by demonstrated change
- Director of ops Troy Toman: outages are as stressful now as in his first years — experience helps with process but not with emotional weight; tools he uses: therapy, meditation, self-compassion practice
- Ops team deliberately avoids hero culture during incidents: breaks are mandated, sustainable pace enforced even during 3-hour wait windows; overtime is the exception for genuine crises, not the norm
- Kamal migration and other multi-cycle projects are worked on continuously; on-call engineer pauses project work for their rotation week so the rest of the team can keep project focus

→ Episodes: big-integer, somethings-broken, did-you-order-the-code-red, leaving-the-cloud-the-finale, listener-questions-ops-edition

## Linux & Hardware Choices

- DHH left Apple's ecosystem in 2024 after 23 years — trigger: Apple's attempt to kill EU web apps in a fight with EU regulators over their App Store monopoly
- Core argument: Apple in 2024 is a bigger developer bully than Microsoft ever was in the 1990s; Microsoft never required permission to publish software for Windows; Apple requires it for every update to iOS apps
- Pattern recognized: DHH switched to Apple in 2001 when Apple was the underdog rebel against Microsoft's dominance; by 2024 the positions had reversed — Apple is now the monopolist, Microsoft is the relatively developer-friendly partner
- Framework laptop chosen for the transition: modular, repairable, user-serviceable down to CPU/motherboard; contrast with Apple M-series where RAM is soldered, battery is non-replaceable, every repair goes through Apple at premium cost
- Framework DIY kit takes under 10 minutes to assemble but triggers the IKEA effect — you like it more because you built it
- Linux tested first on Windows (via WSL), then natively: Framework running Linux was ~15% faster than Windows on DHH's benchmarks; Ubuntu chosen as the base for Omakub/Omarchy
- TextMate (DHH's 20-year editor, which he co-created with Alan) was the hardest thing to leave; VS Code served as the bridge — "huh, I could do this"
- Company transition: Linux as default for all new developers and operators; Windows for product/design roles who need the Windows user perspective; Apple for iOS developers and designers who require Apple tooling; ~50% of Basecamp users are on Windows — no one at 37signals was running Windows day-to-day, so product issues were invisible
- **Omakub** (Ubuntu-based): opinionated Linux setup DHH built after 2 months of configuration; designed so new developers get a polished environment without the usual Linux setup pain; shipped publicly, not just internally
- **Omarchy** (Arch-based): the evolved version; 37signals moving all developer workstations to it; more advanced than Omakub, targeted at developers comfortable with Arch
- Machine management tooling: Kandji (previously used for Macs) replaced with cross-platform alternatives for Windows and Linux; Docker + containers standardize the development environment across all three platforms

→ Episodes: for-the-love-of-linux, moving-to-omarchy, this-again-apple

## Vendor Independence Philosophy

- Apple App Store battles (2020, 2024): both times, a clear contractual carve-out (free companion apps, rule 3.1.3F) was simply ignored by Apple in favor of a "rule we made up in our heads"; the written guidelines do not govern what gets approved — the process is capricious
- 85% of HEY customers are on Apple devices — walking away is not an option; being loud and obnoxious as the only leverage small makers have against trillion-dollar platforms
- ONCE products designed to route around App Store: Progressive Web Apps (PWA) ship without going through Apple's review process; self-hosted by the customer, GDPR-compliant push notifications without routing data through 37signals servers
- DHH's parallel: web-first strategy in 2003 was chosen precisely to avoid needing any platform's permission; the same logic resurfaces with PWAs and Linux
- Open source contribution philosophy (RailsConf 2019 keynote): Rails downloaded 170M+ times; zero dollars received from companies worth billions that built on it; DHH's position is that this is fine — open source software has no marginal cost, so "freeloaders are free"; no tragedy of the commons applies when the resource cannot be over-grazed
- Contribution model for Rails: motivated by craft, by community, by the desire to shape the tools you use — not by debt obligations or market returns; the MIT license is chosen to maximize freedom, not to extract contributions
- Independence as a business principle: being profitable means you never have to ask anyone for permission — not investors, not platform gatekeepers, not cloud vendors; every dependency on an external service is a potential point of control others can exercise over you
- VCs train companies to spend, not to make; bootstrap companies that play with their own money develop visceral cost sensitivity that persists through downturns; VC-funded spending habits are incompatible with long-term infrastructure independence

→ Episodes: this-again-apple, for-the-love-of-linux, open-source-beyond-the-market, its-time-to-care-about-costs, leaving-the-cloud
