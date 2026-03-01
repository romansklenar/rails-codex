---
title: "Sam Altman: OpenAI, GPT-5, Sora, Board Saga, Elon Musk, Ilya, Power & AGI | Lex Fridman Podcast #419"
description: "Sam Altman reflects on the OpenAI board saga, the Elon Musk lawsuit, and the trajectory toward AGI, while sharing concrete views on compute, Sora, GPT-5, safety, and what it will actually mean to build transformative AI."
source:
  type: podcast
  title: Lex Fridman Podcast
  author: Lex Fridman
  url: "https://lexfridman.com/sam-altman-2"
  date: 2024-03-18
tags: [ai, agi, openai, gpt, sora, safety, alignment, compute, governance, elon-musk, board-drama, open-source]
---

# Sam Altman: OpenAI, GPT-5, Sora, Board Saga, Elon Musk, Ilya, Power & AGI | Lex Fridman Podcast #419

## The OpenAI Board Crisis

- Altman describes November 2024's board saga as "the most painful professional experience of my life" — chaotic, shameful, and deeply disorienting — while also noting it surfaced an extraordinary outpouring of support he couldn't fully appreciate in the moment.
- After being fired on a Friday afternoon, Altman quickly accepted it and began planning a new focused AGI research effort by Friday evening, genuinely excited about the opportunity, before hearing from the exec team that they intended to fight the decision.
- The low point of the entire weekend came Sunday evening when the board appointed a new interim CEO, making Altman feel the situation was finally irreversible — even then, the dominant emotion he felt was love rather than anger.
- Altman spent roughly 45 days after the crisis in a "fugue state," drifting through his days while still having to run OpenAI — he describes wanting to crawl into a cave but feeling obligated to keep working on the mission.
- The board's core structural problem was that a nonprofit board answers to no one but itself unless additional rules are put in place; Altman says what OpenAI really wants is a board that is accountable to the world as a whole.
- The previous board shrank from nine members to six and got stuck unable to agree on additions; new board members are being selected in "slates" — cohesive groups with complementary expertise — rather than one at a time.
- Altman distinguishes between how he evaluates board members versus employees: for most roles he ignores track record and looks only at slope (rate of growth), but for board members he cares far more about the Y-intercept — experience and track record are very hard to replace.
- The saga made Altman significantly less trusting by default, a change he dislikes in himself; he describes his prior life philosophy as accepting the occasional cost of being screwed in exchange for getting to live with his guard down.
- Altman views the board crisis as a preview of greater pressure to come: "The road to AGI should be a giant power struggle. I expect that to be the case."
- He says this probably will not be OpenAI's last high-stress moment, but it was valuable for building organizational resilience before the stakes get even higher.

## The Elon Musk Lawsuit and OpenAI's Origins

- Altman says Elon's real motivations for the lawsuit are unclear to him, but the core historical facts are: when OpenAI was founded it was purely a research lab with no idea it would build products, APIs, or a chatbot — the structure evolved incrementally as circumstances changed.
- Elon did not part ways with OpenAI because he was pushed out — Altman says "Elon chose to part ways." Elon believed OpenAI would fail, wanted total control to turn it around, and wanted to either run OpenAI as a for-profit he controlled or have it merge with Tesla.
- Altman's memory of Elon's specific proposal: OpenAI should be acquired by Tesla, with Tesla holding full control.
- Altman would choose a different name if he could go back — "open" no longer captures the company's model — but says the most important meaning of "open" is putting powerful tools in people's hands for free, as a public good, without monetizing the free version through ads.
- On open source, Altman says there is a place for it, especially for smaller models people can run locally, but refuses to treat it as a binary religious issue — nuance is the right answer.
- Altman calls the lawsuit "unbecoming of a builder" and says he misses the old Elon, noting the volume of messages he received agreeing with that sentiment after saying it publicly.
- He says Grok had not open sourced anything until people pointed out the hypocrisy, then Elon announced it would — suggesting open source is not really what the lawsuit is about.
- Altman would heavily discourage any startup from starting as a nonprofit and adding a for-profit arm later, saying he doesn't think OpenAI's path will set a precedent others follow.

## Sora and Visual AI

- Sora demonstrated to Altman the possibility of genuine world-model understanding by handling object occlusion correctly — a person walks in front of something, obscures it, and the same object remains when the person moves away — though he is careful not to overstate this as evidence of a full 3D world model.
- Altman says the Sora approach is "going to go surprisingly far" even though it trains on two-dimensional visual patches rather than an explicit 3D representation.
- Remaining limitations include things like cats spontaneously sprouting extra limbs — and Altman believes some of these reflect something fundamentally different about how the model processes versus how humans learn, while others will simply improve with scale.
- Training is primarily self-supervised on internet-scale data with significant human labeling involvement — Altman declined to specify quantities but confirmed more than three people label data for the models.
- Sora has not been released yet partly because the engineering work to deliver it at the scale users will demand is not yet complete, and partly because deepfakes and misinformation risks require careful thought before deployment.
- On copyright and creative compensation, Altman believes creators whose data is used deserve some form of compensation and opt-out rights when their style is being mimicked — "the model changes but people have got to get paid" — comparing it to the CD-to-Napster-to-Spotify transition.
- Most YouTube videos in 5 years will use AI tools in production, but will still be fundamentally directed by a person; humans are deeply wired to care about other humans, which Altman sees as a durable fact like how humans still run races even though cars are faster.

## GPT-4, GPT-5, and the Scaling Curve

- Altman says GPT-4 "kind of sucks" — not to dismiss it, but because he believes GPT-5 will make GPT-4 look as bad as GPT-3 looks today, and it is his job to live a few years in the future.
- The most exciting near-term capability Altman sees in GPT-4 is as a creative brainstorming partner — not just productivity assistance but genuine "I need to think about this problem differently" use cases.
- Multi-step autonomous operation — breaking a problem into 10 steps and executing them without back-and-forth — is where the current model is weakest and where progress will be most transformative.
- Altman confirmed OpenAI will release an amazing new model in 2024, but deliberately would not commit to calling it GPT-5, suggesting the release strategy itself may be rethought.
- On how GPT-5 gets built: Ilya Sutskever's framing is that OpenAI "multiplies 200 medium-sized things together into one giant thing" — there is no single unlock, just relentless simultaneous progress across compute, algorithms, data, and post-training.
- Altman's context window vision: eventually, context lengths will be effectively unlimited — you would feed in every email you've ever sent, every conversation you've ever had — and the model will know you better the longer you use it; he draws a parallel to Bill Gates failing to imagine why computers would ever need gigabytes of RAM.
- Current RLHF and post-training is computationally tiny relative to pre-training but represents an enormous amount of work and is critical: OpenAI had to simultaneously invent the underlying technology and figure out how to make it into a product people love.
- The gap between GPT-4 and GPT-5 is expected to be as large as the gap between GPT-3 and GPT-4 — GPT-3 now seems "unimaginably horrible" by comparison.
- Smarter reasoning and better long-horizon task completion are the core improvements Altman is most excited about in the next generation, alongside general intelligence improvements that span all capabilities simultaneously rather than isolated domains.

## Compute, Energy, and the $7 Trillion Question

- Altman believes compute will become "the currency of the future" and possibly "the most precious commodity in the world" — not because of scarcity but because demand is unbounded, unlike phone chips where you can't sell 10x more just because supply increases.
- Intelligence is more like energy than like consumer electronics: at price X the world will use this much compute, at price Y it will use much more — meaning supply creates its own demand rather than satisfying a fixed market.
- The bottlenecks to more compute are: energy supply, data center construction, chip fabrication supply chains, and chip manufacturing volume — all simultaneously.
- Altman believes nuclear fusion is the right answer to the energy problem, and specifically names Helion as doing the best work; he also advocates for a renaissance in nuclear fission, calling it a shame that the industry ground to a halt due to what he characterizes as mass hysteria.
- He worries that AI will face the same theatrical risk distortion as nuclear — that dramatic, visible failures will generate outsized fear while slower, diffuse harms (which may be worse in aggregate) are ignored; he draws an analogy to air pollution versus nuclear reactor risk perception.
- Competition in AI is good for products, innovation, and price — but carries the risk of accelerating an arms race in ways that cut corners on safety.
- Altman says he cannot rule out that he will eventually be shot due to AI fears, putting the probability at non-zero — an illustration of how theatrical risks around transformative technology can escalate.

## Safety, Bias, and Governance

- Altman proposes that AI companies should publish detailed behavioral specifications — not high-level principles like "don't be evil," but specific: "when asked X, the model will respond with Y" — so that when a model behaves wrongly it is unambiguous whether it's a bug or a policy disagreement.
- Gemini generating Black Nazis and Black Founding Fathers was a clear bug, but Altman acknowledges there are many subtler cases where a company must decide policy, and that distinction matters enormously for public accountability.
- OpenAI's cultural insulation from San Francisco's broader ideological currents comes partly from having its own dominant ideology — belief in AGI — which crowds out other culture war dynamics.
- The safety function at OpenAI will eventually encompass the whole company, not just a designated safety team: shipping GPT-4 required every part of the organization thinking about alignment, societal impact, and economic implications simultaneously.
- State actors are actively attempting to infiltrate OpenAI; Altman confirmed this without elaborating on specifics.
- On AI escaping containment: Altman calls this a "theatrical risk" that has consumed a lot of smart, well-meaning researchers' attention with limited progress, and believes it has crowded out discussion of other significant near-term AI risks.
- Altman continues to actively oppose having super-voting control over OpenAI, even after the board crisis demonstrated that in practice his removal was very hard to execute — he acknowledges this represents a kind of governance failure that makes it harder for him to credibly claim the board can just fire him.
- He believes no company should be making these decisions about AGI and that governments need to set rules of the road — he is willing to be misunderstood as pursuing regulatory capture while believing the opposite is true.

## AGI: Definition, Timeline, and Power

- Altman now refuses to speculate on when AGI will arrive because the question is "very poorly formed" — people use extremely different definitions; it is better to ask when systems can do specific capability X or Y.
- His working definition of AGI includes meaningfully changing the global economy — ChatGPT 3.5 changed world expectations but the global economy does not yet feel materially different.
- His concrete personal marker for AGI significance: when a system can substantially increase the rate of scientific discovery in the world, since he believes most real economic growth stems from scientific and technological progress.
- By the end of this decade — possibly somewhat sooner — Altman expects systems capable enough that looking back at current AI from that vantage point would feel like looking at GPT-3 today.
- AGI is not an ending, it's more like a mile marker — closer to a beginning than an endpoint.
- The first AGI will not be able to answer "Does a grand unified theory of physics exist?" — but Altman says those would be among the first questions he'd ask if it could.
- Altman wants embodied AI to accompany AGI: "It's depressing if we have AGI and the only way to get things done in the physical world is to make a human go do it."
- OpenAI abandoned robotics because it was hard "for the wrong reasons at the time" but plans to return to it.

## Memory, Privacy, and Long-Term AI Relationships

- OpenAI's memory feature for ChatGPT is an early step toward a model that gets to know a user over a lifetime — remembering preferences is just the beginning; Altman wants the model to integrate lessons from past experiences and remind users what to do differently in the future.
- The ideal future: a context window large enough to hold every conversation you've ever had with anyone, every email you've ever sent — the model becoming more useful over a lifetime of shared experience.
- On privacy, Altman's answer is full user choice — anything you want removed from your AI's memory should be removable, and users with different privacy/utility preferences should be able to set their own levels.
- Transparency about what data is being collected and how is a legitimate concern; Altman agrees companies have historically been shady about this.

## On Ilya Sutskever

- Altman says he loves Ilya and has tremendous respect for him, explicitly hopes they work together for the rest of his career, and credits Ilya as someone who takes AGI and safety concerns — including broad societal impacts — more seriously than almost anyone.
- Ilya has not seen AGI, and OpenAI has not built AGI — Altman pushes back directly on that meme.
- Ilya is described as always on a "soul search in a really good way," constantly thinking from first principles about where the technology is going over 10-year timescales rather than one-year timescales.

## Broader Reflections on AI and Civilization

- Altman frames what might look like discrete capability leaps to outsiders as a continuous exponential from the inside — and wonders whether OpenAI should release even more iteratively to prevent shock updates to the world.
- He sees humanity's accumulated knowledge scaffolding — not biological evolution — as the real source of human capability gains across generations; no one person builds an iPhone, and that collective inheritance gives him hope for the future.
- The simulation hypothesis gets a modest probability update from Sora's ability to generate novel worlds, but it is not in Altman's top five reasons to take the hypothesis seriously.
- Altman is personally at peace with mortality — if he knew he would be shot tomorrow, he says his dominant emotion would be gratitude for his life rather than fear.
- He believes the next phase of AI will function like simple but "psychedelic" mathematical operators — easy to explain, but tipping humans into fundamentally new realms of knowledge and possibility.
