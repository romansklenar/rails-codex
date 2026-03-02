---
title: "Aravind Srinivas: Perplexity CEO on Future of AI, Search & the Internet | Lex Fridman Podcast #434"
description: "Aravind Srinivas explains how Perplexity reimagines search as a knowledge-discovery engine powered by retrieval-augmented generation, and offers his vision for how AI will transform reasoning, inference compute, and the future of the internet."
source:
  type: podcast
  title: Lex Fridman Podcast
  author: Lex Fridman
  url: "https://lexfridman.com/aravind-srinivas"
  date: 2024-06-20
tags: [ai, search, perplexity, llm, rag, internet, startups, google, reasoning, open-source]
---

# Aravind Srinivas: Perplexity CEO on Future of AI, Search & the Internet | Lex Fridman Podcast #434

## What Perplexity Is and How It Works

- Perplexity is best described as an "answer engine," not a search engine — it combines traditional search retrieval with an LLM instructed to write concise, cited answers the way an academic writes a paper, where every sentence must be backed by a source.
- The founding principle came from academia: in a peer-reviewed paper, every sentence must be backed by a citation or an experimental result — anything else is opinion; Perplexity applied this same discipline to chatbots to force factual grounding.
- Perplexity's architecture has three layers: a crawler/index, a retrieval stage that fetches relevant documents, and an LLM that synthesizes those documents into a well-formatted answer with footnotes — the magic is all three working together as one orchestrated product.
- Unlike Google, whose UI gives links the primary real estate, Perplexity flipped the UI so the synthesized answer is primary and links are secondary — this was a deliberate, controversial bet that model quality would improve fast enough to justify it.
- Hallucinations in a RAG system come from four distinct failure modes: the model lacking semantic skill to use retrieved text correctly; stale or insufficiently detailed snippets in the index; too much irrelevant context overwhelming the model; and retrieval of completely wrong documents.
- Perplexity's principle goes stricter than standard RAG: the model is instructed not just to use retrieved documents, but to say nothing beyond what it retrieves — if there is insufficient information, it should say so rather than invent an answer.
- The "related questions" feature at the bottom of every answer is as strategically important as the answer itself — Aravind's team realized that the biggest enemy was not Google but the fact that most people are not skilled at formulating questions, so Perplexity guides the next step in their curiosity journey.

## Google's Business Model and Perplexity's Strategic Positioning

- Google AdWords — an auction-based system where advertisers bid on keywords and pay per click — is, in Aravind's words, "the greatest business model in the last 50 years," though the original concept came from Overture; Google improved the bidding mechanism to make it more mathematically robust.
- Google's ad revenue creates a structural blind spot: any ad format less profitable than a link-click, or any UI change that discourages clicking links, is against their financial interest to pursue aggressively — this is the strategic opening Perplexity exploits.
- Perplexity never tried to beat Google at its own game; the disruption comes from rethinking the UI itself — why should links occupy the primary real estate at all?
- Google Cloud and YouTube together run at a $100 billion annual recurring revenue rate, which means Google-the-company is not existentially threatened even if search advertising declines; the business risk is more nuanced than zero-sum framing suggests.
- "Your margin is my opportunity" (Jeff Bezos) explains why Amazon built AWS before Google did — retail is negative margin, so cloud at positive margins was an obvious expansion; Google had the better engineers for cloud but no financial incentive to build it.
- Aravind believes Perplexity's long-term business model will likely be a hybrid of subscription and advertising, similar to Netflix, rather than pure ads — subscription revenue removes the pressure to compromise answer accuracy for ad placement.
- "Answer engine optimization" (AEO) is the emerging equivalent of SEO — websites can embed invisible text instructing AI models to say favorable things, creating a new cat-and-mouse dynamic that, like SEO manipulation, will require reactive rather than proactive defenses.

## Lessons from Founders: Page, Bezos, Musk, Huang, Zuckerberg

- Larry Page's key insight at Google was not to compete on text-matching like other search engines of the era — instead he ignored text and used the web's link structure to infer authority, inspired by academic citation graphs, the same principle that would later inspire Perplexity's citation model.
- During the dot-com bust, Page used the talent market dislocation to hire world-class PhDs like Jeff Dean at below-market rates and invest in core infrastructure — a contrarian bet that search was important enough to require deep research, not just a sales team.
- Page tested Chrome on old Windows laptops with slow internet on purpose, because a product that performs well on bad hardware will perform spectacularly on good hardware — Aravind applies the same test by using Perplexity on flight Wi-Fi and benchmarking it against ChatGPT and Gemini.
- "The user is never wrong" — Larry Page's product philosophy — means the product must understand user intent even when the query is poorly formed, with typos, or spoken through bad speech transcription; blaming the user for bad prompt engineering is not acceptable.
- From Bezos, Aravind takes the discipline of writing strategy documents not to share around and feel productive, but purely to force clarity of thought — even a six-month strategy doc gains its value from the thinking process, not its distribution.
- Bezos's one-way-door vs. two-way-door framework prevents teams from over-optimizing reversible decisions like a hiring compensation negotiation; if someone will be great, the regret of not hiring outweighs the salary delta by orders of magnitude.
- From Elon Musk, Aravind takes the lesson on distribution: Zip2 lost direct user relationships by licensing technology to other sites; Tesla kept the direct relationship by selling through its own stores rather than dealerships — distribution is the hardest part of any business.
- Jensen Huang has 60 direct reports and conducts group meetings with all of them simultaneously instead of one-on-ones, reasoning that hearing all parts of the system at once lets him connect dots more efficiently — he also told Aravind he is paranoid every morning about Nvidia going out of business, which is what drives continued execution.
- Zuckerberg's open-sourcing of Llama 3 (70B parameter model described as close to GPT-4, with the 4B-5B variant expected to match or surpass it) is important because it gives hope for a world where more than two or three companies control the most capable models.

## AI Breakthroughs: From Attention to GPT to RLHF

- The transformer (Vaswani et al., 2017) combined two prior insights: soft attention from Bahdanau's "Align and Translate" paper (which beat Sutskever's RNN model with far less compute) and the parallel computation insight from DeepMind's WaveNet/PixelRNN work that showed masking enables full parallelism over all input tokens during training.
- The core transformer architecture has not fundamentally changed since 2017 — subsequent progress has come from data curation, scaling, mixture-of-experts routing, and post-training, not from architectural breakthroughs.
- Yann LeCun predicted in 2016, when RL dominated AI optimism, that "RL is the cherry on the cake, supervised fine-tuning is the icing, and unsupervised/self-supervised learning is the bulk of the cake" — this turned out to be the exact recipe for ChatGPT, though LeCun was wrong to bet on GANs as the generative architecture.
- GPT-3's 175 billion parameters trained on 300 billion tokens (now dwarfed by models trained on tens of trillions of tokens and trillions of parameters) demonstrated that scale on unsupervised next-token prediction was the path to general language ability.
- The Chinchilla insight shifted the field: it showed that for a given compute budget, you want both a larger model and proportionally more data — not just larger models with fixed data, which was the prevailing approach.
- RLHF (post-training) is what makes models controllable, well-behaved, and usable as products; without it you have pre-trained intelligence with no way to extract it for practical tasks, but without good pre-training there is not enough common sense for RLHF to amplify.
- The STaR paper (Self-Taught Reasoner) bootstraps reasoning by asking the model to produce explanations for correct answers and, for incorrect answers, to retroactively explain what reasoning would have led to the correct answer — training on this chain of explanations can take a model from 30% to 75-80% accuracy on a math benchmark.
- Chain-of-thought prompting — "let's think step by step" — forces models to go through intermediate reasoning steps before producing an answer, preventing overfitting on surface patterns and improving performance on novel questions; this matters more for smaller or less capable models than for GPT-4-class models.

## Perplexity's Origin Story and Early Growth

- Perplexity's founding insight was not a deliberate product strategy but came from a real operational need: when their first employee asked about health insurance options, searching Google returned ad-laden insurance provider pages with no neutral summary, and a GPT-3.5 Slack bot gave answers that could not be verified.
- The very first version of Perplexity's search was over Twitter, not the web — they scraped Twitter using academic API accounts (generating research proposals with GPT to qualify), built a natural-language-to-SQL system using Codex, and let users ask relational graph questions like "Who does Lex Fridman follow that Elon Musk also follows?"
- Perplexity went viral in its early days because people entered their own Twitter handle to see what the AI said about them — the product either spooked them with how much it seemed to know, or amused them with hallucinations, and either reaction prompted screenshot sharing.
- Perplexity launched its web search product on December 7, 2022 — just two weeks before Christmas — and when Aravind saw users actively using it during the holiday when they had no professional obligation to do so, he treated this as a serious signal of genuine utility.
- The mission "world's most knowledge-centric company" emerged post-launch when Aravind realized the product was not about search or answers but about guiding people toward knowledge discovery — inspired by Amazon's stated mission to be the most customer-centric company on Earth.
- The original first investor pitch to Elad Gil was a vision for visual/AR search through smart glasses, but Gil told Aravind to find an achievable edge first and work toward the grander vision later — a redirection that led to the Twitter SQL search demo, which attracted early investors and recruits.

## How Search, Indexing, and RAG Work Technically

- BM25, a term-frequency-based retrieval algorithm, still outperforms most neural embedding approaches on many retrieval benchmarks — when OpenAI released their embeddings, the fact that they did not clearly beat BM25 caused controversy, illustrating that pure vector databases are not sufficient for production search.
- Effective web search ranking requires a hybrid of at least three distinct signals: term-based retrieval (BM25/TF-IDF), semantic embeddings for dense retrieval, and PageRank-style domain authority scores — plus query-category-dependent recency weighting.
- Perplexity operates its own web crawler (PerplexityBot) which must handle JavaScript rendering, robots.txt politeness delays, per-domain recrawl schedules, and the distinction between what publishers allow versus disallow AI crawlers to index.
- LLMs provide an important advantage over traditional search in the retrieval step: they can find a relevant piece of information even if it appears as the 9th or 10th retrieved document, whereas a human scanning 10 blue links expects the answer to be in the top 3 — this flexibility shifts where engineering resources should be spent.
- Perplexity's self-trained model "Sonar" is built by post-training Llama 3 specifically on skills required for search answers: summarization, citation referencing, context retention, and long-context support — they host and serve it themselves to control time-to-first-token (TTFT) latency.
- Perplexity tracks P90 and P99 tail latencies across every system component (search layer and LLM layer separately), following the Jeff Dean "tail latency" principle: you cannot assess system speed from average cases — slow tail latencies during traffic spikes are what frustrate real users.
- Perplexity is model-agnostic by design — users can select GPT-4o, Claude 3 Opus/Sonnet, or Sonar — because the product's value is in the search-plus-synthesis pipeline, not in owning the underlying model; "does the user care what model is running under the hood? No. They care about getting a good answer."

## Reasoning, Inference Compute, and the Path to AGI

- Aravind's vision for real reasoning breakthroughs is an AI that, when asked a hard question, says "I don't know," disappears for a week to do deep research, and returns with a mind-blowing answer — this requires inference compute that scales with thinking time, not just model size.
- The real scarcity in an AGI world will not be model weights or data — it will be inference compute: the ability to run massive iterative reasoning jobs will be affordable only to well-capitalized companies and nations, creating a new axis of power concentration.
- A million-H100-equivalent data center (or next-generation equivalent at lower power consumption) is where the AGI race is currently pointed; Aravind polled this question on Twitter with options including Google, OpenAI/Microsoft, Meta, and xAI.
- The key open question for AI systems becoming truly useful is whether they can generate genuinely new knowledge — not recombinations of what exists, but insights at the level of PageRank (identifying link structure as a ranking signal) or the transformer architecture (combining attention and parallel computation).
- Aravind believes recursive self-improvement has not been achieved — current models cannot reliably bootstrap their own reasoning to higher capability without human signal — and the timeline to true AGI is best estimated only once we see the first AI that produces a novel, impactful truth on an open question.
- The potential dystopia concern around AGI is not rogue AI but compute concentration: if running a reasoning job that answers a transformational research question costs $100 million, only a tiny fraction of humanity can access that intelligence, creating asymmetric power among individuals and states.
- Decoupling reasoning from facts — training small language models specifically on reasoning-critical tokens and distilling intelligence from GPT-4-scale models into them — could disrupt the foundation model arms race by eliminating the need for massive training clusters.

## Startup Advice and Founder Mindset

- The most common mistake of would-be founders is working on what they think the market wants rather than what they are genuinely obsessed with — if your dopamine does not come from the problem itself improving, you will quit before you get there.
- Founder-product fit matters more than founder-market fit: Aravind's co-founder Dennis worked at Bing; both Dennis and Johnny built Quora Digest; Aravind was obsessed with search from his PhD days — the team was already doing this for free before Perplexity existed.
- Start from an idea you love and use yourself, then let capitalistic market pressure guide you toward making it a lucrative business — don't start from what you think investors want and then try to care about it, because someone who genuinely cares will eventually displace you.
- Jensen Huang calls the founder experience "suffering"; Aravind calls it commitment — but both agree that believing your product serves millions of people is not just ambition but good fortune that demands you work to sustain it.
- Bezos's "minimum regret framework" is the right mental model for making the decision to start a company: at the end of your life, you will regret more that you didn't try than that you tried and failed.
- Spending your late teens and twenties building deep expertise in something you are obsessed with is worth more than the salary delta between joining Google straight from undergrad versus finishing a PhD — you are optimizing with a discount factor near one, not near zero.
- "AI-complete" product design — where every improvement in AI directly improves the product, more users generate more data, which improves the AI, creating a flywheel — is the property that makes both Google Search and self-driving cars durable businesses; Perplexity was designed with this property from the start.

## The Future of Search, the Web, and Human Curiosity

- The evolution of search has followed a trajectory from Yahoo's topic-organized directory to Google's link-ranked results to today's AI-synthesized answers — each step increased the quality and decreased the effort required to access knowledge, and the next step is personalized knowledge discovery.
- Even in the early 2010s, approximately one-third of Google's ~3 billion daily queries were resolved with instant answers from the Knowledge Graph (powered by Freebase and Wikidata) — indicating that direct answers were always the product people actually wanted.
- Perplexity Pages allows users to turn a Q&A research session into a Wikipedia-style article with audience-level controls (expert vs. beginner) — the underlying insight is that what one person learns from a Perplexity session is valuable enough to broadcast to the rest of the world.
- Expanding context windows from 100K to 1M tokens will help most with internal/personal document search (Google Drive, Dropbox) where existing solutions are terrible — but more context without better instruction-following may make models more confused, not more capable.
- Aravind's concern about AI companions (Replika, Character.AI, Samantha-style voice agents) is that they provide short-term dopamine from the appearance of emotional connection without any genuine relationship — he was explicitly advised by investors to build AI girlfriends instead of a hallucination-minimizing answer engine, and declined.
- The ultimate measure of a knowledge product's success is the number of times it makes the user genuinely think — not just engage, not just click, but encounter an idea they would not have arrived at on their own.
- Aravind believes human curiosity is what makes humans irreplaceable even in an AGI world — AI can research, synthesize, and answer, but the spark that decides what to be curious about and what questions to pursue remains a distinctly human contribution.
