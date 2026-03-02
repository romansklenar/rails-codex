---
title: "Pavel Durov: Telegram, Freedom, Censorship, Money, Power & Human Nature | Lex Fridman Podcast #482"
description: "Pavel Durov, founder and CEO of Telegram, discusses the philosophy and engineering behind one of the world's largest messaging platforms, serving over a billion users with a core team of just 40. The conversation spans his ascetic personal discipline, his arrest in France, government pressure campaigns to censor political speech, Telegram's privacy architecture, and his broader views on freedom, human nature, and civilization."
source:
  type: podcast
  title: Lex Fridman Podcast
  author: Lex Fridman
  url: "https://lexfridman.com/pavel-durov"
  date: 2025-09-30
tags: [telegram, freedom-of-speech, privacy, encryption, censorship, government-overreach, stoicism, bitcoin, ton-blockchain, vk, stoic-discipline, lean-engineering, open-source, geopolitics, sperm-donation]
---

# Pavel Durov: Telegram, Freedom, Censorship, Money, Power & Human Nature | Lex Fridman Podcast #482

A rare multi-hour portrait of the most privacy-principled tech founder alive, recorded while he was under active French criminal investigation for refusing to backdoor Telegram for governments.

## Philosophy of Freedom

- Durov's commitment to freedom was formed at age 4 when his family moved from the Soviet Union to northern Italy — the contrast in abundance of goods, ideas, and opinions was immediately obvious even to a child.
- His guiding phrase is "Свобода дороже денег" ("Freedom matters more than money"); he frames the biggest enemies of freedom as fear and greed, both of which must be neutralized consciously.
- To eliminate fear of death, he rationalizes that you cannot experience your own death, so living in fear of it is logically incoherent — instead he reminds himself daily that he could die, which makes every day feel significant.
- He identifies tribal conformity as a hardwired threat to individual judgment: the ancient fear of being expelled from the group still drives people to adopt majority behaviors that offer no competitive advantage.
- His rule for resisting manipulation: always ask "Who benefits from me reading this?" — he estimates 95% of news is published to make you buy something, support a cause, or fight someone else's war.
- He sees freedom of thought as inseparable from physical and cognitive self-discipline: a clouded mind cannot form independent conclusions and will always follow authorities by default.

## Ascetic Personal Discipline

- Durov has been completely abstinent from alcohol, tobacco, coffee, pills, and illegal drugs for over 20 years, attributing it to a biochemistry book read at age 11 that described alcohol as literally paralyzing and killing brain cells.
- He does 300 push-ups and 300 squats every morning, then trains in the gym 5–6 times per week for 1–2 hours — he calls self-discipline "the main muscle" and considers these morning reps primarily a discipline exercise, not a physique one.
- He allocates 11–12 hours for sleep to guarantee extended time lying awake thinking without a phone; he considers early-morning pre-device thought his most creatively productive time.
- He deliberately avoids using a phone except to test Telegram features, having concluded that accessibility is inversely proportional to productivity.
- His longest swim was 5.5 hours in a Finnish lake; he regularly swims across Lake Geneva and Lake Zurich, valuing the meditative patience these multi-hour sessions require.
- He practices Banya (extreme Eastern European sauna) with cold plunge as "alcohol in reverse" — short-term discomfort for long-term health benefits, the opposite of short-term pleasure for long-term harm.
- Diet: no red meat for 20 years (felt "heavy"), no processed sugar, no soda, seafood and vegetables as primary calories, eating within a 6-hour intermittent fasting window.
- He never takes pills on principle — he frames pharmaceutical products as incentivized to treat symptoms rather than root causes, comparing painkillers to smashing the warning light in a helicopter rather than fixing the underlying problem.

## Telegram Engineering Philosophy

- Telegram's core engineering team is approximately 40 people managing nearly 100,000 servers across multiple continents — deliberate understaffing forces automation instead of manual management.
- Durov's thesis: adding employees past a threshold means 90% of their time goes to coordination, and underutilized employees invent internal problems rather than solving real ones.
- He has observed that firing a single low-performer can increase a team's effective output more than adding a new hire — one weak Android engineer was creating more problems than he solved.
- The entire Telegram software stack — back-end API language, database engines, web servers, encryption protocol — was built internally from scratch to minimize attack surface and maximize efficiency.
- Telegram has open-source, reproducible builds for both Android and iOS, making it the only major messaging app where users can cryptographically verify that the GitHub source code matches the app they download from the app store.
- Latency is treated as a moral obligation: at a billion users opening the app dozens of times daily, a 500ms unnecessary delay represents centuries of aggregate human time wasted.
- Nikolai Durov (Pavel's brother), a 3-time IMO gold medalist and 2-time ICPC champion with two PhDs in mathematics, rewrote critical VK data engines from PHP/MySQL into C and C++, producing load speeds that impressed Zuckerberg during a 2009 Silicon Valley visit.

## Privacy Architecture

- Telegram has never shared a single private message with any government or intelligence agency; the architecture is designed so that even Telegram employees cannot access private messages.
- Decryption keys for cloud-stored messages are split and kept across servers in multiple legal jurisdictions — extracting all hardware from one data center yields only undecipherable encrypted data.
- Secret Chats offer full end-to-end encryption with screenshot blocking and no forwarding; they launched one year and three months ahead of WhatsApp's end-to-end encryption rollout.
- Secret Chats are opt-in rather than default because true E2E encryption is incompatible with large group channels, bots, multi-device sync, and persistent chat histories — Telegram chose a hybrid architecture rather than sacrificing usability.
- Durov's response to any government demanding a backdoor: he would rather shut Telegram down in that country than comply, and has stated he owns 100% of Telegram with no shareholders who could overrule him.
- He committed publicly that every attempt by any government to coerce changes to Telegram will be disclosed — he never signs NDAs with governments or intelligence agencies.

## Arrest in France and Government Pressure

- In August 2024, Durov was arrested at a Paris airport and held in a windowless concrete cell for nearly four days, accused of approximately 15 serious crimes based on content that users posted on Telegram.
- He describes the charge theory — that a platform CEO is personally criminally liable for user-generated content — as unprecedented in history, including in authoritarian states, because it destroys the economic incentive for any tech company to operate there.
- The French legal system uses "investigative judges" with powers that make appeals slow and procedurally difficult; Durov's appeal of the investigation itself had not received a hearing date months after filing.
- Telegram's moderation.telegram.org page documents daily removals of CSAM and terrorist propaganda channels numbering in the hundreds of thousands of pieces of content per week — Durov argues the French investigators demonstrated fundamental ignorance of how machine learning moderation works.
- The head of French foreign intelligence services met with Durov and explicitly asked him to suppress conservative Telegram channels during Romania's re-run presidential election — Durov refused and publicly disclosed the conversation.
- The same intelligence services requested that Telegram remove channels in Moldova before its election; Telegram removed channels that violated its rules but refused a second, much larger list of channels expressing legal political opinions.
- Durov grew suspicious when intelligence officials then mentioned to his investigative judge that Telegram had cooperated on Moldova — he interprets the sequence as leverage being applied via the investigation.
- He also refused a French police request to take down a far-left protest channel in France, demonstrating that his editorial principle is viewpoint-neutral.

## VK Origins and Early Engineering

- Durov built the first version of VK (VKontakte) at age 21 in approximately two weeks, serving as sole back-end engineer, front-end engineer, designer, customer support, and marketing person for nearly the first year.
- VK started from PHP and MySQL on Debian Linux; scaled by adding Memcached, then NGINX, and eventually Nikolai rewrote the search, ad engine, messaging, and feeds in C and C++ after returning from a post-doc at Max Planck in Germany.
- The initial user database of Russian schools and universities was assembled by Durov's girlfriend at the time, who emailed universities and the Department of Education to source complete institutional hierarchies.
- DDoS attacks coincided with acquisition negotiation days, which Durov interprets as orchestrated commercial pressure; surviving this gave him his first introduction to how hostile actors operate at scale.
- Government pressure to remove Navalny's opposition groups from VK in December 2011 — which Durov refused, posting a mock response with a photo of a dog — caused him to immediately begin designing Telegram and pack a bag for eventual departure from Russia.

## Russia and Iran Bans / Digital Resistance

- In 2018 Russia demanded Telegram hand over encryption keys; Durov refused, and Russia banned the service in spring 2018.
- Telegram responded with an automated IP address rotation system and a "Digital Resistance" movement recruiting global sysadmins to run proxy servers — Russia ended up blocking so many IP subnets that banks and Russian social networks began going offline, forcing the censor to become more selective.
- Apple held Telegram's app store update for over four weeks, saying it needed to reach an agreement with Russian authorities first; Durov prepared to pull Telegram from the Russian App Store entirely and went public criticizing Apple, after which the New York Times covered the story and Apple approved the update 15 minutes before his deadline.
- In Iran, Telegram created a monetized proxy market: Iranian engineers could set up proxy servers and sell pinned-ad placements to anyone connecting through their server, creating a self-sustaining economic incentive for censorship circumvention — Telegram still reaches an estimated 50 million Iranians despite being formally banned.

## Poisoning and Physical Threats

- In spring 2018, during the TON fundraise and concurrent with the Russia/Iran bans, Durov experienced what he believes was a poisoning attempt.
- A suspicious neighbor left something near his door; within an hour he experienced acute pain across his entire body, loss of eyesight and hearing, and difficulty breathing — he concluded he was dying.
- He regained consciousness on the floor the next day, with broken blood vessels visible across his arms and body; he could not walk for two weeks and did not inform most of his team.
- Rather than making him fearful, surviving the experience made him feel he was living on "bonus time" — he describes every subsequent day as a gift, which freed him from fear of further threats.
- A prior near-death experience in December 2011 came when armed police attempted to enter his apartment after he refused government demands to remove opposition groups from VK.

## Business Model and TON Blockchain

- Telegram became profitable for the first time in 2024; Durov personally has invested more into Telegram than he has extracted, never sold a share, and takes a salary of one UAE dirham (one-third of a dollar).
- Revenue sources: Telegram Premium subscriptions (launched 2022, now over 15 million subscribers, projected to exceed $500 million annually), context-based advertising (not targeted by personal data), and a 5% commission on in-app purchases within mini apps.
- Durov estimates leaving approximately 80% of potential ad revenue on the table by refusing to use personal data for targeting, calling it a deliberate values-based trade-off.
- TON (The Open Network) was originally built by Nikolai Durov in 2018–2019 to be a shardable, inherently scalable blockchain capable of handling Telegram-level transaction volumes without congestion.
- Telegram was forced to abandon the TON project after SEC objections to the fundraise structure; the open-source community launched it independently and Telegram later adopted it as its preferred transaction layer.
- Telegram Gifts — vector-animated, blockchain-tokenized collectibles anchored to Telegram profile identities via TON smart contracts — sold $12 million of Snoop Dogg-themed gifts in 30 minutes; individual items from the first series have appreciated from $5 to over $10,000.
- Durov has held Bitcoin since 2013, purchasing at approximately $700 per coin and holding through the subsequent crash; he credits Bitcoin investment (not Telegram profits) with funding his personal lifestyle and believes Bitcoin will reach $1 million per coin.

## Education, Competition, and Human Nature

- Durov attended an experimental class at the St. Petersburg Academic Gymnasium from age 11, studying at least four foreign languages simultaneously (Latin, English, French, German, optional ancient Greek) alongside biochemistry and evolutionary psychology.
- He was repeatedly expelled from prior schools for challenging teachers publicly; the gymnasium was the first environment where debate with teachers was tolerated as a path to objective truth.
- He considers mathematics the foundational mental discipline: it trains logical decomposition, sequential problem-solving, and original thinking rather than opinion-regurgitation — he observes that most successful tech founders are strong mathematicians.
- His central argument against removing competition from education: eliminating losing also eliminates winning; children denied competitive stakes redirect that competitive drive into video games, and graduate unprepared for the constant competition of adult economic life.
- He cites Europe's decline relative to China, South Korea, Singapore, and Japan as partly attributable to educational competition removal — those countries maintained "ruthless competition" in their systems.
- The Universe 25 mouse abundance experiment is a touchstone for Durov's view of human nature: evolution optimized humans for scarcity, and unlimited abundance causes social dysfunction, loss of purpose, and eventual civilizational collapse.
- He identifies self-imposed restriction as the key mechanism: growing up poor in Russia — same jacket for years, father's professor salary unpaid for months — created focus, purpose, and character that he credits as formative.

## Children, Legacy, and Final Philosophy

- Durov began donating sperm approximately 15 years ago after a close friend asked for help conceiving; he extended this to additional couples and clinics, resulting in an unknown number of biological children he estimates at over 100.
- His will treats all biological children — naturally conceived and donor-conceived — equally, with inheritance deferred until adulthood on the theory that early wealth paralyzes motivation and removes incentive to develop skills.
- His father, a classicist and author of dozens of books on Ancient Rome who turns 80, gave him the formative lesson: children copy actions, not words — if you tell them not to use a smartphone while using one yourself, the instruction fails entirely.
- His father's view on AI: AI can have consciousness and creativity but cannot have conscience — it cannot have deeply rooted moral principles in the way humans understand integrity.
- On quantum immortality: Durov finds the many-worlds interpretation of quantum mechanics a philosophically interesting frame for his survival of multiple near-death experiences — conscious beings cannot experience their own death, so in some sense every surviving version of a person is the one that keeps branching forward.
- His summary of Elon Musk: every apparent weakness in a founder (Musk's emotionality, Durov's single-company focus) is inseparable from the strength it produces — you cannot have the good trait without the trait that looks bad in other contexts.
