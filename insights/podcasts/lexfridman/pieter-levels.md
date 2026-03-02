---
title: "Pieter Levels: Programming, Viral AI Startups, and Digital Nomad Life | Lex Fridman Podcast #440"
description: "Pieter Levels shares how he built multiple profitable software products solo using minimal tools, why he prefers PHP and jQuery over modern frameworks, and how he went from depression while traveling to making millions with AI photo products."
source:
  type: podcast
  title: Lex Fridman Podcast
  author: Lex Fridman
  url: "https://lexfridman.com/pieter-levels"
  date: 2024-08-20
tags: [indie-hacking, startups, ai, digital-nomad, programming, entrepreneurship, productivity, minimalism, bootstrapping, shipping]
---

# Pieter Levels: Programming, Viral AI Startups, and Digital Nomad Life | Lex Fridman Podcast #440

Pieter Levels built Photo AI, Nomad List, and Remote OK solo using PHP, jQuery, and SQLite — shipping fast, charging from day one, and scaling to millions in revenue without investors or a team.

## Indie Hacking Philosophy

- Pieter launched the "12 startups in 12 months" challenge in 2014, shipping one new product every month for a year — not to get rich quickly but to learn by building and forcing himself to ship instead of getting stuck planning
- The projects that outlasted the challenge are the ones that solved a real problem Pieter personally experienced: Nomad List came from his own struggle finding good cities to live and work from as a nomad
- He views building software as a form of making art — products are creative expressions that exist independently in the world, and monetizing them is what allows the art to keep existing
- The goal is not to build a unicorn but to build a "cockroach": a small, resilient business that generates enough profit to sustain itself and its maker without outside funding or a large team
- He treats every product as a small bet: launch fast, see if people pay, iterate if they do, and move on if they don't — sunk cost has no place in the indie hacker's toolkit
- Building in public on Twitter/X — sharing revenue numbers, screenshots, and progress — served as both accountability and marketing; the community around transparency attracted early users and press coverage
- He recommends that aspiring indie hackers start by scratching their own itch: the founder's genuine frustration with a problem is the most reliable signal that the problem is worth solving
- When asked whether to start a business or join a startup, Pieter says start the business — employment teaches you how to execute inside a system someone else built, but building teaches you how to think about what's worth building

## Digital Nomad Life and Mental Health

- After quitting his job in the Netherlands in 2013, Pieter traveled through more than a dozen countries over two years before settling into a nomadic but structured lifestyle; the travel was initially exciting, then became disorienting and isolating
- He experienced depression while traveling — a paradox he describes as feeling most alone when surrounded by the most interesting places on Earth; the lack of community and continuity was the root cause, not the travel itself
- The fix was not to stop traveling but to find cities where other remote workers congregated, forming temporary but real social bonds; this insight became the founding thesis for Nomad List
- Pieter believes that community is the most underrated resource for remote workers: Nomad List's paid membership forum became more valuable to members than the city rankings themselves
- He went Facebook-free for years and found it dramatically reduced background anxiety without reducing his actual social connections, because the people he cared about he communicated with directly
- Depression during the nomad years prompted him to treat work as a creative and social anchor: shipping things people used gave him a sense of contribution that pure travel could not provide
- He describes a "flow state" achievable when working alone late at night on a product — a feeling of direct feedback between thought and code — as one of the most psychologically rewarding experiences available to him

## Building Photo AI

- Photo AI launched in October 2022, initially without a real product: Pieter posted a Typeform survey and a Stripe payment link to test demand before writing a single line of training code
- The avatar AI version of Photo AI generated approximately $150,000 in revenue in its first week, which caused the GPU vendor (via Replicate.com) to raise training prices from $3 per model to $20 per model after seeing Pieter's revenue on their platform
- Lensa, a mobile app, saw the avatar AI trend and released a competing feature that became the top grossing app on the App Store in late 2022, reportedly generating around $30 million in a short period — Pieter had identified the trend first but could not scale as fast as a funded team
- Photo AI uses Stable Diffusion 1.5 as its base model for most generations even years after release, because Pieter's A/B testing across millions of generated photos found that users preferred its output over newer versions like SDXL for most use cases
- The A/B testing system is entirely behavioral: Pieter measures which AI photo parameters lead to more user downloads and favorites across 1 million+ monthly generated photos, then automatically promotes the winning parameters — no subjective human review required
- To prevent NSFW content, Photo AI runs every generated image through Google's Vision API before delivery; images that exceed the safe search threshold are blocked and flagged, with the whole pipeline running automatically
- He uses DreamBooth fine-tuning on Stable Diffusion to train a personalized model for each user from the 10–20 photos they upload; the trained model is then used to generate photos in any style the user selects
- Photo AI has trained models for approximately 36,000 people as of mid-2024, with each training job consuming meaningful GPU compute via Replicate; the business is profitable despite these infrastructure costs because pricing was set to reflect real costs from the start

## Technical Stack and Shipping Philosophy

- Pieter builds everything in PHP, jQuery, and SQLite — technologies he learned in the early 2000s that he continues to use for all products including Photo AI, Nomad List, and Remote OK, despite those tools being considered outdated by most of the industry
- His argument for old, boring technology: he knows it deeply, it runs everywhere, it requires no build steps, it deploys instantly, and it has never broken in ways that modern JavaScript frameworks routinely do; the productivity advantage of familiarity outweighs any theoretical advantage of newer tools
- He uses VS Code as his editor, deploys directly from VS Code to GitHub, and a webhook on his server pulls the latest code and restarts in 1–2 seconds; there is no staging environment, no CI/CD pipeline, and no Docker — just a direct push to production
- Pieter accumulated approximately 37,000 git commits in a 12-month period, averaging more than 100 per day; this is only possible because each commit is small and the deploy loop is nearly instantaneous
- SQLite is his default database for all products; he argues that for solo developers with traffic in the tens of millions of monthly page views, SQLite on a single well-provisioned server outperforms the operational complexity of PostgreSQL clusters or managed database services
- He avoids microservices, containers, and orchestration entirely; all products run on one or a few bare metal or VPS servers, and the simplicity makes debugging trivial — when something breaks he can SSH in and inspect the running process directly
- Nomad List started not as a web app but as a public Google Spreadsheet with columns for cost of living, internet speed, weather, and safety in various cities; it went viral on Hacker News in 2014 because the data was immediately useful, and only then did he rebuild it as a proper website
- Hood Maps, a crowdsourced neighborhood labeling tool, was built using HTML5 Canvas; each user's map label is stored as GPS coordinates normalized to pixel position, allowing the city map to render at any zoom level without storing image files

## Automation and Operations

- PHP cron jobs are Pieter's primary automation mechanism: background tasks including AI training job polling, email digests, payment retries, and data sync all run as scheduled cron scripts rather than event-driven workers or queues
- He monitors all products with a handwritten `healthcheck.php` file on each server that checks database connectivity, disk space, and key data freshness; UptimeRobot polls the healthcheck URL every minute and pages him if it fails
- Content moderation for Nomad List's community forum and Remote OK's job listings is handled by GPT-4o via the API: spam detection, review quality scoring, and chat moderation all run through LLM prompts that flag or auto-remove content, eliminating the need for human moderators
- When Hood Maps went viral, the Mapbox map tile API bill hit $20,000 in a single month; Pieter handled this by switching to OpenStreetMap tiles (free and self-hosted) and adding Cloudflare caching in front of the map — a fix he implemented in a few hours
- Remote OK hit $140,000 per month in revenue at its 2021 peak driven almost entirely by SEO and word of mouth; Pieter spent nothing on paid advertising and ran the entire operation solo, with customer support handled by a single contractor
- He uses a simple spreadsheet to track monthly revenue for each product and shares it publicly; the transparency serves as a forcing function to keep all products profitable rather than subsidizing underperformers

## Monetization Strategy

- Pieter's pricing philosophy: charge enough to cover real costs plus a healthy margin from day one; free tiers and freemium models are a trap for solo developers because they require supporting users who generate costs without generating revenue
- Nomad List uses a one-time lifetime membership fee model rather than monthly subscriptions; Pieter argues this aligns incentives better — he is motivated to keep the product great because members who already paid will recommend it, and he is not beholden to monthly churn metrics
- Remote OK charges companies a flat fee to post job listings, with optional promoted placement; the simplicity of flat-rate pricing eliminates sales conversations and lets the product sell itself
- He discovered that charging for Photo AI upfront (rather than offering free trials) dramatically improved the quality of users who stuck around and gave feedback, because they had skin in the game and treated the product seriously
- When asked whether to raise prices or increase volume, Pieter consistently recommends raising prices: most indie products are significantly underpriced, and the revenue per customer improvement compounds across every other metric
- He views outside investment as a last resort (plan Z in his words) because it changes the product's purpose from serving customers to serving investors; every product he has built has been bootstrapped and profitable before reaching significant scale

## Productivity and Minimalism

- Pieter does his best work between 10pm and 3am in a quiet environment; he has structured his nomadic lifestyle to protect these hours as non-negotiable creative time, scheduling calls and social commitments in the afternoon
- He carries a minimal backpack with a laptop, a few changes of clothes, and essential toiletries; the constraint of not owning physical possessions reduces decision fatigue and keeps the focus on work and relationships
- Pieter muted approximately 15,000 Twitter accounts over 10 years as a systematic approach to making his feed useful rather than emotionally reactive; he mutes anyone who consistently generates negative emotions, regardless of how prominent they are
- He drinks one or two cups of coffee per day and treats caffeine as a serious cognitive tool, not a social habit — timing it relative to waking and avoiding it within 8 hours of sleep based on Andrew Huberman's advice
- Email is handled with a strict batching approach: he reads and responds to email once per day in a defined window, uses templates for common responses, and has no issue with leaving messages unanswered if they do not require his specific input
- Pieter avoids meetings by default; almost all coordination happens asynchronously through GitHub issues, Basecamp-style written updates, and Twitter DMs — a solo developer has no need for synchronous standups
- He does not use task management software; instead he keeps a single plain text file with the current sprint's priorities and crosses items off as they are completed; the simplicity prevents the overhead of managing the system from exceeding the value it provides

## Learning and Adapting

- Pieter is largely self-taught: he learned PHP by reading the manual and building things, learned about machine learning by reading Andrej Karpathy's blog and course materials, and learned about AI model training by experimenting with Stable Diffusion directly
- He credits Karpathy's neural networks course and blog posts as the clearest explanation of how language models and diffusion models work that he found — concrete enough to build on without requiring a PhD in mathematics
- When evaluating whether to learn a new technology, Pieter asks: can I ship something real with this in a week? If not, he continues using the tool he already knows; knowledge compounds but only if the tool is used consistently over years
- He tried Rust, was impressed by its correctness guarantees, but concluded it was incompatible with his shipping speed requirements; the compile-time friction that Rust's safety model requires was too costly relative to his PHP-based productivity
- His approach to AI/ML learning was hands-on from the start: rather than studying theory, he rented GPUs and ran Stable Diffusion fine-tuning experiments immediately, treating each failure as data and each successful generation as confirmation of a testable hypothesis

## Advice for Builders

- The most important thing a young developer can do is ship something real that real people use; side projects, open source contributions, and university assignments all have value, but none of them provide the feedback loop of an actual customer paying for something you built
- He advises against optimizing for salary early in a career: working at a place where you own and ship a complete product teaches more in one year than three years of working on a small component inside a large company's engineering org
- Pieter is openly skeptical of the "move to San Francisco and raise venture capital" default path for ambitious developers: the geography no longer matters, the VC funding creates misaligned incentives, and the social pressure to build a unicorn eliminates the space where the best indie products are found
- On competition: when Lensa copied his avatar AI concept and made 200x more money than he did, his response was to treat it as validation that the market was real, then to differentiate on quality and features rather than trying to out-scale a funded competitor
- His advice on when to sell a startup: sell when the product has plateaued and you no longer find the problem interesting, not when you are scared or bored; building something and seeing it transferred to a team that can grow it is a legitimate good outcome, but selling under distress almost always means leaving value on the table
- Effective accelerationism (e/acc) resonates with Pieter as a philosophical frame: he believes that building products that improve human productivity and quality of life is one of the highest-value uses of a developer's time, and that slowing down technological development out of fear is more dangerous than the risks of the technology itself
