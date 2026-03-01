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

- New product development runs in three distinct phases: **(1) R&D** — small core team explores and builds tentpole features without fixed deliverables, ripping up and replanting until the architecture is clear; **(2) production mode** — standard Shape Up cycles with shaped pitches delegated to teams; **(3) polish/fill-in** — a final open-ended cycle (or two) with no specific bets, just a mandate to close every loose end before ship
- In the R&D phase, shaping and building happen simultaneously and messily — the team rips up database models mid-cycle, tries directions, abandons them; this is appropriate only for the core team and cannot be delegated; it ends when the fundamental unknowns are answered and the architecture is stable
- **Unknown attacking, not planning**: the first thing built for HEY was "receive an email"; sign-up, login, and user management were hardcoded stubs; start with the one thing you most need to learn, not the one that feels like a safe warm-up
- Teams build their own task lists from a shaped pitch — no tickets are handed to them; tasks are discovered by trying to build, not planned in advance; a list of nine steps for one button is too granular — "make sign-up button work" is sufficient
- Pitches almost always end up *smaller* after discussion, rarely bigger; bring ideas as wet clay, not finished proposals; if a collaborator cuts your pitch in half and it still works, that's a success — not a loss
- Shape Up applied to **client services**: frame the contract as "best version of this feature deliverable in six weeks" rather than a fixed scope; clients accept this once they understand it means something will ship, which most fixed-scope contracts never actually guarantee
- Adapting six-week cycles for client work: shorter contracts reduce the future you need to predict; clients can pitch phase 2 internally using tangible phase 1 deliverables — this unlocks budgets that would never have been approved for a multi-year engagement upfront
- The circuit breaker applies in client work too: a client running out of appetite (realizing 200-unit scale is needed when you've proven one) is a legitimate circuit-breaker moment, not a failure
- Shape Up scales to Fortune 50 companies with the same core problems — too little strategic thinking time, slowdown as teams grow — the methodology isn't only for small teams
- Shape Up is a **cultural practice**, not a technical system: the hardest part of adoption is changing the human interaction patterns (how does work feel? who owns decisions? how do people relate?) not learning the terminology

→ Episodes: shape-up, shape-up-roundtable, writing-a-pitch, shape-up-principle-the-betting-table, shape-up-principle-decide-when-to-stop, shape-up-with-clients, shape-up-print-edition, product-strategy

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

- **V1 aerodynamics**: think of the first version as a physical object in a wind tunnel — every extra feature creates drag; the goal is the smoothest, tightest shape possible, not the most complete one; features that "would be nice" are burrs that slow the whole thing down
- **Start weirder than you intend to end up**: early prototyping is the only moment you can be truly strange — radical visual experiments, unusual interaction models; the spirit of those experiments persists even after you smooth them out; you can never get weirder as you go along, so start there
- New product development is inherently more stressful than feature work on existing products — you are inventing the entirety of an ecosystem with no prior decisions to anchor to, high ambiguity, and frequent disagreements; this is expected and not a sign something is wrong
- **The "slightly embarrassed" test**: if you aren't at least slightly embarrassed when you launch, you waited too long; you could always polish for five more years; set a date, cut to it, and let the world calibrate you
- **Soft openings / staged early access**: invite 5–25 handpicked people before any public announcement; this is not a feature focus group — V1 is for you first; the goal is to surface catastrophic blind spots (broken sign-up flows, data loss paths) that internal testing missed because everyone followed the golden path
- Staged rollout is a **forcing function for priorities**: knowing guests are arriving means you stop debating medium-priority issues and focus only on what would embarrass you in front of a stranger; the entire long priority list collapses into one question — what must be fixed before someone else sees this?
- Use a collaborative chat room (not just email) for early testers: testers corroborate each other's findings ("I saw that too"), which raises the signal quality of issues you'd otherwise dismiss as one-offs
- Avoid the word "beta" — it implies unfinished software and sets the wrong expectation; call it early access; V1 of anything is unfinished by definition; the distinction is early adopters who want to be in early, not a public signal of incompleteness
- Don't make sweeping product changes in the first 30 days post-launch of a new version: fix truly broken things immediately; ignore everything else for at least a month; early complaints are often habituation reactions ("where did X go?") not design failures; the same people who hated a change in v2 will defend it when v3 changes it again
- **Darling features that never get used are dangerous**: the HEY Speakeasy Code had such a good name it became a darling too cute to kill, yet neither Jason nor David ever used it; a feature's catchiness is not evidence of its value

→ Episodes: seven-shipping-principles, launch-now, quick-wins, readying-for-launch, refining-before-release, launch-day, move-fast-when-you-can, you-launched-now-what, designing-hey, enough-is-enough, soft-openings

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

- **Morph vs. rebuild**: a new product version is warranted when a genuinely new interface or structural idea cannot be grafted onto the existing chassis without the result being unrecognizable; if the renovation would go down to the studs, build a new house instead; if the new ideas can be introduced while keeping familiar landmarks in place, morph the existing product
- **Forced vs. optional upgrades**: keeping old versions alive (Classic, v2, v3) lets customers opt out, but it permanently multiplies the support and infrastructure burden; morphing forces everyone forward but requires the new version to be familiar enough that it doesn't feel like a product replacement; choose based on how radical the change actually is
- Invite customers who will be affected by a major version change at least six weeks before launch — walkthroughs, preview videos, written explanations of why changes were made; people can't prevent the change, but being informed and prepared dramatically reduces the backlash surface area
- When designing for real human workflows, look for the real-world physical analogue first: HEY's Reply Later and Set Aside were designed around the "pile on the desk" model of paper mail; software that fights the computer to match how humans actually behave is harder to build but produces genuinely better products

→ Episodes: v1-is-for-us, start-at-the-epicenter, eat-your-own-dogfood, underdo-the-competition, be-a-curator, ignore-the-details-early-on, build-half-a-product-not-a-half-assed-project, good-enough-is-fine, scratch-your-own-itch, what-are-you-replacing, making-things-that-multiply, a-product-pivot, the-f-k-no-feature, itch-for-a-new-version, designing-hey

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

- **Product strategy is not about certainty**: never research and second-guess your way to 99% confidence before acting; that approach is very expensive, very slow, and probably just as likely to be wrong as acting at 75% confidence; the goal is to improve odds while capping the downside — not to eliminate risk
- **Quantify the downside, not the upside**: you cannot reliably predict whether a feature will hit 20% or 22% adoption; you can know exactly how many weeks you are willing to lose; size the bet on the downside, let the upside surprise you
- **Two separate debates in every pitch**: (1) is this the right solution? and (2) does this problem actually matter? These are distinct conversations; a technical objection to a solution is an invitation to find a different angle; a "we don't care about that problem" is a signal to stop pursuing the idea entirely
- Don't attach ego to ideas: most pitched ideas don't happen; come in already knowing it's a long shot, and disagreements stop feeling like losses; the goal is shared understanding of what the product should be, not defense of the specific shape you brought in
- Separate "we disagree on whether this matters" from "we disagree on whether it makes sense technically" — the first kills the idea, the second just sends it back to be reshaped
- Avoid arbitrary success metrics: if you set 20% adoption as the threshold for a feature being worthwhile and you hit 15%, you'll spend the next month trying to explain the shortfall rather than learning anything real; feelings of "customers clearly want this, we've heard it a hundred times" are more reliable planning inputs than manufactured round numbers

→ Episodes: planning-is-guessing, your-estimates-suck, making-the-call-is-making-progress, illusions-of-agreement, decisions-are-temporary, disagree-and-commit, its-all-a-judgement-call, picking-priorities, reasons-to-quit, product-strategy

---

## Scope & Constraints

- **Narrow as you go**: after the initial exploration, work required to finish should shrink over time, not grow; if the pile of to-dos is growing as you approach the deadline, you have a scope problem; freeze features early and enter chiseling/editing mode
- Start with the novel, differentiated work — not the baseline; if you complete only the "table stakes" features, the product has no reason to exist; HEY shipped without signatures because the Screener was novel enough to attract users willing to give that up
- Don't hoard ideas: a backlog of 200 items creates guilt and obligation without creating focus; ideas that matter keep surfacing; declare bankruptcy on long lists and let working memory do the natural filtering — the good ideas re-emerge
- **Constraints force better decisions**: 10 hours/week to build Basecamp forced ruthless prioritization; teams of 2 people prevent over-engineering; six-week cycles prevent gold-plating; companies with unlimited resources build cumbersome, feature-bloated software
- **Throw less at the problem**: adding more people or time to a struggling project usually makes it worse; the answer to "we need more time" is almost always "we need to cut scope"
- **Less mass**: organizational mass accumulates silently — every meeting series, every new policy, every extra hire adds inertia; ask "what if we just didn't do that?" before adding any process, role, or obligation; mass is easier to avoid than to shed
- **Fix the team size, not the workload**: when a team is overwhelmed, the instinct is to hire; the better question is "what does this team size allow us to do?" — cut the work to fit the team rather than expanding the team to fit the work; adding people to an already-complex support role compounds the problem
- **Saying yes to scope is saying yes forever**: roles accumulate scope the same way products do — a "yes" to handling a new category of request is effectively permanent, removing it from active consideration; teams must periodically audit what they've silently adopted and explicitly cut what no longer belongs
- **Let customers outgrow you**: when a customer's needs exceed what your focused product offers, direct them to something more complex rather than expanding your product to match; a customer who graduates is a success, not a loss — they learned what they needed to learn
- **Inspiration is perishable**: act on creative energy when it appears; if you must wait six months to implement a good idea, the energy and clarity are gone; this is another reason to keep cycles short
- Rabbit holes vs. science projects: identify rabbit holes (components that consume disproportionate time for marginal value) in the pitch phase before building; name them explicitly as out-of-scope; a science project is an entire pitch with known low odds of shipping — mark it as such before starting, and timebox it
- Spike uncertain technical questions early: spend two days probing an unknown before betting six weeks on it; a spike is "an investment in information," not lost time — it turns "will this take four weeks or four days?" into a real estimate
- **Less is more in scope decisions**: building something that does 80% of what was imagined in two weeks is often more valuable than building 100% in twelve; you can always add the last 20% later; you usually discover you don't need it
- Reduce organizational drag: keep product teams at two people (one designer, one programmer); avoid meetings that require everyone to synchronize; the distance between "I have a good idea" and "I fixed it" should be very short

→ Episodes: narrow-as-you-go, embrace-constraints, less-mass, throw-less-at-the-problem, inspiration-is-perishable, writing-a-pitch, shape-up, rescuing-a-project-in-progress, a-matter-of-ambition, say-no, let-your-customers-outgrow-you

---

## Saying No

- **Yes is cheap now but expensive later**: saying yes to a feature request, pricing experiment, or product direction costs nothing at the moment of commitment and accumulates silently — as surface area that must be maintained, explained, backed out of, or worked around for years; no is a complete sentence that prevents all of that future cost
- **Yes is a blunt instrument**: every yes is implicitly no to hundreds of other things you could have done instead; saying yes collapses future optionality without the trade-off ever feeling concrete at the moment of the decision
- **Commitments accumulate faster than capacity**: each yes added to a roadmap or a support team's remit is another permanent commitment; before long the next year's decision-making budget is already spent on commitments made when it was easy to say yes and hard to imagine the downstream cost
- **Pull the decision forward**: before saying yes to anything with a future delivery date, ask "would I say yes if I had to do this tomorrow?"; the answer quickly clarifies whether you actually want to do it or just want to have said yes; distance from execution is what makes yes so easy and so costly
- **Don't tell customers no — say thank you**: never let a customer interaction turn into an on-the-spot commitment; respond with genuine thanks, nothing more; customers who write detailed feature requests are giving a gift of insight, not issuing a work order; the gift is the problem description, not the proposed solution
- **Solve patterns, not requests**: customer feature requests are almost always hyper-specific to one person's situation; the job is to find the underlying problem that ten or a thousand customers share and solve that, not to implement the toggle the one customer suggested; working on people's behalf, not on their request, is what produces a coherent product
- **Frame scope with "should we?" not "can we?"**: changing the question from "can we do X?" to "should we make this happen, given everything else?" opens a conversation about appropriateness rather than pure capability; it gives the team a path to redirect a request without a hard no — "we're not the right place for this" is softer and more honest than "no"
- **Saying no requires courage, not just discipline**: the courage required is to accept that turning something down may cost money, disappoint a colleague, or frustrate a customer in the short term; most companies lack this courage and end up with product lines no one can fully explain; the Jobs quadrant (four products, flush everything else) is the canonical example of courage that looked reckless and proved right
- **Complexity compounds aesthetically before it collapses financially**: a pricing page that requires small-type asterisks and comparison charts is the visible surface of internal complexity accreted one "reasonable" yes at a time; the individual yeses all made local sense; the aggregate is indefensible; the only fix is the courage to go back and eliminate the layers, which grows harder with every customer who has adapted to the current complexity
- **New products are the moment of maximum courage**: a product with no customers and no revenue has no constituency defending the status quo; this is the only moment you can make the cleanest decisions, introduce the smoothest design, and say no by default without any collateral damage; use that window fully — it closes permanently the moment the first customer signs up
- **Saying no inside the organization is as hard as saying no to customers**: on-call teams, support rotations, and internal service roles accumulate scope through courtesy and helpfulness; "we can do that" slowly becomes "we always do that" becomes "we must do that"; the same discipline required for product scope applies to internal service scope

→ Episodes: say-no, say-no-by-default, be-a-curator, the-f-k-no-feature

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

---

## Pricing

- Pick a price that feels reasonable, covers costs, and that you yourself would pay — then keep costs low and see if it works; do not try to back out a required price from unknown future customer volume before you have any customers
- **Price per seat creates gamesmanship**: every time someone evaluates adding a user, they run a cost-benefit calculation; bucket pricing (e.g., 0–15 users, 15–30 users) reduces the per-seat anxiety but creates step-function optimization where teams try to stay inside a bucket; flat pricing eliminates the per-user decision entirely
- **The whale trap**: capping your high end (Basecamp's $299 flat ceiling) structurally prevents your product and organization from warping around enterprise sales; once you close a $12k/month deal, the gravitational pull to hire key account managers, add enterprise-only features, and optimize for more whales is nearly irresistible — and that's a fundamentally different company
- Enterprise whale accounts corrupt the product backlog: each whale deal closes as a checkbox in the settings menu; over years this accumulates irreversible complexity that makes the product worse for the small and medium customers who actually liked it
- **Avoid discounts and coupon codes**: public sales train customers to wait; a stable price signals confidence, eliminates "should I wait?" behavior, and respects existing customers who paid the same price without a discount; if you want to experiment with price, do it on new customers only
- Don't change pricing for existing customers: people make commitments based on the price they signed up at; price experiments belong in new-customer acquisition, not retroactive repricing of the base
- **Annual vs. monthly for consumer products**: annual billing is an easier purchase decision (think once a year, not once a month), creates stronger commitment, and avoids the psychological drip of monthly charges; for HEY, annual billing was also required by the irreversibility of claiming a name-spaced email address
- **Scarcity pricing for real estate**: HEY charges more for shorter usernames (3-letter: 3x price, 2-letter: 10x price) because the namespace is genuinely scarcer; price can signal real scarcity rather than just being an optimization lever
- Long-term pricing tests can mislead: a six-month A/B test may show that per-seat pricing increases revenue per account, but misses the four-year secondary effect — fewer signups means fewer people invited to collaborate who then become customers themselves; price elasticity tests need multi-year time horizons to reveal viral effects
- Launching without billing is a legitimate choice: Basecamp launched in 2004 without a payment system; the 30-day free period forced a working billing implementation by day 30; the constraint of "we need to get paid" is a better spec for billing than any amount of upfront planning
- When pricing a new product, consider whether it functions as a standalone or an **accessory** to other tools people already use; accessory pricing (low, flat, "no-brainer") lowers the evaluation threshold and accepts that many users will mix it with other products rather than replacing them
- A large free tier (e.g., 1,000 free cards in Fizzy) serves awareness and adoption over revenue maximization; if the product is not your primary revenue vehicle, having many happy free users who get exposure to your broader product portfolio may be worth more than extracting maximum per-unit revenue

→ Episodes: picking-pricing, launch-now
