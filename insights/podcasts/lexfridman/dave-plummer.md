---
title: "Dave Plummer: Programming, Autism, and Old-School Microsoft Stories | Lex Fridman Podcast #479"
description: "Dave Plummer, creator of Windows Task Manager and author of Secrets of the Autistic Millionaire, recounts his path from a 7-Eleven night shift to Microsoft's elite engineering ranks, details how he built Task Manager, Space Cadet Pinball, and ZIP folder support, and reflects on programming, autism, and the future of software."
source:
  type: podcast
  title: Lex Fridman Podcast
  author: Lex Fridman
  url: "https://lexfridman.com/dave-plummer"
  date: 2025-09-06
tags: [programming, microsoft, windows, autism, task-manager, assembly, c-plus-plus, ms-dos, windows-95, windows-nt, space-cadet-pinball, zip, debugging, ai, adhd]
---

# Dave Plummer: Programming, Autism, and Old-School Microsoft Stories | Lex Fridman Podcast #479

## Early Computing and Learning to Program

- Dave Plummer's first computer encounter was a TRS-80 Model 1, Level 1, 4K machine at a RadioShack in 1979-80 — at age 11 he rode his bike there every Thursday and Saturday and set the machine up himself because the store staff hadn't done it yet.
- The TRS-80 used the same five-pin DIN connector for power, video, and cassette — plug them in the wrong order and you'd blow up the machine, which Plummer avoided by reading the label carefully.
- He considers the Commodore 64 the greatest personal computer ever built, ahead of the Apple II, primarily because of higher sales volume and the number of programmers it influenced.
- On the Commodore 64, Plummer's floppy drive overheated early on; with no warranty repair available (the machine was bought second-hand and would have to go to Germany for service), he was left writing programs on cassette tape.
- Because the Commodore 64 had no assembler built in, only a disassembler, Plummer hand-coded his first program — a Galaga clone — by entering 6502 op codes in hex directly, making it true machine language rather than assembly.
- On 6502 without an assembler, code had to be written completely sequentially; adding instructions in the middle was impossible, so every insertion required a jump to free space at the end and then a jump back — producing what he calls "hideous spaghetti code."
- He accidentally erased his Galaga clone while trying to back it up, copying a blank floppy onto the data floppy — his first experience with data management, which taught him "a huge amount of guilt" about rushing.

## Path from 7-Eleven to Microsoft

- After drifting out of high school by skipping progressively more classes, Plummer worked at a 7-Eleven night shift and a paint warehouse; the worst moment was doing gasoline-tank depth measurements with a 15-to-20-foot wooden stick at 40 below, driving thousands of splinters into his hands.
- At age 21 he persuaded his local high school principal to re-admit him on the logic that someone would inevitably drop out, freeing a spot; he completed the three or four classes he needed, then went to university.
- In his first university semester he nearly ended his academic career by barely passing Geometry 90 on a teacher's mercy — those remedial grades didn't appear on his official transcript, giving him a clean start the following semester.
- He funded his university education by writing and selling HyperCache, a file-system block cache for the Amiga — written mostly in C with tight inner loops in 68000 assembly — which sold a couple of thousand copies at $20–$40 each.
- HyperCache was an N-way associative cache that matched drive geometry and prefetched entire tracks at once; Plummer distributed it as shareware, starting on Usenet and Amiga forums, and it was eventually picked up by physical software retailers.
- To get a Microsoft internship, he went through his HyperCache registration cards looking for Microsoft email addresses, found three or four, cold-emailed them, and one — Alasdair Banks — connected him to Ben Slifka, who conducted a phone interview and offered him a position on MS-DOS.

## MS-DOS and Early Microsoft Work

- Microsoft before MS-DOS was primarily a language company — BASIC for multiple platforms, a Fortran compiler, a Pascal compiler — and their deal to bundle MS-DOS with every IBM PC transformed them from a language vendor into a platform standard they leveraged for decades.
- MS-DOS is fundamentally a command launcher: it resolves a typed name against the current directory and the PATH, loads the executable, and runs it — with no multitasking and no graphical interface.
- The x86 architecture limited MS-DOS base memory to 640K; as an OS developer, any RAM you consumed meant less available to every user on every machine in the world, making memory frugality a moral obligation.
- The "nobody will ever need more than 640K" quote has been attributed to Bill Gates but Plummer says it is not real — a misattribution that has circulated for decades.
- One of Plummer's first intern tasks was adding CD-ROM caching to SmartDrive, Microsoft's disk cache — CD-ROMs were brand new and Microsoft Bookshelf was one of the few products that ran on them; caching sped them up "dozens of times."
- He also moved SmartDrive and the DoubleSpace compression engine into "high memory" — the extra 64K accessible by combining the x86 segment and offset registers to produce an address above one megabyte — by placing code stubs in low memory that jumped to the relocated code above the 1MB boundary.

## Windows 95 and Windows NT

- Plummer worked on the COM/OLE Presentation Cache for Windows 95, which stores enhanced metafile renders of embedded Excel charts or Word objects inside a Word document so that Excel doesn't have to be loaded just to display a chart.
- Windows 95 was an evolution of the 16-bit Windows 3.1 codebase with 32-bit support, VxD drivers, and an entirely new UI — people lined up overnight to buy it at retail, a level of consumer excitement for an OS update that Plummer calls genuinely revolutionary.
- Dave Cutler, who came to Microsoft from Digital Equipment Corporation after DEC cancelled the Prism and MICA projects, is the kernel architect behind Windows NT — Plummer calls him "the Linus Torvalds of Windows."
- Cutler was still coding daily as a Microsoft Fellow at approximately age 85 at the time of the episode, and by Plummer's account still went into the office.
- Windows NT was written in C and started from OS/2 as a reference point, but OS/2 was in assembly language — the NT team's first task was re-architecting the whole thing in C around Cutler's clean-sheet kernel design.
- Porting the Windows 95 shell to NT meant converting every string from 8-bit ANSI to 16-bit Unicode — a process Plummer compares to "breaking into someone's house and going through all their drawers," where you encounter both beautiful code and 200-character-wide lines with profanity in the comments.
- Microsoft had 10,000–15,000 employees on MS Mail at the time; downloading the global address book each morning on 10 Mb/s networking took the entire first hour of the workday.
- The Stress system ran overnight on idle machines to crash them on purpose; crashed machines dropped into a serial-cable kernel debugger, and developers' first morning task was triaging those crashes and restoring the machines to their owners.
- NT was ported to four instruction sets simultaneously — Intel x86, MIPS, Alpha, and PowerPC — so a bug on any one architecture required debugging in that architecture's assembly language, with no source-level debugger available.

## Task Manager

- Windows Task Manager started as a home side project — Plummer built the initial version using registry performance keys (HKey Current Performance) because he wasn't at the office and couldn't call internal NT APIs.
- Once he brought it in-house, he switched to `NtQuerySystemInformation` and `NtQueryProcessInformation`, which made the app noticeably faster and more accurate.
- To keep Task Manager as small as possible, Plummer deliberately avoided linking the C runtime library — a single call to any C runtime function would have nearly doubled the binary size, adding roughly 96K. The original shipping binary was approximately 87K.
- Because he excluded the C runtime, he had to manually invoke C++ object constructors from the dispatch table himself — extra work that kept the binary "incredibly small and tight."
- Task Manager uses a Hamming-code-style dirty-bit scheme: each row and each column has a dirty bit, and only cells whose row AND column bits are set get repainted — making individual-cell repaints possible and keeping the UI fast even with many processes listed.
- He designed Task Manager to handle any resize smoothly, including wrapping the CPU graphs at eight per row if more than eight CPUs were present — a decision that still holds up on modern 96-core machines.
- Task Manager shipped first in Windows NT 4.0 and is still largely the original C++ code today, grown from 87K to about four megabytes by additions for dark mode, GPU reporting, thermals, and XML schema layers built on top.
- Plummer embedded his phone number (425-836-XXXX) in a commented-out assert he used to track a kernel CPU-accounting bug that made Task Manager briefly show over 100% total CPU usage; the commented number shipped in NT and appears in leaked NT source code, which is how he finds his Task Manager code when searching online.
- Task Manager runs on approximately two billion Windows instances per month by Plummer's recollection of internal Microsoft metrics.

## Space Cadet Pinball and Other Software

- Microsoft asked Plummer to port Space Cadet Pinball to Windows NT in three months because they wanted a visually impressive, fast-graphics demo for the platform; the original game was written for Win95 and had multiple tables.
- Much of Space Cadet Pinball's original code was in assembly language; because Plummer was on a MIPS machine, he had to rewrite it in C before porting it to all four NT instruction sets.
- At the heart of the game is a giant state machine — roughly a 50-entry switch statement — that Plummer treated as a black box, wrapping his own drawing, sound, and collision code around it rather than re-engineering it.
- A bug in his port caused physics to be simulated at up to 5,000 frames per second on fast hardware instead of the original ~30 fps, producing subtly different (arguably more precise) ball physics compared to the Win95 version — this discrepancy was eventually corrected in later Windows versions.
- Solitaire was included in Windows not as a game but as a drag-and-drop tutorial; Minesweeper was included to teach right-clicking — Plummer learned this from colleagues at the time.
- Plummer built Visual ZIP at home in 1993 as a shareware Shell extension for Windows, motivated by taping a picture of a $300K house with a red Corvette in the driveway to his monitor as a financial incentive to work nights; he sold hundreds to thousands of copies at $19.95–$29.95.
- Microsoft's acquisition team called Plummer to buy Visual ZIP without knowing he was already a Microsoft employee; he accepted their offer and used the money to buy a used red 1993 Corvette — the exact car from the photo.
- ZIP file support traces back to Phil Katz's command-line MS-DOS tool PKZIP, which became ubiquitous on BBS systems; when Windows arrived, users had been creating ZIP files for a decade but had no native way to open them.
- Windows' built-in ZIP support still runs single-threaded, written in the single-core era — on a modern 96-core AMD EPYC 7995, it uses exactly one core to decompress a file.
- Plummer also implemented Windows Product Activation for Windows XP under deadline pressure after the original team slipped the schedule enough that it was going to miss the XP ship date; he built it with help from the DRM team and mathematicians who designed the product key encoding.

## Debugging Philosophy

- At Microsoft in the NT era, roughly 80% of Plummer's professional time was spent debugging and fixing rather than writing new code — he developed a reputation as someone who could fix difficult bugs and so difficult bugs flowed to him.
- All debugging at that time was done in raw assembly, even when the source language was C, because there was no source-level debugger available — you looked at call stacks, register states, and disassembled machine instructions.
- Plummer's rule for asserts: assert things you know cannot be true, not things you hope aren't true — an assert that fires is never a warning, it is a bug, and you want to know about it immediately.
- His advocate for adding asserts organically while writing code, not retroactively — for each function, assert every assumption: if a pointer must not be null, assert it; if a count must stay within bounds, assert that.
- The most impressive debugging Plummer witnessed was Laura Butler — later a Distinguished Engineer at Microsoft — who arrived six weeks into Plummer's tenure to debug a deadlock in the Windows 95 kernel, spent five minutes blazing through call stacks and kernel object states in WinDbg, said "Oh, I see," disconnected, and left.

## Blue Screen of Death

- The Blue Screen of Death is triggered when the Windows kernel detects an illegal operation — a driver writing to memory it doesn't own, or freeing memory twice — and has no safe recovery path; it halts the machine to prevent further damage and dumps diagnostic information.
- Jon Viert wrote the NT Blue Screen; the reason he chose white text on blue background was purely pragmatic: the MIPS firmware he was developing on used that color scheme, and so did his Visual SlickEdit editor — the same scheme for coding, booting, and crashing meant he never had to context-switch visually.
- Rebooting fixes most Windows problems because it clears two categories of accumulated failure: memory that was allocated but never freed (growing until performance degrades), and code that has drifted into an unanticipated state that the developers didn't test.

## Autism and ADHD

- The foundational theory of thought for autism is monotropism: one topic of intense focus at a time, serial single-tasking, not multitasking — Plummer's brain does one thing intensely and then, when done, moves on.
- The biggest benefit of autism for Plummer is the ability to bring an extraordinary amount of sustained focus and dedication to a task he loves — he likens it to the feeling a child gets playing with trains.
- The paradox of his co-occurring ADHD: acquiring focus is hard (easily distracted, needs noise-canceling headphones to sleep), but once focus is established it is very hard to break — getting into the state is difficult; staying in it is easy.
- The biggest challenge of autism for Plummer is not knowing what other people are thinking; instead of reading facial expressions and reactions, he runs an internal NPC simulation of each person he deals with, modeling what they probably think based on what he would think in their position.
- Phone calls are especially difficult because he relies heavily on visual cues — facial expressions and body language that confirm whether a remark is a joke or serious; FaceTime is significantly easier than voice-only calls.
- A recurring pattern in his marriage of 31 years (together 37 years): his wife would say "you know what I mean" after an ambiguous statement, and he would reply sincerely "No, I only know what you said" — a literalism that took years for both of them to understand and accommodate.
- At his first Microsoft intern gathering at Bill Gates's house, Plummer interrupted his manager's four-month timeline to correct it to three months — realizing only after the fact that it was the wrong moment to correct anyone, let alone Gates.
- Masking — performing neurotypical social behavior through deliberate conscious effort — is exhausting work for autistic people; every gesture, facial expression, tone of voice, and posture that neurotypical people produce automatically must be manually constructed.
- Neil Peart's "Limelight" by Rush — "all the world's indeed a stage, and we are merely players" — reads to Plummer as a description of masking and the difficulty of treating strangers as friends; he speculates Peart may have been on the spectrum.
- An autism meltdown is a panic state: the frontal cortex shuts down, decision-making and behavioral filtering disappear, and the person regresses to a fight-or-flight response triggered by accumulated emotional overload.
- Plummer estimates 10–20% of the population has sub-clinical autism spectrum traits — enough to benefit from strategies for leveraging the focus advantages and mediating the social deficits, even if they don't meet the clinical threshold for ASD.
- He wrote his book Secrets of the Autistic Millionaire primarily for his own children, none of whom have diagnosed ASD, but all of whom have specific autistic behavioral traits they inherited from him.

## Language Performance, Side Projects, and AI

- Plummer runs the GitHub Primes project: a single prime-sieve algorithm (counting primes up to 100 million as many times as possible in a five-second loop, using at most one bit per integer) implemented in approximately 100 programming languages, all running in separate Docker containers on a benchmark server, with results updated nightly.
- The benchmark machine has one terabyte of RAM, built specifically for the project; results run across all CPU cores simultaneously.
- Current ranking as of the episode: Zig is typically at the top, with C++ in close competition — C implementations run roughly 1.5× slower than the fastest Zig implementation.
- The project started with three languages — Python, C#, and C++ — that Plummer added himself; it grew after he published the YouTube episode and the community submitted implementations in dozens more, eventually requiring two European maintainers (Rucker and Tudor) to manage it.
- Plummer holds the world record on Atari Tempest (1980) and is building a reinforcement learning AI to beat himself — using a dueling Deep-Q network with two heads that "chase each other," implemented in Lua (to extract game-state parameters from memory) communicating over a socket to Python (to run the RL model).
- His AI can play Tempest to approximately level 36; the world-record game reaches level 96, giving the AI about 40 levels to close.
- He used LLM-assisted coding (Cursor) heavily on the Python side of the Tempest project because Python was a new language for him; he found that reading AI-generated Python taught him idiomatic constructions he would never have produced writing from scratch, since expert Python is several times more concise than naive Python.
- His view on vibe coding: a good programmer with deep C++ knowledge can use AI to accelerate learning a new language and answer "dumb questions" they'd be embarrassed to Google; someone without programming fundamentals cannot effectively vibe-code production systems.

## Future of Programming

- Plummer's forecast for AI's impact on programming: the role will shift toward architecture and specification — like a structural engineer who no longer welds beams but drags components in AutoCAD and describes to the AI how they should interact — while low-level line-by-line coding diminishes in economic importance.
- He believes we are "still quite a ways" from AI being able to generate a full Linux-compatible kernel from scratch, though he acknowledges that day will likely come.
- His own career arc — learning TTL logic, machine code, assembly, C, C++, and eventually AI-assisted Python over 30–40 years — gives him a complete picture of the full software stack that he says will be "hard to duplicate for people starting now," because they will enter at a layer of abstraction that skips the foundational layers.
- His primary languages remain C++ and assembly, supplemented currently by Lua and Python for the Tempest AI project; he writes two styles of C++: modern C++20 with no raw pointers (which he considers nearly as safe as Rust) and plain C with classes (polymorphism and encapsulation without the rest of the C++ machinery).
