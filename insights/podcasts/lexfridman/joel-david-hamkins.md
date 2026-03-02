---
title: "Infinity, Paradoxes, Gödel Incompleteness & the Mathematical Multiverse | Lex Fridman Podcast #488"
description: "Joel David Hamkins, the all-time top-ranked user on MathOverflow and a philosopher-mathematician at Notre Dame, walks through the foundations of modern mathematics — from Cantor's hierarchy of infinities through Gödel's incompleteness theorems to the set-theoretic multiverse. The conversation traces how each crisis in the foundations of mathematics opened a new and richer landscape of ideas."
source:
  type: podcast
  title: Lex Fridman Podcast
  author: Lex Fridman
  url: "https://lexfridman.com/joel-david-hamkins"
  date: 2025-12-31
tags: [set-theory, infinity, cantor, godel, incompleteness, mathematical-logic, foundations-of-mathematics, continuum-hypothesis, forcing, mathematical-multiverse, surreal-numbers, computability, infinite-chess, philosophy-of-mathematics]
---

# Infinity, Paradoxes, Gödel Incompleteness & the Mathematical Multiverse | Lex Fridman Podcast #488

A conversation that moves step by step from Cantor's diagonal argument through Gödel and Turing to Hamkins's own multiverse view of set theory, with each idea shown to be a variation on the same diagonalization trick.

## Cantor and the Hierarchy of Infinities

- Aristotle held that only potential infinity is coherent; actual infinity was considered philosophically incoherent from antiquity through the 19th century.
- The Galileo paradox — that perfect squares can be put in one-to-one correspondence with all natural numbers, yet the squares appear to be a proper subset — was known in the 17th century but was taken to show the incoherence of infinite comparison rather than resolved.
- The Cantor–Hume principle defines equinumerosity by one-to-one correspondence; Euclid's principle says the whole is always greater than the part — these two principles are consistent for finite sets and contradictory for infinite ones.
- Hilbert's Hotel illustrates that adding one guest, or infinitely many guests on a bus, or infinitely many buses each with infinitely many passengers, still leaves a countably infinite hotel that fits everyone — accomplished by moving guests to even-numbered rooms and using prime-power encoding (3^C × 5^S) to assign unique odd rooms to each passenger on car C, seat S.
- The zigzag diagonal path through the integer grid is an alternative to prime-power encoding: it proves the countable union of countable sets is countable by visiting every grid point on a single list.
- Rational numbers, despite being densely ordered (between any two fractions lies another), are only countably infinite — the same 3^P × 5^Q trick encodes each fraction P/Q into a natural number.
- Cantor's 1891 diagonal argument constructs a real number Z whose Nth decimal digit differs from the Nth digit of the Nth number on any proposed list, proving no list can contain all reals — the exclusion of digits 0 and 9 in Z's construction avoids the dual-representation problem (0.999… = 1.000…).
- Most real numbers are transcendental: Cantor proved this as a corollary of uncountability because the algebraic numbers (roots of integer polynomials) are countably many, and the algebraic plus countable cannot fill the uncountable reals.

## Russell's Paradox and the Axiomatization of Set Theory

- Cantor's set theory was pre-axiomatic; he worked without a formal list of axioms, and his ideas were severely attacked by Kronecker, who called him a "corrupter of youth."
- Russell's paradox — the set R of all sets that do not contain themselves leads to R ∈ R ↔ R ∉ R — emerges directly from unrestricted comprehension, the informal principle that any property defines a set.
- Russell sent his paradox to Frege just as Frege was completing his logicist program; Frege recognized immediately that it destroyed his system.
- Diagonalization is the common core of Cantor's argument, Russell's paradox, Gödel's incompleteness, and Turing's halting problem — each constructs an object that differs from every object on a given list.
- Zermelo formalized the first axiomatic set theory in 1908, motivated partly by the controversy over his 1904 proof that the axiom of choice implies the well-ordering principle.
- ZFC (Zermelo–Fraenkel with Choice) adds the replacement and foundation axioms to Zermelo's system and eliminates ur-elements (atoms that are not sets): Hamkins attributes this to structuralism — any structure with ur-elements is isomorphic to one without, so they are never mathematically necessary.

## Gödel's Incompleteness Theorems

- Hilbert's program aimed to find a complete, consistent, computable axiomatization of mathematics — a finite list of axioms from which all mathematical truths could be derived by proof.
- Gödel's first incompleteness theorem (1931): any consistent, computably axiomatized theory that is strong enough to express basic arithmetic must contain statements that are neither provable nor refutable — independence is inescapable.
- The fastest proof of incompleteness goes through the halting problem: if a complete consistent theory of arithmetic existed, a theorem-enumeration machine could wait for either "program P halts" or "P does not halt" to appear, solving the halting problem — which is impossible.
- Gödel's second incompleteness theorem: no such theory can prove its own consistency, meaning the statement "this theory is consistent" is always among the independent statements.
- Hamkins frames incompleteness not as trauma but as a clarifying discovery about mathematical reality: knowing that no finite axiom list can answer all questions is itself useful knowledge that enables a different kind of research.
- The provability decision problem (given a theory and statement, does the theory prove it?) is equivalent to the Halting Problem and was first formulated as Hilbert and Ackermann's Entscheidungsproblem; Turing's 1936 paper proves it undecidable.

## Truth vs. Proof

- Tarski's disquotational theory of truth: the sentence "Snow is white" is true if and only if snow is white — truth is defined by removing quotation marks, then recursively extending this through all logical connectives and quantifiers.
- Truth is semantic (about mathematical structures and what holds in them); proof is syntactic (a finite sequence of sentences obeying formal inference rules).
- A proof system is sound if truth is preserved by every inference step, and complete if every logical consequence has a proof — Gödel's completeness theorem (distinct from incompleteness) proves classical first-order logic has both properties.
- A third, often-omitted requirement: proof verification must be computably decidable — given a claimed proof, we must be able to check mechanically whether it is genuinely a proof.
- Gödel's incompleteness theorem separates truth from provability: for any consistent computable theory, there exist true statements (in the standard model of arithmetic) that the theory cannot prove.
- Hamkins names the truth–proof distinction as the most beautiful idea in philosophy: truth concerns objective mathematical reality independent of human knowledge; proof concerns the interaction between a knower and that reality.

## The Halting Problem and Computability

- The halting problem: given a program, does it ever halt? Answering "yes" is straightforward (just run it and wait), but answering "no" requires understanding the program's behavior without ever being able to conclude from finite observation alone.
- The undecidability proof is a diagonal argument: assume a halting oracle exists; use it as a subroutine in program Q that halts if and only if Q does not halt on input Q — a direct contradiction.
- Rice's Theorem generalizes this: no non-trivial extensional property of programs (any property that depends only on what a program computes, not how it is coded) is computably decidable.
- Conway's Game of Life is a playground for undecidable questions: whether a given cell will ever become alive is equivalent to the halting problem and is only semi-decidable.
- Hamkins and Alexey Myasnikov proved that the halting problem has a "black hole": a computable procedure that correctly answers almost all instances (asymptotic density 1), because programs without any halt-state transition — about 1/e² ≈ 13.5% of all Turing machines — trivially never halt, and the Pólya recurrence theorem for random walks accounts for nearly all remaining programs.
- The black-hole result means almost every Turing machine either has no halt instruction or falls off the tape before repeating a state — two "stupid" reasons that cover essentially the entire space of programs.

## The Continuum Hypothesis

- The continuum hypothesis (CH): there is no infinity strictly between the countable infinity of natural numbers and the uncountable infinity of the real numbers — the first problem on Hilbert's 1900 list.
- Cantor spent his final years obsessed with proving CH; he died in a sanatorium in 1918, having failed.
- Cantor proved CH for all closed sets via the Cantor–Bendixson theorem — the proof required inventing the ordinal numbers.
- CH also holds for all Borel sets, and (assuming large cardinal axioms) for all projectively definable sets — carrying out Cantor's strategy of working up through hierarchies of complexity.
- Gödel (1938): in the constructible universe L, both the axiom of choice and CH are true — showing ZF cannot refute CH.
- Cohen (1963): inventing the method of forcing, he built a model of set theory in which CH is false — showing ZFC cannot prove CH.
- Together, Gödel and Cohen established that CH is independent of ZFC: it can be consistently added or negated.
- No known large cardinal axiom settles CH; the hierarchy of large cardinals (whose consistency-strength grows without bound, by Gödel's second incompleteness theorem) leaves CH undetermined at every level.

## The Mathematical Multiverse

- The universe view (monism): there is one true set-theoretic reality, ZFC is just incomplete, and the goal is to find the missing axioms that resolve CH and other independent questions — championed by Hugh Woodin (Hamkins's own PhD supervisor).
- Hamkins's multiverse view (pluralism): the thousands of forcing arguments that produce incompatible set-theoretic universes show that mathematical reality has genuine plurality — there is no single "true" universe, only a multiverse of equally legitimate set-theoretic worlds.
- Forcing is the technique for building new set-theoretic universes from old ones: starting in a ground model, one attaches a generic filter over a partially-ordered set of conditions to extend the universe and add new sets — for example, adding many new subsets of ω to make CH false.
- Hamkins and Benedikt Loewe proved theorems on the modal logic of forcing and set-theoretic potentialism: the set-theoretic multiverse has modal logical structure, with possible worlds (forcing extensions) connected by accessibility relations.
- Set-theoretic geology (Hamkins, Fuchs, Reitz): "reverse forcing" — given a universe, find the ground models from which it might have been obtained by forcing. The set-theoretic mantle is the intersection of all grounds, and its properties are central to the Woodin program despite being inspired by the pluralist perspective.
- Forcing is analogous to working with complex numbers to prove real results: enter the imaginary forcing extension, perform the argument, then descend back to the ground model with a theorem that holds purely within it.
- Proving an independence result does not mean the wrong question was asked; for Hamkins it means exactly the right question was asked — one that reveals a fundamental cleavage ("carving nature at its joints") between mathematical worlds where the statement holds and worlds where it does not.

## Surreal Numbers and Conway

- Surreal numbers, invented by John Conway, are generated by a single rule applied transfinitely: at each stage, partition existing numbers into a left set L and right set R (all of L less than all of R), and create the new surreal number {L | R} that fills the gap.
- Day 0 produces 0 = {∅|∅}; day 1 produces 1 = {0|∅} and −1 = {∅|0}; day 2 produces ±2 and ±1/2; finite days produce all dyadic rationals; day ω produces all real numbers, the ordinal ω, −ω, and the first infinitesimal ε = {0 | 1, 1/2, 1/4, …}.
- The surreal numbers form a proper class (not a set) because they contain all ordinals; they satisfy the field axioms (addition, multiplication, subtraction, division) and also admit square roots and roots of all odd-degree polynomials, making them a real closed field.
- Surreal numbers are fundamentally discontinuous: no non-trivial set of surreal numbers has a least upper bound, and there are no convergent sequences — calculus via limits fails, but calculus via infinitesimals (Robinson's non-standard analysis) remains available.
- Conway's greatest personal disappointment, as he stated at a conference Hamkins organized, was that surreal numbers never achieved the foundational unifying role he envisioned across mathematics and science.
- Philip Ehrlich holds that Conway partly undermined his own case by presenting surreal numbers as a game and a playful toy rather than a serious foundation.

## Infinite Chess and Ordinal Game Values

- Infinite chess is played on the infinite integer grid with standard chess pieces (no promotion, since there is no edge; infinite play is a draw); positions are not standard starting positions but hand-constructed initial configurations.
- A position has game value ω if white can guarantee checkmate in finitely many moves, but there is no fixed N for which white can guarantee checkmate in at most N moves — black controls the duration by choosing any finite countdown at the start.
- Hamkins's first infinite chess paper (with Corey Evans, a U.S. national chess master and philosophy professor) constructed positions of game value ω, ω², and ω³; a follow-up with Evans and Norman Perlmutter reached ω⁴.
- The question of what game values arise in infinite chess originated as a MathOverflow question by Noam Elkies; it is cited in the arXiv paper.
- It is now known that every countable ordinal arises as the game value of some infinite chess position.
- The proofs require both ordinal arithmetic (determining what value a position needs) and detailed chess verification (ensuring no piece can leak from a cage, no pawn hangs, etc.) — Evans caught and fixed many such errors during the collaboration.

## Mathematical Practice and Philosophy of Mathematics

- Hamkins's preferred mathematical style: simple, clear arguments that prove surprising results — he is skeptical of extremely complicated arguments because they may conceal errors he cannot detect all at once.
- Structuralism in the philosophy of mathematics holds that the only mathematically relevant features of objects are their structural roles — the "substance" of the number four is irrelevant; what matters is how four behaves in its system, and any isomorphic copy is equally valid.
- The Julius Caesar problem (Frege): the Cantor–Hume principle gives identity criteria for numbers (same number if sets are equinumerous) but not membership criteria (is Julius Caesar a number?). The structuralist answer is that the question is meaningless — plug Julius Caesar into the role of 17, and it becomes 17.
- Mathematical ontology: Hamkins is a realist — abstract objects have genuine existence — but argues that mathematical existence is better understood than physical existence, since the deeper we probe physics the more mysterious matter becomes (from billiard balls to atoms to quarks to wave functions), while mathematical structures only become clearer as we articulate them further.
- Mathematics progresses cumulatively and the questions change as understanding improves; philosophy has eternal questions that may not be answerable. Hamkins expects mathematics a thousand years from now to be as incomprehensible to him as today's mathematics would be to ancient Greeks.
- Hamkins's research method is collaborative and playful: he has nearly a hundred co-authors, many relationships beginning on MathOverflow; he plays with examples, changes small features, and follows curiosity rather than grinding at single problems.
- On AI for mathematics: LLMs produce text that looks like a proof rather than a proof — they are optimized for plausibility, not correctness — and Hamkins draws the analogy to LaTeX-typeset homework that looked like a published theorem but contained bonehead errors he failed to catch precisely because of the beautiful formatting. He finds current AI unhelpful for his own mathematical work, though useful for programming.
