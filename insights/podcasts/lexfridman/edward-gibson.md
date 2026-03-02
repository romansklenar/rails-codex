---
title: "Edward Gibson: Human Language, Psycholinguistics, Syntax, Grammar & LLMs | Lex Fridman Podcast #426"
description: "Edward Gibson, psycholinguistics professor at MIT, explains why all human languages minimize dependency lengths, how dependency grammar outperforms Chomsky's movement theory, and why LLMs master linguistic form while likely missing semantic meaning."
source:
  type: podcast
  title: Lex Fridman Podcast
  author: Lex Fridman
  url: "https://lexfridman.com/edward-gibson"
  date: 2024-04-17
tags: [linguistics, psycholinguistics, language, cognition, grammar, syntax, llm, dependency-grammar, chomsky, neuroscience]
---

# Edward Gibson: Human Language, Psycholinguistics, Syntax, Grammar & LLMs | Lex Fridman Podcast #426

## Language Structure and Word Order Universals

- Approximately 40% of the world's ~7,000 languages are subject-verb-object (SVO) like English, roughly 45–50% are subject-object-verb (SOV) like Japanese or Hindi, and about 10% are verb-subject-object (VSO); these three account for nearly all attested word orders.
- Languages show a striking "harmonic" tendency first documented by typologist Joseph Greenberg at Stanford: SVO languages use prepositions (markers before nouns), while SOV languages use postpositions (markers after nouns), and about 95% of the thousand languages with reliable word-order data fit this pattern.
- The explanation Gibson favors for harmonic word order is dependency minimization: placing verbs and their markers on the same side of nouns keeps syntactically related words physically close together, reducing both production and comprehension effort.
- In every language, every sentence can be represented as a dependency tree — a graph-theoretic tree structure where each word connects to exactly one other word and the root is typically the main verb — and no linguist disputes this claim.
- Richard Futrell, an ex-student of Gibson's now at UC Irvine, measured dependency lengths across approximately 64 parsed language corpora and found that in all of them, actual word orders produce shorter dependencies than any random scrambling of the same words, whether or not crossed dependencies are permitted.

## Dependency Grammar vs. Chomsky's Phrase Structure

- Lucien Tesnière published the foundational work on dependency grammar in 1959, but the concept traces back to the ancient Indian grammarian Panini; Gibson prefers dependency grammar because it makes dependency distances between words transparent in a way that phrase structure trees do not.
- Noam Chomsky's 1957 and 1965 frameworks proposed phrase structure grammar — hierarchical expansion rules of the form S → NP + VP — plus a separate mechanism called "movement," where words or phrases shift from a deep structure position to a surface structure position.
- In Chomsky's movement theory, forming a yes/no question in English involves moving an auxiliary verb to the front ("Two dogs will enter the room" → "Will two dogs enter the room?"), treating this operation as a universal grammatical rule.
- Gibson's preferred alternative is the lexical copying account, championed by the late Stanford linguist Ivan Sag: auxiliary verbs simply have two lexical entries — a declarative form and an interrogative form with a slightly different argument structure — so no actual movement is needed.
- Gibson has been at MIT since 1993; his central methodological disagreement with Chomsky, who was also at MIT, is that Gibson runs experiments and corpus analyses to evaluate hypotheses quantitatively, while Chomsky relies entirely on thought experiments and introspective grammaticality judgments.
- Chomsky himself showed in 1971 that phrase structure plus movement creates severe learnability problems — a child cannot determine from input alone which of many equivalent rule systems is intended — and used this as an argument for universal grammar being innate; Gibson argues that abandoning movement eliminates the learnability problem without requiring innateness.
- For any dependency grammar, an equivalent phrase structure grammar exists that generates identical sentences, and vice versa for simple cases; the two formalisms differ mainly in what they make salient, not in their generative power.

## Morphology and Language Diversity

- A morpheme is the minimal unit of meaning within a word; English has relatively sparse morphology, typically one or two morphemes per word, while Finnish can stack up to ten morphemes onto a single root, yielding potentially millions of distinct word forms.
- English encodes third-person singular present tense with an -s suffix (he drinks), plural nouns with -s (dogs), and simple past with -ed for regular verbs (walked), but high-frequency verbs tend to be irregular (drink → drank), likely because frequent use preserves older patterns from language contact.
- Russian has case markers — nominative for subjects, accusative for objects — that attach to noun endings, making word order far freer than English; a Russian sentence meaning "Mary kissed John" remains grammatical regardless of whether the subject or object appears first, as long as the case endings are correct.
- English shifted over roughly a thousand years from a verb-final, case-marking language resembling modern German to a verb-medial language without case marking, largely through contact with French after the Norman Conquest.
- The Queen's vowels: a documented study found that Queen Elizabeth II's vowel sounds shifted measurably between her coronation in 1952 and fifty years later, illustrating that even a single speaker's phonology changes continuously throughout life.

## Cognitive Cost, Center Embedding, and Legalese

- Gibson's dependency length minimization (DLM) theory predicts that the processing cost of a sentence grows with the sum of the distances between each head word and its dependents, measured in intervening words; he suspects the function is exponential rather than linear.
- fMRI research shows that longer dependency distances produce stronger activation in the language network — measured as the BOLD response tied to the oxygen demands of active neurons — providing a neural correlate for the behavioral difficulty of long-distance dependencies.
- Center embedding (also called nesting) refers to inserting a relative clause between a subject and its verb, as in "The boy who the cat scratched cried"; adding a second center-embedded clause ("The boy who the cat which the dog chased scratched cried") is understood by virtually no one in any language and violates no rule of English grammar.
- When Gibson gives subjects a fragment like "The book which the author who…" and asks them to complete it, roughly 60% produce only two verbs even though grammaticality requires three, demonstrating that center embedding overloads working memory even in a written, untimed task.
- Legalese is the most extreme outlier Gibson has found: in a corpus of random contracts, approximately 70% of sentences contain at least one center-embedded clause, compared to roughly 20% in academic or technical writing.
- In a study with collaborator Eric Martinez (a Harvard law student who took Gibson's MIT course), center embedding was the single feature that most harmed recall and comprehension of legal texts — passive voice had zero effect, and low-frequency vocabulary had only a modest effect.
- A hundred practicing lawyers recruited for the study understood the center-embedded versions significantly worse than rewritten non-center-embedded versions with identical legal meaning, and when asked about hiring preferences, the lawyers preferred the simpler writing — suggesting legalese is not consciously optimized for obscurity.
- Gibson's "magic spell" hypothesis for legalese: center embedding may function as a performative register marker — a syntactic signal that the document is legally binding — analogous to how incantations use unusual rhyming forms to signal special authority, even without deliberate intent by individual drafters.
- Nixon's Plain Language Act of 1970 and Obama's Plain Language Act addressed the readability of legal documents; Gibson argues that without a psycholinguistic diagnosis of which specific features cause difficulty, such mandates cannot be effectively implemented.

## The Language Brain Network

- Evelina Fedorenko (Gibson's colleague and wife at MIT) identified a stable left-lateralized language network using fMRI; the network activates reliably for comprehension of any understood language and for language production, whether the stimuli are spoken or written.
- The language network is localized at the scale of cubic millimeters using fMRI, but fMRI measures blood oxygenation with a time resolution of several seconds — too slow to track word-by-word processing during natural speech — leaving the temporal dynamics of syntactic and semantic computation poorly understood.
- Gibson's own language network has remained spatially identical from his first scan in approximately 2006 or 2007 through scans taken recently, suggesting the network's location is as stable as a fingerprint across adult life.
- Tasks that involve complex cognition — spatial memory, music perception, reading computer code, arithmetic — do not overlap at all with the language network; they activate a separate bilateral "multiple demands" network that responds to difficulty in general.
- Reading a programming language like Python or C activates the multiple demands network but not the language network, even in expert programmers — code comprehension is cognitively demanding but processed outside the neural substrate for natural language.
- Constructed languages such as Klingon or the languages invented for Game of Thrones activate the language network in fluent speakers, because their designers built them with enough human-language-like properties to engage the same processing system.
- Global aphasia — caused by strokes that destroy the entire left-hemisphere language network — leaves patients unable to speak, understand speech, read, or write, yet those same patients can play chess, perform arithmetic, drive, and succeed at other complex cognitive tasks, demonstrating that language is a discrete system, not a general-purpose interface for thought.
- Rosemary Varley at University College London has documented global aphasic patients who solve complex logical and mathematical problems at normal accuracy, providing the strongest human evidence that propositional thought does not require language.
- About 70–75% of people report having an inner voice — a phenomenal sense of hearing words while thinking — while Gibson himself does not, and the relationship between inner speech and language network activation remains unclear.

## Language, Thought, and LLMs

- Gibson's view, supported by the fMRI and neuropsychological evidence, is that language is a communication system for packaging thought, not the substrate of thought itself — contradicting Chomsky's position that language is constitutive of human cognition.
- LLMs are, in Gibson's framing, arguably the best current formal theory of language form — they predict what counts as grammatical English better than any symbolic grammar — but they are a black box with too many parameters to count as a parsimonious scientific theory.
- Research by Chris Manning and colleagues at Stanford found that analyzing internal representations of models like BERT reveals structures that closely resemble dependency parse trees, suggesting LLMs learn something functionally similar to dependency grammar from raw text.
- Gibson describes LLMs as most closely aligned with construction-based theories of grammar — usage-based frameworks that treat both individual words and multi-word patterns as form-meaning pairs learned from exposure, with no separate rule component.
- LLMs fail the modified Monty Hall test: if you tell a model that the car is definitively behind door 1 and then ask whether to switch after Monty opens door 3, the model still recommends switching, because it pattern-matches to the Monty Hall problem form it has seen thousands of times rather than tracking the explicit probability information stated in the prompt.
- LLMs reproduce the human failure pattern on center-embedded completion tasks — they drop required verbs at approximately the same rate humans do — even though they were never explicitly trained on grammaticality labels, suggesting they capture something about the processing difficulty of nested dependencies.
- A 2024 paper by Kyle Mahowald (a former Gibson student, now at UT Austin), Fedorenko, and collaborators argues that LLMs excel at formal linguistic competence but lack the "functional linguistic competence" that humans derive from embodied, world-grounded understanding.

## Culture, Color, and the Piraha

- English has 11 basic color terms that virtually all speakers know; the Dani of Papua New Guinea have only two terms (roughly "dark" and "light"), and the Tsimane of Bolivia have between 3 and 7 depending on the individual — yet all groups have normal trichromatic vision and can perceptually distinguish millions of colors.
- Gibson's hypothesis for why industrialized cultures have more color terms: manufactured goods are identical except for color, creating a communicative need to specify color precisely ("the red sweater, not the green one") that doesn't arise when all objects of interest differ in shape, texture, and other dimensions.
- The third color term acquired by cultures as they expand beyond two is invariably a red term; after red, the order is not universal.
- The Piraha of Brazil — studied through linguist-anthropologist Dan Everett, who learned the language as a missionary — have no words for exact numbers; the three quantifier words previously believed to mean "one," "two," and "many" actually mean "few," "some," and "many," as demonstrated by Gibson and collaborators with a simple experiment using spools of thread and red balloons.
- Presenting Piraha speakers with increasing or decreasing arrays of objects revealed that the "one" word was applied to small sets regardless of absolute number and that its use was determined by context, not by cardinality.
- Piraha speakers matched arrays of objects perfectly (a one-to-one correspondence task) up to ten items with accuracy comparable to MIT undergraduates, but when an opaque barrier hid the target array and they had to reproduce the count from memory, their accuracy degraded to approximate estimation above four or five items.
- The likely evolutionary origin of counting words, according to Gibson citing anthropological theory, is agriculture and animal husbandry: tracking whether 17 goats are all present requires abstracting over identity in a way that tracking one's own children does not.

## Language Evolution, Learning, and Universals

- All human children, regardless of language, reach basic grammatical competence by age three or four, and there is no evidence that any language is harder to acquire natively than any other — the difficulty differences observed are all second-language effects that depend on distance from the learner's first language.
- Languages are simultaneously optimized for at least two pressures: dependency minimization (ease of production and comprehension) and regularity of rules (learnability) — the latter explains why no natural language simply scrambles words to achieve perfectly local dependencies, even though that would minimize dependency lengths.
- The Chinese Defense Language Institute ranking rates Mandarin as the hardest language for English native speakers to learn as a second language; the difficulty comes from structural distance from English (tonal system, logographic writing, very different syntax), not from any property of the language as a first-language acquisition target.
- Languages are dying at an accelerating rate globally; Gibson cites Moseten (a language related to Tsimane in Bolivia) as a case where contact with Spanish is causing language shift as speakers seek economic opportunities, while Tsimane itself remains more vital because it has less contact with Spanish-speaking communities.
- Esperanto and other constructed universal languages have failed to spread because language adoption is driven by economic and social utility, not linguistic elegance — the reason English dominates internationally is not that it is easy or beautiful but that the US economy gives people powerful incentives to learn it.

## Animal Communication and Open Questions

- Gibson rejects the claim, often associated with Chomsky, that human language is categorically unique among animal communication systems because of compositionality; his position is that we simply do not yet speak whale or crow, and dismissing their signals as "grunts and squeaks" is circular reasoning.
- The Earth Species Project, co-founded by Aza Raskin, is applying embedding-space analysis to cetacean, corvid, and other animal vocalizations; Gibson finds this research direction scientifically credible and consistent with intellectual humility about the uniqueness of human language.
- The practical method for learning an undocumented language with no prior translators — as Dan Everett did with Piraha — begins by pointing at objects and eliciting labels, then presenting pairs and small sets to probe quantity terms, and relies heavily on the researcher's social willingness to spend years in genuine community contact.
