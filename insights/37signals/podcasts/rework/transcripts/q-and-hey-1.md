---
title: "Q and HEY Part 1"
description: "Jason Fried and David Heinemeier Hansson answer audience questions about HEY, covering feed management, signatures, IMAP support, design philosophy, and pricing."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/q-and-hey-1/
tags:
- podcast
---

# Q and HEY Part 1

**(00:00:00)** Broken By Design by Clip Art plays.

**Shaun: (00:00:02)** Welcome to REWORK, the podcast by Basecamp about the better way to work and run your business. I'm Shaun Hildner.

**Wailin: (00:00:07)** And I'm Wailin Wong. We're still deep in the weeds with Hey, the new email service from Basecamp. It's been a wild ride for the company and we're working on a big episode wrapping up the entire experience of launch. That will be out in a couple of weeks.

**Shaun: (00:00:21)** In the mean time we're going to bring you a Q&A from Basecamp co-founders Jason Fried and David Heinemeier Hansson. This was a recent livestream where they answered the internet's most pressing questions all about Hey. This week is going to be part one and part two will run next Tuesday.

**(00:00:39)** Broken By Design by Clip Art plays.

**Jason: (00:00:43)** All right, we are live. Hey David.

**David: (00:00:45)** Hey.

**Jason: (00:00:47)** How are you?

**David: (00:00:46)** Hey hey.

**Jason: (00:00:48)** Hey hey. This has been a wild couple weeks and there's been tons of questions coming in about Hey so we thought that, we've been answering tons of questions on Twitter and then also on support but we thought it'd be fun to do a livestream. We did one of these when COVID started around remote working and we thought it'd be nice to do one around Hey, and really, specifically why we did this, why we did that. So we asked people on Twitter to tag their questions #QandHey and we got, I don't know, it looks like there's hundreds, perhaps. We'll just kind of start and pick and few and sorry if we don't get to all of them, we clearly won't. But we'll do the best we can here.

**(00:01:28)** So, all right, here's one I really like because a lot of people have been asking about this. What's your suggestion for managing the Feed?

**(00:01:35)** The Feed, for those who don't know, is a feature inside Hey where you basically put your newsletters and instead of looking at them one row at a time, they're kind of all open and you can just scroll through them. So it says, after reading my newsletter, I want to mark it as Read, the only way I can see to do that is to move it to the Imbox and apply a label.

**(00:01:51)** So what we're trying to do here is don't manage the Feed. Don't worry about any of this stuff. You don't manage your Twitter feed. You just scroll through it and when you see it, it's done. You wait for the next thing to come in at the top. You don't manage your Facebook feed. You don't manage your LinkedIn feeds. Just kind of… they're feeds. It's information and you scroll through it and when you're done you're done. New stuff comes in at the top and you don't worry about the old stuff. So we're trying to take the burden of obligation off of you, which is hard because we're so used to having to deal with every single email that comes in. This is the problem with email, for 20, 30, 40 years now.

**(00:02:26)** Every email that comes in, well, do I delete it? Do I archive it? Do I move it? Do I label… don't do anything. Just let it be. And this is where the weight begins to come off your shoulders after you get over the awkwardness of an adjustment because this is an adjustment. And it's a different way of thinking about this, and a different mindset. But once you just say, I'm just going to let it be, let time take care of the rest. Everything becomes lighter and easier and there's less stress and less anxiety and you don't worry about managing things anymore.

**(00:02:54)** So that's the approach we're trying to take in a variety of different areas of Hey, but very specifically the Feed. Because look, the stuff in the Feed doesn't really matter anyway. If you miss a newsletter? Oh well. Right? It's not… this stuff is not urgent. It's not important. And just because someone landed in your email app at 9:01 on a Tuesday morning doesn't mean you need to read it at 9:02, it just means that they sent it at 9:01. So maybe you read it in three days. Maybe you don't read it at all. I miss things all the time in my Feed. No big deal. Nothing in there should be so important that if you miss it you're going to feel bad. It's a different approach and that's kind of how we're approaching this.

**David: (00:03:30)** One of the main changes for me using Hey for now, many months, is that I just deal with so many fewer emails because so much of it gets sent somewhere else. For example, the Feed. I only check the Feed like once every couple of days. I didn't need to read that newsletter at 10am, right? I like to read newsletters sort of at night when I'm just sort of catching up on things. The same thing with the Paper Trail. All these notifications that just come in that I just need to have somewhere, I don't need to react to them right away. Huge difference.

**(00:04:01)** So I think we still have some tweaking to do. Jason and I have been talking about some of these issues like how quickly does your Imbox, for example, flow. For some people it flows very quickly. Jason and I, we get hundreds of emails a day, right? So things flow very quickly. The river is very fast. For other people, the river's slower and there's some legitimate concerns there about what you see and what's in your face, and we're going to continue tweaking all of this. I mean, we've been out for what, 11 days?

**(00:04:28)** Gmail has been there for 16 years and there's what, probably, I don't even know. Hundreds of people working on it. So we're 50 people. We've been here for 11 days. We're going to listen to everything. And part of this, I think, with the whole listening thing is that we designed Hey for us. There were not, like, a bunch of focus groups where we went like, oh, what do you not like about your email apps and this was what 50 people at Basecamp thought would make a good v1. Not the final thing. Didn't get everything right. Didn't get every—we've gone back on a couple things where we're like, you know what, hadn't considered that.

**(00:05:04)** I'll next question because it flows straight into this—

**Jason: (00:05:05)** Yep.

**David: (00:05:05)** What are you going to do about signatures? So we went into this with all the indignation that I've built up after 20 years of using emails and looking at these huge blocks of legalese of like, hey, if you receive this in error then… okay. Now there's this much signature and there's like this much email, not proportionate. This doesn't feel right. But we went in hard, as we often do with the most sort of brutal way through it, which is, all right. You can't do it. No soup for you. Okay.

**(00:05:37)** And then someone called it out on Twitter, and they said, you know what? Here's a bunch of legitimate reasons for why someone would want a signature. Maybe they want their pronouns in there, maybe they want their timezone in there, maybe they want their position at a company in there. And we went, oh yeah, actually that totally makes sense. Totally reasonable. It's totally compatible with this idea that like, yeah, we're not going to make these huge signatures that have social media icons and everything else that's filling the net with footer crap. Or we could do the other thing.

**(00:06:04)** And there's a bunch of that with Hey. We have a core vision for what the product should do, but we didn't consider everything.

**Jason: (00:06:13)** Yeah, I'll jump into… I'm just kind of going down the list here. What's one feature you've gotten the most requests which we won't be bringing to Hey?

**(00:06:20)** Well, won't is… won't and forever are hard to deal with because who knows, right? But I think a lot of people have been asking for POP accounts and IMAP and whatnot, basic, can we check other accounts. That's kind of come up a lot. And we're not building an email client. And Hey handles emails in ways that's not really backwards compatible with other systems. For example, in Hey, you can get an email and you can screen that sender out so you'll never hear from them again. That's not compatible really with IMAP. Like, backwards compatibility. What do you do with those emails on other services? Do you mark them as read? Do you delete them? There's a whole bunch of things that don't really line up.

**(00:07:00)** So we're moving forward. We're not stuck in the past. IMAP and POP, great ways to check other systems but those other systems all are very traditional systems and they all kind of work the same way. Hey is a new take on email. It is compatible with any email service in that you can send and receive emails to any other service in the world, but the way we think about email is very very different. So we're not going to, when I say we're not, for the foreseeable future, which could be forever. We could change our mind in three years. I can't make permanent guarantees one way or the other but we are not here to let you check Gmail with Hey. It's just not the kind of thing that we want to do. It's not the kind of time we want to spend. As David's been talking about, we have a small team, relatively small team. We're version one and we've got a thousand things we want to do and everyone else wants us to do a thousand different things as well.

**(00:07:50)** We have to think about what makes sense for the product, what we want to invest our time in, where we want to take this thing, what we want it to be, what we want it to feel like, what we want it to mean. And also understand that saying no is going to push some people away who want something, understandably, but we're just not going to go there. We're not going to make this an email client for checking other services. It's not part of our, it's not part of our reason for existing. We're trying to differentiate by doing things in quite a different way at a variety of different levels and that's what we want to focus our energy on.

**(00:08:18)** Because if we have to take in email from other services, all of a sudden it slows down development and innovation on other areas of our product because we have to make sure that things work with other things. We just don't want to go there. It's just not our current interest.

**David: (00:08:31)** One caveat to this. I'll just say, people listening don't know how the system works. You can get your stuff in by forwarding. Hey takes forwards in and we send forwards out, so that's sort of the base way of doing it and then we've already committed to doing custom domains, which is the way you can get sort of a not at hey.com address.

**Jason: (00:08:48)** Uh, who led the UX and UI design of Hey? Did the team do user research as part of the process?

**(00:08:54)** The UI and the UX is pretty much led by me and Jonas who is our design team lead here at Basecamp. We don't do user research when we build new products. Version one is ours. It's what we want to exist in the world and the 50 people at Basecamp are the people who we talk to and who we use this with. We've been using Hey internally for what? Six or eight months now, basically. David and I certainly have. And that's enough. We know it's not everybody, we know it's not perfect, we know there's holes. We look at things, we go, we should make that better.

**(00:09:26)** And there's another question coming up, I'll just kind of bunch these two together in a second. But we build what we want to exist in the world for V1, and after that, and this is the same way we've done every product, Basecamp, Backpack, Campfire, Highrise, you name it. And after that, as David mentioned, we hear from tons of people, we listen to a lot of people, we eventually do a lot of customer interviews. Ryan Singer will probably lead that and we'll learn a lot of things.

**(00:09:50)** But version one is ours. That's how we do it and we put it out there and then we see what other people think, and then we adjust from there.

**(00:09:58)** Can I take this next one real quick?

**David: (00:09:58)** Yeah. Go.

**Jason: (00:09:58)** Which is something a little bit similar to something I was asked earlier. So, in Hey, at the bottom of the Imbox, there's a section called Previously Seen and this guy's wondering, do you just leave stuff there? Do you want to delete it? Do you archive? What's the intended purpose of that section?

**(00:10:13)** The intended purpose is to help you just chill out, truly. This is getting back to the Feed part again. Again, going back into history, email has always left you with obligations. Every email you get, you look at it, now what do I do. Well, you don't just look at it. You've got to do at least two things with most emails, traditionally. Which is, you look at it and you act. Maybe it's a reply, maybe you archive it. Maybe you do something else with it. Maybe you star it. Most things, you just see and you don't need to do anything else. And Hey takes that approach, just you look at it and it drops down into previously seen. That's now a log. It's an archive of everything you've done recently. So if you need to get back to something pretty quickly, you can.

**(00:10:51)** Versus, let's say you had something in Gmail that you archived and you wonder where it was. Well, it could be in archive, it could be in you inbox, it could be in sent mail, it could be all over the place. With Hey, it just drops down to previously seen and over time that pushes itself away.

**(00:11:04)** So I know this is a hard habit to break because, especially with Gmail, it's trained us to want to archive everything, to want to clean up everything, to want to put everything away. Just leave it. Let time do that work for you. So yes, that is the intended purpose. You look at something, it drops down, just forget about it. You're done. If you need to get back to it, it's right there and over time, it will just move away and it's really liberating after you can get over the hump of recognizing there's a different behavior here, we're going for.

**(00:11:30)** All right, David. Do you want to take the next one?

**David: (00:11:32)** Yeah. So there's a question here about having support with actual humans for an email service seems unique. Are you planning to lean into that more heavily in your marketing or whatever?

**(00:11:45)** This is a great point that we've been dealing with lately because we've been making Basecamp for the past 16 years and a key feature of Basecamp is that if you have a problem, you write in and you very quickly hear back from a human who's empowered to help you. Either help you with billing or help you understand the product or if you find an issue to escalate that quickly.

**(00:12:06)** And do you know what? I've been using Gmail for 16 years. I don't think I've ever written Google. I don't even think that's a thing you can, right? And some of this is about business models. I think Gmail… I don't even know how many users they have. They probably have a billion users or whatever you get at Google scale. You probably can't answer a billion people. They can't just write you. So you make it very hard to find, to that someone can contact you, and if they do find that, they expect the reply back in like, I don't know, a week. Maybe it works differently. I'm just going off my perceptions here. And clearly other people's perceptions as well.

**(00:12:40)** We've tried to think, could we do this? Could we offer email where if you have problems or you need help or something, you can write and a human will get back to you quickly? Do you know what? It's actually still an unsettled question, because even at $99 a year, that's about $8 a month. Running a support department like we do with a bunch of people that we pay very well is pretty expensive. And there are all these sort of ways you can try to quantify that but we're going to try. We're going to try. We're going to try to make a profitable service where we can write people back really quickly, and hopefully that does feel different. That we can offer the same kind of quick support that we offer in Basecamp for Hey, and I think a lot of people are going to be surprised if they do need to write us. Please, this is not an invitation to just generally write us. Especially right now. We've processed something like thousands of emails yesterday and we're just standing like this against the tidal wave right now. But if you do really have a legit problem, issue, do write in. Feature requests are very welcome, too, they kind of get funneled over into a separate track where we can review them at a calm time.

**Jason: (00:13:49)** What's your vision for enterprise Hey adoption. So it's funny. I'll take you guys back a bit. When we first started to build Hey, we originally weren't even building an email app, we were building more of a CRM style app. We were going to build a new version of Highrise back then, a couple of years ago. Eventually we realized we wanted to build an email thing. But it initially started out as a business email tool. There was no personal version, at all, which is essentially what people are signing up for today, at an @hey.com email address. Although people are using it for business already. But essentially it's priced for an individual user.

**(00:14:23)** But as we started building this thing, we were like, I want this for my own email. Why should I only have these great things for business work, or business email. I want this for all my email. So we kind of decided to take it in two tracks. It's the same product. So we actually, internally at Basecamp are already using the business version, the work version. We're kind of calling it Hey You for the individual version and Hey Us for the business version. Sort of our internal lingo right now. But we're using it. And the iOS app and the Android app support multi-user business accounts already, the web app does. We're just hiding some of those things right now as we're finishing them up.

**(00:14:57)** So ideally, the real business model here for us ultimately is probably business is going to subsidize a lot of personal use. Because it is, as David mentioned. It's hard. It's actually, at $99/year, even though people think email is free, it's traditionally, even $99/year it can be pretty hard to make this work unless you have a lot of customers. So the business side is, I think, going to help make that even more possible.

**(00:15:22)** As far as enterprise goes, we're not interested in enterprise anything. We're interested in helping small and medium-sized businesses. I don't envision a company with hundreds of people getting on board with Hey, although they certainly could. But I think the sweet spot is going to be one person to 50, to 60, to 100 employees, somewhere in there that feels like a really, really, really good fit for the kinds of stuff we're doing with the work version. Which is not just multi-user email, but there's collaborative features in there. There's a whole bunch really interesting stuff that's going to come and we can't wait to show you.

**(00:15:51)** But that's really it. It's not about enterprise. We don't care about enterprise. We care about small and medium sized businesses, so that's ultimately the focus there. But yeah. We're very amped up to get this out because we're using it. It's huge for us. David and I use it all the time to go back and forth behind the scenes on individual email threads. It's really, really handy and I can't wait to show it to you.

**David: (00:16:10)** There's been questions about accessibility. We've worked on making Hey accessible from the get-go. Michael Berger who works at Basecamp is our accessibility specialist. He's been reviewing it as part of the QA process. We still have more work to do. We're putting out a thing on the website shortly, maybe even later today. I don't know when it's going out. Just sort of reiterating our commitment to making Hey accessible. This is pretty difficult work in some regards. It's not easy. We've been doing a bunch of it from the ground up. There's still some work to do but we'll have it wrapped up pretty soon, I think.

**Jason: (00:16:45)** Let's see.

**David: (00:16:46)** There's a question here about recruiting. So we went out as part of the celebration and we've been allowed to publish Hey in the app store was that it removed a bunch of uncertainties around Hey. So a number of years ago, we went like, you know what, we're going to all-in on Basecamp, it's going to be the only thing we're going to do, and that we can do with the team that we have. And that worked out quite well, and then we started working on Hey and we went like, you know what, I don't know what happens when this thing launches. Right? We kept pacing ourselves and going, you know what? I really like it. Jason really likes it. A bunch of people at Basecamp really like it, but we don't have any idea. You can think you've made the greatest product in the world. You push it out there and nothing happens. This happens to me all the time with publishing, or with Tweets. I think, like, oh my God, I am so fucking clever. I wrote this down and it's a great piece and like, just crickets. Then I'll write something down and like, eh, it's kind of a throwaway thing and it just takes off. You just don't know.

**(00:17:42)** You have to ship to know. So we've been quite conservative, which we've always been, running Basecamp for the past 20 years, very conservative in like, let's not get ahead of ourselves here. We've invested a bunch, this is going to be a great V1, but maybe there's 2,000 people who's interested. Maybe there's 5,000 people that's interested. That'd be okay. We built a great system for ourselves and now 5,000 people get to use it. We could never have guessed that 125,000 people would show up in two weeks.

**(00:18:06)** It's actually kind of funny because on the technical side we did all these projections, right? You have to do something. Like, how big should the system be, how much capacity are you building for. And the first thing was like, okay. For the first several months, 20,000. Wow, that would be something and if we totally oversize the system such that in a year we could do 250,000, now we have some orders of magnitude to deal with. And then like, in two weeks 125,000 people show up.

**(00:18:34)** So now that that's happened we're going to do a bunch of stuff on the technical stuff and we've also got to do a bunch of stuff on the human side. We've already brought on five temporary people to help with all the support burden. We may bring on even more if this sort of keeps up. And then we have to get a bunch of other roles filled in because Hey, now, is cemented into something we're going to be working on for the next 10 years, maybe 20 years. I don't know.

**(00:18:58)** A bunch of things that we've been working on Basecamp for 16 years. All sorts of new ideas. We're going to work on this for a long time. It's going to need some more people. So Basecamp.com/jobs right now it says like, no listings open or whatever. That's not really true. Internally we have listings open, we just have to write the job openings. We have to do all the diligent work. It often takes us upwards of two months to do a hire, doing it the way we do. It's kind of a long process, but if you sign up on the mailing list there to be notified as soon as we have an opening, it's going to be there.

**(00:19:31)** I've already tweeted out we plan to hire in security and programming and design and support and a bunch of other areas of the business we're looking at getting someone. Now, this is still us hiring, right? It's not going to, oh, we're going to hire 300 people. No. I mean, let me just set some expectations. When we say, oh, we're going to hire like crazy. That may be like eight people or five people or whatever the number is. I think the most we ever hired in one year was in 2011 where I think seven people joined Basecamp that year. Maybe eight. So those are the orders of magnitude. But anyway. Yes.

**Jason: (00:20:05)** All right. This is a good one. So I'm going to just read this. John bought john@hey.com. A year later he decided he will no longer subscribe and canceled. When can another John buy that john@hey.com and what will you do with past emails and subscriptions and newsletter signups made by the first one who will keep showing up in an inbox?

**(00:20:22)** Great question. This is something we've thought a lot about. If you pay for a year of Hey, you own that email address for life. Even if you cancel a day later and never pay us another penny. We will never recycle that name. That is yours forever. And we even let you set up forwarding. So we will forward emails from, just again, using his example, john@hey.com. That's someone's actual email address, but.

**David: (00:20:46)** He works at Basecamp.

**Jason: (00:20:47)** Works at Basecamp, so I feel okay about that. So any email sent to john@hey.com forever will go wherever you want them to go. So that is our promise. And that is a really fundamental, important promise for a variety of reasons. On a security level it's important because you don't want someone else getting your password reset emails a year and a half down the road. It's also just a fundamental human promise that if you've been using this email address for a year, and you paid us for it. It's yours. You own it now, essentially. And we're not going to ever create any scenario where you're surprised because it doesn't work anymore.

**(00:21:20)** Now, on the trial basis, when you sign up for Hey and try it for 14 days, if you choose not to pay after that, we will recycle that email address between 30 and 45 days or so later, I believe, is the number.

**David: (00:21:32)** 30 days.

**Jason: (00:21:32)** 30 days. So that will be recycled, so we can't have people signing up to try it for a day and then like—

**David: (00:21:40)** John. John@hey.com.

**Jason: (00:21:41)** —amazing email addresses are gone forever. Right. Right.

**David: (00:21:43)** Right.

**Jason: (00:21:43)** So we will recycle those. Also, the other thing we do is if you cancel, if you decide to cancel, on the cancellation screen, when you're all done. Your account is cancelled, you can come back to that screen and download your data and export your data and set up your forwarding. You can do all of this after you cancel, which is very very different from most services. When you cancel, you're locked out, so you'd better get your stuff out of there before you cancel. But if you hadn't thought about it until you… then you're SOL. So we're making sure that we're making this stuff as friendly as possible without lockin, letting you take your stuff even after you've canceled and forwarding email for you after you've canceled, as long as you paid for a full year.

**(00:22:21)** Now, if you pay for seven months and you quit and you ask for a refund, you don't get to keep your email address forever. You've got to pay for a full year. So just $100, or $99, and it's yours forever. So that's how we're doing that.

**David: (00:22:33)** I think that's also, leads into a lot of people have been asking for a monthly subscription. And I totally get it. $100 for an email address is a lot and there are people where, they would want to do this if they could pay on a monthly basis, but it's actually quite complicated. We want to make this promise that what you buy when you buy Hey, it's not just a subscription. You're buying, essentially, a product. You're buying this email address. That one is yours now, whether you continue to subscribe or not. We can't really sell these email addresses for $8. Right? The business model's already difficult in the way we want to run it and the way we want to do support and all that stuff at $99. We can't make these promises that the email address is yours for life for $8.

**(00:23:16)** So that's why we've been sort of… we don't have a straight shot even though I like the idea that someone could essentially pay for this on a monthly basis because I totally sympathize with the idea that hey, I've got $8. I could pay you $8 a month, I can't pay you $100 up front. Maybe there's some way we can do it. I don't know. We've been trying to think about like, is there a legal way where you can sell someone something and then they pay it off over a year or something, but it's pretty complicated.

**(00:23:40)** So, we've got to start somewhere. What we've started with, there's one price. Which leads into this other thing that there are other areas of the world, like in South America or in India where we have a lot of interest from, go like, the exchange rate or whatever, it's difficult. $99 is a lot. Could you do international pricing? And what we've gone out and said is we want to look into that. Hey is one of those services where I could totally see us doing local versions.

**(00:24:07)** In fact, I'm Danish. I've been talking to some people in Danish about the fact that they're excited about Hey and I was just talking today and I need to get back to this person, about hej.dk. So hey, in Danish, is hej, H-E-J. And I was like, this would be a wonderful way, like if you could do the local version of Hey in that language, set up a thing and allow, you can do then localized pricing. Because the other thing is we charge in US dollars, right? So even if you're in Europe, there's an exchange rate there that fluctuates. This is sort of the same issue we've had with Basecamp over the years. If the dollar gets stronger then Hey becomes more expensive and maybe we can set it up in such a way that we can charge in local prices. That's a better way to do some of these things and perhaps offer different prices, like a lot of services do.

**(00:24:52)** If you get Netflix in India, it's a different price than if you get Netflix in the US so we want to look into a bunch of those things, but again, we're 50 people. We don't have international offices in all sorts of different ways of the world. There's so much work yet to do that, just to get the taxes right. We've been doing the tax work for Hey for Europe with collecting VAT, which itself was sort of new to us. We've been selling small business software to corporations and that's been exempt or is exempt for collection of VAT in Europe. Now we're selling something where individuals are buying it for themselves, you have to collect VAT in Europe. And we've had to deal with that, how we present that. We're used to just saying, hey, the service is $99. Then we started collecting taxes. Now you can't necessarily just say it's $99.

**(00:25:39)** I think someone from the UK wrote me and $118 showed up on my bill, I thought it was $99. And I was like. How is this possible, is this the exchange rate, and so I'm thinking oh shit, it's the VAT. So we have to do a bunch of work there to be able to roll this out. We've got to start somewhere for us the US is by far and away the largest market so of course that's where we start. This is where the company is founded and based but I want to explore all of it.

**Jason: (00:26:06)** I like this one. Now that you've launched, is there anything you wish you would have done differently, whether that's in approach or execution?

**(00:26:14)** So, in the product, no. Outside of the product, yes. Something we did not anticipate was the enthusiasm for it and the excitement for it and a lot of people have been asking, can I sign up to be notified if a specific email address becomes available because someone doesn't pay after their trial. Because again, we recycle the trial email addresses. So what I wish we would have done is set up, basically, a waiting list, a way to subscribe to an individual email address and say, if this becomes available, if this recycles, notify me at my other email address so I can come and snap it up and buy Hey. A lot of people have been asking about this and it's actually been pretty time consuming on the support side. We have to say, no, we don't have a waiting list right now. That would have been great to point someone to a list. And also it just would have been a great little fun thing to do. But we didn't do that. We didn't anticipate that. We didn't think this would be a thing, we thought it would take off a lot slower, perhaps.

**(00:27:12)** So I wish we would have thought that through. It would have helped everybody. It also would have been good for business, obviously, as well. So that's the one thing for me that I wish we would have done ahead of time.

**David: (00:27:19)** I wonder, because I've been trying to figure out how we could actually do this. And we're stuck between someone's really excited. They want john@hey.com and on the other side, we have to respect the privacy of everyone who signs up, prospective customers or paid customers, right? Email is a little weird because you know. So if you're like, I want john@hey.com. You could write John. Don't write John actually works at Basecamp and he's not going to give up John@hey.com. I'm just giving you an example, right? You could write, like there's nothing we could sort of do to stop that. But it's sort of been… yeah, it's been difficult.

**(00:27:59)** And just, I've seen some mad stuff. First, we saw that people were selling invitations. And I was like, what do you mean selling invitations. They were on eBay and people were bidding them up. I don't know if any of them sold, but this was sort of, people accused us, you're just doing this scarcity for marketing. No, we're trying to keep our head above water here.

**(00:28:17)** We let people in too fast, actually. For the good of our organization, we let in people too fast. A lot of people at Basecamp, they've not worked at a calm company for the past two weeks and this is something that is very near and dear to our heart that we run a calm company. It's not been a calm company for the past two weeks. And part of that was because we were trying to get this out. We were trying to deal with this Apple situation, and then deal with all the interest and we hadn't anticipated any of that on that level. So it's been quite difficult.

**(00:28:48)** If we had opened up everything on the first Monday we went up, we would just have melted down. It's just… you've got to flatten things here. You can't do it all in one day. So we had the invitation system, unfortunately that meant, well fortunately and unfortunately, a lot of people were excited about it, that's great. Then there was all this selling, that's not great. There were people doing cybersquatting as the technical law term is. I'm always like, when you stick cyber in front of something, you know it's a legal term here, right?

**(00:29:14)** There was cybersquatting going on where people were signing up for addresses they had no intention to buy or to keep or to use simply for the purposes of reselling. We've added a thing in our policies that we forbid that. If we get credible reports with evidence for that we will investigate and if we conclude that someone is cybersquatting, that is signing up for domains with the intention to sell, it's not about whether you want that name or not. Someone asked me, can I sign up for Sisko@hey.com, because that's what my friends call me. Totally, you could sign up for that. That's fine. What you can't do is sign up for John@hey.com and then go around to all the Johns on Twitter who said, oh, I'm excited about Hey and DM them and say, do you want to buy this, $5,000.

**(00:29:58)** If we get any reports, and we have gotten quite a few reports, we will cancel those things and the person who reports the credible evidence, if we conclude the investigation to be accurate, is going to have the opportunity to get it and they're not going to be paying $5,000. They're just going to sign up as anyone else would.

**(00:30:12)** It's kind of tricky, right. And I think that this is… I was actually surprised that people cared that much about getting it, which we really shouldn't have been because someone just tweeted me saying, Gmail has 1.5 billion users. So if you sign up for Gmail today, you're going to get, like, whatever, smartdude99642. That one is probably taken already. But whatever you want to come up with, it's got to be sort of a complicated handle, it often involves numbers because that's the only way to get through the names… I mean 1.5 billion. Most things are taken.

**(00:30:45)** Hey is quite different, especially because it's a paid service. We're not going to have a billion customers. If we have tens of thousands of customers after this is all said and done, that's probably it, right? Which means a bunch of the good names, meaning your first name or your first name plus your last name, or your favorite handle, they're going to be available. You can legitimately buy it. This is one of the things we offer, this is one of the things you get when you charge $99 for email.

**(00:31:13)** So I totally get it. We were taken aback about it. It was surprising, but we're doing the best we can to make it fair without violating anyone's privacy and hopefully it'll shake out over time. And we're in the sort of eye of the storm right now and things are going to sort of level out, so.

**(00:31:27)** Broken By Design by Clip Art plays.

**Shaun: (00:31:34)** REWORK is produced by Wailin Wong and me, Shaun Hildner. Music for the show is by Clip Art.

**Wailin: (00:31:40)** Next week, we're bringing you part two of Jason and David's Q&A. You can find show notes for this episode at rework.fm and we're on Twitter @reworkpodcast. The Twitter account for Hey is @heyhey.
