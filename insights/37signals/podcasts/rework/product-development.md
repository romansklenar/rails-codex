---
title: Product Development & Shipping
description: "37signals' approach to building software: Shape Up methodology, shipping discipline, product philosophy, and decision-making"
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast
tags:
- product
- shipping
- shape-up
- planning
---

# Product Development & Shipping

## Shape Up Methodology

- Work in six-week cycles with two-week cool-down periods between them; six weeks is long enough to do something meaningful and short enough that you can see the end from the start, forcing better scope decisions
- Replace backlogs and estimates with a **betting table**: a small group (2–3 people, not a committee) reviews shaped pitches asynchronously, selects bets for the next cycle, and assigns teams; decisions are made by one person after hearing counsel — not by vote
- Pitches are ~800-word documents combining words and rough sketches (not wireframes); they describe the problem, appetite, a suggested solution direction, rabbit holes to avoid, and explicit no-gos; they leave implementation decisions to the team
- **Appetite replaces estimates**: instead of asking "how long will this take?" ask "how much are we willing to spend on this?"; a six-week appetite is a maximum loss limit, not a prediction
- **Circuit breaker**: if work is not done at the end of the cycle, it is automatically cancelled by default — not automatically re-queued; it must re-compete at the next betting table; failed projects go into a "penalty box" and sit out at least one cycle before being reconsidered
- Teams of one designer + one programmer work autonomously for the full cycle with no interruptions from management; the team creates its own tasks from the shaped pitch rather than being handed a ticket list
- **Two parallel tracks**: senior staff shape the next cycle's work while teams build the current cycle; this is what frees up strategic thinking time for the shapers
- **Scopes and hill charts** are the team's primary tracking tool: scopes are named chunks of work that can be independently shipped; the hill chart plots each scope as "uphill" (figuring out unknowns) vs. "downhill" (execution); a scope stuck on the uphill side signals a design problem, not a time problem
- **Breadboarding** (rough component-connection sketches) and **fat marker sketches** are the shaping tools of choice — rough enough to leave room for the team but concrete enough to eliminate illusions of agreement
- Work in **vertical slices** (integrated front-end + back-end together), not horizontal layers; never hand off a completed design to be implemented — designers and programmers figure out affordances together from day one
- Start shaping and building with the question "if I had to ship today, would this be ready?" — on the shaping side that means "is this solved enough to hand to a team?"; on the build side it means the code is always in a deployable state
- Don't label anything a "2.0 revamp" — that's a sign the scope is too large; factor it into three or four separate, independent projects

→ Episodes: shape-up, shape-up-roundtable, writing-a-pitch, shape-up-principle-the-betting-table, shape-up-principle-decide-when-to-stop

---

## Shipping & Launch

- The seven shipping principles: (1) only ship good work, (2) ship when confident (confidence is calibrated to criticality, not a fixed process), (3) own the issues after you ship — monitor the error tracker yourself, be first-line support for your own feature, (4) don't ship if it isn't right, (5) cut scope not quality, (6) ship to your appetite
- "We only ship good work" is a higher bar than MVP — "minimally viable" is too low; you can't get useful feedback from a half-assed idea; what you ship can be smaller than you wanted, but what you do ship must be complete and good
- Test confidence against criticality: billing code and data-mutation paths get more rigor (external QA firm, heavier review); low-criticality UI polish ships with near-zero ceremony; applying one universal QA process to everything is waste in both directions
- **The developer who shipped it owns the aftermath**: if you throw work over the wall, you lose calibration on confidence, you don't learn from bugs, and on-call ends up holding someone else's context-free mess
- Launch before you are comfortable: Basecamp launched without billing in 2004 (the constraint of needing to get paid in 30 days forced a working billing system in 30 days); HEY World launched in under two weeks intentionally; the content moderation concern they spent time worrying about never materialized
- Ask "if I only had two weeks to launch, what would I cut?" — that exercise clarifies what's actually essential; the answer is almost always more than you think
- Distinguish **fidelity from quality**: quality (well-built implementation) is non-negotiable at any fidelity level; fidelity (how polished the user-facing thing is) is a dial you adjust to the importance of the interaction; there is real skill in knowing when "meh" is appropriate
- After launching something genuinely novel, sit back for a few months before reacting to feedback; initial complaints often reflect habit ("where's the archive button?"), not actual design failures; confidence in deliberate decisions is required to ship real breakthroughs
- When something isn't shipping right, question the premise rather than pushing harder: the keyboard-navigation feature in HEY that got dropped led to the "scroll through unreads" redesign — a better solution to the underlying problem (catching up on email quickly), not just a fix to the original implementation
- Quick wins matter: shipping early and often builds the muscle; teams that practice being late get good at being late; teams that practice shipping get good at shipping

→ Episodes: seven-shipping-principles, launch-now, quick-wins, readying-for-launch, refining-before-release, launch-day, move-fast-when-you-can, you-launched-now-what

---

## Product Philosophy

- **V1 is for us**: build the first version to solve a real problem you personally have; imagined use cases lead to directionless products; when you can't tell if your own implementation is good, you can't improve it; every person at 37signals uses Basecamp daily, giving everyone the ability to evaluate quality
- **Start at the epicenter**: find the one thing without which the product is not the product at all — for Basecamp it was the message board, for Highrise a person page with notes, for HEY sending and receiving email — and build only that first; this tests the core idea before investing in anything peripheral
- The epicenter test: "I don't want to go back to what I was using before" — once you hit that feeling, you have something worth releasing; if you could easily go back, you haven't found the epicenter yet
- **Eat your own dogfood ruthlessly**: 37signals ran Writebook internally for runbooks even when staff rebelled — the discomfort (missing search) became the signal to fix it; pulling a product off your own shelf means you stop noticing its most obvious failures
- Sell painkillers, not vitamins: high-value problems need minimal polish to ship; low-value problems need so much packaging they often shouldn't be built at all
- **Underdo the competition**: more features distract from the core problem; competitors building "everything" are physically incapable of building the focused product a small team can; don't be afraid of the feature gap — use it
- **Build half a product, not a half-assed product**: cut scope ruthlessly before cutting quality; what you choose to ship should be complete, just smaller than you originally imagined
- **Be a curator**: saying no is what defines a strong product; every yes is a commitment of maintenance, support, documentation, and future trade-offs; the best products are edited, not accumulated
- **Ignore the details early on**: get the fundamentals working first; pixel-perfect design before the concept is proved is wasted work; start with affordances (a toggle, a button, a label) so both designer and programmer can begin simultaneously
- Don't build for imaginary customers: the Highrise Deals feature (built for a sales process 37signals doesn't run) was mediocre; the Highrise core (notes on people — a problem Jason and David actually had) was excellent
- **What are you replacing?**: understand what the customer sacrifices to adopt your product; HEY launched without signatures and vacation responders because the novel features (Screener, Imbox) were worth giving those up — the same framing applies when deciding what not to build in v1
- **Making things that multiply**: look for concepts or patterns in one product that can propagate across others; the most leveraged product decisions are the ones that compound

→ Episodes: v1-is-for-us, start-at-the-epicenter, eat-your-own-dogfood, underdo-the-competition, be-a-curator, ignore-the-details-early-on, build-half-a-product-not-a-half-assed-project, good-enough-is-fine, scratch-your-own-itch, what-are-you-replacing, making-things-that-multiply, a-product-pivot

---

## Decisions & Planning

- **Planning is guessing**: a plan is what you hope will happen, not what will happen; the further out you plan, the blurrier the vision; 37signals plans "10 years, six weeks at a time" — each cycle they come up for air and decide what to do next with the most current information available
- **Estimates suck; appetites work**: humans have a 40-year track record of failing to estimate novel software work; the single most important process change at 37signals was replacing estimates with budgets; "how long will it take?" → "how much are we willing to spend on this?"
- The gambler's metaphor: bring $500 to Vegas, lose $500, you're out — software projects without a budget keep doubling down on losses because of sunk cost; the stop-loss is what keeps the oven running
- Most decisions are temporary: treat them as trials, not concrete; ship something, observe reality, then decide; the cost of changing your mind is much lower than the cost of paralysis or extended deliberation
- **Making the call is making progress**: the moment a decision is made, the traffic jam of downstream decisions unblocks; never let "can we get one more opinion?" become a way of avoiding commitment; when arguments stop producing new information, decide
- **Disagree and commit**: when you don't agree but the call must be made, the worst outcome is disagreeing and not committing — you get the downside of the decision without the upside of momentum
- **Illusions of agreement**: verbal descriptions of a feature create false consensus — everyone imagines a different thing; the fastest path to real agreement is to build something and look at it together; even solo, you don't know what you actually want until you see it
- Get real as quickly as possible: use real data, not lorem ipsum; use the thing in anger with your own emails, your own tasks; the most obvious design flaws reveal themselves only through actual use, not through discussion
- **Picking priorities without roadmaps**: don't maintain a long-term roadmap; the six-cycle-per-year cadence means you reconsider the entire plan every two months; something that felt critical in cycle one may be irrelevant by cycle three; the moving average of persistent requests is more reliable than any individual data point
- When do you have to decide? Delay a decision until it actually needs to be made — more information will be available; but once the decision-time arrives, stop deliberating and make the call
- Avoid metrics tyranny: most important decisions can't be measured; 37signals ran for 20+ years measuring very few things; what you measure is a vanishingly small subset of what matters

→ Episodes: planning-is-guessing, your-estimates-suck, making-the-call-is-making-progress, illusions-of-agreement, decisions-are-temporary, disagree-and-commit, its-all-a-judgement-call, picking-priorities, reasons-to-quit

---

## Scope & Constraints

- **Narrow as you go**: after the initial exploration, work required to finish should shrink over time, not grow; if the pile of to-dos is growing as you approach the deadline, you have a scope problem; freeze features early and enter chiseling/editing mode
- Start with the novel, differentiated work — not the baseline; if you complete only the "table stakes" features, the product has no reason to exist; HEY shipped without signatures because the Screener was novel enough to attract users willing to give that up
- Don't hoard ideas: a backlog of 200 items creates guilt and obligation without creating focus; ideas that matter keep surfacing; declare bankruptcy on long lists and let working memory do the natural filtering — the good ideas re-emerge
- **Constraints force better decisions**: 10 hours/week to build Basecamp forced ruthless prioritization; teams of 2 people prevent over-engineering; six-week cycles prevent gold-plating; companies with unlimited resources build cumbersome, feature-bloated software
- **Throw less at the problem**: adding more people or time to a struggling project usually makes it worse; the answer to "we need more time" is almost always "we need to cut scope"
- **Less mass**: organizational mass accumulates silently — every meeting series, every new policy, every extra hire adds inertia; ask "what if we just didn't do that?" before adding any process, role, or obligation; mass is easier to avoid than to shed
- **Inspiration is perishable**: act on creative energy when it appears; if you must wait six months to implement a good idea, the energy and clarity are gone; this is another reason to keep cycles short
- Rabbit holes vs. science projects: identify rabbit holes (components that consume disproportionate time for marginal value) in the pitch phase before building; name them explicitly as out-of-scope; a science project is an entire pitch with known low odds of shipping — mark it as such before starting, and timebox it
- Spike uncertain technical questions early: spend two days probing an unknown before betting six weeks on it; a spike is "an investment in information," not lost time — it turns "will this take four weeks or four days?" into a real estimate
- **Less is more in scope decisions**: building something that does 80% of what was imagined in two weeks is often more valuable than building 100% in twelve; you can always add the last 20% later; you usually discover you don't need it
- Reduce organizational drag: keep product teams at two people (one designer, one programmer); avoid meetings that require everyone to synchronize; the distance between "I have a good idea" and "I fixed it" should be very short

→ Episodes: narrow-as-you-go, embrace-constraints, less-mass, throw-less-at-the-problem, inspiration-is-perishable, writing-a-pitch, shape-up
