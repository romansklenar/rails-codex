---
title: Privacy & Ethics
description: "37signals' stance on surveillance, tracking pixels, employee monitoring, and Big Tech accountability"
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

→ Episodes: 100-facebook-free, heal-the-internet, delete-your-account
