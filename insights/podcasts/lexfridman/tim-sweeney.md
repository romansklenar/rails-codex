---
title: "Tim Sweeney: Fortnite, Unreal Engine, and the Future of Gaming | Lex Fridman Podcast #467"
description: "Tim Sweeney, founder and CEO of Epic Games, traces his journey from a text editor that became ZZT to building Unreal Engine and Fortnite, and explains his vision for a metaverse built on open platforms, a new programming language called Verse, and the dismantling of Apple and Google's 30% app store fees."
source:
  type: podcast
  title: Lex Fridman Podcast
  author: Lex Fridman
  url: "https://lexfridman.com/tim-sweeney"
  date: 2025-05-01
tags: [gaming, unreal-engine, fortnite, epic-games, programming, metaverse, open-source, apple, game-engines, graphics]
---

# Tim Sweeney: Fortnite, Unreal Engine, and the Future of Gaming | Lex Fridman Podcast #467

## Origins and Early Programming

- Tim Sweeney learned to program in BASIC at age 11 during a summer visit to his brother in California, who owned one of the first IBM PCs.
- Between ages 10 and 20, Sweeney accumulated 10 to 15,000 hours of solo programming before ever shipping a commercial product.
- His early projects included a text-based baseball game on the Apple II, a Pascal compiler he built from scratch because he didn't know where to buy one, and a bulletin board system that taught him database management and multi-user concurrency.
- Sweeney studied mechanical engineering at the University of Maryland, and the vector calculus, matrix math, and physics he learned there became directly applicable when he built the first Unreal Engine's 3D systems.
- He attributes his ability to later write a 3D engine partly to "karate kid" moments where accumulated knowledge — vector math, matrices, physics — suddenly became usable in an entirely new context.
- Sweeney's first game development setup was a 486 PC with a 15-inch monitor; by the Unreal Engine era he upgraded to a $7,000 Dell Pentium Pro workstation with a gigabyte of RAM and a 24-inch CRT running 1920x1200 resolution — state-of-the-art for 1996.

## Epic Games and the ZZT Origin Story

- Epic Games was founded in 1991. Sweeney did not set out to build a game — he started building a text editor, then turned the cursor into a smiley face and the document characters into game objects, accidentally creating ZZT.
- ZZT was distributed as shareware: Sweeney released the first of three games for free and asked players to mail $30 to his parents' address for the sequels. Orders started arriving within days at a rate of $100 a day.
- ZZT spread before the public internet via bulletin boards, exploiting the community incentive for users to upload new content and claim credit for bringing it to their local board first.
- Critically, Sweeney shipped ZZT with its level editor, allowing players to build and share their own worlds. He still meets adults at game industry events who grew up building ZZT levels as their first creative programming experience.
- This decision — shipping both a game and the tools to make more games — became Epic's defining corporate philosophy: serve creators and gamers simultaneously so that the engine business can sustain the company through downturns in game revenue, and vice versa.
- The first generation of Epic's 2D games were built by teams assembled remotely via modem and telephone, including Jazz Jackrabbit, which was created by a California high schooler (Cliff Bleszinski) and a Dutch demo coder (Arjan Brussee), with the latter's 30,000-line assembly engine as the starting point.

## Building the First Unreal Engine

- When Wolfenstein 3D shipped, Sweeney was so overwhelmed by its technical sophistication that he gave up on 3D programming for six months, believing he could never compete. He resumed after Michael Abrash published texture-mapping assembly code in a programming magazine, showing that the technique was accessible.
- Unreal Engine 1 was written in C++ on 32-bit Windows NT after starting development in 16-bit C. The move to C++ simplified the codebase dramatically and proved to be the right long-term bet.
- The Unreal team started at about 20 people at peak — a large team for the era — and worked 70–80 hour weeks for three and a half years on a project they perpetually believed was six months from shipping.
- Sweeney wrote the 3D editor while colleagues handled the engine; James Schmalz built 3D models and animations, and Cliff Bleszinski did level design as the "customer number one" for the editor tooling.
- MicroProse licensed the Unreal Engine before the game shipped, paying half a million dollars for two licenses, which became a critical funding lifeline. This licensing revenue — and the support obligations it created — embedded the engine business into Epic's culture from the start.
- Sweeney optimized the Unreal software renderer's texture mapping code to 6 CPU cycles comprising 11 instructions — the minimum necessary to render a pixel on a 90 MHz Pentium at playable frame rates, which he describes as a competitive benchmark among graphics programmers of the era.
- The 3dfx Voodoo 1, the first GPU to deliver serious performance over software rendering, arrived late in Unreal's development cycle and was supported quickly, but the engine was not designed around it.

## Technical Innovations in Graphics

- Constructive solid geometry (CSG) in Unreal — the ability to subtract geometry from the world rather than only adding it — was implemented in a single 30-hour coding session. It was based on binary space partitioning trees and required working through 14 different intersection cases, including the notoriously tricky coplanar polygon case.
- Real-time volumetric fog in Unreal was inspired by a Finnish GPU company's screenshot, which Sweeney later learned was pre-rendered in 3D Studio Max. His real-time implementation required solving a line integral — the integral of the inverse-square lighting falloff function — which resolves analytically to an arctangent, making it fast enough to compute per light map tile rather than per pixel.
- Unreal's lightmapping system calculated illumination at roughly one-foot-grid resolution across surfaces rather than per pixel, enabling colored dynamic lights, torch flickering, caustic water reflections, and shadow casting at interactive speeds while Quake was still using cruder lighting.
- Unreal Engine 5's Nanite virtualized micropolygon system, built by engineer Brian Karis, bypasses GPU triangle rasterization hardware entirely for very small triangles and instead routes geometry through the pixel shader pipeline, exploiting the Nyquist sampling theorem to render two triangles per pixel rather than thousands.
- Lumen, the UE5 global illumination system built by Daniel Wright over roughly a decade, operates at multiple scales simultaneously — from building-level shadows down to per-pixel screen-space detail — so that light behaves consistently from the largest architectural occlusions to the finest surface contact shadows.
- Modern GPUs offer approximately 10 million times more usable graphics performance than the 90 MHz Pentium Sweeney used to ship Unreal Engine 1; modern devices like a PlayStation 5 or high-end GPU deliver around 20 teraflops compared to roughly 90 megaflops on the original platform.
- Rendering photorealistic smoke in Unreal Engine 5 requires a particle system for fire, a separate system for smoke, and lighting calculations that track how light diminishes as it passes through smoke volume — the combination that, in the Marvel 1943 demo, produced smoke Sweeney felt no longer looked like a video game.
- Creating photorealistic humans is the hardest problem in computer graphics because evolution has dedicated specialized brain systems to detecting subtle facial patterns; getting faces right requires correct interplay of subsurface scattering, skin oiliness and reflectance, hair rendering, muscle and fat deformation, and facial animation systems — any single failure puts the result on the wrong side of the Uncanny Valley.

## Fortnite

- Fortnite's core concept — build forts by day, defend against zombies at night — was created in a single one-week internal game jam at Epic in 2011 after finishing a Gears of War project.
- The original Fortnite prototype had a more realistic art style; Epic pivoted to a Pixar-like stylized aesthetic before launch, and the same artists who worked on the gritty Gears of War franchise executed that stylistic shift.
- Fortnite: Save the World launched in early 2017 as an MMO-influenced tower defense game and was a moderate commercial success, covering its budget.
- The Fortnite Battle Royale mode was added in 2017 after Epic employees were playing PlayerUnknown's Battlegrounds internally and realized the building mechanic would transform the genre. The mode was built and shipped in roughly two months.
- Fortnite's cartoonish, non-gory aesthetic — players are teleported out of the simulation when eliminated rather than dying with blood effects — produces measurably more positive player-to-player interactions than games like Call of Duty, which Sweeney attributes to deliberate design choices that affect the community's entire social dynamic.
- Fortnite reached 110 million monthly active users approximately a year before the recording of this podcast, which Sweeney described as an all-time high.
- The 100-player limit in Fortnite Battle Royale is a direct consequence of the single-threaded game simulation in Unreal Engine — the server cannot scale beyond approximately 100–140 concurrent objects updating at 60 frames per second on one CPU core.

## Metaverse, Standardization, and the Verse Programming Language

- Sweeney defines the metaverse not as a specific technology but as the trend of large-scale multiplayer social gaming — players and their real-world friends gathering together in persistent 3D worlds to play, communicate, and create.
- Fortnite became a true metaverse platform in Sweeney's view when Sony agreed to enable cross-platform play, allowing PlayStation, Xbox, PC, and mobile players to share the same lobbies and voice chat — a change Sony initially resisted and Epic pursued through direct confrontation.
- Epic's long-term vision is a standardized interoperable metaverse economy in which players' cosmetic items and in-game possessions persist and transfer across different games from different developers, governed by an open standards body.
- The Verse programming language is Epic's attempt to build a new foundation for the metaverse: it is a functional logic language in which expressions can produce zero, one, or many values (succeed, fail, or iterate), enabling conditions to bind variables and for-loops to express arbitrary queries in a style similar to SQL.
- Verse's type system is designed around the Curry-Howard correspondence — the 1930s mathematical result showing that a sufficiently expressive type system makes types equivalent to theorems and values equivalent to proofs, allowing the compiler to mechanically verify correctness properties of programs.
- Verse's concurrency model uses software transactional memory: game object updates run speculatively in parallel, track their reads and writes locally, and only commit to global state when no conflicts are detected. Conflict-free transactions commit immediately; conflicting ones are retried. This eliminates the need for programmers to manage thread synchronization manually.
- Sweeney's goal for transactional concurrency is to eventually support millions of simultaneous game object updates per frame, which is the architectural prerequisite for a metaverse with far more than 100 concurrent players in a single simulation.
- Verse is currently deployed exclusively within the Unreal Editor for Fortnite (UEFN). Epic plans to integrate Verse into the broader Unreal Engine 6 release, which Sweeney expects to have preview versions available two to three years from the recording.
- Unreal Engine 6's central ambition is to unify three separate tracks: the full Unreal Engine for standalone game developers, the Fortnite creator tools (UEFN), and the metaverse economy — so that a developer can build a game once and ship it as either a standalone title or a Fortnite island, with items interoperating in both contexts.

## Apple, Epic Games Store, and Platform Competition

- Epic launched Fortnite on Android outside the Google Play Store in 2017 to compete directly with Google. Google responded by paying the top 30 mobile publishers hundreds of millions of dollars collectively through a program internally called "Project Hug" (Hold developers close) to prevent them from doing exclusive deals with competing stores. This was a central piece of evidence in the Epic v. Google antitrust trial, which found Google's practices illegal and anti-competitive.
- Epic's analysis of Google Play's cost structure found that the all-in cost of operating the Google Play Store — software, staffing, infrastructure — is approximately 6% of revenue, yet Google charges 30%, a markup only sustainable through monopoly power. Apple's cost structure is similar or lower.
- Apple blocked Fortnite from iOS in 2020 after Epic introduced a direct payment option that bypassed Apple's 30% fee. Sweeney says Epic could withstand the loss of iOS revenue because the majority of Fortnite's player base was on PC and console, while most other top mobile apps would be destroyed by Apple blocking them.
- The Epic Games Store charges developers a 12% revenue share versus Steam's 30%, which Sweeney argues is the appropriate competitive signal: in a market with normal margins, a company whose costs are 6% cannot sustain a 30% take rate without monopoly pricing power.
- Epic spent over one billion dollars in net payments to developers beyond store revenue to fund exclusive game deals on the Epic Games Store, which Sweeney acknowledges worked well for games with dedicated audiences (like Borderlands) but underperformed for smaller games that relied on Steam's organic discovery.
- Sweeney says Apple exerts "soft power" on developers short of banning them — deliberately slowing update approvals by weeks or months for companies not in Apple's good graces — a practice developers are too afraid to publicize because Apple could escalate.
- Even in Europe where the Digital Markets Act requires Apple to allow competing stores, Sweeney says Apple has structured compliance to make competing stores economically unviable, requiring further enforcement and penalties by the EU before the Epic Games Store on iOS becomes competitive.

## AI, Simulation, and the Future of Gaming

- Sweeney is skeptical about AI's near-term ability to generate consistent video or complex 3D scenes: generative AI lacks a persistent internal model of the scene, the plot, and the world, making it fundamentally harder to art-direct than a traditional scene graph maintained by a game engine.
- He believes the most productive near-term role for AI in game development is as a multiplier on human creativity — AI-assisted creation of new assets using existing high-quality scanned data (such as Epic's Quixel library of tens of thousands of real-world objects) rather than full replacement of human artists.
- Sweeney predicts that non-human elements of virtual environments (jungles, cities, lighting, terrain) are within a few years of achieving total photorealism, while convincingly simulating human dialogue, emotional expression, and intent will be the dominant challenge of the following decade.
- He estimates that a compelling real-time simulation of a human at the conversational level — not yet emotional — could be achievable within five years, and that current LLMs already plausibly pass the Turing test in text-based interactions.
- The future of the game industry is bifurcating: very large multiplayer social games that players return to indefinitely (Fortnite, Roblox), and smaller-budget single-player games ($40 million rather than $300 million) that players treat as temporary "vacations" from their primary game before returning. The mid-budget single-player segment faces increasing pressure.
- Sweeney distinguishes sharply between social media, which he views as a negativity-amplifying text medium, and multiplayer gaming, where voice-connected players playing together in real time exhibit consistently empathetic and positive social behavior — a distinction he treats as empirical evidence about which digital environments bring out constructive human nature.
