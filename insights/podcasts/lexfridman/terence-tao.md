---
title: "Terence Tao: Hardest Problems in Mathematics, Physics & the Future of AI | Lex Fridman Podcast #472"
description: "Terence Tao explores the hardest unsolved problems in mathematics — from Navier-Stokes to the twin prime conjecture — and examines how AI and formal proof systems like Lean are beginning to transform how mathematical research is done."
source:
  type: podcast
  title: Lex Fridman Podcast
  author: Lex Fridman
  url: "https://lexfridman.com/terence-tao"
  date: 2025-06-15
tags: [mathematics, ai, physics, problem-solving, research, formal-proofs, number-theory, fluid-dynamics]
---

# Terence Tao: Hardest Problems in Mathematics, Physics & the Future of AI | Lex Fridman Podcast #472

## On Choosing the Right Problems

- The most interesting research problems are those where existing techniques can do 90% of the job and only the remaining 10% is unknown — not the ones that are clearly hopeless and not the ones that are trivially easy.
- The Kakeya Problem, originating from a 1918 puzzle by Japanese mathematician Soichi Kakeya about rotating a needle in minimum area, turns out to be deeply connected to partial differential equations, number theory, geometry, and combinatorics — a prime example of how a simple geometric puzzle reveals hidden mathematical structure.
- Besicovitch proved that a unit needle can be rotated a full 180 degrees in arbitrarily small area, meaning the minimum area needed approaches zero — a counterintuitive result that took sophisticated construction.
- Building counterexamples for modified or "nearby" problems is a legitimate and productive research strategy: it rules out entire families of approaches, saving years of wasted effort on methods that cannot possibly work.
- Tao describes his problem-solving method as "cheating strategically" — if a problem has ten sources of difficulty, turn off nine of them and solve the one-difficulty version first, then combine the insights; he compares it to Hong Kong action movies where the hero fights goons one at a time.
- When stuck, he fills four giant blackboards with everything he knows about a problem, sits on his couch, and views the whole picture at once — a spatial externalization of the problem state that enables new connections.

## Navier-Stokes and the Nature of Turbulence

- The Navier-Stokes regularity problem — one of the seven Clay Millennium Prize Problems worth $1 million each, and the only unsolved one remaining after Perelman resolved Poincaré — asks whether a smooth initial fluid velocity can ever blow up to infinite velocity in finite time.
- The reason Navier-Stokes is hard is that it is "supercritical": at smaller and smaller scales, the nonlinear transport terms dominate the viscous damping terms, making fine-scale information critical and unpredictable — unlike planetary motion, where bulk aggregate behavior governs dynamics.
- In 2D, Soviet mathematician Ladyzhenskaya proved in the 1960s that no blowup occurs because the 2D Navier-Stokes is "critical" — transport and viscosity are balanced at all scales — but in 3D, the supercritical nature makes the problem wide open.
- Tao's 2016 paper constructed a modified, "averaged" Navier-Stokes equation that provably produces finite-time blowup by engineering energy to transfer scale-by-scale through an "airlock" mechanism — demonstrating that the true equations must use some feature his artificial equation lacks, which rules out many proof strategies.
- Tao's proposed roadmap to blowing up the actual Navier-Stokes involves constructing a fluid analog of a von Neumann self-replicating machine: a configuration of water that acts as a Turing machine, builds a smaller copy of itself at each scale, transfers all energy to it, and then powers down — iterating to a singularity.
- Tao's wife is a trained electrical engineer, and her description of circuit design directly inspired his construction of "electronic circuit" analogues — resistors, capacitors, logic gates — in the fluid equations to control energy flow between scales.
- Conway's Game of Life provides a precedent: starting from just three or four rules, amateur mathematicians crowdsourced the discovery of gliders, glider guns, AND/OR gates, and eventually a self-replicating machine — demonstrating that computation can emerge from simple local rules, exactly the kind of phenomenon Tao wanted to replicate in fluid dynamics.

## Structure vs. Randomness in Mathematics

- A recurring theme across Tao's work is the "dichotomy between structure and randomness": most mathematical objects look random (like the digits of pi), but a small class have detectable patterns, and the deep challenge is proving which category a given object falls into.
- Szemerédi's Theorem (1970s) proves that any set of natural numbers with positive density contains arithmetic progressions of any length — this holds both for highly structured sets like the odd numbers and for genuinely random sets, by entirely different mechanisms.
- Arithmetic progressions are "indestructible" in the primes: even if you discard 99% of the primes arbitrarily, the remaining 1% still contains arithmetic progressions of any length — which is exactly what made the Green-Tao theorem provable.
- Twin primes are not indestructible: someone with access to the prime database could remove just 0.01% of primes, carefully chosen, to eliminate all twin primes while preserving all standard statistical properties — this is why twin primes require fundamentally different proof tools than arithmetic progressions.
- The Green-Tao theorem (that primes contain arithmetic progressions of any length) was proved by a collaboration where Ben Green supplied a weak pseudorandomness condition he could prove, and Tao supplied the ergodic-theory machinery that could use it — after an iterative negotiation where each pushed the other's condition toward the usable boundary.

## Prime Numbers: Deep Structure and Open Problems

- Prime numbers are "atoms of multiplication": every natural number other than 1 is a unique product of primes, but relating this multiplicative structure to additive structure (like shifting by 2 for twin primes) is what makes so many number-theory questions hard.
- The Twin Prime Conjecture is almost certainly true — the Cramér random model of primes assigns it overwhelming probability — but proving it requires going beyond statistical arguments to something about the intrinsic structure of primes that survives adversarial editing.
- Tao and collaborators proved that there are infinitely many pairs of primes differing by at most 246, using a pigeonhole argument over a well-chosen set of "almost primes" — primes with very few factors — but getting the gap down to 2 hits the "parity barrier."
- The parity barrier is the fundamental obstacle to twin primes and Goldbach: no matter what set of almost-primes you choose, the density of true primes within it can never exceed 50%, which is the threshold needed to force twin prime pairs to exist.
- Tao's result on the Collatz conjecture proves that "almost all" starting numbers (in a statistical sense) eventually reach a value much smaller than where they started, analogous to showing most casino gamblers eventually lose — but proving that literally every number reaches 1 requires ruling out that one exceptional outlier.
- Collatz iterations in binary resemble cellular automata patterns, and Conway showed that generalizations of Collatz-type problems can encode Turing machines, making the general class of such problems undecidable — though the specific 3x+1 case may still be decidable.
- Tao believes the Riemann hypothesis will not be solved by any known technique: "There's no even viable stretch. Even if I activate all the cheats I know, there's still no way to get from A to B. It needs a breakthrough in another area of mathematics first."
- A disproof of the Riemann hypothesis would be catastrophic for cryptography: much of modern encryption relies on the assumption that prime-related operations behave randomly, and a false Riemann hypothesis would suggest hidden patterns that attackers could potentially exploit.

## AI and Formal Proof Verification

- The Lean proof assistant produces not just answers but certificates: for every computation, it generates a formally verified proof tree that guarantees correctness as long as you trust the compiler — and the Lean developers have deliberately kept the compiler small and provided multiple independent implementations.
- Formalizing a proof in Lean currently takes roughly 10 times as long as writing it by hand, but that ratio is declining — Tao predicts a phase shift will occur when the ratio drops below 1, making it natural to write papers in Lean first, similar to how LaTeX displaced all other typesetting tools within a few years once it became easier to use.
- Lean enables "trustless mathematics" at atomic scale: Tao has collaborated on proofs with dozens of people worldwide, many of whom he has never met, because Lean's verification gives him a certificate of trust for each contribution without requiring personal assessment.
- When a paper's constant was improved from 12 to 11, updating the Lean formalization took only a day or two: changing the number caused roughly 10% of proof lines to turn red (fail), isolating exactly which steps needed rethinking, versus the full manual check pen-and-paper proofs require.
- Tao's Equational Theories Project generated 22 million algebraic implication questions — does commutativity imply associativity? (No.) — and crowdsourced 50 mathematicians via GitHub using Lean to resolve all but two of them, with a 50-author paper planned, something previously impossible without formal verification.
- DeepMind's AlphaProof achieved silver-medal-equivalent performance on IMO problems using reinforcement learning on formal Lean proofs — but required three days of Google's compute for a single problem, and the exponential scaling makes graduate-level mathematics currently out of reach.
- AlphaProof's silver medal performance involved human assistance with formalization and took far longer than the competition time limit allows — Tao envisions a proper AI Math Olympiad where AI gets the same problems, same time, and outputs graded in natural language by the same human judges.
- LLM-generated mathematics has a dangerous property: errors look superficially flawless, unlike human errors that often smell wrong immediately — the AI is trained to produce text that looks correct rather than text that is correct, so mistakes are subtle yet ultimately obvious once found.
- AI is genuinely useful for literature search (pointing toward the right lemma in Mathlib) and for code assistance (Tao cut simple Python scripting from 2 hours to 10–15 minutes using AI), but LLM hallucination of citations currently makes it unreliable for discovering genuinely new references.
- Tao predicted in print that by 2026 there would be research-level math papers with genuine AI collaboration — not just autocomplete but AI contributing to verifications or computations — and considers this prediction already validated as of the podcast date.
- Within this decade, Tao expects AI to generate a meaningful mathematical conjecture linking two fields that humans considered unrelated, and have a real chance of being correct — which he identifies as the more likely near-term breakthrough than solving a major theorem.
- The missing training data for AI to discover new mathematics is the "negative space": the failed attempts, abandoned approaches, and revised conjectures that mathematicians never publish because they are embarrassing, leaving AI with only the winners and no access to how the search actually unfolded.

## Perelman, Ricci Flow, and Solving in Isolation

- Grigori Perelman proved the Poincaré Conjecture — the only solved Millennium Prize Problem — by working essentially alone for seven years, resolving a question about whether every simply-connected compact 3-manifold is homeomorphic to the 3-sphere.
- Perelman's key insight was to introduce "Perelman's reduced volume" and "Perelman entropy" — new conserved-like quantities that transformed the Ricci flow problem from supercritical to critical, making the nonlinearities suddenly tractable by existing techniques.
- Richard Hamilton's Ricci flow approach smooths an arbitrary curved space toward a sphere shape, but in 3D it produces singularities — neck pinches and more exotic collapses — and Perelman had to classify every possible singularity type and show surgical repair was possible for each.
- Poincaré in higher dimensions (4D and above) was actually solved earlier and more easily, because extra dimensions provide room to perform the required deformations — 3D is the hardest case precisely because the space is too constrained.
- Perelman declined both the Fields Medal and the $1 million Millennium Prize, stating the prize is "completely irrelevant" if the proof is correct — Tao notes that Perelman is "an outlier even among mathematicians who tend to have idealistic views."
- Tao's own near-miss experience: he and four co-authors spent two months thinking they had solved a hard PDE problem, discovered a missing estimate for the 13th of 13 terms just as they were planning celebrations, and ultimately only solved the problem after two more years of increasingly desperate attempts — the false dawn kept them engaged long enough to find the real solution.

## The Nature and Beauty of Mathematics

- Tao identifies as a mathematical "fox" rather than "hedgehog": he prefers to learn the tricks of one field and apply them to another that seems unrelated, performing "arbitrage" across disciplines — in contrast to hedgehogs who know one area deeply and comprehensively.
- John Conway's concept of "extreme proofs" — treating the space of all proofs as having shape, and seeking the extreme points such as the shortest, most elementary, or most elegant — opened Tao's eyes as a graduate student to the idea that a proof itself has craftsmanship, not just correctness.
- The Euler identity e^(πi) = -1 unifies three previously separate mathematical concepts: exponential growth (dynamics), rotation by π radians (geometry), and 90-degree direction change (complex numbers) — to Tao, its beauty lies entirely in this unification rather than in the coincidence of fundamental constants.
- Hamilton's reformulation of Newton's laws into Hamiltonian mechanics — placing energy at the center rather than force — was retroactively validated when quantum mechanics arrived and turned out to also be governed by a Hamiltonian, even though quantum and classical Hamiltonians are completely different types of mathematical objects.
- Noether's theorem connects every symmetry of a physical system to a conservation law: translational symmetry gives conservation of momentum, rotational symmetry gives angular momentum, time-translational symmetry gives energy — and this connection transfers perfectly from classical to quantum mechanics via the Hamiltonian.
- The obstacle to unifying general relativity and quantum mechanics is conceptual, not computational: we lack the right fundamental objects, the analog of the Hamiltonian that would organize everything, because we cannot use Cartesian coordinates at Planck-scale distances where spacetime itself fluctuates.
- String theory has been the leading candidate for a Theory of Everything for decades, but Tao says it is "slowly pulling out of fashion" because it is not matching experimental predictions — the problem of unification remains completely open.

## Mathematics as Science and Epistemology

- Science is an interaction between three things that are always distinct: actual reality, observations of reality, and mathematical models — and progress consists of observations and models getting closer to reality, which requires repeatedly discarding initial intuitions.
- A good physical theory is a compression of the universe: the dark matter / dark energy model has roughly 14 parameters but explains petabytes of astronomical observations — the fewer parameters needed to fit more observations, the better the theory.
- Universality explains why mathematics is unreasonably effective: many macroscopic laws emerge from microscopic interactions and depend on only a small number of parameters (temperature, pressure, volume for a gas of 10^23 particles), which is why a model written in five pages can predict almost everything about the system.
- The 2008 financial crisis was a failure of universality assumptions: mortgage default models assumed Gaussian (bell curve) behavior because defaults were supposedly uncorrelated, but systemic shocks caused correlated defaults — non-Gaussian behavior that the models, despite being mathematically beautiful, could not handle.
- Infinity is a mathematical idealization of "arbitrarily large": it makes mathematics cleaner but requires careful analysis to avoid errors, such as the fact that rearranging an infinite series can change its sum — and "finitizing" infinite results (giving explicit bounds and rates) restores intuition at the cost of much messier formulas.
- The mathematical community, viewed as a collective entity, is "incredibly super intelligent" — far beyond any individual mathematician — and platforms like MathOverflow give glimpses of this collective intelligence with remarkably fast responses to hard questions.

## Cognitive Style and Mathematical Thinking

- Evolution did not give humans a "math center" in the brain — instead, mathematicians repurpose existing centers: visual thinkers repurpose the vision center, symbolic thinkers repurpose the language center, competitive puzzle-solvers repurpose the gaming center — producing fundamentally different but equally valid mathematical cognition.
- Tao solves problems with a lot of drawing and "bespoke doodles that only make sense to me" on blackboards, and increasingly uses AI to reduce the friction of plotting functions or running simple simulations — tasks that previously took two hours in Python now take 10–15 minutes.
- To develop a gauge transformation for the wave maps equation, Tao closed his eyes, lay on the floor at his aunt's house in Australia, and imagined himself physically being the vector field and rolling around — a form of embodied mathematical visualization that his aunt found inexplicable.
- "Structured procrastination" is a practical trick: when you don't want to work on a problem, imagine a more unpleasant task you don't want to do even more, and use the first problem as the procrastination from the second — a psychological hack that exploits relative aversion.
- For difficult problems, you should always try something, even if it seems stupid — the way a naive approach fails is informative: if it fails because it ignores a specific hypothesis, that hypothesis must be important, which is a clue about where the real proof must go.
- Tao warns against "mathematical diseases" — problems that consume a mathematician completely, derailing their career for years in pursuit of one result — and credits his own productivity partly to his willingness to move on when a problem is not yielding: "I switch to a different problem. I'm a fox, not a hedgehog."
