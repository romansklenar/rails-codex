---
title: Privacy & Ethics
description: "37signals' stance on surveillance, tracking pixels, employee monitoring, Big Tech accountability, environmental responsibility, platform monopolies, and business ethics"
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast
tags:
- privacy
- ethics
- surveillance
---

# Privacy & Ethics

## Email Tracking Pixels

- Tracking pixels (1×1 invisible images) in emails report open time, location, device, and IP address back to the sender without the recipient's knowledge or consent
- 37signals removed all tracking pixels from their own marketing emails after auditing their mailing-list tools — found them present in software they hadn't examined in years
- HEY blocks tracking pixels by default for all users; when a tracked email arrives, HEY strips the tracker and notifies the recipient that a tracking attempt was blocked
- The Markup (journalism outlet) runs a zero-tracking newsletter: no pixels, no link redirects, no analytics — chose to trust readers rather than measure them
- Plain-English test for any tracker: "Can I explain in two sentences what this collects, for whom, and would the recipient consent?" — most trackers fail this test
- Removing pixels from 5 million daily emails is not symbolic; it shifts what the industry treats as normal — individual company decisions compound into cultural standards

→ Episodes: the-spy-who-emailed-me, heal-the-internet, 100-facebook-free

## Anti-Surveillance Stance

- 37signals updated their Terms of Service to ban integrations that use Basecamp's API for employee surveillance — the trigger was learning that certain HR tools were scraping Basecamp activity to build covert employee profiles
- The ban covers tools that monitor employee behavior without the employee's informed, voluntary consent — not a judgment on all HR software, only on covert monitoring
- Moral framing: software that surveils employees treats them as threats to be managed, not as adults who can be trusted; that assumption poisons company culture at the root
- A tool that secretly measures how fast an employee types or how many tabs they have open cannot be fixed by a privacy policy — the design intent is surveillance and the privacy policy is a legal cover, not a consent mechanism
- The "tattleware" category (software designed to catch employees "slacking") is philosophically incompatible with remote-first trust-based management
- 37signals' own management philosophy is the opposite: no time-tracking, no keystroke logging, no activity monitoring; output and communication quality are the metrics

→ Episodes: big-brother-at-the-office, the-spy-who-emailed-me

## Employee Monitoring Tools

- Kolide (featured guest) makes a device-health tool used with employee consent — framed as a trust-building mechanism, not a surveillance tool; employees can see everything it reports
- The screenshot-every-five-minutes model (products like Time Doctor, Hubstaff) is surveillance theater: it measures presence, not contribution
- The Basecamp alternative to monitoring: written check-ins in Basecamp ("What did you work on today?") answered in each employee's own words, visible to the whole team — transparency without surveillance
- If you feel compelled to monitor employees covertly, you've already lost — the monitoring is a symptom of a broken hiring or trust-building process, not a solution to it
- The counterargument "what if someone is slacking?" misses the point: covert monitoring doesn't fix slacking, it just catches it; the fix is clearer expectations, better communication, and if necessary, a direct conversation
- The question "would you be comfortable if the employee saw exactly what you're collecting and why?" is the correct threshold for any monitoring tool

→ Episodes: big-brother-at-the-office, winston-sat-at-his-computer

## School & Child Surveillance

- Products like Gaggle and Bark scan student emails, documents, and messages for keyword lists and report flagged content to school administrators — often without student or parent knowledge
- Keyword-based systems produce high false-positive rates; LGBTQ students are disproportionately flagged because words related to their identity trigger filters designed for harm detection
- Self-censorship effects are significant: students who know they are monitored stop writing authentically in school tools — the chilling effect on self-expression is a pedagogical harm in itself
- Racial bias in enforcement: algorithms flag, but humans decide consequences; studies show flagged content from Black students is more likely to result in disciplinary action than the same content from white students
- Data retention is a compounding risk: years of flagged adolescent content stored indefinitely by a vendor; breach or vendor acquisition means that data is permanently outside the family's control
- The consent problem: schools often deploy these tools under broad acceptable-use policies signed during enrollment — not meaningful informed consent for continuous behavioral surveillance
- The counterargument "we're just trying to prevent school shootings" is used to deflect any scrutiny; the tools have not demonstrated effectiveness at that goal and impose documented harms on non-threatening students

→ Episodes: are-the-kids-alright

## Privacy Policy Design

- Most privacy policies are written by lawyers for other lawyers and compliance teams — they are not designed to be understood by the people they affect
- CMU usability study finding: the average American would need 76 work days per year to read every privacy policy they encounter; no meaningful consent is possible at that rate
- Plain-English privacy policies work: Flighty (flight-tracking app) and Captivate.fm (podcast hosting) were cited as models — short, specific, written in first-person, explaining the "why" for each data point collected
- Privacy-by-design principle: decide what data you need for the product to work, collect only that, delete it when it's no longer needed — and document this honestly in the policy
- A scavenger-hunt exercise: go through your own product as a user and try to find every place data is collected, stored, shared, and retained — most companies have significant blind spots
- The goal is not a policy that protects the company legally — it is a policy that respects users enough to tell them the truth in language they can read in two minutes

→ Episodes: privacy-scavenger-hunt

## Big Tech Accountability & Antitrust

- DHH testified before the Senate in 2019 on Big Tech monopoly power — specifically Google's abuse of search dominance, Apple's App Store terms, and Facebook's acquisition strategy
- Google's core conflict: they are both the dominant search engine and a competitor to nearly every category of business that depends on search traffic; the incentive to favor their own products is structural and cannot be resolved by self-regulation
- Apple's App Store: a mandatory toll booth on a walled garden — any company distributing software to iPhones must pay Apple 15–30% with no alternative distribution channel and no appeal process for rejection
- Facebook's acquisition strategy (Instagram, WhatsApp): identified and neutralized competitive threats before they could challenge Facebook's network effects — a pattern that structural antitrust law was designed to prevent
- Structural separation argument: the historical precedent for resolving conflicts of interest is structural separation (banks cannot own investment firms, phone companies could not own content) — the same logic applies to search, app distribution, and social networking
- DHH's requested outcome: ban on targeted advertising as the business model driver — not because ads are wrong, but because behavioral surveillance at scale is the specific harm that drives the race-to-the-bottom in privacy

→ Episodes: mr-dhh-goes-to-washington

## Individual Action & Systemic Change

- The "floating point ethics" framework: individual action matters even when it doesn't solve the systemic problem — quitting Facebook doesn't fix Facebook, but it's still the right thing to do
- Indoor smoking ban analogy: individual smokers quitting didn't end the harm; regulation did — but individuals quitting before regulation was passed was still correct behavior, not futile gesture
- Facebook-free pledge: 37signals committed as a company to not running Facebook ads, not using Facebook login, not embedding Facebook tracking — documented publicly and held for years
- DuckDuckGo as default search engine: 37signals switched internally to remove Google's default position in employees' browsers — a small action with a compounding effect
- The "I'm just one person, what does it matter?" rationalization is the same logic that makes collective action impossible — every systemic change started with individuals who acted before it was strategically obvious
- Privacy as a competitive differentiator: HEY's marketing explicitly called out the surveillance model of Gmail as a reason to switch — they bet that enough users would pay for privacy to build a business on it
- Spending money is voting: every dollar spent at a company is an endorsement of that company's practices — 37signals stopped expensing Uber rides after serial ethics scandals made continued support feel like complicity
- "Every dollar's a vote" — whether from personal pocket or company pocket; 37signals stopped spending thousands of dollars per year on Uber meetup transport as a direct act of opposition to documented abusive corporate practices

→ Episodes: 100-facebook-free, heal-the-internet, delete-your-account, take-a-stand

## Platform Monopolies & App Store Power

- Apple's App Store review process is not governed by a rule of law — the published guidelines are a fig leaf; the actual decisions are capricious, made by an opaque "App Review Board" with no documented standard and no appeal
- 37signals experienced this twice (HEY email in 2020, HEY Calendar in 2024): Apple approved the app, then reversed the decision without changing the written guidelines, demanding 30% of revenue or compliance with verbally-communicated rules that never appeared in writing
- "Bill calls you" — Apple delivers rejections by phone call specifically so they don't have to put anything in writing, avoiding accumulation of evidence for the inevitable antitrust lawsuits
- 85% of HEY's paying customers use Apple devices; there is no alternative distribution channel — the App Store is not optional for viable iOS software businesses, it is a monopoly tollbooth
- Google ran the same review on HEY Calendar and approved it without issue — the problem is not the policy, it is selective enforcement that targets smaller developers who cannot fight back
- The EU Digital Markets Act and threatened DOJ antitrust lawsuit against Apple are downstream consequences of exactly this behavior: inconsistent enforcement, capricious rejection, no sideloading alternative
- Progressive Web Apps (PWAs) as a route around the App Store — 37signals' ONCE product line deliberately targets PWA technology to create software that can be installed without Apple or Google's permission
- Amazon's tax avoidance and loss-leader pricing: independent bookstore The Raven documented publicly that Amazon sells books at or below cost (seller's wholesale price), a strategy cross-subsidized by profitable AWS and marketplace businesses that no independent retailer can match — and Amazon does this while systematically avoiding the corporate taxes that independent businesses pay

→ Episodes: this-again-apple, mr-dhh-goes-to-washington, nevermore-amazon

## Targeted Advertising & the Surveillance Economy

- Targeted advertising replaces context-based advertising (placing an ad where relevant audiences already are) with behavioral surveillance (following individuals across unrelated contexts because their profile was purchased)
- DHH's framing: targeted advertising is a "gross violation of personal privacy" and has made commercially viable enormous amounts of content that could never have survived on editorial merit — the surveillance infrastructure is what enables the race to the bottom in internet content quality
- 37signals' 2018 "Facebook-free" stance was specifically a rejection of the targeted advertising model, not a judgment of all advertising — the distinction matters for companies that depend on ads to survive
- By 2024, DHH had moderated: he no longer singles out Facebook as uniquely evil in the targeted ad space, acknowledging that Meta's open-sourcing of AI models (Llama series) represents enormous public benefit — a company can do one bad thing and many good things simultaneously
- Vermont bans highway billboards entirely; São Paulo and European cities have banned outdoor advertising — regulatory precedent exists for restricting advertising in public space as an aesthetic and civic decision, not just a privacy one
- The Facebook-free pledge evolved: 37signals now has an Instagram presence, recognizing that Instagram is a separate product with genuine utility and that blanket corporate boycotts can be counterproductive

→ Episodes: 100-facebook-free, using-ai-for-writing-being-facebook-free-and-other-listener-questions, mr-dhh-goes-to-washington

## Twitter / Social Media Ethics

- Twitter under Musk reduced its workforce by ~80% (from ~8,000 to ~1,500) and the platform kept working — for Jason and David, the lesson is not "lay off everyone" but rather that companies routinely massively over-hire, building organizational mass that slows them down without proportional output
- The content moderation regime that Twitter dismantled employed thousands — that scale of human curation was a choice, not a technical inevitability; decentralized alternatives like Mastodon distribute content moderation decisions to individual instances, discovering that moderation power is quickly abused even at small scale
- Social media outrage dynamics: mob formation on Twitter happens in 18 seconds; people diagnose complex, multi-stakeholder organizational situations from a tweet and declare confidently what should have been done — DHH and Jason both have specific regrets about joining pile-ons (the Away suitcase CEO incident; early Uber commentary) before understanding the full picture
- The "delete the tweet" practice: Jason posted a screenshot calling out a CEO for a perceived privacy violation, felt bad within 20 minutes, pulled the tweet, and explained why — the willingness to publicly retract without being forced to is rare enough that it generated more goodwill than the original post would have destroyed
- Violent rhetoric in business: BYU researchers showed experimentally that hearing violent metaphors from a competitor's CEO made employees more willing to commit ethical violations than hearing violent language from their own CEO — the war-language of business ("dominate," "crush," "kill") primes subconscious aggression and lowers ethical thresholds
- Nonviolent Communication (NVC) / compassionate communication: Basecamp support team studied NVC techniques — the core move is distinguishing "faux feelings" (I feel ignored) from actual feelings (I feel hurt) because faux feelings implicitly accuse, while actual feelings open space for requests and resolution
- DHH on personal social media hygiene: keeping social media apps off his main phone, leaving them on a secondary device in another room — not an all-or-nothing quit, but friction-based control of consumption; read more books as a result
- The network moat of social platforms: follower counts are a form of loss aversion — going from 32,000 followers on Twitter to zero on a new platform feels catastrophic, which is the main reason Twitter alternatives have struggled even among users who genuinely dislike the platform

→ Episodes: keep-calm-and-delete-the-tweet, twitter-is-still-up, happy-pacifists

## Business Ethics & Taking a Stand

- The Charlottesville test case: Flowers for Dreams (Chicago florist) put a pop-up on their website requiring visitors to condemn racism and Nazism before ordering — they took death threats seriously enough to hire security, the message spread virally, and sales improved; business activism can be commercially net-positive
- B Corp certification and benefit corporations: legal structure that mandates profits be used for social and environmental purposes, not just shareholder return — shields the company from shareholder lawsuits when donating significant profits to charity (Dr. Bronner's gave 41% of profits to charitable causes in 2016)
- Dr. Bronner's as the archetype of values-embedded business: the product exists to distribute the philosophy (labels carry the Moral ABC manifesto), not the other way around; the company changed its entire label three times to advocate for GMO labeling, minimum wage, and other causes — using shelf placement as leverage with retailers
- DHH on Uber: the pattern of scandal after scandal (rape victim data accessed, executive misconduct, systematic labor violations, boardroom warfare) crossed a threshold where continued spending became a vote for that culture — "any dollar was too much at that point" — not just personal use but company expense policy
- The spending-as-voting principle generalizes: it applies to which bank holds deposits (JPMorgan finances fossil fuel extraction), which cloud provider is used, which advertising platforms are supported — every financial relationship is an implicit endorsement
- Calling out specific companies by name on social media requires proportionality and verification — DHH regrets joining the Away CEO pile-on based on a journalist's framing that turned out to be incomplete; the willingness to say "I was wrong" publicly is itself an ethical act

→ Episodes: take-a-stand, moral-abc, using-ai-for-writing-being-facebook-free-and-other-listener-questions, keep-calm-and-delete-the-tweet

## Environmental Responsibility

- Basecamp conducted a full carbon accounting in 2019–2020 covering scope 1, 2, and 3 emissions: office heating, flights, employee commutes to meetups, food at meetups, cloud hosting (their largest spend after labor), book printing, and even banking relationships
- The banking relationship as hidden carbon: JPMorgan Chase (Basecamp's then-bank) is one of the largest financiers of fossil fuel extraction globally — deposits held at such a bank are a form of indirect investment in those projects; Jane Yang flagged this as a category that should factor into carbon accounting
- Cloud hosting as the largest operational carbon driver for a remote-first tech company: cloud providers (primarily Amazon AWS and Google) do not disclose per-customer electricity consumption, making it impossible to optimize workloads toward renewable-heavy grid hours — Microsoft is the exception, beginning to offer this transparency
- Basecamp's response: purchased carbon credits for their entire cumulative emissions history (1999–2019), approximately 1,000 tonnes CO2 equivalent, through vetted providers Cool Effect and GoClimate — specifically seeking projects led by local communities where the financial benefit flows to those communities, not to intermediaries
- The "active skepticism" framing for climate action: acknowledging the near-hopelessness of the problem while still acting, because processing the grief and rage enables you to move forward and do things that might, cumulatively, matter
- Individual company action is necessary but insufficient: "Basecamp could essentially erase itself off the earth and it would be a 100th of a 100th of a 10th of the remaining carbon budget" — the real lever is pressuring high-power actors (Amazon, Google, large banks) to change, using a company's public megaphone and industry relationships rather than just internal optimization
- The compounding cultural effect: when carbon accounting, publication of results, and ongoing investment in mitigation become visible and imitated, it shifts what CFOs and boards consider normal — this is how cultural change moves faster than regulation

→ Episodes: greening-basecamp

## Political Neutrality at Work

- Political consulting firm MFStrategies (Marty Santalucia, Harrisburg PA) runs on calm-work principles inside an industry that treats 12-hour days and 24/7 availability as baseline — proof that even structurally intense industries can be operated differently if the founder chooses to
- The "if it's not life and death, put it down" test: Marty's wife, who works in medicine and genuinely does face life-and-death situations, asked him whether his political campaign work justified the same level of always-on response — the answer was no, and it reframed his entire approach to work hours
- Clients who demand 24/7 availability can be trained out of it: consistent non-response after hours sets expectations; some clients will leave, but those who stay understand the terms and the quality of work justifies them
- "The worst way to impress me is to work too much" — Marty's explicit framing to new employees; the political industry glorifies overwork and burnout as proof of dedication, and refusing to participate in that culture is a deliberate ethical stance
- Social media consumption as a workplace ethics issue: Marty mutes political keywords on Twitter during work hours and has an explicit rule against checking it first thing in the morning — even professionals whose job is political communication recognize that unmanaged social media consumption is harmful

→ Episodes: calm-in-the-political-storm

## Online Fraud & Identity Impersonation

- Job scammers impersonated Basecamp to collect personal information (bank account numbers, dates of birth) from remote-job seekers — using spoofed email addresses (info@basecamp.com), legitimate-looking job applications with Basecamp logos, and fake test-of-work tasks
- The scam exploited two specific conditions: remote-work job listings that don't require in-person vetting, and the trust that comes from a recognized brand name
- Platforms where the fraud originated (Facebook job ads, Craigslist) carry no disclaimer that a posting might be fraudulent — unlike dedicated job boards which have abuse education built in
- Practical red flags: requests for date of birth or bank account information early in the process; no video or phone interview; contact through free email accounts (Gmail for a tech company); job offer after only email exchanges
- The legal remediation gap: Basecamp's own remediation was limited to reporting to the FTC and FBI, and requesting takedowns from Gmail and Facebook — building a criminal case against distributed fraud networks is resource-intensive and rarely leads to prosecution
- Protection principle: "Never give money upfront" — any job opportunity that requires a fee to access training or materials is a scam; legitimate employers do not ask candidates to pay for the privilege of applying

→ Episodes: job-scam

## Open Source Ethics & Software as a Commons

- DHH's core argument: open source software has zero marginal cost — there is no "tragedy of the commons" because using the software doesn't deplete it; the freeloader framing is an ideological importation from scarcity economics that does not apply
- Rails has been downloaded 170 million times from RubyGems; more than a million apps have been built with it; neither fact has harmed DHH or reduced the value of the framework — the commons cannot be over-grazed
- The "free labor" critique of open source is a market-economics frame that treats open source contribution as an unpaid commercial exchange — DHH rejects this: contributing to Rails was "a literal labor of love," motivated by autonomy, mastery, and purpose, not by expected reciprocal payment
- Both Bill Gates (proprietary) and Richard Stallman (GPL copyleft) anchored their worldviews in scarcity and debt obligation — both used copyright law to control how their software was used; the MIT license is explicitly different: "do what you want, do as you please (just don't sue)" — no strings attached
- The MIT license as the "anti-license": it is a projection of altruism, not a commercial exchange; it rejects the strong-property-rights framework that both proprietary and copyleft software share
- Shopify built a $20B business on Rails; Twitter also built on Rails but contributed nothing back and blamed Rails for their architectural problems — DHH's response: "whatever? I wasn't looking for gratitude in the first place" — the market framing of ingratitude only arises if you first adopt the market framing of debt
- Proselytizing vs. selling: DHH used marketing techniques in Rails' early days but for ideological not commercial purposes — he now regrets that this led many into the commercial track without the ideological distinction in place

→ Episodes: open-source-beyond-the-market

## AI Ethics

- 37signals' stated concern about AI in products: the summary/AI-generated-text use cases feel gimmicky and have gone wrong publicly (Google's "help me write a letter to Sydney" Olympics ad was pulled for undermining authentic communication) — the team is waiting for genuinely useful applications, not chasing the trend
- AI-generated cover letters in hiring: 37signals received hundreds of applications for a programmer role where multiple applicants had clearly used AI to write identical cover letters — "instantly disqualifying" not because AI was used but because it demonstrated the applicant was unwilling to write in their own words for a company that explicitly values writing
- The authenticity principle: "I want to hear what you have to say, not what a computer has to say about what it thinks you have to say" — AI as editor (suggesting rephrasing, alternative words) is acceptable; AI as author (replacing the human voice) undermines the purpose of communication
- DHH on AI writing detection: AI-generated text still "smells like AI writing" — it has a recognizable texture ("slob" — content that gets shoveled because it is easy to produce but not nutritious); this may change, but the underlying authenticity problem won't
- The legitimate AI use case 37signals is exploring: natural language querying of data already stored in their tools (Basecamp, HEY) — "have a conversation about your project history" — rather than AI generating content on behalf of the user
- Meta/Facebook's open-source AI contribution (Llama series): DHH credits this as "absolutely incredible" — open-sourcing frontier AI models prevents capture by OpenAI or Google, and Meta is underwriting hundreds of millions in compute costs as a gift to the community; this is a case where a company 37signals previously boycotted is doing something of enormous public value, illustrating that companies should be evaluated action-by-action rather than written off wholesale
- PWA technology and GDPR compliance: Once products built as PWAs can deliver push notifications directly from the company's servers to the user's device, without routing through Apple or Google — for European customers with sensitive data, this is a genuine privacy win, not just an App Store workaround

→ Episodes: using-ai-for-writing-being-facebook-free-and-other-listener-questions, this-again-apple, listener-questions
