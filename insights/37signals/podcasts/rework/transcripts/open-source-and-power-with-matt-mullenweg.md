---
title: "Open source and power"
description: "Matt Mullenweg, the founding developer of WordPress and the founder of Automattic, joins Basecamp co-founder David Heinemeier Hansson for a spirited debate about tech monopolies, power in open-source communities, and how to be good stewards of the modern web that they helped build."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/open-source-and-power-with-matt-mullenweg/
tags:
- podcast
---

# Open source and power

**Shaun: (00:00:00)** Before we get to the show, I just wanted to remind everyone that we are gearing up for another one of our mailbag episodes where listeners just like you can call in and ask questions of Basecamp co-founders, Jason Fried and David Heinemeier Hansson. Or, heck, anyone here at Basecamp. So if you have a question you’d like answered on the air, you can leave us a voicemail at (708) 628-7850. All right, onto the show.

**(00:00:24)** Broken By Design by Clip Art plays.

**Wailin: (00:00:25)** Welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m Wailin Wong.

**Shaun: (00:00:30)** And I’m Shaun Hildner. You know, Basecamp as a company has always been opinionated. Heck, that’s the entire premise for REWORK, the book and this podcast. Well, it turns out that when you have strong opinions, some folks don’t always agree with them and that’s healthy. On today’s show, we’re trying something a little novel, a civil discussion between two people with differing viewpoints. One of those people is Basecamp co-founder David Heinemeier Hansson whose voice you know pretty well by now. And the other is Matt Mullenweg, the founder of WordPress and Automatic.

**Wailin: (00:00:59)** Possibly the most surprising part of this whole thing is that this discussion started in the most uncivil environment, Twitter. Thankfully David and Matt agreed to move the conversation to the phone and they have a lot of mutual respect for one another. They spoke for just over an hour about tech monopolies, accountability, and power dynamics in Open Source software. This is a super-sized episode for us, but we wanted to present the call as unedited as possible, so we’ll get out of the way and leave it to David Heinemeier Hansson and Matt Mullenweg.

**(00:01:33)** Broken By Design by Clip Art plays.

**Matt: (00:01:37)** My name is Matt Mullenweg. I am the co-founder of WordPress in 2003 and a few years after that I started a for profit company called Automatic that I’ve been the CEO of for the past five years. And then finally last week. And what kicked this off is we announced an investment where Salesforce, which is a large enterprise CRM company bought 10% of the business for $300 million. And David and I started going back and forth on Twitter and I felt like Twitter was not enough to actually have a good conversation about this. So, I’m glad we were able to hop on and discuss it with a bit more nuance.

**David: (00:02:13)** Absolutely. Well first of all, thanks for coming on the REWORK podcast. We’re talking about before we started recording, it’s just so great when you can have a conversation that can start on something like online and you can then jump on a higher bandwidth medium in such a short period of time. So, thanks again for coming on and having a chat. I know that sort of, as you say, Twitter, you’re putting it very diplomatically, I think, isn’t always the best place to have a good conversation. I’d say it’s pretty much never a good place to have a good conversation. It’s a great place to lobby snipey tweets and get things going. I’m a longtime fan of starting inquiries through snipey tweets.

**Matt: (00:02:56)** Ha. I fell for it. You caught me.

**David: (00:03:00)** Hook and sinker here. So, I think what sort of, to give it a little bit more context, what started it from my end was seeing you guys announce the funding round. This was a Series D round, I think.

**Matt: (00:03:14)** I did an interview around it. Yeah, there was a quote in the interview.

**David: (00:03:15)** Exactly. It was the quote in the interview that really sort of just fell into all my prejudice about venture capital and about what’s going wrong in the online world today, which was we want every website, whether it’s e-commerce or anything to be powered by WordPress. And then following that up with kind of like, well, there’s no reason WordPress couldn’t have an 85% market share of, well, I guess everything, of the internet. Um, which just sort of instantly sent these shockwaves through my system going like, what the fuck?

**Matt: (00:03:48)** And what did that sort of bring up for you? Like what did you imagine there?

**David: (00:03:53)** What’s going wrong right now online for me is that the internet has been captured. It has been captured by, what, 10 companies. Maybe fewer than that, like five really, that sit so heavily on so much of the internet that first of all they get to dictate everything and then there’s scraps left for everyone else.

**(00:04:19)** And when I think about the work that I try to do with the web, and I guess also why this kind of rankled me was because I thought also the kind of work that you guys have been doing for a long time for the web is to promote this open free web, the open free internet, which to me is in direct opposition to an internet that’s dominated by just a handful of players who sit on vast monopolies that allow them to do basically whatever the hell they want.

**Matt: (00:04:46)** So in your idea like an open and free internet would have like five players with 20% each or like—

**David: (00:04:53)** More like, 5,000 players with 1% each. Well maybe that’s an overstatement in some cases, right?

**Matt: (00:05:00)** That’s some VC math right there.

**David: (00:05:01)** But to have just like a very large rich ecosystem of providers of tools and of services and so on. Because if you think about the web today, like if you want to say something sort of live, right, like Twitter pretty much dominates that, right? If you want to share photos online in kind of a broad approach, Instagram is very dominant on that. If you want to engage with a general-purpose social network, I mean Facebook is pretty dominant in that. And when you think about all those domains, when I think of sort of what’s left, right? Like what hasn’t been captured in this way, I think about blogging, I think about podcasting. Those are probably the two main media that haven’t been captured in this way. So to think that like, Hey, this blogging thing that’s kind of like, haven’t been captured yet, seeing that as a goal to be captured just like, yeech. I hope that’s not what he actually means.

**Matt: (00:05:57)** Well, I wonder what, um, for podcasting for example, what percentage of podcasts go through Apple’s default podcasting app?

**David: (00:06:02)** It’s probably a high percentage, but I think podcasting is an interesting example because even if Apple perhaps has a high slice there, first of all, the platform is open in the sense that like anyone can use anything else. I use Overcast for example for podcasts.

**Matt: (00:06:20)** Me too.

**David: (00:06:20)** And also that that Apple—

**Matt: (00:06:22)** It’s built on RSS and enclosures—

**David: (00:06:23)** Exactly.

**Matt: (00:06:23)** —and some really cool software that’s, that’s very open web by default. Although a lot of the newer ones like, even Spotify are saying, upload it to our platform.

**David: (00:06:32)** Which I think, again, Spotify was the other one that sort of tickled me when they were like, “Oh, we’re going to have these exclusives. We’re going to basically close down podcasting to mean like we want to own podcasting.” And I think that that’s the same thing, I’m sort of fearing with an announcement like that from WordPress, it’s like, “Well, we want to own blogging.” When I go like, fuck that, no one should own blogging. And when I say own, I think you bring up a good point here about RSS and even HTML and so-0n. There’s a lot of these open standards that this thing is built on that are perhaps different from the proprietary protocols of Facebook or Twitter. But I don’t think—for me that’s not enough.

**Matt: (00:07:12)** I would say it’s not just protocols. I mean when you talk about those services, they have network effects of having everyone kind of on the same domain, same database. And none of them are Open Source, which is interesting. I’ll say my response. Well, first let me say the exact quote. I said, “I think there’s potential to get to a similar market share as Android, which I believe now has 85% of all handsets. When you think about it, Open Source has a virtuous cycle of adoption, people building on the platform and more adoption.”

So, while I think that you can have, I would say good growth of a platform… Actually, I wonder if Rails is a good example of that. Like what percentage of frameworks built on Ruby would you say, like, Rails has a market share of in terms of users or apps built on it?

**David: (00:07:56)** Very high. But I’d also say that defining the space for frameworks just to Ruby would be kind of defining like blogging just to things built on WordPress, right? Like, for example, like, for me, I don’t really, I don’t care that WordPress is built on PHP, right? Whatever dominance that WordPress might have in terms of its slice of the web, whether that means like it’s number one on PHP. I dunno, that doesn’t feel like it has like a huge influence on the future of the internet. In much the same ways that whether Rails dominates Ruby or not, doesn’t feel like it has an influence on the future of the internet. Versus, WordPress having an 85% slice of the internet. I mean, pretty big influence on future of the internet, right?

**Matt: (00:08:40)** Yeah. I mean, you know, by that definition you’re also excluding some things from blogging. So you’re not calling Twitter microblogging or people publishing texts and pictures on Instagram or Facebook as blogging. Although, you know, in terms of a job to be done or user interface, these things have a lot of overlap. So, if you were to include those, maybe like number of posts per day, I bet our market share would go way down.

**David: (00:09:02)** Which… true. But also doesn’t that sound like a little bit like Zuckerberg saying, well, I mean Facebook doesn’t have a monopoly. Like we compete against things like sleep and we compete against things like eating lunch because these are all sort of just competition for attention. I think a Netflix did the same thing, right? Like we’re not competing against Apple—

**Matt: (00:09:21)** I think Netflix said that, yeah.

**David: (00:09:21)** —or whatever, we’re competing against sleep. Well, I’ve heard the same argument from Facebook, basically saying the reason they don’t have a monopoly is that they’re in the “attention marketplace,” right? And as long as they don’t have a full 8-10 hour slice of your attention every day, well, those things are taking your attention. So, I mean, I still hear the argument. I just, I find that right now we are in a space where the pendulum has swung so far into the era of consolidation and monopolization and control rested with the very few and that that’s a worse place to be than when, for example, I got into blogging. I started my blog and I think 2001 and I started it on Graymatter. Do you remember Graymatter?

**Matt: (00:10:11)** Of course! I was very inspired by Graymatter.

**David: (00:10:13)** Graymatter was this Perl collection of scripts. And there was Graymatter and there was Movable Type and Blogger came a little while later and there was just, it felt like there was a ton of platforms. It felt more interesting. I think that’s also part of it that a diverse—

**Matt: (00:10:33)** Textpattern.

**David: (00:10:33)** Textpattern, yep. A diverse set of tools where there isn’t just one monolithic, dominating platform is a more interesting place to be. It’s a more free place to be. It’s a more experimenting place to be. And when I contrast those two worlds, I’m nostalgic, in like the best sense of that word.

**Matt: (00:10:54)** I think you might have some rose-colored glasses there. I mean when WordPress came on the scene, the big criticism was there’s already too many blogging platforms and Movable Type had the self-hosted market, probably like 90%. Livejournal, Blogger were utterly dominant, really Blogger had been bought by Google and was owned by Google already when WordPress started.

**(00:11:14)** How I think about it, and this is, I think, a really interesting conversation because our companies are so philosophically aligned like, and that’s partially because you publish a lot of your stuff, right? Automatic has been very influenced over the years by the things that you and Jason, 37signals in general have, have published about what you do. So where we differ, I think, is a really interesting place to mine.

**(00:11:35)** So, right now, WordPress’s market share in the same scale I was talking about, that 85%, is about 34%, which means that the technical number, there is a site called W3Techs indexes the top 10 million domains, unique domains, takes out all the spam, everything like that. Of all the 10 million sites, 34% of them are running WordPress. That’s actually 10 times the number two, which is another Open Source platform. I forget if Drupal or Joomla is in the number two. And in fact, in terms of every year we’re growing the equivalent of a couple of Drupals in terms of the sort of percentage of the web we’re picking up.

**David: (00:12:10)** Does that seem healthy to you? Is that a good place? If you take off your CEO hat for a second, does that seem like a healthy marketplace?

**Matt: (00:12:20)** Well, these are really vibrant competitors, in fact, if you look at the wider market—

**David: (00:12:22)** Well, they’re not that vibrant if you’re growing like several times number two, right? Or if you’re 10 times bigger than number two, I don’t think anyone would say, “Oh, there’s a vibrant market in rental cars,” if Avis had like 10 times the market share of Hertz.

**Matt: (00:12:37)** Well, that’s what’s beautiful about the web. So, Shopify only has, I think they say 800,000 merchants. And on that W3Techs number, they show up I think around 1-2% or something. So way, way, way smaller. But look at the business that they built on top of this small slice of domains. So unique domains is not the only measure. And in fact, you know, in the past few years we’ve had Wix, Squarespace, Shopify, in addition to all the amazing improvements that happen and have happened in other Open Source CMSs. And new ones launching all the time, so that’s, I think, one of the beauty of Open Source is even though Open Source can become a bit of a standard, it doesn’t prevent others from starting on it.

**(00:13:16)** And in fact, within the WordPress world, there’s been a lot of interesting takes or flavors of WordPress that are built. So this page builder is like Elementor or Visual Composer or the one that we make called Gutenberg that can sometimes have millions or sometimes even north of 10 million sites on them. And the truth is that if I had an evil hat on, like let’s say I started doing evil monopoly stuff, people could easily fork this offer and they would tomorrow. So there’s a checks and balances there.

**(00:13:44)** So that’s why I love, I mean probably why we both love Open Source. It allows you to be truly sovereign, right? It doesn’t matter what I say or do or don’t do. WordPress belongs just as much to you as anyone else. And any sort of modern set of developers can take it and make it their own or not do updates or whatever they want to do.

**David: (00:14:00)** Yes. I say, I bought into that perhaps more before I actually ran a major Open Source project for many years and realized that that power is illusionary. Like technically, someone could fork Ruby on Rails tomorrow, right. What is the likelihood that that fork is going to succeed once you have kind of sort of this [jock and nod?] of network effects? Actually to some extent you mentioned it before, right, that WordPress is growing so much faster than anyone else. That gravitational pull is huge. So, should someone fork it and then introduce incompatibilities or whatever. What is the likelihood that that’s going to be a serious contender? For me, my assessment would be extremely low. Just the same as if someone was to fork Ruby on Rails today and call it whatever, Snoopy on Pails.

**(00:14:53)** Like, the odds of that being anything than a curiosity for two days on Hacker News, I’d say extremely low, which is exactly why I think this conversation is interesting. Is, Open Source sometimes, to me, and I say that as beneficiary of this, is, it can provide a veil over true power and who has that power. And I would argue that WordPress being in the position, a third of all these domains you just recounted being on WordPress, right is tremendous power. And even if that power is somewhat distributed, it’s still very much so located mostly with the company backing that engine. And that you built a commercial business on top of it then even uses the name goes even further just to say it that there’s a lot of power here. And the last point I wanna make in that is of course there’s a lot of power.

**(00:15:45)** Why would venture capitalists and otherwise invest half a billion dollars into WordPress if they didn’t see Automatic, as the company, as having a lot of power over WordPress, right? I mean, the whole a reason someone is able to raise that kind of money is off the back of something that, where someone can pitch, “Hey, we have like a third of all websites on the internet and we think we can get to like almost, or we can get to 85%.” That that’s a very compelling venture story, right? Like, “Hey, I already have like the beginnings of a monopoly. There’s a straight shot to a monopoly. Once we get to a monopoly, we can extract monopoly rents and therefore a company can be worth billions of dollars.” Where do you differ on [crosstalk].

**Matt: (00:16:35)** Yeah, there’s, there’s some good threads there. I guess first is, no one’s forced to use WordPress and that’s not just a thin veil. I mean there’s a ton of options out there, including like I think that the Rails demo is like build a blog in five minutes, right?

**David: (00:16:48)** Yes.

**Matt: (00:16:48)** So there is, I would argue that a lot of the people adopting WordPress are doing so because in evaluating all the options out there, including the network effects of the developers, the knowledge, the plugins, the themes, the ecosystem, everything. WordPress compares pretty favorably to the ones out there, both on the enterprise side, the consumer side, the site builder, et cetera. Maybe it’s also the price, you know, it’s Open Source. It’s free. You can get million-dollar software for nothing. That’s a good deal. People like that.

**(00:17:20)** I would argue, you said that if someone forked Rails, Snoopy on Pails, which, I like the name of. It probably wouldn’t get a lot of users. I would say that that speaks a little bit to your stewardship of it and that you probably bug a lot of people a lot of the time. So do I. But not to anything that is like gross mismanagement, that would cause a really big part of the community to go. So, you know, typical release of WordPress has 400-500 contributors, maybe 10% of that is from Automatic, like 40 or 50. And they’re important people. We, we do try to contribute as much as possible, but if 200 of those went some place else because I did something really brain dead. Yeah, that would be a pretty serious competitor.

**(00:18:00)** And there are some examples of that in Open Source history. Joomla itself, I think, used to be Mambo. WordPress itself was a fork of b2 16 years ago. And more recently we see things like MySQL and MariaDB. And there’s lots of other examples where you can have a fork that if you put enough weight behind it or if it gets enough of the community going can actually be pretty interesting and take over as say, WordPress and b2 did.

**David: (00:18:25)** Right, so the possibility is there, right? But I think that there’s still just an inherent, to me at least, not just aesthetic, but real issue with concentration and the death of diversity in terms of real effects, right? Like WordPress sits on a third of it and is so much larger than anyone else. So even if it is possible sort of in theory and someone could fork it and in theory someone could sort of usurp it, but what’s the likelihood? And what happens while that’s not happening, as you say, with network effects. Actually, WordPress I think has a ton of network effects, right? Like when a platform is so large and so dominant, it’s likely to attract all the plugin writers and all the theme builders. Because that’s the main marketplace in much the same way that people go like, well, of course we sell on Amazon. That’s where the customers are. And you could say like, well, people choose to shop on Amazon. Yeah, they do. Does that mean that it’s not a problem that they’re growing in sort of monopolistic ways or how they can flex the power that they derive from that position?

**(00:19:35)** I think it still is. I think we’re living through an era right now where a small handful of big tech companies are exerting a completely undue amount of power over the internet, over discourse, over all sorts of things. And that that’s something we should try to recoil from and at least learn from. And at the very least, not aspire to building more of. And I think that that was kind of what at least tickled me and got this going right. Why isn’t WordPress in a great place, “only being a third of all the sites on the internet?” Why does it need to get to 85%? Why does growth need to be that explosive and that wild? And then, let me answer that question first. At least in my, my stereotype of that answer. And that stereotype of that answer is because that’s not how venture capital works.

**(00:20:27)** You don’t get venture capital to the tune of half a billion dollars by saying, “Hey, things are great. We’d love to stay here.” Right? Like you get it because you tell a compelling, extremely rapid, exponential growth story. And that’s the part that scares me because I think when you look at all these big tech companies, the vast majority of them got into this position fueled by venture capital and then they exploited those positions, based on that venture capital. And we’re, we’re all so much worse off and I don’t want to be worse off when it comes to blogging. And I don’t want to see just this concentration of power in one engine no matter how good it is. I think that’s the other part that I take note to, is, there’s one theory of monopolist enforcement that’s just consumer harm, right? Like is Amazon bad for the consumer in the sense of like, do they raise prices? Or do they… I think there’s some great pushback to that theory coming up now, bubbling up now and saying, you know what? Consumer harm is not the only thing that matters. A general sense of concentration of power is also a thing that matters and we should tackle that directly.

**(00:21:36)** I mean, of course this is an imperfect comparison. WordPress is not Facebook or Google. There are differences around like Open Source and so on. But I’m finding that those differences are often overstated. Like Facebook can also point to tons of their shit being Open Source. Hey, we Open Source all our secret sauce to how to build, I dunno, make PHP run fast or databases and Google could say the same thing and yet, and doesn’t change the fact that they are clearly monopolies and in my opinion, clearly bad for the web.

**Matt: (00:22:05)** Well, and they don’t allow you to run Facebook or Google on that, like you can—

**David: (00:22:10)** Yes, but even even if they did—

**Matt: (00:22:10)** —you get the building block, but—

**David: (00:22:11)** Yes, but even if they did, would it change things?

**Matt: (00:22:12)** That’s what’s actually pretty interesting.

**David: (00:22:13)** You think?

**Matt: (00:22:14)** Yeah. So, I mean, we’re pretty unique in that wordpress.com runs core WordPress. So it’s a multisite instantation of the same software that you can download and run. And that is fairly unique actually. And in fact, there are people who run large multisite WordPress instances with hundreds of thousands or millions of sites on them. And that’s cool. Like, I would actually love if, let’s say, one of our big competitors like Wix switched to WordPress, right? Because then we would collaborate on the rails, if you will, or the sort of fundamentals like security, speed, login, whatever it is. And we can compete on maybe interesting user experiences or things built on top of that. But it feels so wasteful to me for like people to reinvent the wheel a million times.

**(00:22:57)** And that’s where, to go to the WordPress point, it’s very important to distinguish that VCs did not invest in WordPress. They invested in Automatic this round, we announced. The investment in WordPress and the WordPress ecosystem is huge. And actually think about dominance a ton because if you look at really successful platforms. Typically the bigger—the company behind it doesn’t go over 5%. I was reading an old thing around the launch of Windows 95, which I don’t know if you remember, but there was like a Rolling Stones song and people are standing in line to get Windows 95 and Microsoft would talk about how for every dollar they made from Windows $20 are made in the ecosystem by other companies. And it’s remarkable, if you go to a lot of platforms you see a similar ratio to that, like a 20-to-1 or about a 5% ratio. Automatic makes probably 2 or 3% of the revenue in the WordPress world.

**(00:23:48)** There’s companies, including GoDaddy who might not contribute very much back to core but probably have three or four times the number of subscribers than us actually running WordPress. So that’s kinda huge and I think about that a lot. Like I want to grow the whole ecosystem. Not just our slice of it. And our slice of it? Someone has said is worth $3 billion. It’s exciting, but… and you actually did sell some shares to Bezos, right?

**David: (00:24:13)** Yes.

**Matt: (00:24:13)** Yeah. So you have taken an investment in the past.

**David: (00:24:15)** Well, we haven’t taken funding. Maybe this is a lost point, but like Jason and I sold our own personal shares, nothing went into the company to fund any operations. It went to fund a Lamborghini and some other fun shit. But nothing into the company.

**Matt: (00:24:29)** Ha.

**David: (00:24:32)** I mean, still, fair enough to say…

**Matt: (00:24:34)** By the way, I think that’s totally fine.

**David: (00:24:35)** Right, I have no qualms. I sort of, I tell that story all the time. It’s not that like selling equity in itself is a problem. I have a problem, generally speaking, on sort of the industry terms with the equity that’s being bought by venture capital and sort of the economics that that model runs on like a grand slam monopoly pushing set of economics that like, so you take 300 million at 10%. What does normal venture capital economics want back? Do they want $310 million back? No, they want $3 billion back. Like, they need a 10 to one, a grand slam hit.

**Matt: (00:25:13)** Well, you’re thinking you’re mixing up late stage and early stage there.

**David: (00:25:16)** True. True to some extent.

**Matt: (00:25:19)** So early stage is making bets, they expect a lot of things go to zero and they want some ten baggers or more in there. Late stage, I mean they’re trying to beat index funds and S&P. So if the market’s growing at 10% or 15% and you’re growing at 30% every year they look really good and are really happy and almost none of their investments go to zero.

**(00:25:38)** So that’s a completely different capital market.

**David: (00:25:40)** But I mean even if you look at that category, right? Like what would WordPress look like if it had, for 10 years, to grow 30% a year. This is where I just want to focus back on your own aspirations here. You end up with aspirations that are exactly that, right? What would it look like if 85% of the internet was run on WordPress? And that, to me, is perhaps where we come back to the fundamental disagreement. Me, that would look dystopian, like, any one platform, I don’t care whether it’s Open Source or it’s my platform, anyone else’s platform. Once it dominates 85% of a media of expression, like that’s fucking terrible. Isn’t this what, kind of when capitalists joke about, I just saw a tweet the other day about Cuba and some fucking right-wing dude was holding up or was in a supermarket and there was this whole row just of one kind of cereal and they all went like this is what you get with communism. You get one kind of cereal and it was like, isn’t the joke here that that’s what capitalism is trying to do in, in all these different segments? That like we’re trying to get one brand of blogging, one brand of, I don’t know, microblogging, one brand of social networks. And then I thought, like, actually, that’s not that funny. That’s just tragic.

**Matt: (00:26:59)** It’s kind of a tough analogy though. Maybe the better analogy would be our cereal aisles have like a hundred cereals but they’re mostly from the same company. Or would that be a better kind of…

**David: (00:27:09)** I’m saying it’d still be pretty bad, right? Like that’s basically just like a labeling exercise.

**Matt: (00:27:14)** Oh no. I’m just trying to help the analogy. But you know, I think part of what’s going on here is also, you know, you’ve referred to WordPress a lot of times as blogging. And I think of it more really like a platform. That’s why the examples I use are platforms. So, if you look at how a lot of people are building on it, they use WordPress to bootstrap something that doesn’t look like WordPress at all.

**(00:27:34)** So it might not even have a website. It might be powering just an API. It might be what some people call headless or decoupled installations. It could be a store, it could be, you know, there’s big platforms that use it to power their user system because we’ve shown that it’s user structure and schema that scales to hundreds of millions of users.

**(00:27:54)** So, you know, just things built in there that people are building on it. And so, much the same way, like, I don’t know exactly what percentage of the web runs Apache or Nginx, but let’s call it a huge percentage, probably over 34%. That’s okay. That doesn’t prevent the different types of websites that are built on it. If Nginx got to 80-85% that, I don’t think, would prevent any of the diversity or what people could put on there, on their websites. Same way with WordPress. WordPress could get to 85% and it wouldn’t mean that there is any sort of monoculture or lack of diversity. If anything, it would allow people to focus more on what’s different and not recreating the WYSIWYG, the user system, the login, all that sort of stuff that we’ve all built a million times and you just don’t need to anymore if something like WordPress solves your needs.

**David: (00:28:39)** Yeah, I think I used to believe that and I think I even used to push that somewhat would Ruby on Rails and I’ve really come too, for me personally, regret that line of thinking. I think just consolidation in itself is an issue for all sorts of reasons that monoculture is an issue. That once you’re down to one grain and you get one pest that affects that, Oh, all of a sudden you wipe out what 85% of the grain harvest that year. And I think that’s not that unrealistic of our comparison to the web.

**(00:29:12)** There’s value in diversity in and of itself, on all these different levels. Also on ideas, I think a great example, you go like, well, why would we want to keep rebuilding WYSIWYG over and over again? Well, because there’s a bunch of good different ideas that could come out of that, which is funny. Like, we actually build our own WYSIWYG editor at Basecamp. And why did we do that? There were all sorts of ones already out there and you could say like, well, this is a solved problem. We never need to think about this again. Sure we do.

**(00:29:43)** It’s pretty bad if we get to the point where we think it’s the end of history that, well all the innovation that’s ever been—

**Matt: (00:29:46)** But you must use libraries, you must use some things off the shelf, right?

**David: (00:29:49)** Oh, I do, but I don’t want any of those libraries off the shelf to be so dominant as to be essentially the entire market. Just like I would fucking hate if Ruby on Rails had like an 85% market share of web frameworks. First of all, the constituency you’d have to fit under that umbrella would be so, ironically enough, diverse that you’d have people wanting to walk in completely different directions. And I think this is one of the things that’s often true with software is that you simply cannot serve the needs of everyone with one implementation. And when you try to, you end up making all them miserable.

**(00:30:31)** That, an expression of like, let’s say how a blogging system should be that’s artistic, it’s scientific, it’s taste, it’s all these things that go into building software. And to think that like, well, there’ll just be one size platform that fits all, uhh. Again, I’m just thinking of like, what is the future I would like to live in? What does a healthy, open, free internet look like? To me it looks like an internet with tons of different providers, tons of different tooling. Where what we collaborate around is protocols, not consolidation of software market share that gives individuals companies or even projects outsized power to dictate the manners of the internet.

**(00:31:18)** Because I think the analogy you gave with, I think it was Wix, you said, like if they dropped whatever they’re doing and like let’s just focus on the same engine. Reminds me a lot of like what happened with Chrome and someone brought it up in the thread or maybe I brought it up in thread on Twitter where Microsoft—

**Matt: (00:31:35)** I think I did. I said I liked it.

**David: (00:31:35)** You liked it. Yes. That Microsoft dropped having their own rendering engine and then they just said, “Ah, fuck it. We’re gonna throw in the towel and we just going to go with Chrome.” With the same Chrome rendering engine.

**Matt: (00:31:45)** And it’s worth saying here that the Chromium rendering engine is Open Source.

**David: (00:31:49)** Right. Yes.

**Matt: (00:31:49)** So they can build a completely unique user experience on top of it, everything.

**David: (00:31:52)** Totally. Yes.

**Matt: (00:31:53)** But they’re contributing to this common way of interpreting HTML and displaying it to users.

**David: (00:31:57)** Correct. How did the web fare last time a single rendering engine had, what did they get to? I think they got to like 92% and maybe they only got to 85%. I should actually look that shit up because…

**Matt: (00:32:10)** But that was proprietary engine, that wasn’t an Open Source engine.

**David: (00:32:12)** To me, I don’t—that’s a a distinction with some difference in some cases and a lot of non-difference in a lot of other cases. This idea that once you have a rendering engine, for example, let’s take that example. Once you have a rendering engine that sits on 85% of the internet? What happens? And we can answer this question pretty well because we saw what happened, developers start developing just against that. They stopped developing against protocols. So you stop having a healthy ecosystem because you turn away from protocols and you turn towards implementations. And those implementations are quote unquote owned, whether it’s equity owned in terms of companies dominating or its Mindshare owned or it’s controlled in terms of having an outside influence by a small number of people who set the tone in it, they’re owned. There’s power, whether we call that power Open Source or we call it proprietary or whatever we call it, it’s power. And having a lot of power vested in a few people has a tendency to corrupt.

**(00:33:14)** The software world has just endless examples of what happens when we consolidate power into the hands of a few people. And it’s very rarely a great story. Let’s take the ideal stage. I think there was some time in like 2008 or whatever, where there were like three different rendering engines, Firefox and Chrome, and Internet Explorer, and WebKit. They all had, I don’t remember what it was like maybe 20% each, right? That was a better web.

**Matt: (00:33:40)** That was a terrible web. It was such a pain in the butt.

**David: (00:33:45)** Yes, it was a pain in the—

**Matt: (00:33:45)** And I say this as someone who was on the web standards project because the standards weren’t there. I think that was part of the problem. So the standards were not moving fast enough. There was no HTML5, it was like bad XHTML and HTML4, CSS wasn’t being iterated fast enough. So that’s why the standards fell behind the browsers and then the browsers would have quirks in their implementation of the same thing because they weren’t able to work together on the same engine.

**David: (00:34:09)** Yes.

**Matt: (00:34:09)** Like I love the idea that if the Microsoft folks find something wrong with a CSS attribute that’s being interpreted a different way. If they fix that, that can go upstream or they can have a public discussion on the bug tracker for Chromium and argue with Google or whoever it might be about what’s the right answer because we’ll search for truth not just for whatever different engineers building the same thing happen to have as the quirks of the implementation. Like that’s not a true standard.

**David: (00:34:34)** Now you’ve given up on protocols, right? Like we might as well hand the internet then to Chromium. And just say like, Hey, let’s fold all the standards bodies. You as an implementation, whatever you say will be truth, anyway. So why bother with this whole thing of protocols? Well, I think the internet in its magic is the magic of protocols. It is the magic of diverse different implementations and that magic is not free. You’re absolutely right. It is much easier for let’s say Apple to control exactly how the API should work for Objective-C or Swift or whatever. They control the whole goddamn thing.

**(00:35:14)** Now, if that was all there was and the developing for the internet was the same thing that we were all just subjects of a single project and not a set of protocols, fuck. Like that erases a huge part of why I’m interested in developing for the web and why I’m not that keen on developing for native platforms, right? It really is a struggle between what do you go for? Do you go for implementation? Should you go for protocols?

**Matt: (00:35:39)** I think if you look at the history of the web, all the most successful protocols are often accompanied by reference implementations or great Open Source software to implement them. And they typically were extractions of things people are doing versus architecture [crosstalk: astronomy?] of like what would be the theoretical thing. The theoretical, we’re just going to make the standard almost fails every single time.

**David: (00:36:00)** But you need the competition between the actual different—

**Matt: (00:36:04)** I think people need to be free to experiment and then you standardize on what works.

**David: (00:36:08)** Yes.

**Matt: (00:36:08)** And but that’s, we’re a little bit off—

**David: (00:36:10)** But how can you do that If you have a single, let’s say, rendering engine for example, Chromium sit on 85% of the—there’s not going to be any experimentation. We went through that. IE.

**Matt: (00:36:22)** Well, it creates a big fat target. If you can knock them off the King of the Hill, you have a huge barrier.

**David: (00:36:28)** Yes, that’s true.

**Matt: (00:36:29)** You don’t believe there’s like thousands of entrepreneurs trying to deseat WordPress.

**David: (00:36:33)** Right. But until that happens or if it doesn’t, we go through the dark ages exactly as we went through the dark ages with IE6 and IE6 sitting at 90% of the market. Anyway. I’m just, I’m making the argument that—

**Matt: (00:36:43)** Except that IE6 was totally closed. Like I would say a big difference is that, you know, you talked about monocultures in grains, but we’re not a grain we’re the soil, right? There’s 50,000 plugins and themes built on top of it and you can literally modify the code or use the frameworks or just write your own and have a really, really interesting alternative. I think also a big difference, you know, 85%, when I talk about that, that’s not a goal. I don’t wake up in the morning saying, “Oh, how do I get another percent?” It’s a trailing indicator. So it’s a trailing indicator of what I get passionate about, which is how do we create the best possible experience for developers and users so that they adopt it and how do we track how we’re doing there? Well, let’s look at the adoption. Just like you have any sort of metric. But there’s nothing we do that tries to game that metric or tries to move it specifically. It’s just how do we make that better user experience.

**David: (00:37:36)** Which I think is a noble goal to have as an individual company. I’m trying to zoom out, and like, what should the goal be for our industry? Should the goal for our industry be that one company, one project, one rendering engine, one blogging engine ends up with all the spoils in essence. And I go, do you know what? That works out pretty well for the individual company. So I can see with the CEO hat, you go like, well that’s what I should be doing. And then I also see that sort of the rest of us in the peanut gallery, worrying about the health of the industry and of the web and so on. We should be countering that. We should be looking at how can we make sure we don’t end up in that situation.

**(00:38:17)** This reminds me actually of, have you placed the Settlers of Catan?

**Matt: (00:38:19)** A few times, it’s pretty fun.

**David: (00:38:21)** Great game. And so it’s like a multiplayer game and it’s all sort of collaborative in the start. And then what I’ve found whenever I play Catan is whenever one player pulls ahead sort of towards the end face of the game what usually happens is this very healthy thing that all the rest of the players go like yeah, let’s stop trading with that person. And that’s exactly how I feel about this. Where, it’s funny, we didn’t even actually introduce this. So the blog that we were on at Basecamp Signal v. Noise runs on WordPress. You guys—

**Matt: (00:38:53)** Thank you, by the way.

**David: (00:38:53)** —helped us get on that and we run on the hosted version. It’s been great. We sort of evacuated from Medium and we got on this platform and we’ve been happy in that. But I sit a little bit now with the taste in my mouth that like I should be one of the other players in the end stage of the Settlers of Catan and simply for the health of the internet to make it as grand as possible. Like maybe we should have made a different choice. Not because WordPress is not great, not because you’re not great, not because there’s not a great team. Because all of that shit is irrelevant to the health and long-term sort of vibrancy of the internet.

**(00:39:39)** This is what I advocate when it comes to [inaudible] engine so that I basically refuse to serve the web in Chrome. Like I only use Chrome when I have to, which is usually when some fucking developer has decided that Chrome is the internet and you have to use Chrome to use their application, which happens.

**Matt: (00:39:55)** You must test in it though when you build things.

**David: (00:39:58)** We have people at the company who would do that. So I mostly rely on other people doing that because obviously you have to. They’re dominant, right? That’s the spoils of dominance. But then I try to spend my time in Firefox and I try to spend my time in Safari because those are two of minority browsers and just that alone is worthy of doing, right?

**(00:40:17)** So to get back to this point is that like if this was doing anything that we cared about at Basecamp, I would go, like, no, we should have picked whatever number two or three or four or five or 10 is if we want a healthy internet that’s, not in the hands of one company, one project or whatever. At Basecamp, we make commercial software. We sell commercial software. We’re in a market, you could define that. Let’s just define it as project management or company communication. You could define that as a slice of cake and you could say we have, I don’t know 1% of that. Well, however you slice the cake, maybe we have 5% 2%, whatever percent we have. I think it’s possible to be a capitalist, to run a company, and not have aspirations of domination.

**(00:41:06)** And I guess I’m just projecting here. I wish that more companies thought like that. I wish that when I read you go like, “Oh man, imagine if we just got to 85% wouldn’t that be sort of kind of awesome dude?” That something would kick in and you’d just go like, okay, yeah, I can see that just in this narrow view of this one company, maybe that would be awesome and it’d be awesome for our investors and shareholders and me and that sort of relatively small [crosstalk].

**Matt: (00:41:31)** I would argue it’d be awesome for the web actually.

**David: (00:41:35)** Is that your final answer? Because really?

**Matt: (00:41:38)** You’re attacking a straw man right now.

**David: (00:41:40)** I’m just, I’m just—

**Matt: (00:41:40)** For me, the 85 is as a result, right? It’s not the goal.

**David: (00:41:43)** Sure, sure.

**Matt: (00:41:43)** And that’s really, really important to say. And two—there’s two—there’s two things–

**David: (00:41:48)** You don’t think that Facebook or whatever would argue the same? They are where they are because they’re awesome.

**Matt: (00:41:53)** No, no, no. Because, oh, I think I feel a little caught up in some very rightful concerns you have about, one, proprietary companies and two, just kind of startup funding culture in general. If there’s two things I’ll ask you to consider, don’t do it now, but like post this conversation, you’ve given me a lot to think about as well. It’s, one, that Open Source platforms are fundamentally different from proprietary platforms and their adoption. And in fact, I bet you can think of lots of cases where when an Open Source platform gets widely adopted, it becomes more like a protocol than a product. It becomes something that a lot of diversity and interesting things are built on. And two, that it’s not zero sum. We’re not talking about land. We’re not talking about Settlers of Catan. We’re not talking about fields. We’re talking about the digital world and there is so much possibility and abundance created by the platforms that came before us. WordPress could not exist, there’s so much that we’re built on top of that people don’t think about anymore. They don’t think about the web server, they don’t think about their database server. They don’t think about the language sometimes if they’re using it as a consumer point of view. And so we’re, we used to think about those things a ton. I used to choose your blogging engine or your website engine by kind of the technology stack. And now people look at the user interface. In the future maybe we all have really good UIs and they’re looking at who helps you meet your business goals [inaudible].

**(00:43:26)** I don’t know, but the layers of abstraction that users need to think about changes and that means is not zero sum at all. That’s why Shopify can build a $30 billion business 10 times our evaluation on a small slice of the domains or users. There’s so much opportunity out there and I think there’s going to be more every day. And it’s not… any sort of like trailing adoption or a standardization on an Open Source stack doesn’t prevent that at all.

**David: (00:43:56)** I think… good points. I say for me looking at something like Shopify and why I’ve been a little bit of a cheerleader. I mean I’m horribly biased on the topic of Shopify, both because—

**Matt: (00:44:07)** They use Rails, right?

**David: (00:44:08)** They use Rails. Not only do they use Rails, they help bring the platform forward. The CEO, Tobi, was one of the original Rails Core members. I’m a good friend of Tobi. So, sort of anyone should take the following with that amount of disclaimer. My argument would be that that is exactly how I love to see the expression of the marketplace. That someone can build a valuable business without capturing the market. Then you can build value, as you say, they’ve built a whatever, $30, $40 billion business off 1%. That, to me is a beautiful expression of capitalism actually working. I mean, you could then argue about Smith & Wesson might have 1% of the gun market like, well, isn’t that beautiful capitalism, eh, maybe not. The particulars matter too. But this idea that they’re not—the amount of power vested in them to get to that value is very low versus—that’s what I worry about. The amount of power that gets vested into these dominating platforms is huge. And I think we are actually overdue a conversation in Open Source about power. And we’ve been coy about it for a long fucking time in ways that have helped not serve people but actually end up silencing them or sidelining them or whatever. That there’s a tremendous amount of power. I mean a lot of Open Source projects kind of give a wink and a nod to it. I think in Python they called a Guido the Benevolent Dictator for Life. Like what is that if not an expression of the power that someone holds.

**(00:45:46)** Again, it doesn’t mean it’s the same kind of powers as capitalist power in that I literally own the means of production and I can sort of fire you or whatever, but it’s power, none the less and I think that that power deserves to be interrogated. And I think ultimately it needs to be constrained. That the Open Source world and the world of software and the world of the internet is better when power is checked. And power is better checked when no one sits on basically all of the pie.

**Matt: (00:46:14)** At this point I would like to offer to listeners to go to the Wikipedia page for “Benevolent Dictator for Life” and you’ll see David Heinemeier Hansson or Ruby on Rails on the page. By the way, I’m there too, for WordPress.

**David: (00:46:26)** And I hate the term. It was funny, I was just on another, I was actually on a Django podcast yesterday and we were talking about this and they were like, “Oh, isn’t this great like, you’re Benevolent Dictator for Life?”

**(00:46:36)** Fuck no, it’s not great. In fact, if there’s any moniker or label that gets attached to me, that really makes me question what I do with Rails, it’s that. That that is an inherently, to me, on my, both aesthetics and ethics, revolting term. This idea that there is this dictator and like we should just be happy because they happen to make good choices right now. Oh fuck. Like that’s, it’s not a good governing model and I think, see what was the other scandal that just happened this month? Right. Free software.

**Matt: (00:47:12)** Stallman.

**David: (00:47:13)** Stallman, right? Stallman. I mean it was more or less—

**Matt: (00:47:15)** That was shocking and terrible.

**David: (00:47:15)** —the sort of Benevolent Dictator for Life of that organization. Yeah, he kind of was.

**Matt: (00:47:21)** He’s not on the Wikipedia page though, for what it’s worth.

**David: (00:47:24)** I think most people would probably give him that—

**Matt: (00:47:25)** He got removed.

**David: (00:47:25)** —or would have given him that label.

**(00:47:29)** Did he accrue substantial power from that? Oh, absolutely. Right. Did he misuse that power and all sorts of ways, abso-fucking-lutely. And this is what makes me uncomfortable about this whole thing that once we set it up as though, “Oh, we’re just a bunch of benevolent dictators.” First of all, where do you get that shit from? Like how do you know that that just benevolence this is coming from. This is describing things to people that you really can’t. And I think in the case of Stallman, now it’s clearly played out. It’s like there was not an accurate label.

**(00:48:00)** And in either case that we deserve to interrogate all this power that’s flowing through Open Source. I mean, if anything that the discussion right now and funnily enough, I’m often on the other side of the spectrum here about like the expropriation of free Open Source labor and how it has a tendency to accumulate wealth to a handful of highly successful companies. And then you have a bunch of programmers who basically get none out of it, right? The irony here is I just argued the other side of that coin. And that you should do Open Source for sort of other reasons and so on. But I think the discussion itself, I’m very much interested in because it is about power and about making the power explicit and not hiding behind things like, “Hey, it’s just open source. Everyone could do everything and like anyone could fork it and so on.”

**(00:48:47)** It just doesn’t happen. And like we have enough history now of like what, 30, 40 years of Open Source to see what actually happens and what doesn’t happen. Stallman happened. Major forks that turn out great very rarely happen. And when they do happen, they’re usually, like you said, with MariaDB, and MySQL because the person who was behind MySQL sold it for $1 billion, then decided, well, fuck it. I’m just gonna make my own thing again. Right. It’s not exactly just like, Oh, it was just a common person who rose up and made a fork and it turned out great. Like the number of cases you can cite of that, these very small list.

**Matt: (00:49:19)** Ah, but sometimes they’re big, I mean WordPress itself being an example right? It was a fork of an existing platform. I think in the benevolent dictator, which is an interesting sidebar. I really like the benevolent part. And again, I think on the dictator part, I don’t love that terminology. I don’t think either of us would be attached to that. But in other places, you know, companies, they typically have a CEO. Countries, they typically have presidents or something like that. And all of these systems are set up to have checks and balances, whether that’s a board or shareholders or voters or things like that. And if you don’t like your country for example, it’s really actually difficult to move to another one and opt into like a different governance system. But in software it is a hundred, a thousand, a million times easier than like uprooting your family and your friends and everything like that and moving to a different country. So, and actually Free Software Foundation is a good example of that. Myself and many others drifted away from them over the years. So, even though they started things, their influence got smaller and smaller and smaller as they took positions which didn’t really align with the future where people were going or where their constituents, be that developers, users, donors, whatever, were headed.

**(00:50:35)** To the extent that Rails is doing great, WordPress, is doing great, et cetera. I think that we’ve been responsive to changes in the marketplace. I think that term started as a joke. There is something interesting that with a lot of these Open Source projects there’s almost nothing you can name on the list that has a committee-based leadership structure. And I think about that all the time. Like, why is it difficult for committees or an alternative governance structures to create really great software, backend software, frontend software. You typically have something more like a director of a movie or a conductor of an orchestra. There’s no perfect analogies because it’s software, it’s different. But you typically have a person with whom a great deal of decision-making power for determining the platform rests and that is often a good thing for the health and quality of the platform, and I don’t mind it as much because we have these checks and balances with Open Source forking or all sorts of different ways that people can opt out of that person’s power.

**David: (00:51:36)** I can see the advantages of sort of director of like how do you get good software, right? But I think the checks and balances, they start to fall apart as you accumulate power. And I think it’s one of the reasons, for example, that it took what, 30 years of incriminating stories about Stallman for that to finally fall. You can say like, well that’s accountability. Like yeah, accountability over the course of three decades is kind of some slow-moving wheels of justice here. If you take say a WordPress at 85%, how slow would the wheels of justice and accountability move versus if WordPress is just like 5% of the market.

**(00:52:16)** What are the switching costs for someone to vote with their feet, to walk out? Oh, I’ll just go to any of the other 20 platforms that all have 5% of the market and I’ll take my stuff there versus, well, I have to uproot maybe not to the level of nation state, but like just look at how hard it is for people to fucking quit technology in general. How many people have quit Facebook regardless of the, I mean, hundreds of scandals at this point, right? Facebook has suffered essentially zero accountability for all their malfeasance. And it’s not just Facebook. Look at Uber, look at all these other companies where they end up in a monopolistic situation. The inertia of that monopoly is so strong that all their malfeasance essentially gets swept away.

**(00:53:08)** If you look at the landscape of technology today, I don’t think it’s a landscape of fucking accountability. Power has its own inertia and that is a problem in and of itself regardless of how benevolent it’s being wielded. We should be incredibly suspect of concentration, not the least because we have all these cases of concentration out in the wild that were the opposite of benevolent, right? Like, I don’t think anyone would use the word benevolent about Facebook or Google or Amazon or Uber. Right, like, they’re—

**Matt: (00:53:36)** But those are all proprietary. Remember, I asked you to consider proprietary versus Open Source.

**David: (00:53:42)** I agree, right.

**Matt: (00:53:43)** There’s an interesting thing that happens.

**David: (00:53:43)** This is why I want to use the broad examples of like say Stallman and the Free Software Foundation. So just to say that…

**Matt: (00:53:48)** Well, but that’s not a good example either because he was pretty irrelevant to be honest. Like he would go around and give talks. The same talk, he’s gave for 20 years but he wasn’t like running something big or something influential.

**David: (00:54:01)** I mean he surely was influential.

**Matt: (00:54:02)** I hope that—

**David: (00:54:02)** I don’t think we can. I mean, I agree it’s not the same thing and we can’t—

**Matt: (00:54:06)** Not a product that like people are using. I think there’s an interesting thing there which is, well, first I’m not going to defend Facebook or any of those companies like I’m not the person to do that. I’m probably more in agreement with you than anything, but for Open Source, there’s an interesting pattern that the bigger it gets, the more widely adopted, some sort of Open Source standard is, the actually easier it moves to move away from it. And in WordPress’s case, for example, if you were on one of the really small CMSs and you want to migrate to another one, you would actually have a hard time with that data migration because no one’s built the kind of system to go in between those.

**(00:54:41)** In fact, what might be your easiest thing to do is migrate to WordPress and then get it back out to WordPress and to this other small thing you wanted to move to. And the reason for that is as WordPress has gotten bigger and bigger and it’s got open data, it’s Open Source. People have built a great importers and exporters for it. So you know, everyone’s starting a CMS today is going to have a WordPress importer because it’s got lots of usage. And so that creates a de facto more freedom of the thing that has more concentration of usage. Where if you were on one of the small things, like, again you’d find it more challenging to switch.

**David: (00:55:14)** Yes, but as a veil, in my opinion because as you just said at the, at the top of the show here that like WordPress is growing at what, 10X the next competitor who several times the next competitor. So, the mathematics with the stats of it is that like, even if that is a possibility, it’s not a possibility that’s being widely used. Part of why I’m interested in having this conversation is because I’m wrestling with all these topics myself and I’m sort of, I’m taking on some of these topics, sort of a harder line perhaps than I would normally take just to explore the territory. In other cases of this discussion, I think I’m taking exactly the line that I kind of feel is true.

**(00:55:53)** I’m just curious to get your, your take on the Tumblr thing. And maybe this is slightly off the agenda list, but the reason I’m interested is because you just said, well I’d hate to be compared to the likes of Facebook and so on. And one of the other things that kind of tinkled my warning bells a little bit was when you guys bought Tumblr, first of all, which I thought was great, like most observers of the tech industry wouldn’t necessarily point to Verizon as, let’s use the word we were using earlier, as benevolent.

**(00:56:24)** So, getting Tumblr out of the claws of that, thumbs up. Getting it at a fucking what, a 98% discount. Triple thumbs up. Just, I love all that, right? Like plundering basically back from like the excesses of Yahoo and so forth. But where I am a little bit worried is later on in that announcement or maybe it was an interview, you were talking about Tumblr and you were talking about its potential and you were talking about its potential, particularly for marketing. And this is one of the reasons I think that like we are in such a shit hole right now in the industry and with Facebook and Google and so on is because surveillance capitalism is devouring the world.

**(00:57:03)** When we said like software is eating the world, advertisement-based software is eating the world, I’d say. And Tumblr lives off advertisement. Unlike, say, WordPress. How do you think that that might change your business and your perspective, that all of a sudden now you own an advertisement-based business and to grow that advertisement, don’t you need to basically do what everyone else is doing and introduce some surveillance capitalism and sell ads based on user profiles rather than just on interest? Because I don’t even see—how does Tumblr otherwise make money?

**Matt: (00:57:36)** Yeah. This is a good question. And also, I think this is also meaty because I’ve been wrestling with this a lot. By the way, it’s been a pleasure to talk. We didn’t mention it earlier, but Rails, TextPad and WordPress all used to be on the same servers. I used to log in to SSH and see like I’d run w or you and like you’d be logged in there. DHH is logged in, too. We would be able to be like, tooling around.

**David: (00:57:57)** There’s so much overlap and intertwinedness of the history of the web, which is, I think is also why this is such a privilege to be able to have these discussions with people who’ve been around for the duration, right? Like there’s not that many, I think that like are still around in this sense of leading major projects or whatever you want to call it. And sort of wrestling with the evolution of the industry that we saw it all the way from, as we just talked about, like 2001, I started blogging. I don’t know when you started blogging, but 20 years of blogging, let’s call it that and to see how the whole thing changes.

**Matt: (00:58:31)** Totally. And by the way, next time we get on, I would love to debate funding and fundraising and the VC model and investment for start ups.

**David: (00:58:40)** Let’s schedule a part two already.

**Matt: (00:58:41)** That’s a whole topic. Yeah. So to talk about Tumblr really quickly. One, it is true that they, right now, make all of their money from advertising. It’s not a ton and so Automatic, this doesn’t particularly change our whole map. We are still a subscriber-driven company. And actually you asked how we’re gonna—what’s one way to make money from Tumblr that’s not advertising. Well, subscriptions. There’s things like selling domains and upgrades and other things that we’ve done for 10-plus years on wordpress.com that have been really successful, that I’m curious to see what sort of flavor or version of that could be interesting for the Tumblr community. And it might be something totally different.

**(00:59:20)** Like maybe no one cares about buying a domain there, but they would love to be able to support creators. You know, because there are so many creatives and fun artists and everything on Tumblr, like, you could have like a built-in Patreon-like model so you could support a creator you love at a price they set and you know 95% of that or more goes to the creator directly without like a ton of middlemen.

**(00:59:38)** So that’s, that’s a business we’d be totally interested in. On the advertising side, I am curious to see what we can do because Tumblr does have a critical mass of people spending time there and as you said, the alternatives in the social networking space tend to be less privacy-focused. So, taking some of what we love about privacy and user-centricity, combining that with a network which is starting a little bit de novo, so kinda from scratch building up an advertiser base and things.

**David: (01:00:14)** How do you even sell that without going down surveillance capitalism? Are you going to sell that advertisement based on like the visitor and a profile of them or based on the content? That’s to me is really, I know this is a whole ‘nother, maybe even two podcasts to dive into, but to me the dividing line on the internet today, whether advertisement is sold unsaved, the DuckDuckGo model where they sell based on search terms. Or you sell it on the Google/Facebook model, which is to sell it based on the visitors and profiles of them.

**Matt: (01:00:43)** Yeah, I think you want to architect the system to hold the principles that you think are important. And by the way, like we said earlier, we do plan to Open Source as much of Tumblr as possible, including switching the backend to be WordPress. So what you’ll see… what I’m interested in is, well it’s really more an interest. So it’s closer to DuckDuckGo or Reddit than it is based on user targeting and the reason for that, one of the cool things about Tumblr is you can have different identities on it so you can have an identity that follows all your favorite comics, an identity that follows all your favorite programming blogs.

**(01:01:13)** And so, logically like just from my naive advertising mind, like I should see different ads in the context of what I’m following on different accounts.

**David: (01:01:21)** Yes.

**Matt: (01:01:22)** And so that we’re—that’s not easy by the way. One, you need to understand the content and two, I think you have to go out there and sell it separately. If you’re just kind of plugging in standard IAB units programmatically, highest bidder-type advertising model you are going to end up with either untargeted things or networks that might compromise privacy. But if you can have true native ads, and I know we’ve—well, I get the sense Google isn’t your favorite, but I think we should go back like 20 years and think what an innovation ad-words was. This idea that it wasn’t loading [inaudible] networks, right? It’s just showing a clean text ad that loaded with the page, was fast, didn’t have images or punch the monkey flash gifs or anything like that.

**David: (01:02:07)** Yep. Right.

**Matt: (01:02:07)** It was actually a pretty clean model. And so I love the idea of this native advertising where the thing that’s the ad is the same as the thing on the network. So people go to Tumblr to read posts and the posts are interesting. They can have all sorts of fun stuff. Like what if all the ads were posts and so there wasn’t a tracking pitch or there wasn’t anything unless you clicked on it, I guess. Then you need to go someplace, but—

**David: (01:02:24)** Which is kind of Twitter, right?

**Matt: (01:02:26)** —til then. Yeah, Twitter is one of the examples of creating this. Instagram’s actually done some interesting stuff there, although, like you said, they are part of Facebook, which has the most user data in the world.

**David: (01:02:35)** I would say my main issue is like which ads show up in the feed. Are they based on the topic of what you’re, like the people you’re following or are they based on some elaborate profile that has been gathered up about you because these people will suck up all sorts of data sources to build like, “Hey, just now you can target 14 to 17 year olds who live in Florida and like uh, I dunno.” So that’s why I was just curious where you fall on that—

**Matt: (01:03:03)** It’s a really tough business challenge.

**David: (01:03:03)** —if, like, are you going to use, basically, information about the visitors that are outside of the universe of Tumblr to show them ads? That to me is surveillance capitalism. Or are you going to go sort of the DuckDuckGo approach of showing… or as you said like just based on like what I choose to follow while I’m on Tumblr.

**Matt: (01:03:23)** Yeah, it’s, like I said, a really difficult business problem. So on day one what’s there is kind of more programmatic ads so they’re probably either buying broad things and they’re not very targeted in general or based on broad demographics. Going forward what I think could be really fun is if you can go from having a hundred advertisers to a thousand or 2000 you could do a lot more of that sort of interest-based targeting that felt like really relevant and exciting to people. It didn’t feel like something that was a record scratch when you’re in a Tumblr feed. But to do that you have to have a direct sales team. You need to onboard all those advertisers. That is a nontrivial problem. That’s exciting and we’re going to go for it, but it might not work. The good news is we have a great business model that we’ve been doing for over a decade now in the rest of Automatic, which is subscriptions.

**(01:04:12)** And I just love that. Like your customers are your customers and you’re providing them something really good and as long as they get more value than what they’re paying you, they keep doing so. And that’s also inspired by 37signals. Like y’all have been doing that forever as well. That’s my native model. But I’m always open to trying new things. So this is a little bit of a new thing for us and I’d love to check back in a year or two and like talk about how it went.

**David: (01:04:36)** Well, I love that sentiment and I was about to give you an amen and hallelujah, but I will hold your feet to the fire instead and—

**Matt: (01:04:46)** I would expect nothing less.

**David: (01:04:47)** —and track it on. Well I think we’ve sort of been going a good bit over the hour here and I really want to thank you for your time and taking your time to wrestle with this. I don’t pretend to have the answers even if I have strong opinions on them. And I think the answers actually will shake out from strong engagements and strong arguments back and forth in the dialectic as philosophers like to call it of trying to figure out what’s the right way to go and what’s the right way to take the internet and what’s the… How do we do right by the internet? Like that’s been one of the themes that’s been bouncing around in my head for a couple of years at least. That there’s, “Hey, I’ve been working on the internet for 20 years.” Like, yes, it’s great to continue to work at Basecamp and that, but there’s also this other aspect of it. I serve a greater purpose, really.

**(01:05:40)** And I try to say that without gagging because the word purpose has kinda been hijacked by the likes of WeWork and so on. Expanding the world’s consciousness and all this way where we take these esteemed words and we render them meaningless by laundering them through this commercial tumbler. Well, Tumblr… pun intended.

**(01:06:03)** Um, yes. Thank you so much and I hope we can continue the conversation about Venture Capital in another episode. I’d love to line that up because, I mean, you have the goods, right? From the inside sitting on 500 million-ish of expectations. I’d love to hear how that feels and like where that takes a company and how it helps or distracts from the direction you want to go to. And maybe we can explore that in an upcoming episode.

**Matt: (01:06:30)** And thank you for having a reasonable conversation on the internet. That’s too rare and I really enjoyed the debate.

**David: (01:06:38)** Thanks a ton, Matt. This was awesome.

**(01:06:40)** Broken By Design by Clip Art plays.

**Shaun: (01:06:46)** REWORK is produced by Wailin Wong and me, Shaun Hildner. Our theme music is Broken By Design by Clip Art.

**Wailin: (01:06:51)** You can find David on Twitter @dhh. Matt is on Twitter @photomatt. You can find us at @reworkpodcast, and our website is rework.fm where we’ll post show notes for this episode. Next week we have a very special episode where the creator of Snoopy on Pails talks Open Source with his pails.

**(01:07:13)** [Wailin makes the adults talking wah wah wah sound from the Peanuts cartoons.]

This is an episode title
