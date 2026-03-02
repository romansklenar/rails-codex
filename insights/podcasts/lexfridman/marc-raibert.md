---
title: "Marc Raibert: Boston Dynamics and the Future of Robotics | Lex Fridman Podcast #412"
description: "Marc Raibert traces 40+ years of legged robotics research from his first pogo-stick hopping machine at Carnegie Mellon in 1982 through BigDog, Atlas, and Spot at Boston Dynamics, and into his current work on athletic and cognitive intelligence at the Boston Dynamics AI Institute."
source:
  type: podcast
  title: Lex Fridman Podcast
  author: Lex Fridman
  url: "https://lexfridman.com/marc-raibert"
  date: 2024-02-16
tags: [robotics, boston-dynamics, locomotion, legged-robots, control-systems, hydraulics, athletic-intelligence, ai, machine-learning, manipulation, hiring, engineering]
---

# Marc Raibert: Boston Dynamics and the Future of Robotics | Lex Fridman Podcast #412

## Origins and Early Inspiration

- Raibert's conversion to robotics happened in 1974 when, as a graduate student in Brain and Cognitive Sciences at MIT, he followed professor Berthold Horn back to the AI Lab and found a disassembled robot arm in roughly a thousand pieces — that single sight determined the rest of his career.
- Before robotics, Raibert was an electrical engineer undergrad at Northeastern studying neurophysiology for graduate school, but found single-neuron recording too reductionist to yield insight into control systems or thought.
- The original pitch for his first pogo-stick robot project was deliberately sandwiched between two boring-sounding proposals on a list shown to Ivan Sutherland — Sutherland, sometimes called the father of computer graphics, immediately identified the middle item as the one worth funding.
- Sutherland gave Raibert roughly $3,000 from his endowed chair to build a first physical model by hand in a Caltech machine shop while Raibert was still at JPL; that non-functional prototype was enough to walk into DARPA with.
- Ivan Sutherland walked Raibert cold into DARPA's hallways in the late 1970s, found Craig Fields (later DARPA director) in his office, opened a Samsonite suitcase containing the bare skeleton of a one-legged hopping robot, and received a commitment of $250,000 — a very large research grant in 1980.
- Raibert joined Carnegie Mellon as a professor starting around 1980; the Leg Lab was founded there before it later moved to MIT, and the first working three-dimensional hopping machine dates to approximately 1982–1983.

## The Physics of Hopping and Balance

- Raibert's rejection of the dominant robotics approach came at a biological legged locomotion conference in Philadelphia, probably in the late 1970s, where a six-legged robot moved so slowly it always kept three feet on the ground like a table — he concluded that was fundamentally unlike how animals or humans actually move.
- The key insight: animals use the springiness in their muscles, tendons, and connective tissue to circulate energy rather than discard it with every step; the early pogo-stick robot captured that principle without any knee or ankle.
- A hopping robot in 3D is controlled by three independent sub-problems: (1) an energy regulation loop that measures apex height to decide whether to add or remove energy from the spring-mass cycle, (2) a foot-placement algorithm that positions the foot relative to the center of mass to control forward velocity, and (3) a hip-torque loop applied only while the foot is on the ground to keep body attitude upright.
- The foot-placement calculation for a running robot is analogous to a pole vaulter: the vaulter must position the pole's ground contact in exactly the right place relative to the body's center of mass at takeoff, or the outcome is either a backward fall or a premature vault.
- In the air, applying torques between the hip and body has no effect on the body's angular momentum — the physics only allow attitude correction while the foot is on the ground, which is what makes legged robots fundamentally different from wheeled or floating systems.
- The first working 3D somersault on a planar (boom-constrained) robot was achieved around 1985–1986; a 3D somersault with tucking was later accomplished at MIT by graduate student Ron Robert, himself a champion gymnast, who brought physical intuition from his own athletic background to the mathematics of rotation rate and angular momentum.
- Atlas running has reached closer to human-like gait than Atlas walking — the walking motion still struggles with the knee's folding-unfolding dynamics and compliance that humans execute naturally, which gave rise to Boston Dynamics' motto: "You have to run before you can walk."

## BigDog, LS3, and the Road to Spot

- The Leg Lab quadruped that preceded BigDog required a VAX computer in a separate room, a hydraulic pump with long hoses, dedicated air conditioning, and a proprietary communications bus — all of it off-board; BigDog was the first system that integrated power, compute, and actuation onto a single mobile platform.
- BigDog originated from a DARPA biodynamics program run by Alan Rudolph: 42 proposals were submitted and three were funded, including BigDog and a climbing robot called RISE.
- The critical team-building hire for BigDog was Martin Buehler, recruited from McGill University in Montreal, who was instrumental in moving the robot from the lab into real outdoor terrain — embodying the company motto "build it, break it, fix it."
- BigDog was tested extensively at the Marine Corps base at Quantico on a trail called the Guadalcanal Trail, which DARPA specified as the milestone terrain; the robot carried an operator-guided payload while balancing and placing its own feet, but visual perception and navigation were handled by a skilled human operator on-site.
- LS3 (Legged Squad Support System) evolved from BigDog and was designed to carry 400 pounds; the team demonstrated it carrying approximately 1,000 pounds in one test by having one LS3 carry the other.
- Spot's origin was a conversation with Larry Page after Google acquired Boston Dynamics: Page asked whether a robot could be made that weighed around 60 pounds and would be less intimidating to have in a home — that constraint became the specification for the first all-electric, non-hydraulic quadruped.
- The Wildcat quadruped, which used a small racing go-kart engine, reached 19 miles per hour on flat terrain — fast enough that engineers three buildings away sent complaints about the noise.

## Hydraulic Actuation and Hardware Innovation

- Raibert argues that hydraulics are unfairly dismissed as old-fashioned; the basic servo valve design had been frozen since the 1950s when it was engineered for aircraft, and Boston Dynamics performed substantial original innovation on valve circuits, achieving both higher efficiency and much smaller physical size.
- Boston Dynamics built a hydraulic power supply about the size of a football, weighing 5 kilograms, that produces 5 kilowatts of power while integrating a motor, pump, filters, heat exchanger, and valves in a single package — enabling the lightweight, powerful actuators seen in Atlas.
- The custom servo valves in Atlas perform some of the computation that classic hydraulic circuits did externally, resulting in more efficient energy use per unit of motion and a smaller overall robot.
- The transition from hydraulic to electric actuation in Spot required eliminating the gasoline engine and hydraulic pump circuit, replacing them with a battery driving a motor — a significant systems-integration challenge that ultimately enabled indoor deployment and reduced intimidation factor.

## Natural Movement and Control Architecture

- Natural-looking robot movement, according to Raibert, requires predictive control: the system must model where the body will be in the near future and actuate toward that future state, rather than purely reactive control that only corrects measured errors after they appear.
- Spot's model-predictive controller operates over a limited horizon of approximately one to one-and-a-half seconds, re-solving the optimization at every 100-millisecond interval while accounting for obstacle positions, foot placements, and balance simultaneously.
- Dynamic maneuvers like somersaults require a much longer planning horizon: all the necessary rotation and momentum must be committed at launch, because once airborne the robot cannot modify angular momentum.
- Atlas's three-step-stair climbing maneuver took 109 recorded attempts and approximately six weeks of work before achieving a reliable success rate — the team filmed every attempt and used human-in-the-loop data collection to drive iterative improvement.
- Tad McGeer demonstrated in the mid-to-late 1980s that a legged mechanism with no computer at all could walk down an inclined plane using only carefully tuned springs and dampers — a concept called passive dynamics that shows the mechanical body can be a participant in motion, not just a passive recipient of control commands.

## Athletic Intelligence vs. Cognitive Intelligence

- Raibert frames intelligence as having two distinct components: athletic intelligence (real-time physical control, energetics, hardware-software co-design) and cognitive intelligence (planning, understanding, on-the-job learning, and task generalization).
- Boston Dynamics, in Raibert's assessment, has set the standard for athletic intelligence but most robots — including Spot — remain "pretty dumb" on the cognitive side, which he identifies as the primary remaining barrier to commercial viability.
- As of the episode recording, there were approximately 1,500 Spot robots deployed commercially, many operating in daily industrial inspection roles; Hyundai's acquisition of Boston Dynamics was explicitly cited as a resource for driving down manufacturing cost and improving reliability at scale.
- The Boston Dynamics AI Institute, which Raibert leads as Executive Director, opened a Zurich office directed by Marco Hutter — co-founder of ANYbotics and professor at ETH Zurich — who is half-time at the institute and half-time at the university, focusing on reinforcement learning for physical robots.
- The AI Institute purchased a fleet of Spot robots, several ANYmal robots, and a range of manipulation arms (including Franka and US Robotics models) at launch rather than waiting to build custom hardware, to enable immediate research on cognitive tasks.

## Watch-Understand-Do and Inspect-Diagnose-Fix

- The AI Institute's flagship cognitive research project, called Watch-Understand-Do, aims to let a robot observe a human performing a task, automatically segment the observation into discrete sub-actions, identify which robot skills map to each sub-action, and execute the task independently — what Raibert calls OJT (on-the-job training) for robots.
- The initial test domain for Watch-Understand-Do is simple bicycle repair tasks, starting with tasks like inserting a seat post into a tube with a latch — chosen because they are tractable sub-problems even though overall bicycle repair is very complex.
- A second major project called Inspect-Diagnose-Fix targets the role of a field service technician: a robot would arrive at a machine, examine it to determine the fault, and physically repair it — analogous to the Maytag repairman but without a human inside.
- Boston Dynamics Spot robots are already performing the "inspect" portion of Inspect-Diagnose-Fix commercially — collecting thermal images, reading gauges, and capturing audio from industrial equipment — but the diagnosis and repair steps remain unsolved research problems.
- Raibert explicitly distinguishes navigation in the wild from navigation as conventionally programmed: humans enter an unfamiliar room, adjust a chair, and navigate it without being given a map or explicit specification of obstacles — he wants robots to develop the same assumption-free spatial competence.

## Machine Learning and Traditional Control

- As of early 2024, Raibert observed that the most impressive locomotion performances in the field — including Atlas's parkour videos — are still primarily achieved with model-predictive control rather than end-to-end learned policies, though Atlas has begun incorporating learning-based components.
- Raibert is optimistic about language models but cautious about direct application to physical robots: pixel values do not behave like words (tokens), and physical interaction introduces grounding problems that text-based training does not encounter.
- His view on the path forward is a "mating" of model-predictive control and machine learning, capturing the performance ceiling of traditional controls with the generalization capability of learning — a hybrid approach the AI Institute is actively pursuing.

## Building Teams and Company Culture

- Raibert's four ingredients for a great robotics team are technical fearlessness (taking on problems without knowing how to solve them), diligence (pursuing robustness beyond the narrow demo), intrepidness (staying committed through repeated failure), and technical fun (finding genuine pleasure in the craft of engineering).
- Boston Dynamics' development philosophy is encapsulated in the motto "build it, break it, fix it" — Raibert explicitly criticizes teams that keep their robot on the shelf to avoid damage and argues that planned breakage with spare-parts budgets is the only path to genuine robustness.
- The famous Boston Dynamics videos of engineers pushing Spot with a hockey stick or tugging it on a rope while it climbs stairs were not just demonstrations for the public — they were the actual testing methodology, because the team was unsatisfied with any solution that only worked in idealized conditions.
- Raibert was the final editor on most Boston Dynamics videos until approximately 2020–2021; his production philosophy was "no explanation — if they can't see it, it's not the right thing to show" — no title cards, no narration, just the robot doing something worth watching.
- Early Boston Dynamics hiring explicitly included people who built bicycles, kayaks, and motorcycles — makers without professional engineering degrees — because hands-on physical building intuition was considered as valuable as academic credentials for the kind of hardware development the company does.
- Raibert credits the stepping-stones-to-moonshots philosophy, formalized in his original proposal for the AI Institute, as the methodology for managing long-horizon research: produce a tangible milestone at least every year to maintain feedback, motivation, and course correction, even if the final goal is five or more years away.

## Competition, Industry, and the Future

- Raibert visited Figure AI and Apptronik and described both as having good teams doing well; he characterized Elon Musk's Optimus as not yet at Atlas's performance level as of early 2024, while crediting Musk's track record — transforming EV adoption and effectively replacing NASA for launch services — as reason not to underestimate him.
- He expressed the belief, partly in jest, that Atlas's existence was an inspiration for Optimus: he reads between the lines of Tesla's humanoid announcements and sees Boston Dynamics' influence.
- The only robotic use case he identified as clearly generating commercial profit as of early 2024 is warehouse automation, noting that traditional fixed-arm industrial robots also make money but that socially deployed mobile robots have not yet found reliable unit economics.
- Raibert sees competition in the quadruped space as net-positive for Boston Dynamics because it shifts the market question from "do I want a quadruped?" to "which quadruped do I want?" — a validation of the category that benefits the leader.
- On AI safety and AGI risk, Raibert is skeptical that superhuman AI is inherently threatening, drawing an analogy: smarter humans exist and we do not find them threatening; intelligence alone does not imply misalignment, and computers already outperform humans on many narrow tasks without causing harm.
- He acknowledges the car as his template for technology risk-benefit analysis: automobiles kill approximately 1.25 million people per year worldwide and pollute heavily, yet remain a net boon to humanity — and those problems are being technically addressed over time.

## Advice and Philosophy

- Raibert's career advice to MIT undergraduates was to ask, "If you had no constraints — no resource, opportunity, or skill limits — what could you imagine doing?" and then work backward from that unconstrained ideal toward what is realistically achievable, rather than starting from what seems possible.
- His daily uniform of Hawaiian shirts began as an act of contrarianism: after someone told him the shirts were old-fashioned, he stopped wearing them for about a week, then decided he would not let others dictate his clothing, and has worn them nearly every day since — a self-described symbol of the "why not?" mindset he applies to engineering challenges.
- The "why not?" question was introduced to him by Marine Ed Tovar during DARPA collaborations: whenever someone said a capability was impossible, Tovar would respond "why not?" — Raibert adopted it as a default response to self-imposed technical limits.
- Raibert sees the Boston Dynamics AI Institute as a deliberate career pivot away from locomotion, which he spent roughly four decades on, toward cognitive intelligence — motivated in part by wanting to avoid becoming a person who only ever does one thing.
