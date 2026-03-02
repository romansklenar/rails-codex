---
title: "David Kirtley: Nuclear Fusion, Plasma Physics, and the Future of Energy | Lex Fridman Podcast #485"
description: "David Kirtley, CEO of Helion Energy, explains how pulsed magneto-inertial fusion works, why the field-reversed configuration is uniquely suited to direct electricity extraction, and how Helion plans to deliver fusion power to a Microsoft data center by 2028."
source:
  type: podcast
  title: Lex Fridman Podcast
  author: Lex Fridman
  url: "https://lexfridman.com/david-kirtley"
  date: 2025-11-17
tags: [nuclear-fusion, plasma, energy, helion, physics, clean-energy, frc, magneto-inertial-fusion, power-generation, fusion-engineering]
---

# David Kirtley: Nuclear Fusion, Plasma Physics, and the Future of Energy | Lex Fridman Podcast #485

## Fusion vs. Fission: The Basics

- Fusion powers the universe by combining lightweight nuclei — primarily hydrogen isotopes — into heavier elements; fission does the opposite, splitting heavy, unstable nuclei like Uranium-235 or Plutonium-239 by adding a neutron to trigger a chain reaction.
- In both reactions, the product nuclei have slightly less total mass than their inputs; that mass deficit is released as energy via E=mc², though the amounts and products differ dramatically between fission and fusion.
- Iron is the pivot point in the periodic table: elements lighter than iron release energy by fusing together, while elements heavier than iron release energy by splitting apart.
- Fission fuels — uranium and plutonium — were made in primordial supernovae and the Big Bang; fusion fuels — hydrogen isotopes — are the most common atoms in the universe, making up the bulk of every star.
- Deuterium, the primary fusion fuel Helion uses, is a heavier isotope of hydrogen with one proton and one neutron; it is found in all water on Earth, including seawater, and is safe, clean, and virtually unlimited.
- Kirtley estimates that the deuterium dissolved in Earth's seawater contains enough fusion fuel to power all of human civilization at current electricity consumption levels for between 100 million and 1 billion years.

## Why Fusion Is Inherently Safer Than Fission

- The NRC defines a nuclear reactor as an apparatus designed to sustain a self-supporting chain reaction of nuclear fission; fusion does not meet this definition, and Helion deliberately uses the word "generator" rather than "reactor" because fusion simply stops when you stop feeding it fuel.
- At any given moment, a Helion fusion system contains approximately one second's worth of fuel; if anything catastrophic happens — including, in the analysis Kirtley submitted to the NRC, a meteor strike — that fuel disperses harmlessly back into the environment as deuterium gas, without any runaway reaction.
- A fission power plant holds several years of fuel in its core, meaning a physical failure leaves a large reservoir of potential energy at risk; fusion's one-second fuel inventory is a fundamental architectural safety advantage.
- Fusion power plants cannot contribute to nuclear weapons proliferation: the physics of fusion do not produce weapons-usable fissile material, and nuclear nonproliferation experts have urged Helion to develop fusion as fast as possible specifically to reduce the global incentive to build uranium enrichment infrastructure.
- Even so-called hydrogen bombs derive approximately 90% of their energy from a fission primary stage using uranium; the fusion component merely boosts the fission yield, and there is no known path to a pure fusion weapon based on current physics understanding.
- Modern fission reactors are engineering-safe; Kirtley's view is that past disasters like Chernobyl and the oldest Fukushima reactor units reflect human and institutional failures rather than fundamental engineering failures of the power plant design itself.

## The Physics of Plasma and Fusion Confinement

- To achieve fusion on Earth, hydrogen isotopes must be heated above 100 million degrees Celsius — the point at which particles move fast enough (on the order of 1 million miles per hour) to overcome electromagnetic repulsion and get close enough for the strong nuclear force to bind their nuclei together.
- At around 10,000 degrees, atoms lose their electrons and become plasma — a state where nuclei and electrons move independently; at fusion temperatures, temperature is best understood not as heat in the everyday sense but as the kinetic velocity of individual particles.
- Magnetic fusion confines plasma by trapping charged particles on magnetic field lines, where they gyrate in circular orbits measurable in inches — far larger than the atomic scale — and are prevented from touching the reactor walls.
- The fundamental challenge of magnetic confinement is that particles constantly collide with each other, are knocked off field lines, and escape; all magnetic fusion approaches are essentially races between fusion events and particle loss.
- Plasma beta is the ratio of particle pressure (NkT) to magnetic pressure (B²/2μ₀); a high-beta plasma pushes back hard against its confining magnetic field, meaning it is energetically dense but difficult to hold stable.
- The field-reversed configuration (FRC) operates at beta equal to one — the highest possible value — meaning the particle pressure exactly matches the magnetic pressure; this makes FRCs extraordinarily energy-dense but inherently prone to a tilting instability, which Helion has learned to manage through the stability parameter S* over E.

## Helion's Magneto-Inertial Approach: The Field-Reversed Configuration

- Helion uses pulsed magneto-inertial fusion (also called magnetoinertial fusion), which sits between laser inertial fusion (nanosecond pulses, no magnetic field) and tokamak-style steady-state magnetic confinement — combining high magnetic pressure pulses with self-organized plasma confinement.
- The key physics phenomenon Helion exploits is the field-reversed configuration: when the external magnetic field in a linear solenoid is reversed faster than the hot plasma particles can physically respond (in under one microsecond), the plasma reconnects internally and forms its own closed magnetic topology — trapping itself in its own magnetic field rather than an external one.
- A natural analogue of the FRC is the plasmoid: the self-organized blob of magnetized plasma that solar flares detach and hurl into the solar system, carrying their own enclosed magnetic field for a brief time before dissipating.
- FRC stability is governed by the parameter S*/E — the hybrid kinetic stability parameter S* (related to plasma temperature and gyro-orbit size) divided by E (the elongation, or length-to-width ratio of the plasma); a high S*/E plasma is stable like a rapidly spinning duct-tape roll, rather than a slowly spinning coin that tips over.
- Counterintuitively, heating the plasma also stabilizes it: because S* is a function of temperature, getting the FRC hot fast enough is essential to keeping it from tilting before it reaches fusion conditions — which is why Kirtley describes Helion as "more of an electrical engineering company than a fusion company on many days."
- FRCs that theory predicts should survive only a few microseconds have been held stable for thousands of microseconds in practice — roughly 1,000 times the naive theoretical limit — once S*/E is properly engineered into the design.

## Plasma Compression and Direct Electricity Recovery

- Fusion output in pulsed magnetic systems scales as B to the power of 3.77 (approximately), making magnetic field strength the dominant lever: pulsed magnets have demonstrated over 100 Tesla, compared to roughly 20-27 Tesla achievable in steady-state superconducting systems, which translates to orders-of-magnitude more fusion power output.
- Helion's energy recovery chain works as a transformer analogy: the fusion plasma, under high magnetic pressure, pushes back on the external magnetic coils; this induces a current back into the capacitor banks that originally powered the compression, recovering the input electrical energy at over 95% efficiency.
- When fusion occurs inside the compressed FRC, newly born charged particles (helium nuclei and protons) add pressure to the plasma, which expands against the magnetic field, pushing more electrical current back into the capacitors — recovering fusion energy directly as electricity rather than heat.
- Theoretical papers have predicted that this direct inductive energy recovery approach can achieve 80–85% conversion efficiency from fusion energy to electricity, compared to the 30–35% efficiency of conventional steam turbine cycles used by fission plants and tokamak-style fusion designs.
- Helion's chosen fuel for its commercial machines is deuterium and helium-3 (D-He3): when these nuclei fuse, they produce a helium-4 nucleus and a proton — both charged particles — which stay trapped in the magnetic field and push back on it, enabling full direct electrical recovery; the competing D-T fuel produces a neutron that carries energy out of the magnetic system and must be captured thermally.
- Helium-3 is rare on Earth (it escapes the atmosphere due to its light mass), but is abundant in Jupiter's atmosphere and has been found on the Moon; as a price for the cleaner direct-electricity fuel cycle, D-He3 fusion requires operating temperatures of 200–300 million degrees rather than the 100 million degrees sufficient for D-T.

## Control, Simulation, and the Electrical Engineering of Fusion

- Each Helion fusion "shot" fires in microseconds — far faster than any human response time — so the entire sequence of fuel injection, field reversal, compression, fusion, and energy recovery is pre-programmed into FPGAs using assembly-level code, triggered via fiber optic signals traveling at the speed of light.
- A full Helion system requires tens of thousands of parallel electrical switches conducting 100 million amps (100 mega-amps) simultaneously; even the largest individual transistors handle only 30,000 amps, so massive parallelism is essential.
- Real-time monitoring is achieved via Rogowski coils — electromagnetic coils that emit optical signals proportional to the current flowing through each switch — feeding back over fiber optics to a central system that verifies every switch is conducting correctly before and during each shot.
- Helion uses a hierarchy of simulation tools: SPICE circuit models coupled to magnetohydrodynamic (MHD) fluid codes for circuit and bulk plasma design, and particle-in-cell (PIC) hybrid codes for ion-level stability analysis — the latter only became computationally feasible recently, aided by the same GPU hardware built for AI data centers.
- Simulation cycle times remain a bottleneck: advanced stability simulations take one to two days to run, meaning operators must pre-design shot sequences, run experiments, and compare results over days rather than in real time; Kirtley is actively exploring reinforcement learning to compress this loop toward near-real-time.
- Some fusion simulation codes are still written in Fortran, with Python increasingly used for control logic; Helion is actively hiring Fortran programmers specifically for fusion physics codes.

## Prototypes, Iteration Velocity, and Manufacturing Philosophy

- Helion has built seven fusion systems, the first six of which were prototypes named after Starbucks cup sizes (IPA, Tall, Grande, Venti, Trenta) plus a founding system called the Inductive Plasmoid Accelerator (IPA); each generation scaled up magnetic field, plasma temperature, and energy.
- Trenta, the sixth system, came online in 2020 with approximately 50 employees; it was the first machine to achieve 100 million degree temperatures in a deuterium–helium-3 plasma and, as far as Helion knows, the first device to demonstrate bulk D-He3 fusion.
- Helion's core manufacturing philosophy is that building small, rapidly manufactured systems generates scientific learning faster than building one massive experiment; by iterating at speed, the company learned fusion scaling laws empirically — including the B^3.77 power scaling — far faster than a single mega-project would have allowed.
- To maximize build velocity, Helion sources components from eBay and surplus markets when possible: turbomolecular vacuum pumps available same-day on eBay — even if only one of three purchased units passes specification — beat a nine-month manufacturer lead time, and this mentality is applied system-wide.
- When standard G10 fiberglass sheet (the same material as PCB circuit boards) came in sizes too small for the Trenta end caps, Helion machined and bolted two off-the-shelf pieces together rather than waiting six to twelve months for a custom molded part — a representative example of the company's "good enough to move fast" engineering culture.
- Helion is now over 500 people, of whom approximately 50% are technicians rather than scientists — unusual for a fusion company — with a working conveyor belt production line (a second one recently came online) manufacturing power supplies in-house to avoid supply chain delays.

## The 2028 Microsoft Power Purchase Agreement

- In 2023, Helion signed a power purchase agreement with Microsoft to supply electricity to the grid serving one of Microsoft's data centers, with a contractually committed target of producing first electrons from a fusion power plant by 2028.
- Microsoft had observed Helion's progression through multiple prototype generations, watched fusion milestones being hit, and seen the manufacturing infrastructure being built before agreeing to the deal; Kirtley says the hard deadline is "daily" in his mind.
- The seventh Helion system, Polaris, is the machine intended to demonstrate net electricity production; it was still under construction and simulation when Trenta was operating, meaning most of the post-2020 hires have not yet seen a full machine-build-to-fusion cycle themselves.
- Helion's pulsed design enables variable power output: the repetition rate can be tuned between 1 and 10 pulses per second on the power plant, and smaller plasma systems have been demonstrated running at 100 pulses per second (100 Hz) for over a billion consecutive operations continuously.
- Because the primary energy recovery is DC (electricity stored in capacitors), Kirtley's team is exploring direct DC-to-GPU connections that would bypass conventional AC grid conversion and transmission losses — a potentially unique tight coupling between a fusion power plant and a data center.
- Helion is already working on site selection, utility interconnect agreements, and regulatory approvals for the 2028 plant; the NRC's ADVANCE Act, signed into law recently, codified for the first time how the U.S. government will regulate commercial fusion systems, treating them under Part 30 (particle accelerator rules) rather than Part 50 (fission reactor rules).

## Energy Density, Cost, and the Path to Scale

- Kirtley frames power plant cost from first principles: in a well-optimized manufacturing process, cost asymptotes toward raw material cost (concrete, steel, copper, aluminum), so minimizing system size and material usage directly determines whether fusion electricity can be economically competitive.
- A 50-megawatt Helion fusion facility is projected to fit inside a roughly 27,000-square-foot building (approximately one acre), compared to more than 2,000 acres of solar panels needed to produce equivalent output in Seattle.
- Because the AI cost of computation asymptotes toward the cost of electricity, and data centers concentrate enormous power demand in a small geographic area, Kirtley sees AI data centers as the ideal near-term deployment target for fusion: high power density on a small site, with a buyer willing to pay for reliable baseload power.
- Helion's long-term manufacturing ambition is a Gigafactory model producing 50-megawatt fusion generators on a daily production cadence, shipped on trucks to sites — analogous to what Tesla has demonstrated with electric vehicles and SpaceX with rockets.
- The world currently has approximately 4,000 gigawatts of installed fossil fuel electricity capacity; Kirtley's metric for meaningful success is not a single demonstration but beginning to replace that capacity at scale through high-volume manufacturing.
- Energy growth forecasts of 4–6% per year driven by AI data center demand are, in Kirtley's view, likely to be significant underestimates of where electricity demand is actually heading.

## Geopolitics, the Kardashev Scale, and the Fermi Paradox

- Because deuterium comes from seawater found everywhere on Earth, fusion fuel cannot be monopolized, embargoed, or pipeline-disrupted by any nation or cartel — a structural geopolitical advantage over both fossil fuels and fission, which requires enriched uranium linked to weapons proliferation risk.
- Nonproliferation experts approached by Helion urged the company to develop and deploy fusion power plants as rapidly as possible globally, specifically to reduce the worldwide incentive to build uranium centrifuge enrichment programs that create weapons-grade material as a byproduct.
- The Kardashev Type I threshold — where a civilization harvests or generates energy equivalent to all solar energy incident on Earth — is reachable with fusion given that the Earth's seawater holds at least 100 million years of fuel at current use rates, leaving room for 100x or more expansion in power output.
- Kirtley finds the Matrioshka brain hypothesis — that advanced civilizations turn inward, building Dyson spheres to power massive cognitive expansion rather than physically colonizing space — increasingly plausible given recent AI trends, which may partly explain the Fermi Paradox.
- Fusion propulsion is the natural energy source for deep space travel: solar power falls off as the square of distance from the Sun, making it impractical beyond the inner solar system; fusion fuel is energy-dense and self-contained, and direct energy recovery (no steam cooling required) is essential in the vacuum of space where there is no working fluid to reject waste heat into.
- Kirtley's team at the predecessor to Helion worked on fusion rockets and beamed microwave launch systems before spinning off to focus exclusively on terrestrial fusion power; the efficiency-first design philosophy borrowed from aerospace — where every watt of heat generated must be radiated away by a heavy radiator — directly shaped Helion's approach to direct electrical recovery.
