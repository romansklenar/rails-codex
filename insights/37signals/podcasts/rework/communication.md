---
title: Communication
description: "37signals' internal and external communication principles: async-first, direct, written"
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast
tags:
- communication
- async
- writing
---

# Communication

## Internal Communication Principles

- You cannot not communicate — silence, avoidance, and non-answers are all communication; leaving a vacuum invites rumors and negative interpretation
- Never expect or require immediate responses; the expectation of instant reply is toxic and disrespects others' time
- If words can be interpreted in multiple ways, they will be understood in the way that does the most harm — favor short, clear, low-surface-area language for important matters
- Time is on your side: rushing conversations produces worse outcomes; let heated exchanges cool before forcing resolution
- Write to be read, not transcribed — Kickoffs and Heartbeats written with intention are gifts to the organization; AI-generated meeting transcripts are not
- Async long-form writing is the primary operating mode; Basecamp messages are expected to receive responses in hours or days, not seconds
- Institutional memory lives in written threads, not in chat scroll — 37signals has retrieved context from Basecamp threads seven years old
- Avoid gamifying internal communication: Applause-style like buttons create power-dynamic anxiety, reward cheap engagement, and corrupt internal compasses for what is actually good
- The "37signals Guide to Internal Communication" (30 principles) serves as the onboarding reference for all new hires on how the org communicates

→ Episodes: principles-of-communication, dont-like-this, dont-like-this-update

## Async vs. Real-Time Chat

- Async is the default; real-time chat is a tool for social conversation and quick one-on-one exchanges, not project management or deep work
- Chat is appropriate for: social channels, one-on-one riffs, sharing quick links — not for tracking multi-person project decisions
- Chat-first work cultures fragment attention, cause things to fall through the cracks, and make it impossible to onboard new teammates who can't reconstruct context from scroll
- The medium carries expectations: Slack-style tools condition users to expect instant replies; Basecamp messages condition patience and thoughtfulness
- Chat history at 37signals auto-deletes after two years by design — anything worth keeping goes in a Basecamp message, to-do, or document with a permanent URL
- Five uninterrupted hours of focused work is the productivity standard; constant chat monitoring makes this impossible for most workers who have never experienced it
- Do not default to chat for complex decisions — verbal and chat descriptions create illusions of agreement; written proposals make misalignment visible

→ Episodes: the-wrong-time-for-real-time, principles-of-communication

## Cycle Communication: Kickoffs and Heartbeats

- Every six weeks, each department head publishes a Kickoff: a plain-language description of projects the team intends to pursue, including appetite (budget) not estimates
- Kickoffs are shared company-wide so every team knows what every other team is working on — the antidote to "what are they even doing over there?"
- Heartbeats close each cycle: a retrospective of what the team actually did, including reactive work, shoutouts to individuals, and surprises
- The Kickoff/Heartbeat rhythm is tied to Shape Up's six-week cycle — a predictable cadence makes it easy to hook communication rituals to it
- Kickoffs contain no individual task assignments — teams decide their own approach; leaders set direction, not method
- For reactive teams (Ops, SIP, support), Heartbeats often contain more unplanned work than Kickoff work; schedule only 50% capacity for those teams
- These writeups let new employees read up on a year of company history at their own pace — far more useful than recordings of Zoom status calls
- The Kickoff serves as a self-restraint mechanism for founders: ideas go on a "card table" and are only pulled out at the next cycle planning discussion, not acted on impulsively

→ Episodes: kickoffs-and-heartbeats

## Customer Communication

- Founders must talk directly to customers — Jason personally emailed all Basecamp 3/4 customers before the Basecamp 5 launch and replied to every response individually, no assistant, no AI
- Direct founder-to-customer contact produces the highest-fidelity product insight; aggregate pipelines (support tickets → AI summaries → quarterly reports) destroy the nutrients in customer feedback
- Ask one open-ended question at a time, not 30 multiple-choice items on a scale of 0–10; single open questions yield 1,600+ rich, usable responses vs. meaningless statistics
- Customer language is a goldmine: terms customers use to describe their own problems become the marketing copy and feature names (e.g., "things falling through the cracks")
- Quantitative surveys are gameable and ultra-processed; open-ended anecdotes train gut instincts and reveal customer motivation, not just behavior
- Scan your customer list and proactively reach out — noticing a notable name in an order and writing to them personally builds durable word-of-mouth
- Publishing a founder's direct email address (no assistant, no AI relay) is a differentiator — it signals accessibility and creates personal bonds that outlast product frustrations
- Direct customer communication also surfaces product misunderstandings: many "feature requests" are for things that already exist but aren't discoverable

→ Episodes: talk-directly-to-your-customers, question-your-customers

## Public and External Communication

- Press releases are spam: formulaic, ineffective at driving traffic, and produce fake quotes that make founders feel like idiots — 37signals' Basecamp 4 press release generated broad coverage and zero measurable impact
- The alternative to press releases is being interesting: ship something novel, take a genuine contrarian position, or reveal a compelling angle that makes coverage inherently earned
- Authentic founder voice outperforms company-brand voice — no one at 37signals writes tweets or emails for Jason or David; delegating your voice is the one thing you must never do
- A major editorial placement (The Verge, TechCrunch) now drives less traffic than a throwaway tweet written in seconds — the media landscape has permanently shifted toward direct-to-consumer
- Cultivate relationships with individual writers who cover things out of genuine interest (e.g., Daring Fireball) rather than blasting press wires — targeted outreach beats spray-and-pray
- Founder-led marketing is a superpower unavailable to large companies: the person with the most skin in the game speaking directly to customers cannot be replicated by a marketing department
- Avoid off-season burnout on social platforms — extended breaks are necessary to avoid the attention economy pulling you into performing a character rather than being authentic

→ Episodes: press-releases-are-spam, talk-directly-to-your-customers

## Crisis Communication and Apologies

- When something goes wrong, pick the "this is a huge deal" token — if you downplay it, customers will escalate to "this is the biggest deal ever"; if you own it fully, they often respond with "this isn't that big a deal"
- Write human apologies, not corporate ones: "I fucked up" beats "we regret any inconvenience that may have occurred"; weasel language signals inauthenticity immediately
- Name specifically what you did wrong; conditional or vague apologies ("sorry if anyone was offended") universally backfire
- Don't sacrifice an individual employee as a proxy for systemic failure — "rogue employee" narratives are usually dishonest; rogue actions are expressions of organizational culture
- A genuine apology must be followed by organizational change, not just words — the cat.jpg incident led to a full privacy policy rewrite, internal access controls, and an access logging system
- Status page communication during outages is a customer service task, not an engineering task — overly technical outage explanations increase frustration even for technical users
- Communicate outage status via infrastructure that stays up even when your product is down; baking your status page into the product means it goes dark precisely when customers need it most
- Do not demand forgiveness in an apology — offer it, let the other party decide, and accept that accepting an apology is distinct from forgiving

→ Episodes: how-to-say-sorry

## Feedback and Acknowledgment Design

- Like buttons in work tools introduce power-dynamic anxiety: managers who applaud some daily check-ins but not others signal perceived favoritism even when none is intended
- Gamifying work communication (applause counts, likes, hearts) corrupts individual judgment about quality — DHH found himself unable to trust his own assessment of content after chasing applause metrics
- The replacement for likes in Basecamp: "Whispers" — short (12-character), no notifications, text-required micro-acknowledgments that stack horizontally and form a quiet visual crowd
- Requiring even minimal effort (typing something vs. clicking a button) meaningfully raises the quality and authenticity of peer acknowledgment
- The goal of acknowledgment tooling is to confirm receipt, not to generate engagement metrics — Basecamp has no ad model requiring eyeballs, so engagement maximization is actively harmful
- Long-form work (data reports, research writeups) deserves explicit acknowledgment mechanisms so authors know their work was read — silence after effort damages motivation

→ Episodes: dont-like-this, dont-like-this-update
