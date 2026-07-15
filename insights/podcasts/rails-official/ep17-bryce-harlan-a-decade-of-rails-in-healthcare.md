---
title: "Bryce Harlan: A Decade of Rails in Healthcare"
description: "Jaan Health senior principal engineer Bryce Harlan on a decade of running a HIPAA-regulated between-visit care-management platform on Rails, from a Rails 4-to-6 rewrite to SLA-named Sidekiq queues, a bespoke ActionResponder API layer, and AI-assisted feature pipelines."
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/19436980-bryce-harlan-a-decade-of-rails-in-healthcare"
  date: 2026-07-08
tags: [rails, healthcare, hipaa, sidekiq, background-jobs, api, activerecord, twilio, testing, ai-assisted-development, architecture, upgrades]
---

# Bryce Harlan: A Decade of Rails in Healthcare

Bryce Harlan, senior principal engineer at Jaan Health (phamily.com), reflects on ten years evolving a HIPAA-regulated Rails platform that helps nurses and care managers coordinate between-visit patient care, covering a Rails 4-to-6 rewrite, high-volume Sidekiq job processing, a bespoke API abstraction, and how the team now bakes AI into feature delivery.

## Product and Domain

- **Jaan Health** (marketing site: phamily.com — "Phamily" with a PH) sells to clinical practices — doctors and nurses — to manage **between-visit care**: the healthcare that happens outside the few days a year a patient sees a doctor.
- **Primary users are nurses and care managers**, not physicians; practitioners use the platform in an overseeing capacity. Care managers act "like a quarterback," coordinating medications, symptom reports, insurance approvals, and blood-draw results across the many doctors older patients see.
- Much of the work is **proactive outreach** to build patient relationships, plus sending messages, reviewing clinical protocol plans, making updates, and sharing documentation back to systems of record.
- **Pivot history:** started as an appointment-reminder company; ~6 months after Bryce joined, pivoted to care orchestration/management after noticing front-desk staff naturally forming patient relationships over text — an emergent user behavior the team then leaned into.
- **No patient mobile app by design** — a deliberate differentiator ("meet the patient where they are"); patients have a phone and shouldn't need to download an app.

## Healthcare Compliance Constraints

- **Everything is "fairly sacred"** — the whole app is locked down; HIPAA compliance pervades the system.
- Any data transfer to an outside system requires a **BAA (Business Associate Agreement)** — a legal contract guaranteeing HIPAA properties like **encryption at rest**.
- **SMS opt-in system:** patient permission is required before texting; without permission, patients are directed to the web app.
- **Annual compliance training** — roughly a weekend clicking through scenarios and signing paperwork; described as routine, not daunting.
- Working in healthcare means **more eyes on your work in a critical lens** — framed as a positive that forces engineers to slow down and consider security, which fast-growing startups often deprioritize.
- **Deployment security is outsourced to Aptible** (their host provider); a dedicated internal team handles platform/security specifics rather than app engineers.

## Rails Architecture

- **Rails is the central hub API** — "80% of the magic happens in the Rails layer" — with a few spoke services.
- The main Rails app runs in **API mode**; all front ends are built with **Vue single-file components** (chosen for their strong, opinionated philosophy, echoing the reasons for choosing Rails).
- A **separate, lighter-weight Rails app** powers the patient web portal (server-rendered with ActionView).
- **Communication is ~90/10 SMS vs. web portal**; SMS runs through **Twilio**, with Rails orchestrating the Twilio calls.
- **Twilio subaccounts:** each doctor's office gets its own dedicated Twilio subaccount, so rate limits apply per-tenant and have rarely caused issues.
- **ActionResponder — a bespoke thin abstraction layer:** thin-controllers/fat-models taken "to its logical extreme." Most APIs route through a single endpoint; ActionResponders handle data serialization, parameter parsing normalization, and a shared access pattern so an endpoint can be called identically over HTTP or directly from backend service code, returning a standardized/normalized payload.
- **JSON API with sparse fieldsets/associations** — clients can request just the fields they want, "a little bit like GraphQL," out of the box for any ActionResponder endpoint.
- **GraphQL was evaluated and rejected** — too much overhead, unneeded features, and didn't feel like "the Rails way"; the real goal was pulling logic out of controllers and closer to the model rather than into a litany of service objects.
- **Service objects still used**, but pre-ActionResponder the controllers had become thin model wrappers with service objects doing duplicated work (parameter parsing, **Pundit authorization**) with no abstraction separating generic from model-specific concerns.

## The Rails 4 to 6 Upgrade

- Joined when the app was on **Rails 4** (built ~1-2 years before he joined, by the founders); stayed on Rails 4 "for quite some time."
- **Jumped straight from Rails 4 to Rails 6 in spring 2020** — an unconventional route Bryce would not recommend. Rails 6 had been out roughly half a year and was the latest at the time.
- **Motivation:** the pandemic overnight turned skepticism about virtual care into "swimming in business"; as a small company they judged they might have only one chance for a big change before it calcified into a 6-month project — so they "ripped the Band-Aid off."
- **Why they stayed on Rails 4 so long:** small team, little appetite for paying down tech debt, and nothing compelling to jump for (Rails 5's headliner ActionCable wasn't a draw) — classic "if it isn't broken, don't fix it" inertia.
- **The upgrade was effectively a rewrite:** the app was a "Frankenstein of gems"; automated testing was poor. They gutted much of the app and rewrote it in Rails 6, which made the jump smoother.
- **Mailboxer replacement:** they had tortured the **Mailboxer** gem (designed for email) into representing conversation state. The upgrade was the moment to design proper models — taking inspiration from what they liked — and ship their own architecture, which is still in use today.

## Dependency Philosophy

- **Decision that aged well:** owning load-bearing logic rather than torturing a gem "into shapes it was never designed for" once a product reaches maturity.
- Gems are still preferred when the problem is **truly a commodity** ("we're not writing our own auth layer") and the gem is well-maintained with community activity.
- Guiding heuristic: **read the gem's source** — poking inside to judge whether it's well-written code is one of the best ways to learn a language, especially Ruby.
- **ActiveRecord is the tool they lean on most** — chaining atomic scopes to build complex filtered views. Contrasted sharply with Python's SQLAlchemy (via a FastAPI service for the AI team), where developer-managed indirection means "rewriting big parts of ActiveRecord" just for listing, sorting, ordering, and chaining.
- **Broad lesson:** "you never need as much as you initially think" — programmers over-build for edge cases; trust that what you actually need will emerge from what you ship.

## Background Job Processing at Scale

- **Sidekiq handles all job processing.** The app sends on the order of **100,000 Twilio messages per day**, all as async jobs for retryability, with a bursty peak-usage pattern.
- **The problem:** queues met a (generous) SLA, but end-user experience was poor. One user enqueuing ~500+ messages meant the next user's batch waited behind the entire first batch — a head-of-line blocking problem at real volumes much larger than 500.
- **Fixes:**
  - Changed **batch treatment** so a batch enqueues quickly onto the same queue rather than waiting for a batch wrapper to spawn underlying jobs.
  - **Fast-tracked the first 100 jobs** of any batch (regardless of batch size) onto a very fast queue so every user feels responsiveness immediately, even if the 9,000th of 10,000 messages sends an hour later.
- **Realization:** the earlier reflex of just adding workers/capacity was solving the wrong problem — naturally spacing out sends is often better UX ("I want to message these people today, not necessarily at 10:06 AM"), and nurses aren't ready to field 500 replies instantly anyway.
- **SLA-named queues (credited to a Judoscale blog post on queue naming):** replaced ad-hoc queues (import/real-time/low/default with hand-tuned weights) with **queues named by SLA** — within-5-seconds, within-5-minutes, within-30-minutes, within-an-hour.
  - Datadog alerts fire when a queue's SLA is breached, prompting investigation (too many jobs enqueued? need more processing power? or a job that belongs on a slower queue?).
  - Removes the recurring "should this go on the import or default queue?" question — "the question almost answers itself: how fast do you need it done?"

## Observability, Testing, and Deployment

- **Datadog is the primary APM** for diagnostics; Aptible provides supplementary tooling. AI-assisted **stack-trace/trace deep dives** are cited as an ideal AI use case — offloading tedious line-by-line tracing to focus on higher-order thinking.
- **ActionResponder pays dividends in testing:** seed files can call the exact same code path as a network request (same parameters, same parsing, same side effects), marrying integration tests and seeding — escaping "stub hell" of hyper-idealized state and making complex world-states easy to construct step by step.
- **Testing external SMS:** heavy use of stubs/mocks, plus **Twilio's dedicated testing phone numbers** in a sandbox account (e.g., a number that responds "I'm a landline"). A central test suite covers that layer.
- **Playwright** for full end-to-end integration tests — normally against a mocked/stubbed environment, with an env-var flag to instead run against a deployed environment pointed at the Twilio sandbox.
- **Staging** is a faithful, fully-secured recreation of prod — "break-in-case-of-emergency"; a final CI round runs there when there's risk that only real production data would surface.
- **Team:** ~15 engineers, nearly all touching the Rails app (AI-focused engineers touch it less often).
- **Deployment:** nightly builds via **GitHub Actions**, pushing to release branches (not everything ready is merged nightly); shipping to production roughly **twice a week**.

## AI-Assisted Development

- **Claude Code is the main tool**, with a **rigid skill-based pipeline** that turns a vague idea or ticket into a shippable feature: generate a **PRD** → **FRD** → technical implementation-plan document → a **test suite** — with engineers expected to read, refine, and sign off at each stage.
- **Tests before implementation:** for features worth ~3-4 days of effort, the developer signing off must confirm the tests are the correct way to prove the feature **before the LLM writes any other code**. For small bugs, "the rigmarole isn't required."
- **Motivation** — the founder's phrase "give people superpowers": let engineers take backlog features that lack a strong advocate and ship them end-to-end (frontend + backend, complex requirements) with little involvement from other players.
- **Repo/tooling setup:** Vue frontend and Rails backend live in **two separate repositories**, unified via a **VS Code workspace** for full-stack single-pass work; a top-level **wrapper repo acts as a registry** of the underlying repos and is where the Claude Code skills live. Cross-repo feature commits are now orchestrated seamlessly (a bigger challenge months earlier).
- **PMs are being pulled upstream too** — nearly all PMs now have GitHub access and their own environments — to focus on epic/feature-level work (customer input, regulations) while engineers take on the "why can't I ship this fix I know is broken" polish work.
- **A convincing win:** Bryce (a former AI skeptic for app code) built a complex **business-process/flowchart modeling** feature (Zapier/Lucidchart-style decision points, important in healthcare) with Claude after failing to find a good off-the-shelf option — the generated models were clean and idiomatically Rails, and shipped much faster than he could have alone.

## Philosophy: Programming as Theory Building

- Cites **Peter Naur's "Programming as Theory Building"** — a programmer's output is not source code but the **theory** behind it; code is just an implementation/consequence of that theory.
- As code production becomes a commodity via AI, the job increasingly is **crafting the theory** — interfaces, effectiveness, usability, long-term maintainability.
- **The test suite becomes the theory of the code** — a key reason the team favors tests-first — describing what the system actually is.
- **Learning advice:** force yourself to learn **C at least once** — descending toward how a computer thinks (memory management, systems) builds intuition for debugging that stays valuable in the age of AI's higher-level abstraction.

## Why Rails, and Why It Stays

- **Founder's choice:** a developer who worked at Y Combinator companies around the time Rails became popular and embraces its philosophy; many YC companies still choose Rails.
- **What keeps them on Rails:** the ecosystem's sweet spot — building and iterating quickly, spending far less time "in the weeds of what makes a web app a web app," plus a decade of accumulated inertia.
- **Coming from Flask/Node.js and a math background**, Bryce found MVC familiar but ActiveRecord (circa 2014-15) a revelation — turning heavy raw SQL into chainable code.
- Currently on **Rails 7**, with **Rails 8 evaluation in very early stages**. Open to trying the modern single-stack Rails frontend approach ("there's an elegance to one stack") if starting fresh today.
- **Rails as secret sauce:** a reliable framework lets the team take technical excellence and security "for granted" and focus on the unique product problem — crucial under the constant AI-era pressure that "someone's gonna vibe code my app in a week."
