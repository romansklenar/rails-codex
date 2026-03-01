---
title: Cloud Exit
description: "37signals' migration from cloud to owned hardware: rationale, process, outcomes, and cost savings"
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

→ Episodes: leaving-the-cloud, leaving-the-cloud-part-2, leaving-the-cloud-the-finale, spending-in-the-clouds

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

→ Episodes: leaving-the-cloud, leaving-the-cloud-part-2, leaving-the-cloud-the-finale

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

→ Episodes: spending-in-the-clouds, leaving-the-cloud, leaving-the-cloud-part-2

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

→ Episodes: leaving-the-cloud-part-2, leaving-the-cloud-the-finale

## Tooling Built

- **Kamal**: open-source deploy tool built by 37signals; wraps Docker for zero-downtime deploys to own hardware; successor to Capistrano for the container era; no vendor lock-in
- **KVM**: used to slice high-core-count machines (192 threads) into per-service VMs — necessary because new hardware is powerful enough to host multiple services per box
- **Docker**: containers provide portability and consistent packaging; simpler operational model than Kubernetes for a team of 10
- Backups: per-database backup servers in-rack + cold storage shipped to AWS S3 as off-site copy; out-of-band (IPMI) access to all servers and network gear for remote intervention
- Deft (data center partner, 14+ year relationship): handles all physical operations — unpacking, racking, cabling; 37signals never physically visits the data centers

→ Episodes: leaving-the-cloud-part-2, leaving-the-cloud-the-finale

## Outcomes & Lessons

- Projected savings: $7M over 5 years (napkin math comparing cloud vs. on-prem total cost)
- On-prem monthly bill for running Basecamp (their largest app) is roughly one-fifth of what the equivalent cloud bill was — and migration is expected to raise that by only 50–75%, still dramatically cheaper
- Operations team count: unchanged at ~10 — the cloud did not reduce headcount and exiting the cloud did not require adding headcount
- Work eliminated by exiting: monthly cloud spend reporting (2+ days/cycle), AWS upgrade treadmill (Kubernetes + DB cluster mandatory upgrades), reactive cost-spike firefighting
- Remaining cloud footprint post-migration: 8 petabytes in AWS S3 (file storage); planned exit in 2025 — a major standalone project given data volume
- Some search/logging infrastructure (Amazon OpenSearch) still in cloud at time of finale episode; targeted for migration within ~6 weeks
- Psychological lock-in is as real as technical lock-in: teams who started in the cloud lack mental models for on-prem and treat it as exotic/dangerous; it is neither
- Cloud's actual model: "someone else's computers + someone else's ops staff" — you can simply buy both instead of renting both once you reach whole-unit quantities
- Hyperscalers employ thousands of people doing the same manual ops work as any on-prem team; the automation narrative is marketing
- The cloud is correct for: (1) pre-ops-team startups using fully managed platforms (Heroku, Render), (2) businesses with 50–100x traffic spikes (Shopify/Black Friday); everyone else should run the math
- Key prerequisite 37signals had: never fully abandoned on-prem (Basecamp 4 never moved to cloud) — ops muscle memory and tooling stayed intact; organizations that went all-in on cloud face a steeper re-entry
- Alternative on-ramp for others: lease dedicated servers from Hetzner (Germany), Digital Ocean, or OVH before committing to hardware purchase; co-locate a few owned boxes next to leased capacity

→ Episodes: leaving-the-cloud, leaving-the-cloud-part-2, leaving-the-cloud-the-finale, spending-in-the-clouds
