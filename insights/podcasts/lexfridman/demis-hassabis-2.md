---
title: "Demis Hassabis: Future of AI, Simulating Reality, Physics and Video Games | Lex Fridman Podcast #475"
description: "Demis Hassabis, DeepMind co-founder and Nobel Prize winner, explores his conjecture that any naturally occurring pattern can be efficiently learned by a classical algorithm, and maps the road from AlphaFold to AGI by 2030 via scientific discovery, world models, and cautious optimism about existential risk."
source:
  type: podcast
  title: Lex Fridman Podcast
  author: Lex Fridman
  url: "https://lexfridman.com/demis-hassabis-2"
  date: 2025-07-23
tags: [ai, deepmind, agi, science, biology, physics, games, simulation, consciousness, safety]
---

# Demis Hassabis: Future of AI, Simulating Reality, Physics and Video Games | Lex Fridman Podcast #475

## The "Learnable Nature" Conjecture

- Hassabis proposed in his Nobel Prize lecture that any pattern generated or found in nature can be efficiently discovered and modeled by a classical learning algorithm — he described it as intentionally provocative in the tradition of Nobel lectures.
- The conjecture rests on the observation that natural systems have structure because they were shaped by selection processes — evolutionary, geological, or cosmological — and that structure is what makes them learnable rather than brute-forceable.
- Hassabis calls this principle "survival of the stablest": not just biological evolution, but the weathering of mountains over millennia or the orbital stabilization of asteroids all impose the same kind of learnable structure on systems.
- Man-made or purely abstract problems such as factorizing large numbers may fall outside this learnable class because they lack the selection-imposed structure; those may genuinely require quantum computers.
- The key insight linking AlphaGo and AlphaFold is the same: both built models of combinatorially vast spaces — 10^170 Go positions, 10^300 possible protein conformations — yet both are tractable because nature had already solved them, implying a lower-dimensional learnable manifold.
- Hassabis is actively working in his spare time with colleagues on whether a new complexity class should be defined for problems solvable by neural-network-style processes applied to naturally structured systems — he frames P vs NP as ultimately a physics question when you treat the universe as an informational system.
- Veo 3's ability to model Navier-Stokes fluid dynamics from watching YouTube videos is, to Hassabis, not just a cool demo but empirical evidence that such a lower-dimensional manifold exists for fluid behavior — something he says surprises even him given his background writing physics engines in game development.

## World Models and Video Generation

- Hassabis distinguishes Veo 3's understanding of physics from anthropomorphic understanding: it has modeled enough dynamics to generate coherent 8-second videos that are difficult to fault by eye — he calls this "intuitive physics" akin to a child's understanding, not a PhD student's.
- The fact that Veo 3 acquired intuitive physics through passive observation of video — without embodied interaction — directly challenges the neuroscience theory of "action in perception," which held that you need to act in the world to truly perceive it.
- Hassabis sees interactive, explorable video as the next frontier: the ability to step inside a generated world and move through it, which he views as the beginning of a true world model — a prerequisite for AGI.
- Video generation models reverse-engineering fluid dynamics from YouTube is, in his framing, telling us something fundamental about how the universe is structured, not merely producing impressive content.
- DeepMind's weather prediction system WeatherNet outperforms traditional fluid-dynamics supercomputer models and now enables fast cyclone path prediction — another instance of a neural network modeling what was assumed to require classical brute-force simulation.

## Video Games, Open Worlds, and AI

- Hassabis's early career was defined by open-world simulation games — Theme Park, Black & White — where each player co-created a unique experience; he sees modern AI as finally enabling the vision those games gestured toward.
- Black & White contained what Hassabis calls "still probably the best learning AI in a game": an early reinforcement learning system where a mythical creature mirrored the player's behavior — kind if treated kindly, cruel if mistreated.
- The fundamental problem with 1990s open-world AI was that emergent behavior was fragile and limited; now AI can generate content dynamically in any direction the player goes, enabling a true "choose your own adventure" in which narrative adapts to unconstrained choices.
- Hassabis says his post-AGI sabbatical projects are two things: creating an open-world simulation game as realistic as the universe itself, and working on his physics theory — and he notes that in his mind these are the same question.
- GPUs were originally designed for gaming; in the 1990s, the forefront of AI, graphics, physics engines, and hardware innovation all happened inside the games industry — Hassabis cites this as evidence that games have always been where cutting-edge technology and art fuse.
- Hassabis identifies Civilization I and II as his all-time favorite games and deliberately avoids recent entries so they don't consume his time.

## AlphaEvolve and Hybrid Search Systems

- AlphaEvolve combines LLMs — which propose candidate solutions — with evolutionary computing — which searches novel regions of the space — and Hassabis sees this hybrid as a template: foundation models paired with Monte Carlo tree search, evolutionary methods, or other search algorithms.
- The weakness of classical evolutionary computing in the 1990s and 2000s was that it could never generate genuinely new emergent properties; it only recombined subsets of what was seeded in. Hassabis conjectures that pairing it with LLMs may overcome this limitation.
- AlphaEvolve has already found faster matrix multiplication algorithms through incremental hill-climbing; Hassabis contrasts this with the kind of architectural leap (e.g., the Transformer in 2017) that current systems cannot yet autonomously produce.
- Move 37 in AlphaGo — the never-before-seen strategy that human experts initially dismissed as a mistake — was produced by adding Monte Carlo Tree Search on top of a model; AlphaEvolve applies the same principle in the space of programs and algorithms.
- Hassabis frames evolution itself as a relatively simple search algorithm running on the physics substrate for four billion years of compute time, which generated all biological diversity — he takes this as proof that evolutionary systems can produce genuinely new emergent capabilities.

## Path to AGI and How We Will Know

- Hassabis puts a 50% probability on AGI arriving within five years, i.e., by 2030, but emphasizes that his bar is high: consistent, non-jagged intelligence across all cognitive domains, not today's systems that excel in some areas and fail obviously in others.
- Two missing capabilities he singles out: (1) true invention — formulating a novel conjecture rather than solving one — and (2) the leap of imagination Einstein had when deriving special relativity from the knowledge available in 1905.
- His proposed AGI test has two components: brute-force evaluation across tens of thousands of cognitive tasks to check for consistency, plus exposure to a few hundred of the world's top domain experts (like Terence Tao in mathematics) given one to two months to find obvious flaws.
- A proposed "back-test": give a system all scientific literature up to 1900 and see whether it independently derives special relativity and general relativity — that would be a Move 37 for AGI.
- Another lighthouse moment Hassabis would look for: an AI inventing a game as deep and aesthetically elegant as Go — not just playing Go superbly, but conceiving the rules from scratch.
- He distinguishes incremental hill-climbing — which current systems like AlphaEvolve do well — from the kind of S-curve jump that a new architectural breakthrough like the Transformer represents; he is uncertain whether further S-curves are needed or whether scaling the current paradigm is enough.
- Current systems cannot handle vague, high-level prompts like "invent a game as good as Go" or "make a better version of yourself" — they need the objective narrowed to something tractable before they can improve incrementally.

## Scaling Laws, Compute, and the Race

- Hassabis says scaling is still proceeding on all three fronts simultaneously: pre-training, post-training, and inference-time compute — he does not expect this to stall, and notes that inference may eventually dwarf training in total compute consumed.
- He attributes 80–90% of the breakthroughs underlying modern AI over the past 15 years to Google Brain, Google Research, and DeepMind combined — and argues that if new architectural breakthroughs are required to reach AGI, DeepMind is positioned to produce them because of its deep research bench.
- He is not worried about running out of high-quality training data because enough real-world data exists to seed simulators that can generate synthetic data at the correct distribution.
- On the Gemini product cycle: a full new version takes roughly six months of combined research iteration plus a "hero" pre-training run; the interim model numbers (e.g., 2.5 variants) represent post-training improvements applied to the same base architecture.
- Gemini models cover a Pareto frontier of performance vs. cost/latency: the Flash model is distilled from Pro, allowing developers to choose any point on the performance-speed trade-off that suits their use case.
- Hassabis says that designing AI products requires predicting not what the model can do today but what it will be able to do in 6–12 months, and intercepting that capability curve — a fundamentally more technical product discipline than conventional software design.
- He predicts that current text-box chat interfaces will look archaic within a couple of years, replaced by multimodal, personalized interfaces — possibly AI-generated per user — analogous to the Minority Report interaction paradigm.

## Scientific Discovery and Research Taste

- The hardest part of science is not solving a conjecture but formulating one that is interesting, falsifiable, and worth a Terence Tao's time — Hassabis says current systems clearly cannot do this, and a "naive search on top of a model" will not be sufficient.
- AlphaProof achieved a silver-medal result at the International Mathematical Olympiad; Hassabis speculates that eventually AI may solve a Millennium Prize problem — but inventing a conjecture worthy of study is a harder and more distant target.
- Good experimental design splits the hypothesis space in two: whether the experiment succeeds or fails, you learn something equally valuable about where to search next — Hassabis treats failure as just a negative example in a binary search over possibility space.
- Hassabis's long-term dream is a "Virtual Cell" — a full in silico simulation of a yeast cell, starting at the protein-interaction level (not the atomic level), that can run experiments and generate predictions useful enough to guide wet-lab work, potentially 100x accelerating drug discovery.
- AlphaFold solves the static structure problem; AlphaFold 3 takes the first step toward modeling dynamics by predicting pairwise interactions between proteins, RNA, and DNA; the next stage is modeling whole biological pathways (e.g., the mTOR pathway involved in cancer), eventually scaling to a full cell.
- Isomorphic Labs, spun out of DeepMind on the back of AlphaFold, is applying AlphaFold-style systems to drug design — Hassabis describes it as going well.

## Energy, Civilization, and the Post-Scarcity Vision

- Hassabis bets on solar and fusion as the two primary energy sources in 20–40 years; he notes that the bottleneck for solar is batteries and transmission, while fusion appears "definitely doable" with the right plasma containment design.
- If energy becomes effectively free and renewable, desalination solves global water access (currently only affordable for wealthy countries like Singapore and Israel), electrolysis produces unlimited rocket fuel, and asteroid mining becomes economically viable.
- He describes a potential "radical abundance era" where resource scarcity — including land and materials — is no longer the primary driver of conflict; he views this as removing one of the major vectors of zero-sum geopolitics.
- DeepMind is applying AI to grid optimization and cooling-system efficiency in data centers, and has done plasma-containment work with Commonwealth Fusion; material design (new solar materials, room-temperature superconductors, optimal batteries) is what he calls "one of the most exciting" near-term application areas.
- Hassabis would not be surprised if humanity surpassed a Type I Kardashev civilization within 100 years given the combination of solved energy, AI, and reusable rockets.

## Safety, P(Doom), and Governance

- Hassabis declines to give a P(doom) number, calling it a false precision — but says the probability of civilizational catastrophe is "definitely non-zero and probably non-negligible," which he treats as sufficient justification for cautious optimism rather than recklessness.
- He distinguishes two risk timescales: near-term bad actors repurposing general-purpose AI for harm (biological, nuclear, or otherwise), and longer-term alignment failures as systems become more agentic and autonomous.
- The tension he cannot resolve: open-source AI maximizes benefit to good actors but also provides access to bad actors — he says he has not heard a clear solution to this.
- He hopes the final steps toward AGI will resemble CERN — an international collaborative research effort — rather than a Manhattan Project; he acknowledges the current geopolitical climate makes this difficult.
- Hassabis believes 10 times more safety research effort is needed than currently exists, and expects this to accelerate as the AGI line approaches.
- He argues that AI itself could assist early warning on bad-actor use cases (bio threats, nuclear signals) — provided the AI doing the monitoring is itself reliable, which he acknowledges is a circular dependency.
- The new governance structures required are not just regulatory but involve political philosophy: his priority ordering is first create abundance, then figure out distribution, rather than trying to solve distribution while still in scarcity.

## Consciousness, Substrate, and What Makes Humans Special

- Hassabis's preferred working definition of consciousness is "the way information feels when we process it" — he acknowledges it is not scientifically precise but finds it intuitively useful.
- He disagrees with Roger Penrose's hypothesis that quantum mechanical processes in the brain are necessary for consciousness; he believes classical computation is almost certainly sufficient, though he holds this view tentatively given the absence of a definitive experiment.
- Why we attribute consciousness to other humans: two reasons — same behavior, same substrate. With AI on silicon, the second justification disappears even if the behavioral one is satisfied; this creates a genuinely novel philosophical and ethical problem humanity has never faced.
- He speculates that brain-computer interfaces (e.g., Neuralink-style neural implants) could eventually allow humans to directly experience what it is like to compute on silicon, which might empirically resolve the substrate question.
- DeepMind built DolphinGemma — a Gemini variant trained on dolphin and whale vocalizations — as a step toward an AI-assisted translator of animal communication.
- Hassabis draws on his neuroscience PhD (focused on hippocampal memory and imagination) and frames building AI as the best empirical method for discovering what, if anything, is uniquely special about human minds — by building an intelligent artifact and comparing.

## Competition, Talent, and Google DeepMind's Culture

- Hassabis attributes Google DeepMind's turnaround from perceived underperformance to leadership in roughly one year to the merger of Google Brain and DeepMind's research cultures, combined with what he calls "relentless progress and relentless shipping."
- He still operates Google DeepMind like a start-up despite its scale inside Google — decisiveness and energy rather than layers of management — and describes the combination of world-class research with billion-user product surfaces as unique in the industry.
- On Meta's talent acquisition strategy: Hassabis acknowledges it is "rational" given that Meta is behind the frontier, but argues that the researchers who understand what AGI means are motivated by mission, not compensation alone — and notes that AI salaries have already risen to the point where early-stage interns earn what his entire first seed round was.
- He maintains that if AGI requires architectural breakthroughs rather than pure scaling, DeepMind is best positioned to produce them, citing the historical record: Transformers (Noam Shazeer), AlphaGo (David Silver), and the majority of foundational modern AI came from Google's research organizations.
- He supports ongoing communication with leads at other AI labs, especially on safety topics, explicitly because those channels need to be open before things become more serious — not just because the science is collaborative.
