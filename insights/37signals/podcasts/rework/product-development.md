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
- A suspiciously high shipping rate (100%) is a sign your standards are too low; you should occasionally have a project that simply doesn't meet the bar — that's what "we only ship good work" really means at the 11th hour
- "Better than nothing" is a dangerously low burden of proof; never let that be your internal argument for pushing deploy
- Test confidence against criticality: billing code and data-mutation paths get more rigor (external QA firm, heavier review); low-criticality UI polish ships with near-zero ceremony; applying one universal QA process to everything is waste in both directions
- **The developer who shipped it owns the aftermath**: if you throw work over the wall, you lose calibration on confidence, you don't learn from bugs, and on-call ends up holding someone else's context-free mess; the cool-down period exists specifically to allow the builder to monitor what they shipped
- **Gold-plating is its own failure mode**: perfecting a specific solution to a flawed premise is worse than shipping a good solution to a great premise; a clever implementation of the wrong idea is still the wrong idea
- If something is hard to implement, always ask "why is this hard?" before pushing through — hardness is usually a signal the concept needs cleaning up, not that you need more engineering effort; "make the change easy, then make the easy change"
- Launch before you are comfortable: Basecamp launched without billing in 2004 (the constraint of needing to get paid in 30 days forced a working billing system in 30 days); HEY World launched in under two weeks intentionally; the content moderation concern they spent time worrying about never materialized
- Billing is a legitimate thing to defer past launch: leaving it out focuses energy on the product, and the time-pressure of approaching trial expiry forces a simpler billing implementation anyway
- Ask "if I only had two weeks to launch, what would I cut?" — that exercise clarifies what's actually essential; the answer is almost always more than you think
- Distinguish **fidelity from quality**: quality (well-built implementation) is non-negotiable at any fidelity level; fidelity (how polished the user-facing thing is) is a dial you adjust to the importance of the interaction; there is real skill in knowing when "meh" is appropriate
- After launching something genuinely novel, sit back for a few months before reacting to feedback; initial complaints often reflect habit ("where's the archive button?"), not actual design failures; confidence in deliberate decisions is required to ship real breakthroughs
- Don't knee-jerk in the first weeks post-launch: fix broken things immediately, but don't make sweeping changes because early users are still adjusting to something new; give it time to see whether complaints are real design failures or habituation
- When something isn't shipping right, question the premise rather than pushing harder: the keyboard-navigation feature in HEY that got dropped led to the "scroll through unreads" redesign — a better solution to the underlying problem (catching up on email quickly), not just a fix to the original implementation
- Quick wins matter: shipping early and often builds the muscle; teams that practice being late get good at being late; teams that practice shipping get good at shipping
- Track the minimum post-launch: total accounts, rough trend direction, and a handful of sanity-check numbers are enough; only instrument what you will actually act on; data analysis that doesn't change your decisions is vanity, not insight
- Post-launch team size should shrink back to a small core (2–3 people) after the launch surge; running permanently at crunch staffing levels destroys the sustainability of the work
- **Code quality is the prerequisite for speed**: a clean, readable codebase lets a single designer or programmer ship a full feature in a day; a ball of mud prevents it regardless of team size; the "judo move" — bending existing components in slightly new ways — only works when the underlying code is well-maintained
- Aim for **durable software**: durable means easy to repair, not just hard to break; code that people are afraid to touch doesn't get improved and slowly rots; lower the cost of change so anyone can get in there and improve things
- Invest in things that don't change: most web fundamentals (cookies, HTTP, relational data) look the same after 20 years; knowledge invested there compounds; new-technology investments carry high obsolescence risk and should be sized accordingly

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
- **Making things that multiply**: look for concepts or patterns in one product that can propagate across others; the most leveraged product decisions are the ones that compound; UI patterns (stacks, unified menus, keyboard navigation) discovered in one product become candidates for the whole portfolio — but let them breathe for months before deciding what's actually worth porting
- New products are **design and technology labs**: a green-field codebase lets you experiment with ideas that would be too expensive or risky to try in an established product; many Rails framework advances came directly from 37signals product launches; this alone justifies building new products even if they never reach Basecamp-scale
- **Revisit the back catalog with benchmarks, not nostalgia**: going back to an earlier product version to find an idea that aged well is legitimate — but evaluate it against a concrete benchmark ("can you immediately orient to what's fresh in this project?"), not a vague feeling of "that was better"; nostalgia is seasoning, not the meal
- Don't formalize style guides across products — keep each product's aesthetic fluid; the living products are the style guide; this fluidity makes it easy to pull a good idea from one product into another without bureaucratic friction
- **Software should be fun**: Easter eggs, hidden keyboard commands, and small moments of levity are worth building; they signal that real humans made the product; they generate organic word-of-mouth that no marketing budget can buy; hiding them behind a key combo means only willing participants encounter them
- **Organizational health test**: can your team ship something genuinely small (an hour of work) in a single day without it touching a QA queue, a roadmap, or a sign-off process? If not, your processes have become too rigid for low-risk work; probe this regularly — the ability to do small things fast is what allows levity, Easter eggs, and rapid market responses

→ Episodes: v1-is-for-us, start-at-the-epicenter, eat-your-own-dogfood, underdo-the-competition, be-a-curator, ignore-the-details-early-on, build-half-a-product-not-a-half-assed-project, good-enough-is-fine, scratch-your-own-itch, what-are-you-replacing, making-things-that-multiply, a-product-pivot, the-f-k-no-feature

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

→ Episodes: narrow-as-you-go, embrace-constraints, less-mass, throw-less-at-the-problem, inspiration-is-perishable, writing-a-pitch, shape-up, rescuing-a-project-in-progress, a-matter-of-ambition

---

## Bugs & Quality

- Bugs are inevitable in any software of real complexity; every piece of serious software ever written has had them; accepting this is not lowering your standards — it is the prerequisite for a mature, sustainable engineering culture
- Not all bugs are equal: separate them into tiers — **Code Red** (data loss, access blocked, financial impact: drop everything), **Code Yellow** (degraded but not catastrophic: fix within the week), and everything else (schedule like any other work); calling everything a "bug" collapses the distinction between "line breaks wrong" and "customer lost emails"
- A healthy bug backlog will contain items that are legitimately never fixed; a "forget drawer" for low-criticality, low-frequency bugs is not negligence — it is prioritization; some bugs survive as long as the software itself
- Bug-free software that nobody wants is "perfectly bad software" — it is not good software; low-quality software that people find valuable can be fixed; an unwanted-but-polished product cannot be rescued by fixing bugs
- **The Andon cord principle**: anyone on the team should be able to call a code and stop the line when they notice something materially wrong; the instinct to wait — because software can be fixed later — is what causes bugs to quietly accumulate; make it culturally safe to pull the cord
- Founders doing early customer support are prone to passing customer frustration directly into the engineering queue without filtering; a professional support layer acts as a triage buffer, preventing intensity-of-complaint from driving prioritization instead of actual impact
- Managing bug load: on-call rotation (two programmers, one week at a time) handles minor issues and escalations; team that built a feature cleans up the first week post-launch; spring cleaning cycles and end-of-year cool-down months address the accumulated backlog
- UX flaws (confusing flows, bad copy, too many steps) matter more than many technical bugs and should be classified in the same triage system; something that "works" but works poorly is a more important fix than an obscure edge-case crash
- Your **company is a product with bugs too**: if customers feel they can never reach you, that inaccessibility is a company-level bug that outweighs many software bugs; fix the company as rigorously as you fix the code
- Build with good habits — automated testing, aesthetic care, simplicity — and quality follows; beautiful, simple code surfaces bugs faster than convoluted code; the habits precede the outcomes

→ Episodes: software-has-bugs

---

## Project Rescue & Ambition

- **Finish one thing completely before starting the next**: the most common cause of projects spiraling out of control is layering new work onto unfinished work; every open thread costs attention and momentum; stop adding, pick the most important open item, finish it 100%, then move on
- The last 10% of any project is often half the work; never let the apparent nearness of completion justify opening new fronts; punch lists in construction and software both grow if you keep adding scope while 90% things sit incomplete
- **Long timelines make problems worse, not better**: the "luxury of time" is actually a curse — more time means more opportunity to defer hard decisions; the easiest moment to stay on track was the beginning; it only gets harder from there; "we'll deal with it later" is the most comfortable sentence and the most damaging habit
- Precise estimates on multi-month projects are a form of self-deception; even 37signals with 20 years of experience regularly overshoots six-week estimates by a week or two; the longer the timeline, the less precise any estimate can honestly be
- Large projects fail because they commit to a specific scope far in advance; the only way to hit a long deadline reliably is to treat it as a budget: "we will ship whatever is finished by that date," not "we will finish everything we specified"
- **Daily standups are the wrong cadence for spotting real problems**: you cannot see that something is genuinely off-track in 24 hours; over-checking creates false confidence and interrupts the builders; async hill charts and weekly check-ins give the signal without the noise
- Constant micro-management is the equivalent of sawing at the steering wheel through a turn — you go slower and lose control; let the team drive, check in at a reasonable distance, and inject urgency deliberately when warranted
- **Ambition is "how much can you do with little"** — not "how much can you accumulate"; the right kind of ambition is about efficiency, leverage, and density: same impact, fewer people, fewer features, less complexity; the consolidation season of technology (after years of expansion) rewards this approach
- The ideal new-product team is three people (two programmers + one designer) — enough to cover all dimensions of the work with essentially zero coordination overhead; Shape Up adds overhead that isn't needed at that scale, so drop the process and just build
- Fix time and resources; leave scope open for renegotiation throughout the build; the pressure of fixed constraints produces better trade-offs and a more focused product than any upfront spec
- **The benchmark competitor is email and WhatsApp** — not other SaaS tools; that's what most people actually default to; building something that beats email for three-person collaboration over two weeks is the bar; complexity beyond that needs to earn its place
- Calm company is the platform for ambitious sprints, not the destination; running at a sustainable baseline is what lets you choose to go somewhere far and uncertain when it matters; if you're always at the red line, you have no reserve for the adventure

→ Episodes: rescuing-a-project-in-progress, a-matter-of-ambition, your-estimates-suck
