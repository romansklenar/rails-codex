---
title: Customer & Support
description: "37signals' customer support philosophy: everyone does support, community, and knowing when to let go"
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast
tags:
- customer
- support
- community
---

# Customer & Support

## Support as a Core Practice

- Treat support as a product feature bundled with the software, not a cost center to minimize — "when you buy Basecamp, you buy us"
- Staff for 24-hour coverage using time-zone distribution (US, EU, APAC) rather than overnight shifts or on-call rotations
- Target a first-reply time of ~1 hour for standard requests; under a minute proved counterproductive (customers assumed they were talking to a bot)
- Provide an explicit "emergency" flag in-app so urgent issues surface immediately without abusing the queue
- Use case-study libraries for onboarding: document interactions that went well and ones that didn't, and walk new hires through them case by case in the first weeks
- Hire for good judgment, not just product knowledge — reps must make sound calls independently, without a supervisor on every exchange
- Rotate upset customers to a fresh teammate voice rather than escalating through tiers; a new human voice often resets the dynamic
- Write like you're explaining to a friend or family member, not a tech person — "train the corporate out of them"; strip jargon, avoid boilerplate apology phrases
- Never hide behind automated phone trees, bots, or help-doc links when a human conversation would serve the customer better
- Keep "Fisher Price easy" as the writing standard: short, clean answers beat comprehensive but dense ones

→ Episodes: support-is-a-feature, tales-from-the-front-lines, customer-support

## On-Call / Technical Support as a Career Path

- Create an "on-call" queue for cases that require diving into the codebase — these are separate from standard questions and need back-end investigation
- Let support reps who show curiosity about code self-select into on-call work; the career path grew organically at Basecamp before it was ever formalized
- Use expressive, readable languages (e.g., Ruby) as an entry point for non-engineers — support reps with no CS background can learn to read code well enough to diagnose issues
- Build a team wiki of code scripts for common on-call fixes; document every solved case with detailed notes as if the reader is brand-new, creating a breadcrumb trail for colleagues in other timezones
- Teaching programming via "fix things, not build things" is more useful for support work than conventional "build a Twitter clone" curricula
- Validate potential features through on-call work: solve a recurring customer problem with a manual script, prove demand, then pitch it as a full product feature
- Readable code is a diversity and inclusion issue: when code reads like plain English, people from non-traditional programming backgrounds can contribute to technical support roles
- Pair support reps learning on-call work with a programmer who holds "office hours" — not as dedicated on-call backup, but as an informal knowledge resource

→ Episodes: support-console-ation

## Everyone on the Front Lines

- Every employee — designers, programmers, executives, founders — rotates through customer support (called "EOS," Everyone On Support)
- Direct customer contact removes the "muffler" that a support department creates: you hear the raw frustration, not a filtered summary
- Developers who do support often come away with 20-minute fixes they would never have prioritized through the formal feature-request pipeline
- Being on the front lines reminds each person why the company exists — customers are paying the paycheck, not just the founders
- Start small when implementing this in another company: find one willing person, shadow them the whole first day, then use that experience to train the next person
- Founders doing support is non-negotiable — if Jason or David won't do it, there's no credibility in requiring it of others
- EOS creates a mirror effect: DHH reports becoming embarrassed about his own past behavior as an impatient customer after spending a day answering support tickets
- Watching someone use your product in a demo or support session is more valuable than any usability report — you cringe at what you thought was obvious

- EOS can fail if you set-and-forget it: the support team's obsession with inbox zero left non-support colleagues with nothing to do, generating frustration and resentment
- Fix EOS by giving non-support participants freedom to do their own kind of work — a designer can do a "farm-to-table" product pitch based on customer conversations; a developer can fix the bug they spotted; they don't need to answer emails like a support pro
- For the first two EOS shifts, focus on tool setup and tone — can the person get a customer logged in and write at a human level? After that, let them choose how to contribute
- Track and share EOS outcomes in heartbeat posts: celebrate bugs squashed, pitches generated, and product improvements so the whole company sees the value
- EOS is emergency preparedness training: during a major outage, non-support developers jumped into the support queue and replied to customers without being asked — that's only possible because they had EOS experience
- Write a clear intro guide explaining *why* EOS exists, not just how to do the shifts — people need the "why" to feel that the time is worth it
- The intangible result of EOS: it "infects the company like a merciless empathy virus," aligning everyone around company values of being human, empowered, and responsive

→ Episodes: put-everyone-on-the-front-lines, tales-from-the-front-lines, customer-support, james-glazebrook-support-driven

## Handling Difficult Customers

- The "two tokens" rule: when there's conflict, one party takes "it's no big deal" and the other takes "it's the end of the world" — grab the big-deal token first so the customer can't
- Never recite terms of service back to an angry customer — if you feel compelled to cite policy, that is a signal the policy is wrong, not the customer
- Give customers grace and space: assume they're having a hard day for reasons entirely unrelated to your product
- Pause before replying when your first instinct is defensive — the authentic voice is fine, but not the knee-jerk version of it
- It's acceptable to pass a customer to a teammate if the email has hit you the wrong way before you've even replied; asking for help is a team strength
- Customers who have a problem resolved well rate a company higher than customers who had no problem at all — every support interaction is a marketing moment
- A personal follow-up (small gift, handwritten thank-you card) after a recovery moment creates lifetime brand advocates
- Phone or video calls, not just email, are a legitimate support channel — jump on a Zoom link when a customer needs real-time help

- Tell an irate customer directly: "We're both human — let's treat each other with respect and I'll be your advocate through this" — naming the dynamic often resets it
- Give grace and space to yourself as a support rep, not just to customers: back-to-back empathy-heavy interactions accumulate; step away, take breaks, ask a teammate to cover the next email if you're not in the right headspace
- Record customer calls (with permission) so the product team can listen in without being on the call — a lightweight way to close the gap between support intelligence and product decisions
- Support teams dealing with emotionally intense customer interactions (grief, crisis, stress) should cap back-to-back calls — switching from two-to-three calls with breaks rather than four-to-five in a row preserves the quality of presence each customer receives
- Bring in outside experts (e.g., trauma stewardship specialists) when your support team regularly absorbs significant emotional load from customers — internal leadership alone can't provide all the coping frameworks needed
- Do not incentivize support staff with sales commissions; separate education/service roles from sales roles entirely — the moment commission enters, the relationship dynamic shifts from advocate to salesperson

→ Episodes: tales-from-the-front-lines, customer-support, put-everyone-on-the-front-lines, dose-of-empathy

## Talking Directly to Customers

- Founders should send personal emails to customers from their own addresses, not on behalf of the company — "emailing me is emailing me; no assistant, no AI"
- A single personal email from a founder can surface feature requests that never would have surfaced through aggregate feedback pipelines — e.g., voice notes in Basecamp emerged this way
- Customers use different words for your features than you do; direct conversation is the only way to discover the gap between your language and theirs
- Sometimes customers request features you already have — direct conversation closes that knowledge gap instantly; no other channel does
- Customer-to-founder connection is harder to cancel than a software subscription; people will give more grace to a product when they trust the person behind it
- Email is now a high-effort channel, which is a signal: the people who write are serious enough that every one deserves a response
- Founders can also initiate: scan recent orders for recognizable names and reach out proactively — the relationship formed before the product arrives makes the product taste better
- A personal reply to a complaint — even one that doesn't grant the request — that includes an authentic apology and a change in process converts a detractor into an advocate

→ Episodes: talk-directly-to-your-customers, support-is-a-feature

## Building a Customer Community

- The Basecamp Community lives inside Basecamp itself, seeded with real content (tips, guidelines, example posts, fake-user intro templates) before any member was invited — don't launch an empty room
- Start with 8–10 hand-picked "beta" members who will set the tone; roughly half of them will still be the most active contributors years later
- Treat the community host role like event hosting: invite people in, offer something to engage with, but step back and let members answer each other — intervene on a case-by-case basis
- Create dedicated spaces for peer knowledge-sharing (e.g., "Inspiration Exchange") where users post creative use-cases and workarounds, not just questions
- Bring in founder or product posts occasionally for high-engagement moments — a post from the CEO produces outsized reaction and signals that leadership is present
- Use the community for beta testing new features; give members early access and their feedback before wide release
- Run periodic surveys to cull initiatives that aren't getting engagement; cut ruthlessly rather than maintain things that take more effort than they return
- Lurkers are valid members — they learn, they don't cause harm, and they occasionally convert into contributors; don't gate the community behind forced participation
- Grow slowly and manually: 2,100 members after three years is a sign of health, not underperformance

→ Episodes: building-a-community

## Customer Segmentation: Who to Serve

- Never let a single customer represent more than a small slice of revenue — if one cancellation could damage the business, the customer mix is wrong
- Enterprise customers change incentives: a $5,000/month customer (vs. $100) triggers an involuntary concierge reflex that distorts priorities and product direction
- Enterprise sales cycles (security questionnaires, legal review, negotiated pricing, account management) are incompatible with a self-serve product model — don't adopt them halfway
- Enterprise customers optimize software for procurement managers and lawyers, not users — that's why so much enterprise software is bad
- Design software for the people who must use it, not for the people who buy it; misaligning buyer and user corrupts product decisions over time
- The right question isn't "why wouldn't you want their money?" — it's "what does taking their money do to the kind of business you become?"
- A healthy customer base is a flat distribution: no outliers, every customer pays roughly the same, any random 10% can leave without crisis
- It's not a failure when a customer outgrows you — if they started as a 20-person team and are now 2,000, they need different software; let them go gracefully
- Don't build the features that only a fraction of large existing customers request; those requests, if fulfilled, price out the small new customers who represent your real market
- Trying to keep every customer at every size is itself a choice — one that silently kills the product for the customers you actually want

→ Episodes: biggest-customer-conundrum, let-your-customers-outgrow-you

## Delighting Customers with Surprise Gifts

- Run a formal customer delight program: anyone at the company can nominate a customer (via a to-do with name, address, and the interaction context) and a dedicated person handles the research and sourcing
- Research recipients through public social profiles (Twitter, Instagram, LinkedIn) before choosing a gift — 90% of the time you can find enough to send something genuinely personal (sports team tickets, a restaurant voucher, a pet-related item)
- Surprise is the goal: send to a business address or home without alerting the recipient; only ask for an address when no other route exists
- Avoid food gifts as a default — allergies and sensitivities are too unpredictable; flowers, candles (unscented/lightly scented), movie gift cards, spa finder cards, and company swag are safer fallbacks
- For international recipients, source gifts locally using companies based in the recipient's country to avoid customs charges landing on the customer
- Trigger moments for sending delight: a long-tenured customer venting about a missing feature, someone who posted something kind about your product on social media, a new user who helped surface a bug, or a personal email from a customer that caught a team member's attention
- Comp a month of service as a delight option for long-term customers who are frustrated — a concrete, immediately useful gesture that costs the company little and signals you value the relationship
- Use curated gift box companies (especially those that are women-owned, environmentally focused, or support local artisans) as a reliable fallback when you can't find enough personal information about the recipient

→ Episodes: sending-a-little-delight

## Support Team Autonomy and Research

- Give support team members dedicated Research & Innovation Days — self-directed time away from the queue to pursue projects that interest them; this is what produced initiatives like peer benchmarking surveys and technical documentation guides
- Support reps conducting peer-to-peer research with similar companies (same industry, remote teams) surfaces practices you'd never find by staying inside your own organization — treat it as casual benchmarking, not corporate audit
- Use structured anonymous/non-anonymous surveys (not just open discussion threads) to capture feedback from remote team members who won't speak up in large async threads or feel their voice gets lost in the notification volume
- Document knowledge in a searchable central place (wikis, project templates, Campfire searches) so support context doesn't live only in the heads of long-tenured employees — the moment a fact isn't written down, it becomes a risk when that person is unavailable
- Build new hire onboarding around project templates with mini-guides for every tool, video walkthroughs, and culture docs — the "sink or swim" approach costs disproportionately more than the time it takes to document things once

→ Episodes: temperature-check, support-console-ation, customer-support
