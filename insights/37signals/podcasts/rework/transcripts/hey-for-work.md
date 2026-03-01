---
title: "HEY for Work"
description: "Basecamp takes the wraps off HEY for Work."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/hey-for-work/
tags:
- podcast
---

# HEY for Work

**Shaun: (00:00:00)** Jason, did you get under a blanket?

**Jason Fried: (00:00:02)** No, I just ended up getting a couple carpets in my space. So it seems like it’s better.

**Wailin: (00:00:07)** You’re under a carpet? Oh, no, like you just have carpet, like on the floor like a normal person.

**Jason Fried: (00:00:11)** On the floor, yeah, yeah, yeah.

**Shaun: (00:00:13)** Yeah, he’s rolled up in a carpet like a murder victim.

**Jason Fried: (00:00:17)** I was thinking could you get one of those big egg crate foam things, cut a hole in the middle, put it around your head like a necklace? A collar?

**David: (00:00:27)** A podcasting cone? I’m gonna trademark that right now podcasting cone.

**(00:00:32)** Broken By Design by Clip Art plays.

**Wailin: (00:00:32)** Welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m Wailin Wong.

**Shaun: (00:00:39)** And I’m Shaun Hildner. So back in June, Basecamp released HEY, our new personal email service. And now we’re launching HEY for Work, which is an email service for companies. It has a bunch of different features and also requires a different approach when it comes to things like marketing, privacy, and onboarding.

**Wailin: (00:00:53)** We got on the phone with Basecamp co founders, Jason Fried and David Heinemeier Hansson to talk about the launch of HEY for Work. Here’s that conversation.

**Shaun: (00:01:09)** Welcome, everyone. We’re talking about HEY for Work today, right?

**Wailin: (00:01:11)** Yep, that’s right. HEY for Work. And I wanted to start things off by asking how HEY for You is going now that you’ve had some time to reflect on it. I think that’s where we’ll start the episode.

**Jason: (00:01:25)** I mean, so far HEY has been way beyond our expectations. We have over 30,000 paying customers in just a few months. That’s a huge number, for anything, in that short of time. But also, for a product where the primary alternative is free. And we’ve had roughly 30,000-plus people switch away from free email to pay for email with HEY.

**Wailin: (00:01:47)** What was the timeline for HEY for Work? Is this the original timeline you had envisioned or did this also get revised, just like the HEY, launch had to get reconfigured because of the pandemic and other things?

**Jason: (00:02:00)** Initially, HEY for Work was the product. As we started getting into it, we decided that we were going to ship the personal version first. But we had always kind of planned after we launched HEY for You to get the work version out by the end of 2020. And we essentially have, it’s not open for public signup yet. But we’re going to do that probably the first week of January in 2021.

**(00:02:20)** Right now, we’re just doing kind of a slow rollout for people who were on the HEY for Work list. Primarily focusing on small company invitations, first. Companies with fewer than 10 people. None of this was definitive, it was just let’s kind of see how it goes. Let’s feel it out. And let’s then make a decision to get both versions out this year.

**David: (00:02:40)** What’s kind of funny about the order of things is that the version of HEY that we were using during the majority of the developing process was the work version. The switch to go with HEY for You as the first thing to launch happened relatively late in a two year cycle. And even when that happened, the primary use of HEY for Jason I and for the rest of the company was the work version.

**(00:03:05)** So when we shipped HEY for You, we had all these work features in there. And we kind of had to hide them, essentially, and it was like, oh, yeah, we’re not ready to launch that yet. We should be looking more at the version of HEY that was shipping to public in the first place. So being able to share email threads and comment on them and so on were all features that did not make sense for the personal version. So we had to hide those.

**(00:03:33)** It was kind of like a reverse process of, oh, you have this broader product that does more, it has multiple users and has all these additional features. And now we’re not going to do any of that first. Now we’re pulling it back out, polishing it up and making that ready to go for everyone.

**Jason: (00:03:49)** Part of it, too, is that HEY for Work was essentially done for a while. But there’s a difference between done for you and done for others. And this is the same thing that was true for Basecamp when we first built Basecamp. We built a version for ourselves, initially. And then we eventually decided to turn it into a product. And then you have to polish a bunch of things. Things like sign up. We don’t have to sign up because we just sort of create our own account behind the scenes, essentially. But others have to sign up and they have to understand what signup means. They have to understand how to do a bunch of things that we did, manually, ourselves.

**(00:04:21)** So there’s a lot of finishing work. It’s like finished carpentry in a house. It’s like, the last few months, it seems like nothing really happens. But all the little details happen.

**(00:04:31)** This product, HEY for Work, has been working for months and months and months. We’ve been using it as David said, but it’s not ready for the public because there’s a bunch of little finishing things that we could put up with not having but the public wouldn’t be able to sign up or use it or understand some of the details without us finishing the stuff. So that’s where most of the work’s been in the last few months.

**Wailin: (00:04:50)** Yeah, it’s interesting, this framework we use for building something for ourselves and then making it ready for the public. Because I feel like at Basecamp we have a really interesting relationship with email where because we make this software that is meant to, if not outright replace email, it does replace a lot of functions of email, right? This collaborative software. So, I don’t think we use email that much internally. And you’re used to using email externally with vendors and lawyers and folks like that. Or PR people, media. But I feel like at a lot of other companies, email is just the way you do everything. You send one line emails back and forth to your boss or your reports, or whatever. And so how did you approach solving what you saw as the biggest problems in work emails, when we, ourselves, actually have already found a whole other way to work that’s not email? Does that make sense?

**Jason: (00:05:48)** Yeah, it does. Most of our communication is not email based. It’s all in Basecamp. Email is an external communication tool for us. Unlike, as you said, a lot of companies, email is the primary method of internal communication. Regardless of whether it’s internal or external, what’s really frustrating about email, specifically, multi user email, email with threads you need to share with someone else or show someone else or get someone else’s thoughts about something before you respond, is that traditionally, the only way to do that was to forward emails around. The problem of forwarding is that, we’ve all been through this, you receive a forwarded thread with a bunch of back and forths. Well, if you want to get up to speed on the thread, you have to read it backwards from the bottom right corner up to the left corner, through multiple layers of indenting and quoted text. It’s a horrible experience.

**(00:06:34)** So that’s not about internal, external, that’s just about sharing emails with coworkers and discussing emails behind the scenes. Oftentimes, what you would do is you’d maybe forward something, and you’d have a side thread about it. Or you paste an email into some other tool and discuss the stuff in some other place, and then go back to the email tool and respond. But now you’ve got these splintered conversations, can never really get back to the whole story.

**(00:06:59)** So HEY eliminates that by allowing you to actually literally share threads in a way where you can show someone something, keep everything on the same page, give someone access to a thread without making them a recipient, without having to forward, without having to have them try to decipher and decode this horribly indented email. And everyone can see the same emails in the same format and the same layout as you can. And it just makes the whole reading and sharing experience so much better.

**(00:07:25)** And then you can comment behind the scenes with your coworkers. So you can discuss how you might want to want to respond or you can pull somebody in to get some additional information that you might need to respond or something like that. Keep all those discussions also in the same place, on the same page. All of that stuff is really the core of some of the significant benefits of using HEY for Work. And again, that doesn’t have anything to do with internal or external. It’s just dealing with people and conversation.

**David: (00:07:54)** But I do think it’s fair to say that, HEY for Work was designed around how we use email at work. And email isn’t that great for a lot of internal communication. It’s not that great for the one liner back and forth. Email actually got a bad rep, I think in part because it was used for those things. And it didn’t do it that well. If you want to have a near real time conversation a chat tool, a messaging tool, is way better. Use email for communicating with people outside of your organization, because that’s the kind of protocol that everyone has access to. You’re not going to invite random people to your internal communication tool left and right. So you use email, and it’s great for that. And it’s also good for doing the long form writing that you want to send out. But it’s not great to be a chat tool. And I think we need to both give up some of the things that we’ve been using email for and embrace some of the other things that we weren’t using email for enough. And that’s where the value is. Say email is not great at these things. It doesn’t matter. We’re not trying to make it great.

**(00:09:01)** Part of the challenge, creating something like an email service is that a lot of people will bring their existing perception of what email is because they’ve been trained in a certain way of using email over the past many years, perhaps the entire time you’ve been working. That’s a lot of time to ingrain a certain set of habits and behaviors. And with HEY, we really wanted to question all of those. Email is really good at some things and that was actually the core insight, perhaps. We needed to unearth, we needed to unwrap it from all the other shit that people were using email for and let’s double down on the good things. Dump the rest, and here we go.

**Wailin: (00:09:44)** Yeah, I am having flashbacks to, and I don’t know if any of you have this experience because I don’t think you’ve worked in too many like traditional kind of corporate settings. But just trading these one line emails back and forth. Being like, you want to go to lunch? Okay. Where do you want to go? How about this place? No, we went there yesterday. How about this other place? Okay. What time? This time? No have to finish something. This time?

**David: (00:10:05)** Email sucks for that, right?

**Wailin: (00:10:06)** Yeah, it’s terrible.

**David: (00:10:07)** And that’s the problem when you just have email inside an organization, right? Like, if you run everything on email, well, you run everything on email. And then you end up not liking email. It’s okay to have two tools, right? Like, that’s essentially how we ended up with HEY, was to think, okay, Basecamp does almost everything in Basecamp, right? The only thing it doesn’t do in Basecamp, really, was email, and we weren’t gonna make Basecamp do email, even though the joke is that every piece of software eventually expands until it also does email. We weren’t going to do that. We weren’t going to make Basecamp into an email client, although, kind of, a little bit, we did, right? You can actually send emails into Basecamp. So we got halfway there. But thankfully, we didn’t go all the way.

**(00:10:50)** So the last step, in a way, where we would have full control in the sense that we had designed all the communication tools that we needed, was email.

**(00:10:59)** So we’ve always designed HEY to be a compliment to something like Basecamp. One, two. HEY, Basecamp. And hereby ends my sponsored pitch, for our own software products in our own podcast.

**Wailin: (00:11:13)** What do you think this episode is?

**David: (00:11:14)** Thank you for coming.

**Wailin: (00:11:17)** It’s interesting, what you said earlier about how we’ve developed a lot of norms and culture around email. And we have to kind of disabuse ourselves of a lot of those old ideas to embrace something like HEY. And it strikes me as a particular, marketing challenge and onboarding challenge for a work product. Because if you’re looking at business customers, not only do you have, I guess what I would say, are psychological switching costs, which I think get amplified in like a corporate setting when you’re trying to like move a lot of people over to a new product. But you also have just the actual switching costs, right? People pay a lot of money for their systems, and they get them in place. And it’s very difficult to switch something as big and fundamental as email. So how did you approach that piece of it?

**Jason: (00:12:06)** First of all, being honest about it, that, you’re right, it’s a steep curve. It’s a slog. In fact, the signup process for HEY was designed in a way where it could take multiple days to get through it, if that’s how much time you need. There’s many steps and many screens and a lot of heavy lifting. And then there’s the human side of it, like you said. Getting people to switch their email and when’s the right time to do that? And are we going to lose email? And there’s all these questions.

**(00:12:32)** This is, again, coming back to, we don’t need to have every customer. We don’t need to have millions and millions of companies using this to make it successful. If we can get 10s of thousands of customers who are really eager for this and are generally slightly smaller businesses or brand-new businesses that aren’t switching from something, then I think we’re going to be just fine.

**(00:12:51)** And also over time, we’ll add more stuff. For example, right now, we don’t technically have any calendar integration. And that’s a non-starter for a lot of companies. And we totally understand that and are totally aware of it. And down the road, would love to do something about that but we don’t have it now. So it might not be right for people right now.

**David: (00:13:06)** The other thing here is that this is why there hasn’t been a lot of competition in email for a very long time. There are a bunch of big company defaults, like Outlook, like Gmail. Any startup that needed to show tremendous traction in 18 months would look at that and go like, “Yeah, no.” That’s a real shame because email is such a fundamental part of communication in virtually all companies. And to simply say, “Eh, too hard.” Like, we can’t do it fast enough, therefore, we will not do it. Therefore, we will simply hand over email to a bunch of large companies. That seems like a declaration of failure. People should have a real choice. If you actually care about where you get your communication products from, you should be able to pick something like HEY, that goes like yep, I don’t want an email system from Microsoft. I don’t want an email system from Google. Where do I go to get it?

**(00:14:07)** A funny parallel to this was when we launched HEY, one of the features we promoted heavily was this idea that we would cut out the tracking—the spying pixels. We created a lot of awareness about the fact that these spying pixels are part of the email ecosystem today. And a lot of companies are using them by default, even if they didn’t necessarily want to. There are a bunch of people using newsletter software where the spy pixels just come with the package.

**(00:14:34)** After we raised awareness about this, I got a bunch of requests from people who were either running a newsletter or thinking about starting one, like, can you tell me about a newsletter service where I can buy something without the spy pixels? And you’re like, uh… no, I can’t. They don’t exist. That choice isn’t even there in the market, right? If you were to think, hey, I want my email hosted by someone else, and I don’t want to use big tech to do it. What were you options? They were not great. And that seems like a shitty place to be for something as important as email. People should have an awesome choice to go with if they choose to do so.

**(00:15:10)** And as Jason says, even if it takes a long time, eventually all of nature, in terms of capitalism, renews itself, right? Companies die, and they’re restarted, and thank heavens for that. So we just have to wait 50 years for the current crop of companies to cycle through and then we’ll ended up with most of them running on HEY. That’s okay. Got time.

**Jason: (00:15:34)** I’ll be 96, though, so let’s… in 50 years. Let’s hurry up.

**David: (00:15:39)** I just did a podcast talking about how old we’re gonna be. I committed like, we’re gonna go for 100. So I feel comfortable charting 50 years out. But I mean, it doesn’t even have to be 50 years because of course, these things churn so much faster than that. And if you look at the average survival rate of most companies, most of them are not around in three years, five years.

**(00:15:56)** Because that’s the other thing, too. If you are a new fly by night startup that just got your Series A funding, and you have to do something in 18 months, otherwise, you’re essentially kindly told to shut it down. What kind of company would want to move their email there, right? I think that’s also what we bring to the table. Not just a great piece of software, but also the kind of company that someone could think about buying an email service from.

**Shaun: (00:16:23)** I’d like a little bit on how we’ve trickled out invites to HEY for Work versus the flood, we got for HEY for You.

**Jason: (00:16:32)** With HEY for You, we had, at the end, close to 200,000 people on a waiting list. We had to get through that list before we opened it up to the public. That was the promise we made to everybody who signed up for the list. Problem was is that every time we sent out 10,000, 20,000 invites, we ended up getting, 400 or 500 customer service emails and questions. And it was like this really difficult, impossible task and our customer service team was pushed to the brink. We had to hire five people over the weekend, you know, the whole thing. We don’t want to go through that, again. We also knew we weren’t going to go through that again, in that HEY for You is a much simpler product to sign up for. It’s you, you don’t have to get any co workers on board, you don’t have to move your domain over, you just sign up in literally a few seconds and you’re off and running.

**(00:17:16)** We knew with Work, because we had a long, involved signup process that we weren’t going to see that kind of signup flow or volume. So what we decided to do was set up a list, of course, which we have over 10,000 companies on now, I think it might be close to 11,000. Now, we asked that list, a follow up survey about company size and whether or not you as the person who signed up has decision maker status in the company, where you could be the actual person to switch over the email and ask a series of questions. And from those questions, we got some information. And I’ve been basically sending out invites to different cohorts.

**(00:17:56)** So initially, we started out sending invites to companies that have between one and five employees. And the person I’m sending the invite to is the decision maker, or the owner of the company. Then we started doing it to slightly larger companies six to ten employees than we did 11 to 20. But the idea really for us is to get about 100 companies on board using HEY for Work by the end of 2020.

**(00:18:19)** So that might take 600 invitations or 1000 invitations, it all depends. And we think with that number, we’ll have enough companies who can give us enough feedback and test the system and make sure everything’s working. And then we can actually open it up to the public in early January. But before that, of course, we will send a note to the entire list with an invite code. So anyone who’s on the list for HEY for Work, will get invited prior to us opening up to the public. But the plan is probably early January, maybe first week of January, maybe second week of January or something like that, we’ll have it all open to the public because we are ready to go. We’re just making sure we didn’t miss anything at this point.

**Wailin: (00:18:56)** How did you approach the privacy questions and philosophy in HEY for Work? Because unlike an email product for personal use, like HEY for Work, I mean, it’s like email is owned by the company, right? And so the expectation of privacy, just from a legal perspective is really different when you’re in the workplace. So how did you think about it in a workplace environment?

**David: (00:19:16)** It was difficult. We’re kind of faced with these trade offs. On the one hand, I’m quite pro worker in the sense of privacy and make sure that you’re not being spied upon, and that you have sort of some psychological safety in just your surroundings. And there’s not a bunch of metrics constantly tracking you and reporting back to the boss. And then on the other hand, you just have some basic legal statutes that say if you’re using a corporate email system, and that company gets a subpoena, the email is being searched. That’s just it. That’s just happening. If you are using a corporate email system, those emails are the property of the company.

**(00:19:56)** So we kind of went almost the other direction where a lot of companies might be, “Eh, let’s just not talk about that.” And I thought the better alternative was simply just to be really upfront about do not use your corporate email system for your private emails. Damn it, that is a terrible idea and you should totally split it up. And we actually ended up with a really kind of interesting, and at some points cumbersome and annoying firewall between accounts in HEY. Something we’ve struggled with in other regards of how we wanted to design how things work, like how your contact book works. Normally, you just say, oh, I just have one contact book. And in HEY, there’s a data firewall between the stuff that happens on your work account and the stuff that happens on your home account.

**(00:20:41)** And we’ve made a few things hard for ourselves, because it was all born from a really fundamental commitment that this needed to be separate. That if you’re using HEY, as you soon will be able to, where you have both your work email and your personal email available in the same interface. Which is Ironically, the version of HEY that we’ve been running for months and months, we still have to finish up that work and make it available to everyone now that HEY for Work is slowly rolling out.

**(00:21:10)** But when you’re doing that, it’s really easy to kind of get it wrong. I heard this when we started working on HEY, when we, what is that two plus years ago started doing the development. I had actually that entanglement. I’m trying to remember, I think it was forwarding all my personal email into my work address or, the other way around. And I was just like, it’s easier. I just want one inbox. I don’t really care. I’m kind of like, part owner of the company anyway, who’s going to spy on me? Do you know what, it doesn’t matter. If Basecamp was ever to get a subpoena, all my emails, personal emails, would be searchable and would be subject to be turned over. And in other ways, there’s just… No, that was not a good way to go.

**(00:21:50)** The other reminder of this I got was, with the whole privacy aspect, was when I was trying to convince my wife to use HEY. We were like, oh, I’m so excited. We have this email system. You should use it. And her first question was, well, can your employees read my email? And I was like, well, reasons, technical, blah, blah, blah, right? We needed a much stronger answer. And with all of these things, you need a really strong answer. And when the answer is yes, the company can read your company email, just commit to it.

**(00:22:19)** When you are invited to HEY for Work, there’s a little thing that says hey. This email is owned by the company. And in fact, I think we need to do even more to raise awareness that separating your home life and your work life is just good digital hygiene. But at the end of the day, the email in a HEY for Work account is owned by the organization. So don’t go around organizing mutiny on your HEY for Work account, don’t go around committing to other sorts of things that if your boss found out it would be catastrophic. Just do shit on your own account. You’re going to be better off in all cases anyway, whether you use HEY or you don’t use HEY, thinking about where data lives, who has access to it, and what’s the worst thing that can happen, will save you a lot of grief.

**Shaun: (00:23:10)** Have you received any feedback that you were maybe surprised about from the initial trickle of companies signing up?

**Jason: (00:23:17)** We have received feedback, yeah. I wouldn’t say surprised. I’d say like, oh, yeah, we knew about that. Like, where’s the calendar integration? Yeah, we knew that was going to be an issue. Or, for example, we have this feature in HEY, called extensions, which lets you set up company email addresses, like press@basecamp.com, or info@basecamp.com. But the replies come from the people who reply. So if someone sends an email into info@basecamp.com, that ends up in my inbox, and I respond, that response is not coming from info at Basecamp. It’s coming from Jason at Basecamp. And a number of people have said, like, I wish we could respond from the extension address. And then we go, yep.

**(00:23:55)** All these things are things we knew about. Some things are like, oh, I didn’t think that would be as common a request, but we knew it would be a request. There’s been a number of requests, though, around journaling, or being able to automatically forward every single email that comes into an account to an external service that exists to record every email that’s ever sent in for legal purposes. We don’t have that feature, yet. The other one that’s come up is setting up a catch all addresses. This is actually something we did not discuss. So maybe this is maybe a little bit of a surprise. So you can set up extensions, you know, info@ or press@ or marketing@ or partnerships@ or whatever. But we don’t have a catch all so if someone sends an email to Iloveyou@basecamp.com, that’s gonna bounce. So catch all has been something that’s come up a few times, which we don’t have and hadn’t really talked about.

**(00:24:44)** But so far, the feedback’s been really useful. We’ve had a few cancellations as you’d expect. Things don’t work as people expect or certain things are what they wanted. Totally understandable. We’ve learned a little bit from them as well. But so far, given the, again, this the steep climb that is switching a corporate email system over to a new system. Especially one that by the way, does not allow importing. So we don’t allow you to import all of your old, 10 years of company history email into this. So there’s this a steep climb here. But given all that, I’ve been very pleased by the response so far.

**Wailin: (00:25:20)** Do you feel like the calendar is like your white whale? I feel like this is something that, you know, you’ve been working on for so long, like at Basecamp. It’s always like, oh, how can we make the calendar better? And it’s so hard to do. And now we’re doing this email thing. And people want their calendar connected to their email. Do you feel like we’re just like inexorably headed towards reinvention of the calendar?

**Jason: (00:25:44)** Well, a couple things. First of all, the reason HEY doesn’t really have calendar integration is because we are a bizarre company that doesn’t really use a calendar internally.

**Wailin: (00:25:55)** That’s true.

**Jason: (00:25:55)** We use Basecamp’s, scheduling system, wherever. But we’re not a meeting driven company. And the primary reason for calendars at companies is for booking meetings with one another, which we don’t really have very often. And this is one of those examples where, when we build something in the model of us, the model of us does not really compute with most companies in this case, right?

**(00:26:15)** So we know that there’s a deficiency here. And I will say that we’re not committing to building a calendar, because that’s a quite a big project. But I will say I’m extremely excited about bringing the same kind of thinking that we brought to email to the calendar, because the calendar has been neglected for many, many years, just like email had been neglected for many, many years. Maybe it was like 10 years ago, I don’t know, there was like this moment where everyone was making new calendars, just like everyone’s making new to do apps all the time. But that kind of faded, because basically, Google and Outlook dominated the calendar market. Okay, just like they dominate the email market. It’s time for someone else to come back in, bring some brand new thinking, we have some brand new thinking around calendars. And I’m really excited to dig into that.

**(00:26:59)** Whether or not that’s actually part of HEY, or it’s a standalone product that anyone can use with or without HEY, is yet to be determined. We have not even discussed that at all. But I think it’s something we should think about.

**Wailin: (00:27:12)** All right, I don’t commit to anything,

**Jason: (00:27:14)** No commitments.

**Wailin: (00:27:14)** Don’t promise anything.

**Jason: (00:27:15)** We regret every commitment we’ve ever made to be honest.

**Shaun: (00:27:20)** I’d just love to hear your feelings when you think about 2020 with the launch of HEY and HEY for Work, what is your overarching feeling?

**Jason: (00:27:29)** You know, it’s been interesting because we launched HEY for You. And then there’s been a little bit of a lull from us. If I’m thinking about what it looks like from the outside, there’s been a bit of a lull. Like what have you guys been up to? That’s because we’ve been, we switched our attention over to HEY for Work.

**(00:27:44)** But in 2021, we’re going to get back to to HEY for You and HEY for Work, of course, and bring some of that original novel thinking and expand that feature set again and take HEY in different directions that people are not going to be expecting from an email app.

**(00:28:01)** That, to me is the most exciting type of work. Just backfilling the product to make it do what every other email app does is not interesting or exciting. We want to show people that email is actually broader than a lot of people are thinking about.

**(00:28:16)** Given everything that happened this year, the pandemic and political strife in the US primarily, and all sorts of other issues around the world, and childcare, and no school, and all this stuff. Like the fact that we were able to launch essentially two new products this year, HEY for You, and HEY for Work, and for the most part, maintain a sense of calm. We’re not as calm this year, as we normally are. We had some really rough spots, and we’re still coming down from some of those rough spots. So we’re not back to normal, nor will we be until this whole pandemic is over. But I still think we managed to do something pretty amazing this year with still a relatively small team, given the circumstances. And we brought something new into the world that I think people were genuinely excited about which is a nice thing to do in a year like this, which people are not very excited this year.

**David: (00:29:09)** Yeah, I think what I enjoyed the most was just the validation of these kind of crazy ideas we had for email. This whole concept of the screener that even internally at Basecamp people were like, “Eh, I don’t know, man.” And then just our own lowered expectations, right? Like we went into this eyes wide open thinking, we just spent two years building HEY, this might very well just go phfff when it launches. We were preparing ourselves psychologically and business wise for that to happen and feeling okay, and, at least we learned a lot and we’re going to roll in some of the ideas we had into Basecamp. We’re gonna make things better and so on. And then the opposite happened. But then on the other hand, I’m also just ready to get on with it. Like 2020, even with all that, I could hit fast forward, and then it’s summer 2021 and we’re all vaccinated, and it’s all good, and then we can be really excited about what we have.

**Jason: (00:30:05)** The other thing I would say is, and this is a little bit of a selfish thing, but it felt good to feel like we still got it. Basecamp is something we launched back in 2004. We’ve done three really wonderful versions of it. We’re about to start on Basecamp 4 next year. But it’s kind of like our first album. And then a couple follow ups along the way, didn’t quite do as well as the first album. We had Backpack and Campfire and Highrise. And these were, I mean, Highrise especially was a very successful thing, and still actually is even though it’s, of course, we don’t sell it anymore. But a lot of people still use it.

**(00:30:40)** But it’s nice, 20 years in to come up with another album that people like and want to hear. And it’s satisfying. It’s just frankly, satisfying on a personal level to go, we still have ideas that people are intrigued by. We can still do original things. We can still build stuff people haven’t seen before. And we haven’t lost that edge. David and I have sort of reminisced a bit. We launched Basecamp, Backpack, Highrise, and Campfire. I think at that point, we had like, what, 10 people, 12 people in the company, we launched four products. And as you get bigger and you get slower, you turn into a company that has more to lose than to gain by shaking things up.

**(00:31:21)** It’s nice to know that we can still do this, and that we should still do this. And that fun should be a primary driver for whatever we do. And building HEY was fun. It sort of reinvigorated us, I think, to take some chances. I think that’s really good organizationally and I’m really proud of everybody for getting behind it and making it happen.

**(00:31:45)** Broken By Design by Clip Art plays.

**Shaun: (00:31:50)** REWORK is produced by Wailin Wong and me, Shaun Hildner. Music for the show is by Clip Art. You can learn more about HEY for Work by going to HEY.com/Work. Show Notes and transcripts for our episodes are at rework.fm and you can follow us on Twitter at @reworkpodcast.

**Wailin: (00:32:18)** And now for another installment of our podcast within a podcast, Shaun Wick or Shaun reviews candles and we talk about cozy things. Today we have a special guest all the way from Copenhagen, Denmark. David Heinemeier Hansson. He’s going to talk about cultivating a cozy persona on Twitter. Just kidding. I can’t say that with a straight—I couldn’t get there with a straight face.

**Shaun: (00:32:41)** I’m not even going to review a candle on this one. I think we just need to turn this over to David.

**Wailin: (00:32:46)** I think we just needed David to teach us how to pronounce hygge correctly.

**David: (00:32:50)** What are you trying to say? I don’t even…

**Wailin: (00:32:52)** Oh, my gosh. How dare you.

**Shaun: (00:32:53)** That’s not a great… uh, H-Y-G-G-E.

**David: (00:32:56)** Oh, hygge. It’s funny. Since I am back in Copenhagen, now. Hygge really is just a euphemism for like poor lighting and the sun goes down at four. Right? So hygge is not it’s not nearly as romantic. Hygge is looking at your shitty living conditions and going, actually it’s not that bad. Really. Let’s just brand it. And it’ll be a national thing and we’ll all feel good about the fact that it’s fucking depressing when the sun doesn’t come out every day. It’s a classic sort of let’s just look at a shitty situation with a different set of eyes and all of a sudden it’s great.

**Shaun: (00:33:30)** I love that, though.

**David: (00:33:32)** Mind Jedi tricks.

**Shaun: (00:33:34)** I love it.

This is an episode title
