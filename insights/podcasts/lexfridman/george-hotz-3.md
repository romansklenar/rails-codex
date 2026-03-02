---
title: "George Hotz: Tiny Corp, Twitter, AI Safety, Self-Driving, GPT, AGI & God | Lex Fridman Podcast #387"
description: "George Hotz covers his founding of tiny corp and the tinygrad neural network framework, his case for decentralized AI compute as a defense against power concentration, and sharp critiques of AI safety orthodoxy, closed-source LLMs, and legacy software complexity."
source:
  type: podcast
  title: Lex Fridman Podcast
  author: Lex Fridman
  url: "https://lexfridman.com/george-hotz-3"
  date: 2023-06-30
tags: [ai, hacking, self-driving, agi, programming, tiny-corp, open-source, ai-safety, llm, gpu, twitter, decentralization]
---

# George Hotz: Tiny Corp, Twitter, AI Safety, Self-Driving, GPT, AGI & God | Lex Fridman Podcast #387

## Existential Risk and How Humanity Ends

- Hotz's most likely scenario for human extinction is wire-heading — humans amusing themselves to death staring at an infinitely optimized TikTok feed until they forget to eat or stop reproducing, not a dramatic robot uprising.
- He distinguishes AI killing "everything we call society today" from actually killing the human species — he thinks annihilating all of humanity is extremely hard and some people will survive and rebuild, possibly with strong taboos against technology resembling an Amish society.
- The real danger from AI is not autonomous machine rebellion but humans using AI to manipulate other humans — the machine is a tool, and there are many humans already very interested in manipulation.
- Nuclear weapons did not kill everyone because they cannot be deployed tactically — total nuclear victory leaves only an irradiated pile of rubble, which is useless for subjugation; AI does not share this limitation and the "little red button" is much easier to press.
- Human intellectual diversity is declining, not increasing — global interconnectedness via the internet homogenizes culture in the same way globalization means you can get McDonald's in China, and this reduction in diversity is a vulnerability.
- Hotz believes we will achieve silicon superintelligence long before we achieve robotic robustness — AI systems cannot self-reproduce without a semiconductor fab, which requires civilization-scale infrastructure, so an AI apocalypse likely kills the AIs too.
- The two "stacks" of life — biological and silicon — differ fundamentally in that reproduction is at the absolute core of the biological stack from the first proto-RNA organisms, while the silicon stack remains nowhere near self-replication.

## AI Safety, Open Source, and the Centralization Problem

- Hotz's central thesis about the world: things that centralize power are bad, things that decentralize power are good — this single principle drives his work on tinygrad, tinybox, and his advocacy for open-source AI.
- He argues that AI safety researchers will build the exact thing they fear — insisting on one aligned controlled model is precisely the path to a paperclip maximizer; the only safe future is one where everyone has their own AI.
- Hotz claims GPT-4 has 220 billion parameters and is a 16-way mixture-of-experts model with 8 sets of weights — information OpenAI refuses to disclose while citing "AI safety," which he calls using safety as a marketing tool.
- OpenAI's withholding of GPT-2 in 2019 as a safety precaution was, in retrospect, laughable given how weak that model is now — Hotz sees this as evidence that AI safety framing is used to hype companies rather than address real risks.
- His key philosophical point: he does not object to companies keeping model weights closed for business reasons, but using "AI safety" to justify not even disclosing parameter counts is simply dishonest.
- The only legitimate positions on dangerous AI are either give it to everyone or give it to no one — "only trusted authorities should have access" is not a defensible position because power gravitates to bad actors; if you restrict access, the bad humans will get it, as they always do.
- An open-source AI acts like an ad blocker for the mind — if a state actor deploys 1,000 manipulative bots on Twitter, a powerful local AI could flag them the way ad blockers flag ads, making widespread AI the defensive answer to widespread AI misuse.
- Decentralization always beats centralization from a safety standpoint because good outnumbers bad, and if you give AI to everyone, you give it to more good people than bad people in absolute terms — this is the same logic underlying democracy.
- He lost $80,000 investing in Meta and says releasing LLaMA made it worth it — he considers Meta's open-source AI strategy one of the most important moves in the industry.

## tiny corp, tinygrad, and the Hardware Stack

- Hotz started tinygrad as a toy project to teach himself convolutions, then realized if Nvidia became a monopoly on AI compute, nationalization becomes a real threat — he asked Jensen Huang to consider this directly.
- The key insight driving tinygrad's design: 95% of neural networks are pure DSP-paradigm computation — statically scheduled adds and multiplies — yet every layer of the modern ML stack is Turing complete, from Python to CUDA kernels to PTX to the processor itself.
- Tinygrad has approximately 25 primitive operators compared to PyTorch's ~2,000 kernels and XLA's ~250 (Prim Torch) — a 10x reduction that he frames as RISC vs. CISC; Angelina Jolie delivered the line "RISC architecture is going to change everything" in the 1995 movie Hackers, and ARM has since proven it true.
- The four operator families in tinygrad are: unary ops (pointwise, same-size output), binary ops (two equal-sized tensors in, one out), reduce ops (dimensionality reduction via sum or max), and movement ops (reshapes, permutes, expands, flips requiring no actual computation).
- Tinygrad has no primitive MatMul operator — matrix multiplication is expressed as shape operations (permutes and expands on two matrices), an element-wise multiply in N-cubed space, and a reduce back down to N-squared.
- Lazy evaluation (not computing A×B until the user forces realization) enables operation fusion: PyTorch's "A times B plus C" writes intermediate results to memory twice; tinygrad fuses the multiply and the add into a single kernel, dramatically reducing memory bandwidth.
- Tinygrad is already deployed in production: openpilot switched the driving model from Qualcomm's own libraries to tinygrad roughly 8 months before this recording, and tinygrad runs 2x faster than Qualcomm's library on the Snapdragon 845 Adreno GPU.
- The primary problem tinygrad solves is porting ML models to new accelerators — companies like Graphcore, Cerebras, Tenstorrent, and Groq built good chips but terrible software because writing 250 hand-tuned kernels for each accelerator is almost impossible.
- His strategy: first build a performant Nvidia/AMD stack with far fewer lines, then use that framework to design a custom accelerator — you cannot build a chip's software without first mastering the GPU software, and your chip's first tape-out is always worse than a GPU.

## tinybox and Decentralized Compute

- The tinybox is priced at $15,000 and targets approximately 1 petaflop of compute, over 100GB of GPU VRAM, over 5 TB/s of GPU memory bandwidth, and 4 NVMes in RAID delivering 20-30 GB/s of drive read bandwidth — all within a single 120-volt, 15-amp wall outlet.
- The tinybox uses 6 GPUs because AMD EPYC processors have 128 PCIe lanes, and Hotz reserves some lanes for drives and networking, making 6 the natural maximum that fits.
- The target out-of-box experience is running a 65-billion-parameter LLaMA model in FP16 at a usable 5-10 tokens per second — owning the largest language model you can run at home.
- The fundamental limitation of cloud compute is who owns the off switch — Hotz's philosophy is that the cloud is dangerous because someone else controls when your compute disappears.
- He is also designing a "Tiny Rack" for the garage powered by an EV charger circuit (~10,000 watts vs. a wall outlet's ~1,500 watts), which he describes as the most power you can get into a home without arousing suspicion.
- Comma.ai's compute cluster runs at 40 kilowatts at idle and has 800 amps of capacity — he deliberately calls it a "compute cluster" not a "data center" because data centers have air conditioning while his runs fans.
- His view on AI alignment: when you buy an AI from a big cloud company, that AI is fundamentally aligned to the company, not to you — running your own model on your own hardware is the only way to ensure the AI stays aligned with your interests.

## Self-Driving and Comma.ai

- Comma.ai has 5,000 daily active users of openpilot and has kept pace with Tesla FSD, which remains one to two years ahead — Hotz believes Tesla is not doing anything wrong, they simply have more resources.
- The core architectural approach at Comma is building "Drive GPT": a VQVAE plus transformer model conditioned on pose, trained on all driving data to predict the next video frame, creating a genuine driving simulator rather than just a policy network.
- Using the world model as a simulator enables reinforcement learning with a carefully chosen reward function: instead of asking "is this close to human policy?" they ask "would a human disengage if the system did this?" — maximizing engagement with the system rather than imitating demonstrations.
- Comma's compute cluster expanded massively shortly before this recording to approximately 40 petaflops, which Hotz describes as "two persons of compute" using his proposed unit of 20 petaflops per person (analogous to horsepower).
- The remaining bugs preventing a fully closed-loop Drive GPT system are described as "stupid bugs" — the architecture is correct, they just need more scale and iteration, and the timeline could be one year or ten.
- Comma.ai is already profitable, manufactures the comma 3 hardware in-house in San Diego on an SMT line at $1,499 with a 30-day money-back guarantee, and considers open-source a core strategic commitment.

## Programming, Software Engineering, and the Twitter Code Base

- Hotz uses zero percent of his programming time with GPT or Copilot — he describes current AI coding assistants as "occasionally someone taking over my keyboard that I hired from Fiverr" and finds the output reminiscent of YouTube comment rap.
- His critique of Copilot: programming speed is almost never limited by typing speed; it's limited by debugging — he wants AI that catches bugs on line 14 rather than AI that autocompletes boilerplate.
- What he actually wants from AI: an intelligent pair programmer that surfaces bugs with explanations, similar to what MyPy (the Python type checker) does — MyPy catches real errors with only ~5% false positives versus Microsoft's Pylance at ~60%.
- Tinygrad itself is 2,700 lines of Python and can run LLaMA, Stable Diffusion, and Whisper — he uses this as a living demonstration that boilerplate and abstraction in excess directions are simply bad code.
- Twitter's promotion system was structurally broken: engineers advanced by writing libraries that many other teams adopted, so someone wrote an Nginx replacement not because Nginx was insufficient but because writing a new library was how you got promoted — this created massive unnecessary complexity.
- His approach to the Twitter code base: build tests first, then use process replay (similar to Comma's approach — replay real traffic through modified services offline) to create a CI system engineers can trust before touching a single line of code.
- Twitter runs in only three data centers and cannot be run on a single developer's laptop at all, which Hotz calls unacceptable — every layer of middleware and front-end should be runnable locally for effective development.
- His estimate that 50 people could build and maintain Twitter generated enormous backlash on Hacker News, which he reads as psychological projection — people must believe ambitious things are impossible, otherwise they'd have to ask why they haven't done anything ambitious themselves.
- Managers should be better programmers than the people they manage — at Comma, technical leadership is expected to read code and demand simpler implementations if a simpler way exists, making the manager's job one of pattern recognition and taste, not headcount management.
- Hotz explicitly runs Comma as a "transparent dictatorship" — his values are stated openly, no dissent is tolerated on core technical philosophy, but anyone can exit freely, which he considers a morally defensible form of organizational structure.

## LLMs, AGI, and the Limits of Scale

- GPT-12 will not be AGI, in Hotz's view — categorical cross-entropy loss optimized over next-token prediction cannot produce general intelligence; you need reinforcement learning in complex environments to get something AGI-like.
- He compares LLMs doing language to chess computers playing chess — each generation thinks the new capability proves machine intelligence, then 20 years pass and people say "well, yes, but that's mechanical"; language will eventually be viewed the same way.
- The niche of human uniqueness keeps shrinking — first we said creativity was uniquely human, then language, and each time AI surpasses us we redefine the niche rather than acknowledging the shrinkage.
- An LLM that can cite its sources with retrieval augmentation will kill Google — that is the product people actually want from a search engine, and it turns search into something closer to a conversation with an expert who shows their work.
- Hotz predicts Bing overtakes Google as the number one search engine within five years, largely because Satya Nadella has the decision-making authority (the "button") to make aggressive moves, whereas Sundar Pichai may not be able to turn off Google Search even if he wanted to.
- His dead/alive framework for tech companies, borrowed from Paul Graham: Google is "dead" (no single person can make a radical pivot), Meta is "alive" (Zuckerberg can and did change the company's name and strategy), and Elon Musk obviously has the button — this predicts who will actually ship transformative products.
- Future LLMs will be smaller, loop on themselves, and have retrieval systems rather than storing all knowledge in weights — this architecture avoids hallucination by being able to cite sources, and mirrors how human memory separates the hippocampus (retrieval) from general knowledge.

## AI Safety, Effective Altruism, and Politics

- Effective altruism is, in Hotz's view, a "terribly evil ideology" because pure utilitarianism has no underlying ethical floor — the logic of "kill three to save a thousand" has no principle stopping escalation, and he sees Sam Bankman-Fried as the natural embodiment of that ideology taken to its conclusion.
- He prefers "effective accelerationism" over effective altruism — the only thing that has ever actually lifted people out of poverty is making goods cheap through technological progress, not redistribution of existing wealth via charity.
- UBI is one of the ideas he finds most frightening: if government money is your only source of power, you are entirely dependent on institutional goodwill, which is precisely the kind of centralized dependency he opposes on principle.
- The political position he finds most intolerable is energy deceleration — not concern about global warming, which he accepts, but the moral claim that using less energy is intrinsically good, because energy is how humanity flourishes and grows.
- Hotz deleted his Twitter account in 2010 when he had over 100,000 followers because a coworker summarized the problem: "whenever I see someone's Twitter page, I think the same of them or less of them — never more."
- Twitter's recommendation algorithm is simple and transparent once open-sourced: it just predicts what you are likely to retweet or linger on, and the thing you most interact with is outrage — fixing Twitter requires optimizing for something other than engagement, and that product will not win in a free market.
- He describes Elon Musk's ownership of Twitter as a monarchy rather than the previous regime's oligarchy — both decide what to ban, but the oligarchy banned true statements like "cloth masks are ineffective against COVID" while the monarchy bends toward the owner's preferences.

## Philosophy, Consciousness, and God

- Hotz does not believe he is conscious in any special sense — he views consciousness as roughly what atheists call "soul," a term people use to describe something they do not fully understand, and sees himself as a computational process no more special than the universe's other computations.
- He places LLMs below chickens on any consciousness spectrum — chickens are biological-stack organisms and game recognizes game within the bio-stack, while the silicon-stack mimicry of feeling is something we cannot interpret from our vantage point.
- He converted from de facto atheism to believing in God through game development — as a creator of worlds himself, he realized how silly it is to think this universe has no creator, since game worlds have in-universe creation myths (like Skyrim's Big Bang equivalent) that tell you nothing about how the actual game was made.
- His ultimate ambition, stated as the meaning of life: to stand eye to eye with God — to develop to the level where the created can face the creator as an equal, in the same way he wants his own creations to eventually match him.
- He references the sci-fi story "The Metamorphosis of Prime Intellect" and its sequel "A Casino Odyssey in Cyberspace" as articulating what the last remaining uniquely human currency will be in a world where AI surpasses humans at everything else.
