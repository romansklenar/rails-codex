---
title: "Subscription hostages"
description: "Raise your hand if this sounds familiar: You sign up for a service or a product online."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/subscription-hostages/
tags:
- podcast
---

# Subscription hostages

**Shaun: (00:00:00)** Before we begin today’s episode, I would like to remind everyone that we’re gearing up for another Mailbag show. So, if you have any questions for Jason Fried, David Heinemeier Hansson, or anyone here at Basecamp, please leave us a voicemail at (708) 628-7850.

**(00:00:20)** Back in February, Basecamp co-founder and CTO, David Heinemeier Hansson tried to cancel his subscription to Sirius XM. He landed on a screen that said, “I would like to discuss canceling my subscription,” and gave him a toll-free number to call. So, of course, David took to Twitter.

**David: (00:00:35)** Ah, fuck off, Sirius XM. I don’t want to discuss my options. I just want to cancel your shit without the hassle of having to call your fucking hotline! Fuck!

**Shaun: (00:00:47)** Was this the first time that you had encountered this subscription cancellation hell?

**David: (00:00:51)** No. One funny thing is I almost had it with the Financial Times. So, I signed up for the Financial Times because there was an article in there and I wanted to read the article, and I was like, okay, fine. I’ll sign up. So, I signed up. I read the article, and then I was like, okay, I don’t read the Financial Times, so just let me try to cancel. And I go through the cancel process and there’s this whole big spiel basically saying, you’re gonna have to call our office in London business hours, blah blah blah.

**(00:01:17)** And then, at the bottom, there was like, oh, except if you’re a foreign subscriber. Then, we’ll allow you to cancel online. So, not only did the Financial Times have the full infrastructure to allow me to cancel online by myself, they were basically telling all the UK subscribers, “Hey, fuck you! We’re gonna put you through this hoop jump bullshit that’s not required at all and that we won’t ask international subscribers to do. But you, yeah, you have to call between 1 o’clock and 1:15 on the second Tuesday of the month to reach the one person who’s capable of canceling your subscription.”

**(00:01:57)** And I thought that that was just shockingly hostile.

**(00:01:58)** Broken By Design by Clip Art starts to play.

**Shaun: (00:01:59)** Hello, and welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m Shaun Hildner.

**Wailin: (00:02:06)** And I’m Wailin Wong. After David sent out his tweet about Sirius XM, he got a bunch of responses from people pointing out other companies that also do not offer a way to cancel subscriptions online. Quite a few of the complaints were about newspapers. I even pointed out to David that my former employer and hometown paper, the Chicago Tribune where I’m still a loyal subscriber, does not let you cancel online.

**Shaun: (00:02:30)** David asked us to look into what he described as subscriber hostage-taking and to focus on newspapers. Although, it should be noted that this tactic is used in a wide range of industries. Today on REWORK, we try to get to the bottom of why this dark pattern is so hard to get rid of.

**Laura: (00:02:49)** I had just tried to cancel my New York Times online subscription.

**Wailin: (00:02:53)** This is Laura Hazard Owen.

**Laura: (00:02:55)** I had called them on the phone, I think before the online chat option was added. And, you know, had to talk to them about why I was canceling. Which, obviously it isn’t… I mean, it’s not some terrible tragedy to have to explain to somebody in person why you’re canceling a subscription but it feels sort of awkward at this point to have to be on the phone with someone being like, you know, I don’t want this anymore. And, we sort of talk about people in our generation avoiding phone calls or whatever, and I think that that’s one of the reasons.

**Wailin: (00:03:29)** Laura pays special attention to these issues because she’s deputy editor of Nieman Journalism Lab, a part of the Nieman Foundation at Harvard that reports on journalism in the internet age.

**Laura: (00:03:41)** The topic of how easy it is for people to subscribe comes up because that’s like, in newspapers’ interests to make it really easy to do. So, what kinds of offers work best for people to entice them to subscribe? What are the ways that you keep customers coming back and you keep the ones who sign up for a trial subscribed? Obviously, there’s a lot of interest on that side of it. And, understandably, I think there’s much less interest in how easy is it for them to cancel it? I think a lot of companies don’t want to make it that easy for a customer to leave.

**Richard: (00:04:14)** They’re saying it’s part of what we call the “gotcha” economy.

**Wailin: (00:04:17)** Richard Holober is the executive director of the Consumer Federation of California. He’s heard a lot of complaints about subscription services especially ones that get customers to sign up by offering something for free and then make it really hard to cancel.

**Richard: (00:04:31)** Used to be, you’d buy something. You’d know the price, make a decision. Maybe it was a good deal, maybe it wasn’t. But now, it’s more and more based on deception. Get something free, but you know, it’s really not free. It’s just a bait and switch. Once you’re getting that free product, you’re going to get charged sometimes for something you just don’t want, or that’s extremely expensive. And that is increasingly how America is working. It’s not up-front kind of business dealing with consumers. It’s all hidden in the fine print. Verizon, Equifax, Time Magazine, Gold’s Gym, Classmates.com, you know, in California, the Sacramento Bee was one that someone cited where it’s a free sample period for the newspaper, and then they started getting billed and we know of a case involving the New York Times where the same kind of practice occurred. So, yeah, a lot of companies that I think should know better but, whatever. Draw your own conclusions about how they operate.

**Wailin: (00:05:35)** In 2017, Richard and the Consumer Federation of California helped push through legislation that, among other things, requires companies that offer online subscriptions to also offer an online cancellation option. This applied not just to newspapers, but to all kinds of products from cosmetics, to software, to gym memberships. And, because it was so broad, the opposition came from many places, like the California Chamber of Commerce, and the Internet Association. Yes, there is something called the Internet Association. The newspapers weren’t happy either.

**Jim: (00:06:07)** I mean, it’s no secret that newspapers have lost circulation over the last few years and I think the goal was to try to do everything we could to ensure those techniques and tools that newspapers had at their disposal in order to try to retain those subscribers could continue to be used.

**Wailin: (00:06:27)** This is Jim Ewert, the general counsel for the California News Publishers Association, a trade group that’s been around since 1888, and represents, daily, weekly, and campus newspapers in the state of California. Jim said his group was concerned the bill would limit their flexibility.

**Jim: (00:06:43)** One of the things that we wanted to ensure was that for those newspapers that wanted to continue to offer free trials or other offers to retain subscribers, that the publication be allowed to contact the subscriber in order to retain them. And that’s been a practice for newspapers for at least a century, if not longer. Newspapers want to be able to have a conversation with their subscriber in order to try to keep that subscriber as a reader. And we sought to try to create as much flexibility as we could in the law.

**Wailin: (00:07:29)** It seems like you did get more flexibility, because they opened up the online option while keeping the other ones. I mean, were you then satisfied with that level of flexibility?

**Jim: (00:07:38)** Yeah, to the extent that we were satisfied with the bill. Yes.

**Wailin: (00:07:43)** Have you heard anything about whether the costs associated with complying with this legislation over the last year or so… has it been onerous? Has it kind of taken away resources from other projects that your members had wanted to work on or invest in?

**Jim: (00:07:59)** I don’t believe it has. I’d have to check with some folks, but I don’t believe it has. I haven’t heard anything from my folks, at least. And generally if there’s something that has become too onerous, they’ll come to me to see if there’s a way that we can deal with that. But… and no one has come forward.

**Wailin: (00:08:18)** Jim at the California News Publishers Association said newspapers want to have a conversation with their subscribers and find out why they’re canceling and try to persuade them to stay on. But Laura Hazard Owen at Nieman Lab says that companies are not entitled to that conversation.

**Laura: (00:08:32)** I think it’s reasonable of them to ask. I don’t think it’s reasonable of them to require it as a step for giving up your credit card information. You shouldn’t be held hostage until you’ve explained to a real human why you don’t want this anymore, in my opinion. These little notices on newspaper websites, for example, that say, “If you’d like to cancel your subscription, please call us because we’d really like to know why.” And it’s like, nobody wants to have that conversation. I probably… honestly, I would see that, and I would say, whatever. I’ll just pay. I don’t want to have this awkward phone conversation with someone. At least for me, there’s this whole level of guilt there, too, because it’s like, the news industry is something that we need to be supporting. It’s in trouble, and we need to put our money where our values are. It feels more loaded. At least for me with newspapers and written content online than it does with, like, an exercise app or something.

**Wailin: (00:09:28)** I contacted a few major newspapers about their online cancellation policies. The New York Times lets you cancel by doing an online chat, which a spokeswoman said fulfills the California legal requirement. The Wall Street Journal, which allows you to cancel online if you live in California, but makes everyone else call, just referred me back to the page on their website outlining their policy and said they had no further comment. I thought maybe The Washington Post would talk to me since they actually do allow subscribers to cancel online, but they said no one was available for comment. I still didn’t feel satisfied about why this subscriber hostage situation is allowed to continue. So, I phoned a friend. Someone who knows about journalism, and design, and the economics of the media industry.

**Pete: (00:10:10)** So, I’m Pete Mortensen. I was most recently the director of Program San Francisco for Matter Ventures, a media accelerator and venture capital fund. Prior to that, I worked as a design strategy consultant for about 10 years, learning the human-centered design process. And I kind of went to that because I’d been a reporter before, writing about Apple for Wired and before that working in local journalism, writing at a daily and then later editing a weekly. And, a lot of why I decided to look outside of journalism for career opportunities was both for self-preservation, because I saw a lot of trouble coming. But more so because I had no idea how to help with any of the aspects of the business side of journalism when I was a working journalist.

**(00:11:00)** As you well know, the business of news was not taught terribly heavily in our era.

**Wailin: (00:11:05)** I do know, because Pete and I were in the same class in journalism school. We graduated in the early oughts which was an interesting time to be entering the industry, especially newspapers. Because we could see the internet starting to change life around us but were not fully prepared for that upheaval.

**Pete: (00:11:21)** One of the original sins of how we got here was the certainty that the real product was the print newspaper and the website, therefore, was at best an ad for the print publication. A number of poor decisions kind of cascaded and we’re all dealing with the fallout here almost 25 years later. First choice was, you don’t charge for web access. So, you devalue the quality of the work. Secondly, you never put that much effort into it because you just view it as an ad and that, of course, rebounds on the first one, which is, if it’s an ad, it’s a bad ad. It’s not even providing a good picture of what the experience of being a subscriber would be if you aren’t already one. Those two factors together, like, the real thing is the newspaper and the digital thing is just either for kids that I don’t understand, who would not be able to pay me anyway. And I’m definitely exaggerating somewhat for effect. Although, not entirely.

**(00:12:25)** As a result, now that we’ve moved into a stronger subscription era, we’re still dealing with a lot of residue and fallout from that. The vast majority of newspaper sites are loaded up with incredibly invasive ad tech and then now that the internet ad market is in freefall basically everywhere except podcasts, there’s a realization that actually consumer-derived revenue is a far safer way to go. Especially at the bigger papers, you’re seeing the experience get better but I think there’s still a little bit of just, like, not feeling great about the overall digital experience as the ideal way to read and therefore, for digital-only subscriptions, they try to… once they get you in, make it really irritating to leave. And I think that’s common whenever you have a product that people don’t really fully believe in, to feel the need to almost trick you into staying a customer. What you see at The Wall Street Journal.

**(00:13:37)** I took the journal for a little bit for work only, and then, like they had limited hours to take my call, and then I was put on hold. I think it was about an hour in total to get out. There was a lot of, what if we change the offering to this? Can you really explain why you don’t need it anymore? What if I gave you a month for free? I’m frankly not a Wall Street Journal reader, and either be okay with not having me or think about what it would take to turn me into a reader through how they approach their business and their coverage, and that sort of thing.

**Wailin: (00:14:09)** I thought about what Pete said, that at the heart of subscriber hostage tactics is an insecurity about whether the product being sold is worth paying for. And then I thought about what Laura said, that there was something fraught about saying, “I don’t want to pay for this newspaper subscription.” I personally struggle with this because I believe in journalism. I believe that good and ethical reporting is essential to a functioning democracy. I subscribe to four newspapers including all of the ones I called for comment, and two magazines, and yet sometimes these companies make it very hard to support them. But there are examples of media outlets that are breaking away from the traditional ad-supported model and seeing how that’s not only sustainable from a business perspective, but beneficial to the relationship with their audience.

**Jen: (00:14:53)** My name is Jen Sabella, I am director of strategy and co-founder of Block Club Chicago.

**Wailin: (00:14:59)** Block Club Chicago is a neighborhood news non-profit and is essentially a reincarnation of DNAinfo, a hyper-local news website in Chicago and New York that got shut down in 2017.

**Jen: (00:15:10)** We saw that there was a big gap in neighborhood coverage. We heard from so many people saying they missed it. And we were like, let’s do this thing. We had a really large audience. We know how to make it work, so we decided to just try it for ourselves as a non-profit this time.

**(00:15:28)** None of us wanted to get rich. That’s kind of the whole point, and I think that by being a non-profit, we’re telling our readers, every dime we get is going to be invested in reporting. It’s being invested in covering the neighborhoods, doing what we do best. We decided early on, we’re like, we need reliable income. We’re not trying to get rich, like I said, but we saw all these reporters lose their jobs at DNAinfo and we didn’t want that to happen again. And we felt that what we were providing, which was very ground-level news was worth 16 cents a day.

**Wailin: (00:15:59)** With Block Club Chicago, you can read five unlocked articles before being asked to pay. And the editors decide which articles are locked. Breaking news is always unlocked. A subscription costs $59 a year and Block Club Chicago is also thinking about some different membership tiers that come with swag or access to special events, similar to how public radio has members.

**Jen: (00:16:20)** We all come from an old-school newspaper background, and we watched our newsrooms shrink. And, we just know we need to rely on different funding models. We cannot be dependent on foundations. We need to be self-sufficient, and by self-sufficient, that means, our readers. And, you know? If our readers don’t find us valuable, they won’t pay. And that’s kind of our ethos, is, you know, we’re going to work our butts off to bring you news that you need and that you feel is worth $59 a year.

**Wailin: (00:16:49)** Oh, and if you want to cancel your Block Club Membership, you just click something on the website, and you’re done.

**Jen: (00:16:54)** I personally can’t stand when I have to jump through a bunch of hoops. I remember trying to cancel a gym membership and having to write a letter and mail it, and like, it’s 2019. I don’t… I mean, I don’t use the mail. I don’t write letters. That was just so obnoxious to me. Or people who make you call and stay on hold forever. That is just something that none of us are interested in. We’re not trying to trick anyone. If you don’t find it valuable then we don’t want to make you pay for something you don’t find valuable. That’s the right thing to do. We’re not trying to scam people.

**Pete: (00:17:26)** If somebody tells you they’re willing to pay, you should believe them and try to really be clear about what motivates them to pay and make sure they get enough of that so that when the month is up, they don’t decide to leave. Because if you get just enough of what brought you in, people stay on subscriptions forever. So long as it’s not exorbitantly expensive and kind of stays at the same price point. You know, it’s much harder to acquire a subscriber than to lose one. Regardless of how easy it is to cancel. You just form a much stronger, clearer point of view about what the value of what you’re doing is so that you’re offering enough to keep your audience really engaged and so that they don’t have to, every month, think about do I want to continue this or not? It’s just a given unless they have some sort of economic hardship where they have to give something up, in which case you shouldn’t keep them as a customer, right?

**Jen: (00:18:20)** We put out a newsletter every morning that has seven stories in it that you can’t find anywhere else. You just can’t. Every single day. So, I think that that is important. I mean we don’t have the same front pages as the other news outlets in town and we aren’t as big as we were but we’re trying to get back to what we do next, which is covering neighborhoods from the ground level and having the reporters on the ground in the neighborhoods.

**Wailin: (00:18:44)** Did you end up canceling Sirius XM?

**David: (00:18:47)** Oh, do you know what? The shortcut to canceling Sirius XM is to rant on Twitter. Then you get handed off to a special customer service unit that’ll cancel your shit right away. Seriously. It’s totally dystopian. I’ve heard the cancel stories from Sirius XM before and most of them entail spending 40-plus minutes on the phone.

**Wailin: (00:19:11)** Ugh.

**David: (00:19:11)** And I did not have to do that. I just—

**Wailin: (00:19:15)** Like, they didn’t force you, to like, tell them five reasons why.

**David: (00:19:17)** Exactly. Exactly. That’s—I routed around the whole let’s try to capture this customer script and they went straight to, “Oh, I see in my notes that blah blah blah. You’re cancelled. You’re good.”

**(00:19:32)** Broken By Design by Clip Art plays until the end of the show.

**Shaun: (00:19:32)** REWORK is produced by Wailin Wong and me, Shaun Hildner. Our theme song is Broken By Design by Clip Art.

**Wailin: (00:19:49)** Special thanks to Brandie Howell for her help with this episode. If you’re in California and want to share a consumer complaint with the Consumer Federation of California, their website is consumercal.org. That’s Consumer-C-A-L dot org.

**David: (00:20:15)** Aw, fuck off Sirius XM. I don’t want to discuss my options. I just want to cancel your shit without the hand—hassle. Fuck, let’s start over. We’re doing it live! All right. One more time.

This is an episode title
