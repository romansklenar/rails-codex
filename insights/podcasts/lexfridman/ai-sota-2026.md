---
title: "State of AI in 2026: LLMs, Coding, Scaling Laws, China, Agents, GPUs, AGI | Lex Fridman Podcast #490"
description: "Nathan Lambert (post-training lead at AI2) and Sebastian Raschka (author of Build a Large Language Model from Scratch) survey the full state of AI in early 2026, covering the China vs. US race, open-weight models, scaling laws, post-training breakthroughs, AGI timelines, and the future of programming."
source:
  type: podcast
  title: Lex Fridman Podcast
  author: Lex Fridman
  url: "https://lexfridman.com/ai-sota-2026"
  date: 2026-01-31
tags: [ai, llm, scaling, china, open-source, agents, gpu, agi, post-training, rlhf, reasoning-models, coding, nvidia, robotics]
---

# State of AI in 2026: LLMs, Coding, Scaling Laws, China, Agents, GPUs, AGI | Lex Fridman Podcast #490

## China vs. US: The Open-Weight Race

- DeepSeek's January 2025 R1 release was the inflection point that "surprised everyone" with near-frontier performance at allegedly much lower compute cost, igniting the current AI race both in research and at the product level.
- Sebastian Raschka argues there will be no winner-takes-all in AI because researchers rotate between labs frequently, making ideas non-proprietary — the differentiating factor is budget and hardware, not secret algorithms.
- Nathan Lambert identifies Z.ai (GLM models), MiniMax, and Kimi K2 Thinking from Moonshot as Chinese open-weight models that by early 2026 had surpassed DeepSeek in community mindshare, with DeepSeek losing its crown as the preeminent Chinese open model maker.
- DeepSeek is built and funded by Highflyer Capital, a hedge fund — the company is deliberately secretive about its commercial use of the models, even while publishing unusually detailed technical reports.
- MiniMax and Z.ai have both filed IPO paperwork and are explicitly targeting Western mindshare, while DeepSeek remains secretive and does not seek external customers.
- Chinese open-weight models use friendlier licenses than Llama or Gemma — no user-count thresholds or reporting requirements — which drives adoption among developers who want no strings attached.
- Lambert predicts 2026 will see more open-model builders than 2025, with many of the notable ones in China, but expects consolidation to arrive in the years following as training costs mount.
- US companies won't pay for API subscriptions to Chinese labs for security reasons, so Chinese labs release open weights as a strategy to capture US enterprise AI spending indirectly — a deliberately realistic business calculation.

## Frontier Model Rankings and User Behavior

- Claude Opus 4.5, released in late November, generated hype Lambert described as "almost a meme" — organically growing while Gemini 3 (released a few months prior) faded from the conversation despite being a strong model.
- GPT-5 introduced a router architecture where most users are served by a cheaper non-thinking model, which Lambert credits with saving OpenAI significant GPU costs even though he personally never uses the non-thinking variant.
- Lambert uses GPT-5.2 thinking or pro exclusively for information and research queries, running up to five simultaneous pro queries looking for papers, code references, or equation feedback.
- Lex uses Grok 4 Heavy specifically for "hardcore debugging that the other ones can't solve," finding it best for that niche use case.
- GPT-5.2's long-context scores improved dramatically — from roughly 30% to roughly 70% — in a minor model update, suggesting an algorithmic change in how the model handles extended context.
- Users form strong model allegiances from a single "threshold effect" moment where a model does something impressive, then tolerate the model until it does something "really dumb" and switch.
- Sebastian uses ChatGPT's "auto mode" for quick daily queries and pro/thinking mode for deep review tasks like checking citations, figure numbering, and formatting — treating the two modes as distinct tools.
- Nathan uses Gemini for fast, simple factual lookups and Claude Opus 4.5 with extended thinking (always on) for code and philosophical discussion — demonstrating that power users maintain multi-model workflows.

## Open-Weight Model Landscape

- The open-weight ecosystem includes at least ten notable Chinese models (DeepSeek, Kimi, MiniMax, Z.ai, Qwen, Antlang, and others) and at least ten Western ones (Mistral, Gemma, gpt-oss, NVIDIA Nemotron, OLMo, SmolLM, Apertus, LM360 K2, Marine Community Project, and others).
- Meta's LLaMA was conspicuously not mentioned when Nathan enumerated top open models — and when Lex noticed, Nathan responded simply: "RIP."
- gpt-oss-120b is notable as the first open-weight model explicitly trained with tool use in mind, representing a paradigm shift where the model is designed to call a Python interpreter or web search rather than memorize facts.
- OpenAI released gpt-oss partly because it cannot serve the model on its own GPU-constrained infrastructure — Sam Altman stated publicly that releasing it lets users' compute handle distribution without OpenAI paying GPU costs.
- OLMo 3 from AI2 is part of a growing "fully open" category that releases training data, code, and model weights — in 2024 AI2 was essentially the only organization doing this; by 2026 competitors include LM360, Apertus, Hugging Face SmolLM, and NVIDIA Nemotron.
- Chinese open-weight models tend to be large MoE architectures optimized for peak benchmark performance; Western open models have historically trended toward smaller dense models, though Mistral Large 3 and NVIDIA Nemotron are pushing toward 400B-parameter MoE territory in Q1 2026.
- Kimi K2 Thinking gained a reputation specifically for creative writing quality, an example of how niche capability differentiation drives user preference for individual models.

## Transformer Architecture and LLM Evolution

- The GPT-2 decoder-only transformer from 2019 remains the architectural ancestor of all major 2026 LLMs — changes from GPT-2 to gpt-oss-120b amount to swapping LayerNorm for RMSNorm, multi-head attention for Group Query Attention, adding Mixture of Experts, and tweaking activation functions.
- Mixture of Experts (MoE) expands the total knowledge capacity of a model without increasing per-token compute: rather than one feedforward network, the model routes each token to 8 of 256 (or similar ratios) "expert" sub-networks, using a router that selects specialists based on input content.
- Multi-head latent attention, introduced prominently by DeepSeek, shrinks KV cache size substantially — making long-context inference more memory-efficient — and became one of the key architectural differentiators across 2025 open-weight releases.
- Alternative attention mechanisms that dominated 2025 architecture choices: multi-head latent attention (DeepSeek), Group Query Attention (widespread), and sliding window attention (OLMo 3) — all aimed at making inference cheaper for long contexts.
- At end of 2025, Qwen3-neXt added a gated delta net, inspired by state space models, replacing or augmenting attention with a fixed-state mechanism that achieves linear (not quadratic) scaling with sequence length.
- Training systems have evolved far more than architectures: switching from BF16 to FP8 training can increase tokens-per-second-per-GPU by ~30% (e.g., 10K to 13K), enabling faster experimentation on data and algorithms even with identical model designs.
- Text diffusion models generate entire completions in parallel batches rather than one token at a time — promising for speed but currently unable to handle tool-use interruptions mid-sequence; Google announced Gemini Diffusion, achieving similar quality to Nano 2 at much higher speed.

## Scaling Laws: Pre-training, RL, and Inference

- The classical scaling law is a power-law relationship between (compute + data) on the x-axis and held-out next-token prediction accuracy on the y-axis — a relationship that has held across 13 orders of magnitude of compute and shows no sign of breaking.
- Three distinct scaling axes now exist: (1) pre-training scaling (model size × data quantity/quality), (2) reinforcement learning training scaling (log-compute → linear benchmark improvement, demonstrated first by o1), and (3) inference-time scaling (more tokens generated during reasoning → better answers).
- Pre-training for the OLMo 3 model cost AI2 approximately $2 million in GPU cluster rental including engineering failures and multiple seeds — while serving hundreds of millions of users costs billions per year, making inference the dominant ongoing expense.
- DeepSeek's famously cited "$5 million" pre-training cost covered only the final training run at cloud market rates, excluding ablations, research experiments, and the full post-training pipeline — SemiAnalysis estimates their true GPU fleet is approximately 50,000 units.
- Gigawatt-scale NVIDIA Blackwell compute clusters are coming online in 2026 from contracts signed in 2022–2023 — a two-to-three-year lead time that means today's build-out decisions will define frontier capabilities in 2028.
- xAI is reported to reach one gigawatt of compute capacity in early 2026, with two gigawatts by year-end — nearly all of which goes first to pre-training because it requires the most dense, synchronous, high-bandwidth compute.
- Rules of thumb at AI2: RL post-training runs should not last more than one month or the opportunity cost of missing researcher improvements becomes too high; pre-training runs lasting over a month risk catastrophic failures with unacceptable lost compute.
- AI2's November release of a 30B-parameter model involved five days of RL post-training; a December re-release resulted from simply extending that same RL run by three and a half weeks — producing a notably better model with no architectural changes.

## Training Stages: Pre-training, Mid-training, Post-training

- Pre-training is next-token prediction on a vast corpus (measured in trillions of tokens): smaller open models train on 5–10 trillion tokens, Qwen is documented at 50 trillion, and frontier closed labs are rumored to reach 100 trillion tokens.
- Mid-training is a specialized continuation of pre-training — same algorithm, but focused on higher-quality data or specific domains like long-context documents — named to fill the gap between "pre" and "post" training stages.
- Post-training encompasses supervised fine-tuning, DPO/RLHF preference tuning, and RLVR with verifiable rewards — transforming a raw base model into a useful assistant by unlocking skills the model already has rather than teaching new knowledge.
- Synthetic data in pre-training does not mean "AI hallucinated text" — it means re-formatting existing content (e.g., converting a Wikipedia article into Q&A pairs, or processing PDFs via OCR like OLMo OCR or DeepSeek OCR) to make it higher-density for the model.
- AI2's OLMo 3 achieved better performance with less raw data than previous versions, primarily through improved data quality — fitting a model on cleaner data at the same token count consistently outperforms fitting on more but noisier data.
- Common Crawl (hundreds of trillions of tokens, essentially the whole internet) is the base of most pre-training datasets; labs filter it aggressively using classifiers trained on small experiments measuring downstream benchmark impact.
- Anthropic lost a $1.5 billion lawsuit to authors after torrenting books for training data — buying a physical copy was judged legally acceptable, but torrenting made them liable, a precedent with enormous implications for the industry.
- Private proprietary data (clinical trials, legal documents, financial records) represents the next unlocked scaling axis: domain-specific LLMs trained on industry data by pharmaceutical, legal, and financial companies have not yet been built at scale.

## Post-Training and RLVR

- RLVR (Reinforcement Learning with Verifiable Rewards) was named by Nathan Lambert's team in the Tulu 3 paper before DeepSeek popularized the concept — the framing gave the research community a shared vocabulary around which to organize.
- RLVR works by having the model generate answers to verifiable questions (math, code, factual lookups), scoring correctness as the reward, and using policy gradient algorithms (PPO or GRPO) to reinforce successful reasoning patterns.
- GRPO's reward signal is relative — a completion is scored against other completions on the same problem — so if the model solves a problem 100% of the time, there is zero gradient signal; labs must continually source harder problems to keep training productive.
- DeepSeek R1-Zero, trained with RLVR from scratch with no human-annotated chains of thought, spontaneously developed self-correction behavior — phrases like "let me reconsider" — with the paper calling this the "aha moment," because it emerged purely from reward optimization.
- Sebastian trained Qwen 3 base with RLVR on MATH-500 and saw accuracy jump from 15% to 50% in just 50 gradient steps — demonstrating that RLVR rapidly unlocks mathematical reasoning that was latent from pre-training but not expressed without RL.
- RLHF (preference tuning on human comparisons) has no documented log-compute → linear-performance scaling law; RLVR does — making RLVR the preferred vehicle for compute investment in post-training.
- A "RLVR 2.0" direction involves process reward models or value functions that score intermediate reasoning steps, not just final answers — Google published work in this area; Nathan identifies value functions (scoring every generated token) as the more promising research direction over process reward models.
- RLHF remains the "finishing touch": it improves tone, organization, format, and personality without adding new knowledge — the layer that made ChatGPT feel magical and that still differentiates user experience across models.

## Coding and AI-Assisted Development

- Claude Code and Cursor represent fundamentally different programming paradigms: Claude Code is agentic (handles the whole project autonomously) while Cursor/VS Code plugins keep the developer in control of each diff — Sebastian prefers Codeium for Cursor as the "Goldilocks" middle ground.
- A survey of 791 professional developers (10+ years of experience) found that most ship code that is 50%+ AI-generated — and senior developers are more likely than juniors to have AI-generated code above that 50% threshold.
- Approximately 80% of surveyed professional developers reported finding coding with AI either "somewhat more enjoyable" or "significantly more enjoyable" than without it.
- Cursor's Composer model is reportedly a fine-tune of a large Chinese MoE model — deduced in part because the model occasionally responds in Chinese — and Cursor updates its model weights every 90 minutes based on real-world user feedback, representing the closest publicly known deployment of continual RL on a production model.
- One Claude release in early 2026 demonstrated Claude autonomously rebuilding Slack from scratch given only the software's parameters and a sandbox environment — nearly completing the task successfully.
- Nathan argues that the failure modes of current coding agents are "pretty dumb" and fixable — e.g., Claude repeatedly trying to use a CLI command it doesn't have installed — rather than being fundamental limitations of the approach.
- Anthropic uses Claude Code to build Claude Code, and Dario Amodei has publicly stated that a large fraction of Claude's own codebase is already AI-generated — suggesting Anthropic runs these tools at inference budgets 10–100x what individual subscribers access.

## AGI, ASI, and Timelines

- OpenAI's informal working definition of AGI is an AI that can perform "a certain number of economically valuable tasks" — Nathan finds this definition unsatisfying but acknowledges it provides a concrete grounding point.
- The AI 2027 report originally forecast AGI milestones around 2027–2028 and subsequently pushed that estimate back three to four years, to approximately 2031 as a mean prediction — Lex's personal estimate is later still.
- Nathan's AGI prediction: software automation will progress dramatically within the decade, but automating AI research itself — the step required for a true singularity — will take longer than 10 years.
- The "jagged AI" thesis: models are already superhuman at some categories of code (front-end, traditional ML) but genuinely poor at others (large-scale distributed training systems) — the gaps are large and asymmetric, making "superhuman coder" a misleading monolithic milestone.
- Lambert is bearish on consumer in-home robots due to safety requirements (near-zero failure tolerance across billions of interactions) but bullish on self-driving cars and purpose-built industrial automation in controlled environments like Amazon distribution centers.
- Sebastian's view on consciousness as AI's key differentiator: current AI has no agency — "you still have to tell it what to do" — making it a powerful tool but not a decision-maker; the absence of self-directed goals keeps humans in control.
- Nathan speculates that a "one model to rule everything" vision is "kind of dying" — being replaced by a multi-agent paradigm where many specialized models handle different tasks and communicate with each other.

## GPUs, NVIDIA, and Compute Infrastructure

- NVIDIA's moat is not primarily the GPU chip itself but the CUDA ecosystem built over two decades — an investment that would take years for a competitor to replicate even with equivalent hardware.
- Google has a structural advantage in AI infrastructure: it pays no NVIDIA margin on TPUs, built data centers years before the current boom (avoiding multi-year lead times), and can integrate its stack top-to-bottom — advantages that compound at hyperscale.
- NVIDIA's new Vera Rubin architecture includes a specialized chip with minimal high-bandwidth memory designed for pre-fill (the matrix-multiply-heavy phase of inference) — a different chip from the standard GPU, reflecting the growing separation of training and inference compute requirements.
- At 100,000+ GPU scale during pre-training, at least one GPU is almost always down at any given moment — training code must handle graceful redundancy, a systems problem qualitatively different from small-scale ML experimentation.
- Jensen Huang is described as uniquely operationally plugged into NVIDIA in a way that resembles Steve Jobs at Apple — a singular leadership style that Nathan credits with driving GPU progress faster and more focused than a diffuse organizational structure would.
- Without Jensen's specific bets, a deep learning winter could have occurred when GPUs weren't yet available for AI — Nathan estimates the delay could have been a decade or more, during which Silicon Valley's attention would have captured by different technologies.

## Open Source Policy and the ATOM Project

- Nathan Lambert launched the ATOM Project (American Truly Open Models) in July 2025, framing it as a US response to the gap left by Meta's retreat from open-weight leadership — at that time, China had four to five DeepSeek-caliber open models and the US had zero comparable alternatives.
- The ATOM argument has two premises: (1) open models are the engine for AI research because researchers start with them; therefore (2) the US should own the best open models so that frontier research continues to happen in the US.
- AI2 received a $100 million NSF grant over four years — described as the largest CS grant the NSF has ever awarded — to build open models, but Nathan argues no single organization can sustain the ecosystem alone.
- The White House 2025 AI Action Plan includes a section titled "Encourage Open-Source and Open-Weight AI," defining the models and arguing for their unique value for innovation and startups — which Nathan reads as a meaningful signal even though the plan is not yet binding policy.
- Banning open-weight model releases would require a US "Great Firewall" — Nathan argues this is functionally impossible because training a competitive model costs as little as $1 million to $100 million, a sum attainable by many actors worldwide.
- Reflection AI announced a $2 billion fundraise explicitly dedicated to building US open models — Nathan cites their announcement as evidence of a cultural tide turning in favor of open models after the Llama 4 controversy.
- NVIDIA has become a more active participant in the open-model ecosystem with Nemotron 3 and is beginning to release training data alongside model weights — one of only a few companies at NVIDIA's scale doing so.

## Work Culture, Silicon Valley, and the Human Cost

- The 9/9/6 work schedule (9 AM to 9 PM, six days a week, or 72 hours per week) has become a reference point for AI lab culture in 2026 — not necessarily formal policy but a cultural norm driven by competitive intensity.
- Nathan wrote a post on burnout from personal experience managing a team while simultaneously running full-scale model training — describing it as "a crazy job."
- The book "Apple in China" by Patrick McGee describes Apple engineers working so hard during iPhone supply chain setup that the company instituted "saving marriage" code words for when an employee needed to leave for family — and reports engineers dying from overwork.
- Nathan's observation: professors who work long hours seem happier on average than frontier lab employees — because professors have a clear mission, mentorship relationships, and a more stable sense of purpose than the chaotic sprint culture of AI labs.
- Silicon Valley bubble dynamics are simultaneously productive (collective belief in breakthroughs accelerates breakthroughs) and dangerous (deviation from reality risks missing what the majority of human beings actually need from this technology).
- SF AI meme culture in late 2025 included the concept of a "permanent underclass" — the idea that the last six months of 2025 was the only window to build durable value in an AI startup before large incumbents captured all returns.
