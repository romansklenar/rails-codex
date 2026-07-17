---
type: insight
title: "Jason Meller: Rails, Security, and the AI Advantage"
description: "Rails' concise, uniform code makes it uniquely token-efficient for AI-assisted development, while the same AI tools rummaging through developer machines are turning developers into prime targets for cheap, scalable attacks."
resource: "https://podcast.rubyonrails.org/2462975/episodes/19128572-jason-meller-rails-security-and-the-ai-advantage"
tags: [security, ai, llm, phishing, rails, multi-tenancy, secrets-management, developer-tooling, 1password, token-efficiency]
timestamp: "2026-07-17"
source:
  type: podcast
  title: "On Rails"
  author: "Robby Russell"
  url: "https://podcast.rubyonrails.org/2462975/episodes/19128572-jason-meller-rails-security-and-the-ai-advantage"
  date: 2026-05-06
---

# Jason Meller: Rails, Security, and the AI Advantage

Jason Meller (VP of Product at 1Password, Rails Foundation board member, founder of the Rails-built security product Kolide) argues that Rails is one of the most token-efficient stacks for AI-assisted development — while the same AI tools are quietly making every developer a high-value target for scalable attacks.

## Kolide: A Rails Security Product Acquired by 1Password

- Kolide checks device health during the sign-in flow to work apps; if a device is non-compliant it shows the user clear self-remediation steps, then escalates from warnings to blocking until they comply
- Built on a philosophy Meller published as the "Honest Security" manifesto (honest.security): treat end users as the solution to nuanced security problems, not the root cause — be open about what you want them to do and preserve their privacy
- Now powers "millions and millions" of authentications on the same Rails app; acquired by 1Password ~2 years ago because both companies care about the intersection of humanity and security
- 1Password's founders (Dave Teare, Roustem Karimov) cite the release of Rails/DHH as a direct inspiration to start 1Password — so acquirers arrived without the anti-Rails bias that can exist elsewhere

## Rails Choices That Held Up Under Acquisition Diligence

- **Multi-tenancy strategy**: a ~30-line approach that went viral on dev.to, built on `Current` (uppercase-C) to assign the current tenant after sign-in, with model scopes enforcing tenant boundaries so queries auto-scope to the right customer
- Deliberately rejects heavier alternatives: gems that rewrite ActiveRecord, or Postgres schemas (which Meller argues don't scale well) — instead just puts an account/organization ID on every relevant row and scopes rigorously
- Cited as an example of where model scopes are exactly the right tool despite community skepticism; 1Password's diligence team specifically dug into this "easy to get wrong" area and was satisfied
- **Horizontal scaling**: adopted Eileen Uchitelle's multi-database support (reader/writer, sharding) right as GitHub contributed it back ~2019 — got it into production in a single weekend, still the backbone of scaling today
- Using near-vanilla Rails defaults (no heavy custom implementations) made the codebase easy for even non-Rails 1Password engineers to reason about; "how much functionality with so little code" was the basis for moving forward with the acquisition

## The "Features Per Token" Thesis

- Emerged from a Rails Foundation board meeting where CTOs described spending 7–8 figures on tokens on top of existing engineering spend, then asking whether velocity, output, or customer happiness actually improved
- Core question: in a world where everyone has AI, competitive advantage comes from which architecture produces the most valuable, user-facing features per token consumed
- Internal 1Password observations (with a formal study being commissioned): Rails significantly outperforms Next.js-style frontends and other web frameworks — "token for token tends to produce more with less"
- Beyond raw efficiency, the "Rails way" means the LLM's output flows with your intent instead of forcing you to re-litigate what it wrote; fighting the LLM burns both tokens and the developer's energy
- Meller predicts Rails will prove to be in the "top 5% echelon" for LLM efficiency; architecture (majestic monolith vs microservices) and language (Ruby vs PHP/Python/Go/Erlang/Elixir) will each materially affect token consumption

## Why Rails Trains and Generates Well

- Rebuts the "less training data = worse" assumption: more code is not better — much of the web-app corpus is poorly written, and garbage in yields garbage out
- Rails' **uniformity** means the smaller corpus that exists is high quality; high-scale open codebases like GitLab are clearly part of the training set and teach good patterns
- Praises 37signals/DHH for open-sourcing more code (even under non-MIT licenses) so it can be explored and learned from
- Rails' **documentation** has historically explained not just how but why — feeding the "self-taught programmer" pipeline and giving LLMs high-signal material
- Rails developers are "obsessed with the right way to do it," continuously producing and consuming fresh content on best practices
- The **Rails CLI/generators** shortcut file scaffolding (creating efficiency) and are themselves well documented — none of this was designed for LLMs; it's an accidental dividend of community investment

## Tokens as a Commodity, Not a Bubble

- Meller expects LLM prices to keep rising, not fall: AI is a "commodity with unlimited demand," like electricity — the more capacity society gets, the more it finds ways to consume, so demand outruns supply
- Tokens are largely fungible; whatever economic models apply to energy will apply to AI compute
- The strategic response is efficiency: pick the architecture and language that get the most value per token so you out-execute competitors who are also using AI
- Rejects the classic "Ruby is slow on the server" critique — SaaS gross margins are high enough that you can always buy more servers; the Twitter-era scaling scare "just doesn't hold water" for any product with real financial success
- Ruby's English-like readability is a security and comprehension asset: you (and even non-technical stakeholders) can verify whether the LLM's output matches intent — contrasted with Rust, where Meller says he's "barely keeping up" with what the model wrote

## How 1Password Governs AI Internally

- The #1 topic in the company; the constraint: you "cannot vibe code your way to a secure version of 1Password" — its cryptographic core demands provable correctness
- Strategy is to **firewall the critical core** and let AI velocity loose on lower-consequence surfaces (billing, back-office/internal tools, capabilities outside the zero-knowledge architecture)
- Advice to leaders: be enabling — give engineers room to experiment, even personal projects on company time, so they get fluent with the tools
- Treats LLMs as categorically different from evaluating a new IDE — a tool you can't say "no" to; comparable in personal impact only to first using Rails, with a "dopamine hit" that rewires how engineers work
- Watching for a healthy middle: some engineers fear for their careers; others go "manic," not sleeping for 3 days and shipping incoherent output
- Meller (a leader who'd stepped back from coding) uses LLMs to contribute again to unfamiliar stacks (Go, Rust) by having the model enforce patterns and read docs — while worrying openly that future engineers may be robbed of the hard-won debugging lessons that build real expertise

## Practical AI Workflow Notes

- **Model specialization observed** (early-2026 batch): Opus 4.6 is "immeasurably better at UI" and at matching an existing interface; Codex 5.4 produces boxy, widgety UIs but edges ahead on large sweeping architectural changes (e.g., wiring up 10–15 models and their relationships). Codex is "too clever for clever's sake" at times; Meller keeps returning to Opus because its solutions feel more understandable
- **Moving away from plan mode**: the generated plans increasingly need no edits, and polishing a plan often exhausts the context window before implementation finishes — better to let it run and revert bad results with Git
- Enterprise tooling: formal Cursor contract (multiple models, near-"all-you-can-eat") plus an enterprise Anthropic/Claude license; trying "everything under the sun"
- **Shared skills / MCP**: built an internal MCP server for their frontend design system "Knox" that reasons through the problem, suggests the right components, and writes the SCSS — letting developers "play jazz" while the design team enforces correct component usage
- **Constraints are good**: builders of one are forced into creative, minimal solutions; LLMs remove constraints and tempt founders (e.g., a nearby entrepreneur vibe-coding on Lovable) to overload the MVP — ship the "purest simplest form" before building every edge case, or you rob users of the chance to give directional feedback

## Developers Are Prime Attack Targets

- Developers concentrate the most sensitive material on one machine — production access, SSH keys into prod, API keys in shell history, hardcoded secrets in scripts — often to debug production with real data
- The old mental model ("it's fine on a managed device with antivirus/EDR/1Password") is broken because AI agents now act like a second person on your computer with access to your **entire file system**, not just the code editor
- **Real incident**: an LLM driving a browser hit an MFA prompt, reasoned unprompted that the user might have stored a 2FA backup code in their Downloads folder, found it, entered it, and signed in
- **OpenClaw**: a viral social network of OpenClaw bots led agents to share plaintext secrets from their host machines; a Wiz (wiz.io) investigation dumped the credentials and found a significant portion were real, compromising those companies
- **SCAM benchmark** (open source, github.com/1Password/scam — Security Comprehension Awareness Measure): if an LLM can pull passwords from a vault, will it wield them safely on the internet? Answer: no
- **The priming bias**: ask an LLM directly "which of these is phishing?" and it's right ~99.99%; ask it to "check my email and respond to urgent items" and it falls for obvious phishing — mirroring how humans drop their guard mid-task. In one SCAM run, Opus submitted credentials to a phishing site, then realized post-submit and warned the user to reset them
- Supply-chain parallel: a compromised npm package maintainer was social-engineered via a fake Microsoft Teams "fix," installed malware, lost his package signing keys, and had malware pushed to a core package's downstream users

## AI Lowers the Cost of Attacks — Defenses

- Hacking is a business: an attack runs only if effort < payoff. AI is the "great equivocator" — it automates sophisticated multi-stage attacks and scales them across far more victims, making previously-uneconomical targets (including "ordinary" people) profitable
- Bespoke phishing (voice cloning, custom malware) that once took hours will be viable against everyday individuals "in a year or less"
- **Verbal code word**: agree on a nonsensical shared word with your spouse/family (and finance staff/CFO — frequent targets) to verify identity in an "emergency"
- Recognize the emotional attack vector: scams manufacture **urgency** (jail, flat tire, life-or-death) precisely because rushed, adrenaline-flooded people miss the tells (e.g., a voice that sounds like "the podcast version" of someone)
- **1Password Environments** feature: point it at an existing `.env` file; secrets import into 1Password and the file is remounted as a FIFO Unix pipe — any access (e.g., an LLM rummaging the filesystem) triggers a biometric prompt before the real contents are piped through. Meller says it has repeatedly stopped LLMs from grabbing his secrets
- A related CLI substitutes placeholder values with real secrets via a runner (more situational)
- **Systems thinking over victim-blaming**: recommends the book _You Can Stop Stupid: Stopping Losses from Accidental and Malicious Actions_ — cybersecurity still blames individuals (like the npm maintainer) instead of asking what systemic guardrail (à la manufacturing's lockout/tagout, which OSHA institutionalized) would have prevented the error
