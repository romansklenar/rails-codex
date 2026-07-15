---
title: "DHH: Basecamp 5, Vibe Coding, and the Future of Rails"
description: "DHH on how modern Rails shaped Basecamp 5, why the backend has stayed stable for 20 years, the coming ActionText/Passkey extractions, and how agentic AI is compressing the software process from prompt to IPO."
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/19335416-dhh-basecamp-5-vibe-coding-and-the-future-of-rails"
  date: 2026-06-12
tags: [rails, basecamp, ai-agents, vibe-coding, hotwire, actiontext, passkeys, shape-up, framework-philosophy, 37signals]
---

# DHH: Basecamp 5, Vibe Coding, and the Future of Rails

David Heinemeier Hansson, creator of Ruby on Rails and co-owner of 37signals, on how modern Rails shaped the just-released Basecamp 5, why the backend has barely changed in 20 years while the frontend churned, and how agentic "vibe coding" is compressing the entire software process — with feet planted in both excitement and unease.

## What Still Drives Him After 23 Years

- **Ruby remains "the most beautiful programming language" he's ever seen** — the delight holds whether he writes the code himself or watches an agent do it.
- **The internet is still "the best application platform we've ever had"** — maximum freedom to distribute apps without gatekeepers, unlike other platforms.
- The Ruby + internet + great web apps combination is a mission he hasn't tired of; 23 years ago he'd have bet Rails wouldn't last this long.
- Frames the present as "essentially the eve of another great revolution in computing" with AI.

## Backend Stability vs. Frontend Churn

- **The backend shape is "eerily similar" to 2005** — controllers after the REST/7-actions transition, and ActiveRecord's core DSL, look immensely recognizable 20 years on.
- ActiveRecord skills were **"an investment you could amortize over literally 2 decades"** — unlike JS ecosystems where time spent on a 2009 framework yields few dividends.
- Most ecosystems do "generational cohorts" — an app is built in an era and moves along; Rails instead gets "a ton of fresh blood entering the veins" continuously.
- **The frontend is how you carbon-date a Rails app**: Webpacker vs. esbuild vs. no-build, jQuery presence, which JS framework was current at inception. You cannot date an app by opening a model file.
- DHH accepts the frontend churn is "not something we can absorb the blame for" — JavaScript/React peaked and dropped through crazy churn from ~2009 on.

## Basecamp 5: Architecture and Choices

- **Basecamp predates Rails** — DHH started building it in 2003; Rails was extracted from it. Basecamp 5's backend is deeply similar to that first version.
- **Almost no raw SQL left**: he doubts Basecamp 5 contains any complete SQL statements — ActiveRecord is now powerful enough that you never drop to that level.
- **Recordables / delegated types** were the biggest internal-organization shift in how they build Basecamp — a Rails feature that "nudges a certain architectural style" without heavy plumbing or hard Rails dependency.
- **Built on the "chassis of Basecamp 3"** — a codebase started in 2013; Basecamp 5 is a major UI revamp riding on 2013-era code.
- 37signals still maintains and runs the **original 2003 Basecamp** for thousands of customers, though it stopped selling it to new customers in 2010.
- **Fizzy** is a fresh greenfield app (public codebase) built to today's best standards — yet its models look "not that different" from Basecamp's, proving Rails bridges the stable-legacy vs. greenfield chasm.

## Hardware Flip: Dev Machines Now Outrun the Cloud

- The dev machine used to be the slow bit and the server the fast computer — **that has flipped**.
- The fastest single-core CPUs now live in developer machines, with many cores available.
- **Benchmark cited**: the entire Basecamp 5 test suite runs in ~60 seconds on his local **AMD 395** (16 physical cores) — roughly **twice as fast** as on 20 enterprise/data-center-grade cloud cores.
- This enables compressing CI and build-pipeline complexity; running a full suite for an app as large as Basecamp in 60s locally he calls "astounding."
- The **no-build shift** (real JavaScript modules you can load and reference) ended the "uncomfortable, cumbersome" Webpacker era (~2015–2019) when the frontend was less enjoyable to build than the backend.

## Coming to Rails: ActionText + Lexical, and Passkeys

- **New editor in Basecamp 5 built on Meta's Lexical framework** ("Lexi"), being built into ActionText — the underpinnings that run Facebook and WhatsApp.
- Replaces **Trix** (37signals' in-house editor), which was great for its box but couldn't be extended; **tables** in the WYSIWYG editor had been wanted "for literally almost a decade," and **Markdown support** was another glaring omission.
- **ActionText upgrade plan**: Lexi becomes the default but stays Trix-compatible — you can run both and migrate. Rich text is "table stakes" for modern web apps.
- **Passkeys → Rails**: an open PR aims to get end-to-end Passkey support in "fully native" form.
- **DHH changed his mind on passkeys**: originally skeptical because passkeys-as-password-replacement had usability holes (set up on iPhone, then can't log in from a Windows PC).
- **The breakthrough: pair Passkeys with Magic Links** (the technique used in Fizzy) — email-based login always works as a fallback. His prescription: "just have Magic Links and Passkeys. That's it." — ideally dropping social logins entirely.
- Goal is to **"bring the floor down so low that everyone can play"** and end the crazy pattern of outsourcing authentication to a SaaS provider out of intimidation.

## "Vibe Coding" and Non-Programmers Writing Rails

- **Big workflow change at 37signals**: designers and project managers can now write Rails/Ruby code and see ideas become working software "without going through the mediation of a programmer."
- This answers "the hardest parts in software" much earlier — *how should this work, is it good, does it feel right* — validating intuition before wasting a programmer's weeks or months.
- **Caveat: literally vibe-coded output is mostly not merged** — in most cases code that isn't understood or reviewed in detail does not ship. Jason cannot vibe-code all of Basecamp "at least not yet."
- **Shape Up's 6-week cycle now feels "archaic"** — DHH has a hard time imagining almost any Basecamp feature still requiring 6 weeks; implementation cost has been massively compressed across Basecamp, Omarchi, and everything else he touches.
- Personal history: cites years of writing code Jason rejected ("it doesn't work, it's got to work this way instead") after weeks of investment — being relieved of that "coding in vain" is a huge step forward.

## The Agentic Development Swing: Excitement vs. Danger

- DHH says he's "flipped": a year ago he proudly hand-wrote every character; now he'll delegate to an agent **if it produces code of the same quality he'd have written** — he still sweats esthetic presentation, just not the chiseling.
- **Calls it a professional obligation** of every programmer to take the revolution seriously, dedicate time, and avoid "distracting ideological dead ends" like "it's just a parrot / just regurgitating."
- **Cheap experimentation is the surprising delight**: `git reset` throws away 1,000 lines with zero guilt; he wants to see "7 different implementations" before judging a shape — like scanning art.
- **Credits Tobi (Shopify)** with seeing the future earlier and mandating AI attention before the industry caught up — says he's "finally taken the Tobi pill on AI acceleration."
- **Strong opinions on agent weaknesses**:
  - Agents are "eager to please as quickly as possible in as few tokens as possible" → bolt-on code rather than good architecture.
  - They're not yet good at Kent Beck's "make the change easy, then make the easy change" — will happily write **1,200 lines where an architectural twist in Rails could have done it in 20**.
  - The "monkey's paw curse": ask naively and it gives you exactly what you asked for, even when it shouldn't be delivered that way.
- His hesitations "are really just hesitations about software development without care towards architecture" — the same ball-of-mud fate humans have always risked.
- **Hallucination "stopped being a thing"** because we moved from AI to *agents* — agents have tools, run tests and linters, so hallucinated code doesn't survive into the pull request. Prompt injection remains a concern.
- **Self-driving-car analogy**: agents still "crash," just at a much lower rate; on diligence he says agents sometimes show "a vastly higher than average degree."
- Model-jump momentum: cites **GPT-5.5** as "a massive step forward" / an "Opus 4.5 moment" that enlarged the scope of delegable tasks; notes the field re-invents *how we work* "every 6 weeks," and that ~last December was the inflection where agents started writing first code (vs. autocomplete).
- **Warns against baking foundations too early**: a default `agents.md` shipped in the last Rails version would now be "not only outdated but literally harmful" — 3 model jumps on. Studies show over-steering an agent that already knew the right approach "fills up the context window with distractions" and "makes it dumber."
- On MCP vs. CLI: everyone was "all in on MCPs," then "the puck skated to CLIs," now talk of both — too much flux to "pour foundational framework concrete" yet.

## Organizational Effects: Ambition Up, More Incidents

- **Ambition rises when productivity rises**: e.g. Jeremy's project to optimize the *fastest 1%* of requests (sub-millisecond) — work no one would have tackled before, but it "adds up" on infrastructure spend at millions of requests.
- DHH's own end-of-cycle keyboard-accessibility sprint (NeoVim-like focus jumping between sidebar panes) is work he'd previously have deferred to a post-launch Shape Up cycle — now "easier to be whimsical," turning ideas into running code rather than planning cards.
- **The reliability tradeoff**: going from ~5 to ~50 PRs a week means more instability even if per-PR resilience improves — "certain systems have gotten more unreliable with the introduction of AI," not because agents are worse programmers but because volume creates more incident opportunities.
- Notes Basecamp 4 had **literally 100% uptime** over its last 3 months going into the Basecamp 5 launch.
- **Startups shouldn't chase 100% uptime** — product-market fit faster matters more than that reliability tier.
- **His bias, stated plainly**: 37signals codebases already have established patterns and application-level architecture on top of Rails, which makes them amenable to good agent work. He admits he doesn't know whether agents can do good work in "a big ball of mud" — "I don't know."

## Rails as an On-Ramp: "From Prompt to IPO"

- **Updated the Rails tagline** from "hello world to IPO" to **"from prompt to IPO"** — predicts real IPOs of vibe-coded apps that reached product-market fit that way, later hardened by hired programmers (or good-enough agents).
- Sees a class of apps historically served by **Microsoft Access, FileMaker Pro, and Excel** — "one of the largest application platforms for non-programmers in the world" — that Rails-via-agents could serve for people without access to skilled programmers.
- Some Rails apps could be **written entirely by agents in the true vibe-coding sense** (director never looks at the code) — fine for low-criticality apps, but "I wouldn't vibe code my next bank app."
- **Rails has always embraced a "criticality spectrum"** — biologists, musicians, and career-changers got started because Rails flattened the curve, made most mistakes non-critical, and built in security so beginners "couldn't make the dumbest mistakes." That on-ramp mirrors where agents are now.
- Rejects the gatekeeping "climb this 200-meter wall before you're let into the Garden of Eden" culture — wants Rails "flat," letting newcomers "make some mistakes, maybe shoot a toe off or two."
- **Pro agent contributions to Rails itself**: despite AI-slop security reports being a nuisance, he'd "love" for agents to write Rails features and improve the codebase — reviewed by qualified humans on core/committer teams "for a long time."

## Parting Advice

- **Worry less about doom** — climate hysteria or AI killing us all: "if any of those things are gonna happen, they're gonna happen whether you worry about them or not."
- Focus on progress, the love of computers, the beauty of Ruby, the productivity of Rails — "we live in the best of times on 500 different axes."
- Dwelling on what's wrong will "poison your mind" — "too precious of an organ to poison like that." Keep a slight concern in reserve, but don't let it dominate; embrace the future.

→ Episode: [DHH: Basecamp 5, Vibe Coding, and the Future of Rails](https://podcast.rubyonrails.org/2462975/episodes/19335416-dhh-basecamp-5-vibe-coding-and-the-future-of-rails)
