---
title: "Two weeks"
description: "Basecamp released its new email service, HEY, on June 15."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/two-weeks/
tags:
- podcast
---

# Two weeks

**Andrea: (00:00:00)** The vibe in general during HEY launch has been different than anything that I’ve experienced before at Basecamp. I mean, I’ve worked there for almost 10 years.

**Kristin: (00:00:09)** Already, day two, nothing was going as planned.

**Jonas: (00:00:13)** I was thinking about that, it was like. Wow the previous few years have been very chill by comparison. I don’t know if we appreciated how chill they were.

**(00:00:19)** Broken By Design by Clip Art plays.

**Shaun: (00:00:20)** Hello and welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m Shaun Hildner.

**Wailin: (00:00:26)** And I’m Wailin Wong. On June 15th, Basecamp launched HEY, a new email service built from scratch over the course of two years. It was the most ambitious product launch the company had undertaken in almost a decade and it planted a flag in a new area for Basecamp: email.

**Shaun: (00:00:42)** In a note to all employees on June 20th, just five days into the launch of HEY, co-founder and Chief Technology Officer, David Heinemeier Hansson wrote, “This may well be the most important two weeks in the history of this company since we launched Basecamp on February 4th, 2004.”

**Wailin: (00:00:59)** This is the story of those two weeks. It’s the story of a product launch that took Basecamp by surprise. Interest in HEY wildly surpassed expectations. Basecamp got into a public fight with one of the biggest corporations on the planet. And all of this happened during a global pandemic and civil rights movement. This is a story of the HEY launch in three acts.

**(00:01:21)** Basecamp co-founders Jason Fried and David Heinemeier Hansson will kick us off.

**(00:01:26)** Broken By Design by Clip Art plays.

**Jason: (00:01:32)** April 20th, I believe, was the original scheduled date. We were just kind of like, you know what? This doesn’t feel like the right time to launch something.

**David: (00:01:40)** We felt great about the product but horrible about what was going on in the rest of the world. And we were thinking, well, what do we do here? This pandemic is not going to let go, and clearly it hasn’t. In fact, it’s come roaring back in the US. And then we have this civil rights issue on everyone’s mind. This is a terrible time to launch a product in many ways. We were left with, well, what do we do about that? We’ve spent two years making this. If we postpone it, what, another year? Until a vaccine is out? Until all these issues have been solved? Then we might sit on this for a very long time.

**Shaun: (00:02:20)** So, after much deliberation, Jason and David decided to postpone the launch of HEY by two months.

**Jason: (00:02:26)** We felt like June 15th, it was good enough of a time to do this. It’s not the perfect time. It probably wasn’t the perfect time. But there was no guarantee that another week or two or three was going to be perfect either. We said, we’re okay with June 15th, let’s do this.

**(00:02:43)** And we also said that we were going to launch in control. We’re not launching to the public at large. We’re launching to a list which we’ve created over the past number of months. And so on the first day, we released just a few hundred invites, just to kind of feel out our systems, to make sure our systems were working properly. To see how it was received, to see how people felt about the launch, that whole thing. It felt pretty good at that point, and that’s where we gained some confidence that we were doing it at the right, worst time. It was not the best time, but it was the right time.

**Kristin: (00:03:14)** This is supposed to be the most controlled launch that we’ve ever had as a company.

**Shaun: (00:03:22)** Kristin leads the customer support team at Basecamp.

**Kristin: (00:03:24)** The plan was to only release [laughing]. I’m sorry. The plan was to only release 100 invitations per day for the first week. And so, on Monday, June 15th, we released 100 invitations.

**Shaun: (00:03:44)** But you know what they say about the best-laid plans.

**Javan: (00:03:46)** I don’t think we’ve ever had a product launch where people were so excited.

**Shaun: (00:03:52)** This is Javan, a programmer at Basecamp.

**Javan: (00:03:57)** You know, Basecamp is project management software. It’s not flashy in any way and we typically, kind of quietly introduce a new version of Basecamp and some people from the previous version move over. This is the first thing I can remember in a while that was just a new thing that we put out on the internet and it kind of went viral, I guess? People wanted it.

**Jason: (00:04:19)** People really excited. I put out this demo video, which I’d done the day before sort of on a whim, and that thing kind of blew up. People wanted this product.

**Shaun: (00:04:28)** This unexpected wave of interest in HEY prompted Basecamp to start sending out many more invite codes than originally planned. And there was a huge problem on the horizon.

**Kristin: (00:04:37)** The Apple fiasco started. And we were getting a ton of attention. There was a media frenzy and people were tweeting at us. There was like this war. People were talking shit. People were supporting us. There was just all this attention on HEY and people wanted to know what the fuck is going on? What is the big deal of this product? I want in. I want in, let me in now!

**(00:04:59)** Broken By Design by Clip Art plays.

**Shaun: (00:04:59)** That brings us to Act 1: Burn the House Down.

**Wailin: (00:05:10)** The plan was to launch HEY on June 15th with not just a web app, but mobile apps for iOS and Android and desktop apps for Windows, Linux and Mac. The first sign of trouble landed on Javan’s lap the Friday before launch. His team is in charge of the desktop apps, including the one for Mac.

**Javan: (00:05:28)** We had submitted our desktop Mac app to the Mac App Store and they rejected us outright.

**Wailin: (00:05:36)** The reason for this rejection was because HEY doesn’t offer a way to pay for the service inside the app. For that, you have to go to the web. Apple has rules for developers around in-app purchases, or IAP for short. You’ll be hearing that term a lot in this episode. Basically, if you’re selling something, you have to go through an Apple system for collecting payment and give Apple a cut.

**Javan: (00:05:58)** We just forgot that that was an issue. Historically our company has really only dealt with iOS apps. We’ve never used the Mac App Store before. So, fortunately, you can install Mac Apps without that Mac App Store, just by hosting the files ourselves.

**(00:06:15)** Nabeelah, who’s new at the company and is new on our team, we threw her a curveball and said, here’s the new plan, and she pulled off moving the enter Mac App to our own infrastructure in a day.

**Wailin: (00:06:27)** Okay, so that was a pretty straight-forward work around, but this hiccup with the desktop app was just the beginning. Unlike macOS, there’s no way to directly distribute mobile apps for the iPhone and iPad. For that, you have to go through the App Store and follow Apple’s rules. That includes using their payment system if you want to charge customers for your app, and giving Apple 30% of what you make.

**(00:06:51)** There are, however, many examples of companies that have successfully skirted this.

**Dylan: (00:06:56)** The de-facto rules everyone operates under, which is a combination of written and unwritten is that if you have another way of doing payment, then you cannot advertise it or link to it within the app.

**Wailin: (00:07:09)** Dylan is a programmer on the iOS team.

**Dylan: (00:07:13)** So you can offer a service that has a login, like Netflix, for example, and you can have people create accounts and set up payment elsewhere, but you cannot, in the app, link to that or give people any information about that.

**Wailin: (00:07:26)** This Netflix-style setup is what the team landed on. If customers wanted a HEY email address, they’d sign up on the web at HEY.com, avoiding Apple’s IAP. And the HEY iOS app would be careful not to advertise that sign up method. So, with that decided, the iOS team got ready for launch day.

**Dylan: (00:07:44)** HEY was planned to be launched on June 15th and we knew that getting it on the App Store, particularly on a new product where they review it with more scrutiny is scary. So a week ahead of time, we submitted the app, and that was one week before the product’s launch and then it was approved. And were like, great. We have an app to go, ready for June 15th, day of launch.

**(00:08:11)** Then we built more features, and we fixed a lot of bugs and we submitted our bug update. This was on Sunday night. And our hope was that our bug fix update would get approved pretty quickly and most people would only ever see the good version later in the day on Monday.

**Zach: (00:08:27)** Monday morning we were rejected. I didn’t think it was kind of a crisis situation yet. Like every iOS developer, we’ve had various rejections.

**Wailin: (00:08:37)** Zach is a programmer and the lead for the iOS team.

**Zach: (00:08:40)** We though, oh, well, we’ll explain and then they’ll say okay, that’s fine. You know, we got confused, we made a mistake.

**Dylan: (00:08:48)** Zach and I, we both woke up, we were probably both sitting in bed, and… I know I was. And we were messaging back and forth, okay, what do we do? What do we do? And so we prepared a response for Apple explaining that HEY is a web service and the iOS app is a complement to that web service. All account management, all payment is done through the web service, and that’s what we explained.

**Wailin: (00:09:09)** The team wasn’t too worried at this point. But mid-morning on Monday, Apple rejected the app again. Here’s Basecamp’s CEO, Jason Fried.

**Jason: (00:09:19)** We didn’t know the depth of nervousness and anxiety that we were about to enter. The pit. It’s funny, because we were tempered because the excitement for the product was off the charts so we were excited but also kind of terrified because we couldn’t deliver what we wanted to deliver, which was a great app on every platform. 1.0 was great, but if that was the last version we could ever do, that wouldn’t be great enough. We have other things we want to do and other improvements we want to make and if we were gated there, we’d be in real trouble. So that was the start of it.

**Dylan: (00:09:47)** So we said, you know what? We’re just going to resubmit. There are so many stories on the internet and personal experience that on one day we got a reviewer that accepted it, the next day we got a reviewer that didn’t. So we thought we’d spin the roulette wheel and maybe we’ll get the reviewer this time that’s okay with it.

**Zach: (00:10:03)** So later on Monday, we submitted a new binary, changed the screenshot. The app very quickly went into review, which is unusual and then sat in review for a day, which is also very unusual. And usually it doesn’t take that long when it’s in review. Especially if it’s already been approved, this shouldn’t be like they have to learn it from scratch. They should be doing their sanity checks on it. So once it starts to be in review for a while, you’re kind of, like, alarm bells go off. Like, uh-oh, there might be a problem here.

**Wailin: (00:10:33)** This newer version that was stuck in Apple’s review process was 1.0.2, and then on Tuesday, Zach’s phone rang.

**Zach: (00:10:40)** You know, I get very little phone calls and 99% of them are spam. They’re all from my local area code and they all want to tell me about my car warranty or credit card bill or something. So this one said San Jose. I don’t know anyone there, so I kind of thought, oh this is Apple. And I’ve been doing iOS development since 2008 when they released the first SDKs and I’ve never talked to Apple before. He says, hi, I’m calling from Apple, we’re talking about your review, blah blah blah. And then he kind of tells me that this is not a mistake. They’ve escalated it internally and they are rejecting. They’re not changing their minds, they’re basically like, this is how it is, is right. It wasn’t a discussion.

**(00:11:25)** I jumped right into Basecamp and I mentioned everyone, Conor and Dylan, everyone on the iOS team, and Jason and David and said, well, I just got off the phone with Apple and this is not good.

**Wailin: (00:11:34)** So version 1.0.2 had been rejected for not offering in-app purchase. Version 1.0 was still on the app store and people could download it, and if they were in the first batch of customers who received HEY invite codes, they could create accounts and start using the app. But now the team was worried Apple would yank version 1.0 from the App Store. So Basecamp co-founder and CTO David Heinemeier Hansson did what he does best, and took the fight to Twitter.

**Shaun: (00:12:01)** On Tuesday afternoon, @DHH tweeted: “There is no chance in bloody hell that we’re going to pay Apple’s ransom. I will burn this house down myself before I let gangsters like that spin it for spoils. This is profoundly, perversely abusive and unfair.”

**David: (00:12:18)** The house is the company. We were looking at an existential threat from our perspective in the sense that we’d already made the ethical choice that we were not going to give Apple 30%. You can’t launch a major, mainstream email service if you’re not on the iPhone. So if Apple was going to kick us out of the App Store because of that, we would already have burned half the house down. And then, to finish the job, we would have sought every recourse in the book. And we talked to lawyers about it, hey, what does it look like to sue Apple for this kind of stuff? And they went, um, let me tell you. You have a good case… against a $1.5 trillion company who’s going to hire three of the highest paid law firms in the US to absolutely bury you with subpoenas and depositions, and hey, here’s your life for the next ten years.

**Shaun: (00:13:13)** By Wednesday, the third day of launch, David’s tweets were blowing up. The dispute with Apple over their rejection of the HEY app was getting covered by CNBC, Bloomberg, Wired, The Verge, and many other tech outlets. The publicity was creating a huge surge of interest in HEY. So while David worked the press and social media angles, Jason filed an official appeal with Apple.

**Zach: (00:13:34)** Jason’s a very good writer, and I think he made compelling points. David has been out there on Twitter, is getting some noise and a lot of times this thing happens where something happens with app review and then it makes some noise and then they reverse it. So I had very hope at that point that it would be, it would be reversed, and they would say, okay, yeah, this is fine. This is like your other app, these other apps. It’s a gray area or whatever, but it’s fine.

**Dylan: (00:13:59)** We were hopeful. At this point, it had gotten a whole lot of media attention, the overwhelming sentiment was not favorable towards Apple. We thought that Apple kind of was going to want an out at this point. So we were pretty surprised, actually, when they talked to the press before they even told us about the final rejection.

**Zach: (00:14:17)** It goes on Twitter and then I saw posts go up from TechCrunch and Protocol and The Verge. Like, simultaneously, like this was planned.

**Shaun: (00:14:25)** Apple had sent their response to Basecamp and a select group of media outlets at the exact same time. And their rejection came back to this fundamental disagreement over whether HEY needed to offer in-app purchase. But the part that really stung was something they said about Basecamp’s history with Apple. One line read that Basecamp apps, “Do not offer in-app purchase and consequently have not contributed any revenue to the App Store over the last eight years.”

**Dylan: (00:14:52)** They said, well, you’ve been in the App Store for eight years and you haven’t contributed anything. That is like, wow, this is a couple days before they’re about to have their really feel-good WWDC where they tell all the developers how much we appreciate you. No, we have not contributed to App Store revenue. However, Apple sells $1000 phones. And these $1000 phones they can only sell because of this entire ecosystem so to say that we’ve added no value to their system, that’s offensive. It was a situation where both of us benefitted. Apple provided a marketplace and Apple provided an easy way for customers to get to the software and we contribute to the iPhone and macOS being valuable products that people want.

**Shaun: (00:15:40)** The real heartbreak here is that Basecamp, the company, is full of Apple fans. Employees use Apple products at work and in their homes, Apple’s design has inspired Basecamp’s products. The introduction of the iPhone and iOS changed the course of Zach and Dylan’s entire careers, and Apple is a crucial part of Jason Fried’s origin story.

**Jason: (00:16:00)** 1987, I remember going over to my friend Adam’s house right next door. He’s like, Jason, you’ve got to check this thing out. I’m like, what is it? He’s like, just come over. So I’m like, all right. So I run downstairs in my house, I run across the lawn. His front door’s always open. I wave hi to his mom, Silvia, and I go up the stairs, and I go into Adam’s bedroom. And there it was. There was a Mac SE running Microsoft Flight Simulator and it blew my mind. And that’s like, I got into software, I got into design, I got into running a business all because of Apple. And that moment of seeing that thing, that Mac SE for the first time, is always how I’ve wanted people to see our products. When people see HEY for the first time, I want them to go, ooh. This is totally different.

**Dylan: (00:16:40)** Part of it was that Apple was one of the good guys. They’re a big company in late-stage capitalism, I know that. But also I thought that directionally, Apple was aligned with my own values and that I was developing for a platform and contributing to the wellbeing of a company because I do believe that what I do contributes to Apple’s well-being and they contribute to mine and I thought that we were aligned.

**Jason: (00:17:05)** There were moments over those two weeks where I thought to myself, like, if Apple just didn’t let us put an app in the App Store, I was actually contemplating retirement. Like, literally. I was thinking, like, I don’t want to be in this industry if I can’t run my own business my own way. And we’ve gone through all these steps not to become someone else’s company, but to stay independent. And now there’s a company out there saying, well, you can be independent as long as you give me 30% of our revenues. That’s worse than a VC deal. Why does it have to be this way? That’s really, I think, what ultimately got me riled up. And I lost a lot of sleep over it and I feel like I was physically ill because of this stress and the anxiety, and I know a lot of other people felt similar, if not more stress and anxiety, for maybe different reasons.

**Zach: (00:17:54)** You know, and all this time, we had huge amounts of positive feedback on all levels, all platforms, so it was supposed to be a very exciting time and now we’re just trying to fight to even have our app out there for customers.

**(00:18:06)** I’m like, I just want to build apps. I don’t want to go in front of Congress. Yeah, we could sue Apple, but they have, I guess $200 billion in cash. They could just draw it out until we’re all dead. So it’s not even a fight that could be fought.

**Conor: (00:18:21)** Oh, yeah, that’s Zach, he’s 100%, like let’s not do a confrontation, let’s just…

**Shaun: (00:18:25)** And that’s Conor, Basecamp’s iOS designer.

Conor: David’s like, I’m going to burn this place down, and then the side conversations were kind of like, no need to pick a fight, no need to poke the bear.

Zach: Since we had 1.0 in the app store, we had customers using it, they’re reporting bugs, so we’re still trying to focus and go through our bug list and our feature list and try to figure out what’s next, but it’s just really distracting and really hard to make any forward progress when it was so uncertain whether it’s like, going to even be an app at all anymore.

**Conor: (00:18:58)** Jason and David were handling the overarching strategy and we were told, don’t work on in-app purchase or any sort of work-around. Our team was kind of put on pause in many respects. There wasn’t really any room, or like any need for us to be doing anything until they had decided what they wanted to do.

**Wailin: (00:19:15)** Apple denied Jason’s appeal on Thursday, day four of launch. This was hugely demoralizing to Basecamp and the iOS team in particular. And the level of publicity was still at a fever pitch. But there were so many other things going on in the world, like protests following the killing of George Floyd. Some people at Basecamp struggled with managing their emotional energy during this time.

**(00:19:37)** Here’s Jane, Basecamp’s data analyst. She’d been pulling all kinds of numbers during launch week, including figures on Apple’s clout in the mobile industry.

**Jane: (00:19:44)** Given the context in that week, in that moment, of what was going on, the level of outrage, for instance, that I might have felt looking at those numbers at another point in time was much more muted. The fight to improve the rules and to decrease the slice of the pie that Apple gets. It’s an issue worth fighting for and it’s an issue worth fighting because not just Basecamp faces it, and a lot of companies that don’t have the privilege and the platform and the independence to be able to make these statements. You know, it’s just… there’s a lot of fear.

**(00:20:23)** Also, people are fighting for the right to be able to just exist without being killed by the police at the same time. The days in which I was pulling these numbers were also the days in which some of public outcries were the loudest, and the pull to really be doing more felt the strongest.

**Lexi: (00:20:45)** That was one of the things that I was having a hard time with, balancing everything that was going on in the world and then being super focused on the launch of HEY.

**Wailin: (00:20:54)** This is Lexi, a customer support representative at Basecamp who’s based in New York. By the Friday of launch week, the 17 person team was fielding thousands of HEY emails a day. Friday was also Juneteenth which commemorates the day in 1865 when federal orders ending slavery were read in Texas, two years after the Emancipation Proclamation. This year, Juneteenth was marked by celebrations and protests across the US.

**Lexi: (00:21:19)** This is a revolution and the civil rights movement happening in our era right now and I just could not bear to be looking at a computer screen for another day. I had to do something. I had to go be on the street, I had to be connecting with people.

**(00:21:34)** [protest noises] SHUT IT DOWN!

**Lexi: (00:21:39)** I also am a white woman and I know that me observing Juneteenth is very loaded, and I’m open to learning about that and trying to continue learning. But it felt like the right thing to do to go march and use my white body in between Black bodies and police officers that day.

**(00:22:00)** [protest noises and drums] Hey hey, ho ho, these racist cops have got to go. Hey hey, ho ho…

**Wailin: (00:22:03)** Back at Basecamp, there was still a lot of activity. Jason wrote an open letter to Apple explaining that his opposition to IAP wasn’t just about the 30% cut, although he did find that to be extremely high versus the single digit percentages that credit card processors charge. For Jason, the bigger issue is that using Apple’s IAP system would force customers to go through Apple instead of Basecamp if they needed help.

**Jason: (00:22:29)** We have a platform, we have a lot of people who pay attention to what we’re doing. And I felt like I had some points that I wanted to make. Specifically the first one around the 30% thing not being the biggest issue here. Whose right is it to tell me, tell us, and to tell our customers, how we can interact with them? We’ve spent a lot of time, a lot of effort, and have hired a lot of people to do things our way and we do things really, really well. We’re extremely proud of our customer service, our response times, our responsiveness. You can’t really service your customers in a way that you want to, if you care about customer service, if you push people through the App Store. You can’t handle refunds, you can’t handle partial payments, you can’t handle hardship exemptions, you can’t get people half off. If someone has a billing issue, you can’t help them. You have to say, go ask Apple. And when you ask Apple, sometimes it can take three to five days to get a response. We’re known to get back to people within an hour.

**Wailin: (00:23:19)** Jason’s letter went up on Friday and the workday ended without any response from Apple. However, a day earlier, on Thursday, Phil Schiller, Apple’s Senior Vice President of Worldwide Marketing, had given an interview to TechCrunch where he’d suggested a few ways HEY could comply with Apple’s rules. So when David took to Twitter on Friday, he had changed his tone slightly.

**David: (00:23:42)** We drew the line in the sand, we’re not going to pay you 30%. You can’t just show up and shake us down on the day of our launch, after you’ve approved our app, and then ask us for 30% of revenues. Not going to fucking happen.

**Wailin: (00:23:55)** I said he’d changed his tone slightly, okay. I didn’t say he got a full personality transplant.

**David: (00:23:58)** But. There are other things that could happen. Phil Schiller, you’ve gone out in the press and asked for other things and that you would love to see us in the App Store. I don’t know what’s in Phil Schiller’s heart of hearts? Maybe he really does love to have HEY in the App Store. I like that romantic notion. Let’s just take that at face value and say, like, this is what he wants. And we’ve somehow just misunderstood these incredibly vague App Store rules? And Phil Schiller is now telling us what we’re supposed to do. So that’s the olive branch I extended after saying we’re going to burn the house down.

**Shaun: (00:24:37)** In his TechCrunch interview, Phil Schiller had suggested a number of things HEY could do. Things like, charging different prices for the app on the phone and the app on the web. Or offering a free version with other features. Here’s one of David’s responses on Twitter.

**(00:24:51)** “For all the snark and exasperation, we’re going to take @PSchiller up on his offer.”

**(00:24:57)** Quoting Phil Schiller now: “There are many things that they could do to make the app work with the rules that we have. We would love for them to do that.”

**(00:25:05)** Now quoting David again, “We won’t ever do the IAP but try some of the ‘other many things’.”

**Wailin: (00:25:12)** Then, around 10 PM on the east coast where Zach and Dylan live, everyone on the iOS team got a notification.

**Zach: (00:25:18)** So I get a notification on my phone that there’s a new message from app review. Interesting thing here with this app review, is they don’t send anything in the email. It’s like a bank or a doctor’s office. They send you an email saying to go check something else. So there’s no content there, so you’ve got to go and log into their, to the App Store Connect website, that’s where all this correspondence takes place to actually see what the message is. So that’s just a lot of anxiety. Oh, there’s a new message. We haven’t done anything, so… who knows what happens next.

**Wailin: (00:25:54)** The note read, in its entirety, “Hello Jason, we’ve seen David’s tweets and look forward to working with you on a path forward. This update has been approved. Sincerely, App Review Board.”

**Zach: (00:26:04)** I just jumped on Basecamp and I was basically like, what is happening?

**Dylan: (00:26:12)** It was so casual, and it was so informal and so short, that I figured that this had to be written by Phil Schiller or somebody very high up in Apple. If you’re just like a normal employee and you’re communicating about an issue that’s gotten publicity you’re very careful about it. And this was just, ah! We saw David’s tweet, okay cool. Things are great. Bye.

**Jason: (00:26:32)** We felt wonderful because this was version 1.0.2 which had been approved. This was the version that was being held up for a week and was the center of all the controversy. But that’s not the end of this because 1.0.2 was a bug fix version. Like, that’s not the future of the product, that was just the bug fixes that were being held up. How are we going to find a medium where they’re happy, we’re happy?

**(00:26:52)** Broken By Design by Clip Art plays.

**Wailin: (00:26:52)** You heard Jason. This is not the end. Apple dropped this cryptic note late on a Friday night. WWDC, their big developer event, was scheduled to kick off on Monday. Sign ups for HEY in the first week of launch had wildly exceeded company expectations and there were still tens of thousands of people on the wait list for an invite code.

**Shaun: (00:27:13)** And with that, let’s head into Act 2: A Miracle By Monday.

**Wailin: (00:27:23)** After approving version 1.0.2 of the HEY iOS app and saying they wanted to work on a path forward, Apple kind of vanished again. There was no further communication via the developers portal or a phone call or Twitter. All the team had to go on was Phil Schiller’s quotes in that TechCrunch piece.

**Jason: (00:27:39)** I was thinking about other ways that people can use email.

**Shaun: (00:27:43)** Again, here’s Basecamp founder and CEO, Jason Fried.

**Jason: (00:27:46)** And I was walking around and I saw a lost dog ad on a telephone pole. It had someone’s email address on it. We have a cat. If I lost my cat, I’m not sure I’d want to put my email address up there. What if I could put a temporary address up there. I was thinking about like with Craigslist. When you put an ad up on Craigslist, they hide your email address, essentially, from the public. They give you this weird tokenized one. This would actually be a really interesting thing. We could offer temporary, randomized, email addresses that expire. It’s not a trial. There’s no path to move on. It’s not an actual email address you’d want to keep. This is just a temporary email for people who want to use an email for something that doesn’t last very long. Not everything lasts forever. There’s some situations you want to sign up for something, you don’t want to give your real email address. That’s where we came up with this idea, and that satisfied Apple’s demands because it was a free thing, it was limited. It did not continue into a paid thing. There was no path from this temporary email address to paid. And then we also had been building HEY for Work, which is what we’re using at Basecamp, and now a couple other companies are using it, which is a multi-user version of HEY where the company pays and the employees don’t. And that’s another condition that Apple allows in the App Store without having to pay 30%.

**David: (00:29:05)** I don’t even know which one of them is going to do it. Either it’s going to be this thing about, like, HEY is also an enterprise software platform and that’s okay, or maybe it’s going to be this free thing and then that’s okay.

**Shaun: (00:29:15)** Once again, this is David Heinemeier Hansson, Basecamp’s co-founder and CTO.

**David: (00:29:20)** We were thinking, do you know what? Now is our moment. We have to close this. There’s a lot of attention on it right now, both from the press and from regulators. That’s not going to last forever, right? We can’t drag this out over two months, so we need to really hurry up here and do what we usually don’t do, which was work through the weekend to make this happen. The Father’s Day weekend. To come up with a plan, to implement the plan, to test the plan, to get it all ready so on that Monday, the first day of the WWDC, for Apple, we could have a proposal on Apple’s desk that we thought they would take.

**Jason: (00:29:59)** We want to show good faith effort, we want to show that we want to work with them. They said they want to work on a path forward, so do we, so we’re going to get to work, do the work, and give them something they can see immediately, first thing Monday morning. We had basically a day and a half to build it.

**Zach: (00:30:12)** Yeah, I got a call from David and Jason at some point on Saturday morning.

**Wailin: (00:30:19)** Again, this is Zach, the iOS team lead.

**Zach: (00:30:20)** And they said they kind of had an idea about what they wanted to do. Can we get this done?

**Conor: (00:30:27)** We have some friends and we were able to go out to their cabin in Montana for the weekend.

**Wailin: (00:30:32)** This is Conor, a designer on the iOS team.

**Conor: (00:30:35)** I had bailed on work early on Thursday, enjoyed Friday mostly not working and jumping in the lake, swimming, all that fun stuff. And then on Saturday morning, I look down at my phone at 10 AM and there’s a text from Jason. Well, that’s never happened before, so it was a very… who’s punking me? He says, “Hey Conor, I know it’s Saturday, but I need to draft you to help out with something important. Zach is on board and we need to pull off a miracle by Monday morning.”

**(00:31:06)** Sorry, at that moment, I’m like, oh boy, a miracle, this sounds intense. Okay, and then he says: “I know tomorrow’s Father’s Day, so we have to see if we can get this done today, can we talk?

**(00:31:13)** Yeah, I hopped in Basecamp after I had the call and spun up a project for it and started to lay out some to-dos and Zach had already made a good chunk of progress on it and then Rosa, being the very generous person that she is, she hopped in to help and Jorge also hopped in to help.

**Rosa: (00:31:28)** There were so many fires, so many bugs and so many emergencies.

**Wailin: (00:31:32)** This is Rosa, a programmer on the Security, Infrastructure, and Performance team.

**Rosa: (00:31:37)** I was so focused on them that I didn’t even learn about the Apple issue until some friend outside Basecamp linked me to some tweets from David. And I said, what? What is going on? I have no idea.

**Jorge: (00:31:53)** I think the challenge was they had to make some modification to our sign up process very fast and very quick.

**Wailin: (00:31:59)** Jorge is also a programmer on the Security, Infrastructure, and Performance team.

**Jorge: (00:32:02)** It was preparing a completely isolated system for signing up in the application, which is completely isolated from the regular sign up workflow. Completely isolated from our billing system. Different emails. It’s very simple to describe, but in terms of work, it represented a decent amount of work.

**Wailin: (00:32:22)** Going back to what David said needed to happen over the weekend, come up with a plan, check. Implement the plan, check. Test the plan, for that, you need Basecamp’s one person quality assurance department, Michael.

**Michael: (00:32:34)** I sort of started seeing some messages from a few folks on the iOS team that they had this work lined up. One of the things with QA, it’s like, it always helps to sort of know about things earlier. It sort of gives your mind the space to think through concerns or scenarios that maybe weren’t anticipated by someone else.

**Wailin: (00:32:54)** The team didn’t have the luxury of time in this case. They had to implement and test the best version of the app they could make in a weekend. Here’s Jonas, the design lead at Basecamp.

**Jonas: (00:33:02)** Kind of Saturday was planning and figuring it out and the first attempt at implementing it, and then Sunday was kind of like, thinking through a little bit more and being like, hey is there anything we forgot here? Because we kind of only have one more shot to make sure it’s right.

**Michael: (00:33:14)** I would say we do so many things where sleeping on it makes such a difference, especially when we’re under stress or making a decision quickly. We try to take a little time away from it and come back because for whatever reason in the morning, you see it differently. You’re like, what was wrong with my night-time self? What was I thinking. It’s something about at the end of the day you get tired and you’re not thinking as clearly, and then in the morning, everything’s clear again.

**Shaun: (00:33:38)** By Sunday, which happened to be Father’s Day, the team had a working version of the HEY iOS app that they believed would satisfy Apple’s demands. People could use the app without signing up for a paid HEY account, and they would just receive a randomized email address that would last for 14 days. But another issue had bubbled up during the first week of launch.

**(00:33:58)** Basecamp had been sending out HEY invite codes to people who had signed up on a wait list. Because of all the hype around launch, by the end of the first week, that invite list had ballooned to almost 100,000 people. To try to move through the list, the team had started sending out thousands of invite codes a day versus the original plan, which was just a few hundred. But it still wasn’t enough.

**Jason: (00:34:21)** The whole purpose of the list was to allow us to slowly roll this thing out in a controlled manner, but when the list got so large, it was all sort of out of control anyway. Let’s figure out how to just get this out. We want everyone, now, to be able to use this thing. This timing is right.

**Shaun: (00:34:38)** So Jason and David decided to move up the public launch from some time in July to June 25th. This accelerated public launch would have implications across the company and especially for Basecamp’s support team. Under the original plan where just a few hundred invites a day would be sent out at first, Jason and David had planned to answer all of the HEY-related customer support emails. The rest of the support team would be monitoring incoming questions, organizing responses to the most frequently asked questions and staying on top of the queue for Basecamp’s other products.

**(00:35:09)** But one the Apple situation started, Jason and David’s attention was diverted and the support team was facing a mountain of emails.

**Kristin: (00:35:17)** They’re pulled away with all these media interviews and we’re in charge of this queue that is growing and growing and growing.

**Shaun: (00:35:25)** Again, this is Kristin, head of Basecamp’s customer support.

**Kristin: (00:35:28)** I actually thought it was going to be okay through the whole week. And… on Saturday morning, I got a text from Jason asking me to hire five temps to start on Monday morning. It’s like, am I going to do this? Am I going to get this done? Like what the fuck. I wasn’t sure.

**Andrea: (00:35:28)** I got a text from Kristin, our head of customer support.

**Shaun: (00:35:53)** Andrea is the head of people ops at Basecamp.

**Andrea: (00:35:56)** She said that we had been tasked with hiring five, at least five temporary customer support representatives to help out with the HEY queue. We have a very intentionally designed process for hiring and for on-boarding. And this was none of that. We talked about a couple options. The first was people that we’d interviewed that we’d liked in the last round. We also talked about just tapping some friends or friends of friends that might be interested because it was such short notice that we really had to cover all the bases. We were very upfront that it was not going to be a typical experience when it comes to onboarding at Basecamp, or even working at Basecamp. It was a plea, almost, can you help us out? It’s a short period of time, it’s going to be a little bit chaotic, but it’s going to be very exciting, and you’re going to have a huge impact on our business and our product and the team.

**(00:36:51)** We ended up with five people that were contracts signed, ready to go and then five additional people who we weren’t sure if we needed them and we kind of put them on retainer.

**Kristin: (00:37:00)** It ended up working out. Andrea fucking busted her ass, also, head of people ops, getting these contracts and figuring out payroll and all of this shit. She worked just as hard as I did over the weekend.

**Andrea: (00:37:14)** We had everyone lined up on Saturday, which is why I went to bed at 7:00. Me and Kristin were working, and about 7:00, 7:30, I was like, I’m going to go to bed. I’ll, I’ll see you in the morning.

**Kristin: (00:37:29)** After we got everything signed, I spent the day creating an onboarding process. How can I get people really quickly trained on a product that is brand new. That we’re still learning the nuances of. Like, we know the general things about this product. We’ve been using it for months, but now I have to quickly onboard all of these people and make sure that they understand the basic outline of what the product does. And it’s not like any other email service.

**Elizabeth: (00:38:02)** So we would usually do two weeks in person.

**Shaun: (00:38:03)** Elizabeth is a principal customer support rep at Basecamp. She’s been part of the onboarding process for many new hires, but it’s never been anything like this.

**Elizabeth: (00:38:12)** After the two in person weeks, usually it was kind of several weeks of building up and working closely with other team members going back and forth on cases. So the whole process, I think, really until someone was totally up to speed would be three months. It was funny because that Saturday, I was trying to make the new onboarding projects and I originally was basically using our ordinary template and thinking, like, oh, I just need to shave a little off here and there. And then there was a moment, where I was like, wait, no. This whole thing needs to come down. It’s all… I’ve got to burn it all down.

**Shaun: (00:38:50)** That’s three months of training compressed into about a day and a half.

**Elizabeth: (00:38:54)** We met, we did a video chat. We introduced ourselves. I had them watch Jason’s demo on YouTube. And then I had them read through all the snippets that we had written the previous week, so they could get a sense of, oh, what are people asking. And how do you answer those questions and that’s what those are really good for.

**Jason: (00:39:14)** So we said Zach and Conor, we need you guys to make this new version of the app by Monday and Kristin, also, you need to hire five people by Monday, too. We asked a lot from a lot of people but everyone came through beautifully.

**(00:39:26)** Broken By Design by Clip Art plays.

**Shaun: (00:39:28)** With the weekend over and a plan in place, we come to Act 3: There ARE Feelings in Programming.

**Wailin: (00:39:39)** Heading into Monday there were two important things happening in the week. The first was getting approval for the newest version of the iOS app with the burner email account feature. The second was sending out invites to the remaining 70,000 or so people on the HEY waitlist and fully opening HEY to the public on Thursday.

**(00:39:58)** So on Monday morning, the team released version 1.0.2 of the HEY iOS app. That’s the one that had been held up the previous week and finally approved on Friday night. Jason published an open letter to Apple titled, Apple, HEY, and the Path Forward. And the iOS team submitted the new version of their app, the one with the burner emails. It was unclear whether there would be any response from Apple before WWDC, which kicked off at 10 AM Pacific time on Monday.

**(00:40:25)** WWDC background music.

**Tim Cook: (00:40:25)** Good morning and welcome to WWDC. WWDC is an incredibly important event to Apple, our developers, and our users.

**Zach: (00:40:35)** It’s Apple developer Christmas, that’s what everyone calls it, because it’s like, this is when we get all this new stuff.

**Wailin: (00:40:41)** Again, this is Zach, the iOS team lead.

**Zach: (00:40:42)** Not only new developer tools and new APIs and maybe announce new iOS and macOS versions so we get to see all the stuff we love is this new technology and they give a whole bunch to us in one day.

**Dylan: (00:40:57)** On Friday, my thought was, I’m not even going to watch WWDC this year. I’m going to show Apple. I’m not going to watch it.

**Wailin: (00:41:05)** This is Dylan, the other programmer on the iOS team. His jumbled feeling was what a lot of people at Basecamp were experiencing at the start of the second week as everyone waited for Apple’s response.

**Dylan: (00:41:15)** It’s all mixed. A lot of jumble of emotions and feels. Usually programming doesn’t have feels. It’s like the Tom Hanks movie. There’s no feeling in programming.

**League of their Own: (00:41:24)** Tom Hanks: There’s no crying in baseball!

**(00:41:28)** Rosie O’Donnell: Why don’t you leave her alone, Jimmy.

**(00:41:29)** Tom Hanks: Oh, you zip it, Doris!

**Wailin: (00:41:32)** On Monday, the newly hired temps on support started answering customer emails. Another 20,000 HEY invites were sent out and some other folks at Basecamp picked up the baton from the weekend and kept working.

**Jeff: (00:41:42)** Come Monday, it was like, now this actually has to work.

**Wailin: (00:41:45)** Jeff is a programmer on Basecamp’s core product team.

**Jeff: (00:41:48)** We had a working version but it was based on our traditional sign ups, like our regular sign up. We want throw away accounts. We need to be able to throw them away. We don’t want them interfering with paying accounts. And we also have a bunch of restrictions around them, right? We don’t want someone easily to be able to sign up for one and then spam people. We don’t want people signing up for thousands of them and automating that process.

**Troy: (00:42:15)** We were concerned that by sort of opening this up to a wider audience and actually explicitly creating this kind of burner, or temporary email account feature that this opened us up to a different avenue of abuse.

**Wailin: (00:42:29)** This is Troy, who heads Basecamp’s Operations Team.

**Troy: (00:42:32)** And so we did end up spinning up some unique outbound infrastructure so that those temporary emails were using different sending IPs in the case that if the content was bad or those email addresses were misused, we limited their impact on the overall experience for HEY users.

**Jeff: (00:42:52)** I was able to think through it in layers. Like, okay, so I really only need to get this part done because these burner accounts last for two weeks, which means I have two weeks to really think through my cleanup plan. I think that that’s the right instinct to have in software because things change so often. Is just to think like a few steps ahead. Have an idea of a possible future, but realize that that may not be the one that you end up going with. So I like to think through what would I do and what things can I defer and what are the costs of deferring.

**(00:43:26)** So with something like this, I realized, yeah, we have two weeks before we really have to make sure these burner accounts get cleaned up and disabled and so all I really have to do is make sure that the application that we submit to Apple works and holds up under scrutiny. And so I knew I just had to finish those essential things before Wednesday and that we really had time to do the rest. Fortunately, we got it all done.

**Shaun: (00:43:50)** On Tuesday, the iOS app with the burner email feature went into review. Apple approved it on Wednesday, and on Thursday, HEY’s doors opened to the public, no invite code needed. The Ops team under Troy was in charge of making sure the system was ready to handle the new surge of sign ups.

**Troy: (00:44:07)** You know, my reaction was okay, we’re ready. And it’s also Basecamp’s first product launch in the cloud, which is probably another thing that’s kind of unique for us about HEY. In the past, when we’ve launched our products we’ve usually launched them on our own hardware and in our own data centers. Thankfully, we were in the cloud because trying to move this quickly, changing your scale requirements, changing how you’re building out your system would have taken potentially weeks versus days because we’re not going off and ordering physical hardware from Dell that has to show up and end up in a rack and be cabled together. I think a lot of Basecamp people feel like this is this sort of highly unusual, unstable, crazy environment of this launch. For me, it felt like a calm launch just because you had clear decision making with David and Jason.

**(00:44:59)** A decision like changing the entire launch plan can happen without you being on conference calls all weekend long. And then I think there’s just a level of trust among the people here at Basecamp. I think there was a healthy recognition that what we were trying to do was kind of outrageous and had the potential to go terribly wrong. Nobody seemed concerned about that. It was very much of an optimistic feeling around launch. Even though there’s this part of your brain that’s going, this makes no sense.

**Shaun: (00:45:26)** By Thursday, a week and a half into launch, the support team had been working with new colleagues for a couple of days and they were chipping away at a wall of emails unlike anything they’d seen in recent memory.

**Chase: (00:45:36)** When you talk about Basecamp, it’s unicorns and emojis and exclamation points and all the details and let me get to know more about your business. With HEY, it’s you’ve got a question, here’s the answer and then we’re moving onto the next one because there’s 300 other people waiting behind you.

**Shaun: (00:45:49)** This is Chase from customer support.

**Chase: (00:45:52)** You have to realize you’re going in for kind of the long haul here, right? This is not like a hotdog eating contest. It was a shift. But I think it’s a good shift, too, because it’s a shift that lines up more with what HEY is as a product. HEY is calm, HEY is quiet. HEY is email’s not going to control me, I’m going to control it. So you’ve kind of got to bring that mentality to all the support stuff, too, and that means when you come into the HEY queue in the morning, there’s… Like this morning, there were 600-something in there. You start with one. You answer that one and you move on, and you make sure not to fall into that same inbox zero mentality that David and Jason rail about.

**Kristin: (00:46:29)** So on Saturday when I logged on to do some emails, the oldest in the queue were 22 hours and I was like, well, shit.

**Shaun: (00:46:35)** Again, here’s Kristin, who heads up the support team.

**Kristin: (00:46:38)** By the time I logged off on Saturday night, the oldest were 12 hours. And I was like, all right. That’s better. We’re so used to Basecamp. This is so different. We have to think about support differently. Not only because we’re busy as fuck, but because people don’t want an effusive response, I don’t think. It’s not the same. I’ve been telling everyone when we have to think about the difference between these audiences is that, we’re still friendly. It’s like you’re helping a friend but you’re in a big fucking hurry.

**Shaun: (00:47:13)** The support team wants their new colleagues to feel cared for and empowered, even under these intense circumstances. Here’s Ashley, who helped onboard and train the temps. They were brought on with the possibility of making their positions permanent.

**Ashley: (00:47:25)** I think it can be difficult to relay that you’re all right when they’re not used to who you are in person. You’ve not really had any video chatting with them so they can’t understand your tone. Open communication is the main component because that leads to trust and it leads to correct answers. It leads to discussions on whether things are working now. Should it be working that way? So folks have agency, temp or not. They need to be able to freely express that. Questions constantly welcome. Never too many questions. Never a wrong question, especially in this time when we’re really very much trying to figure it all out.

**Wailin: (00:48:05)** The support team is like the beating empathetic heart of the company. If they’re under pressure, everyone feels it. And everyone can see it via the many bug reports and questions that flood the customer support queue. This was especially true during the launch of HEY.

**Jeff: (00:48:20)** You see tickets come in, and you’re like, oh, I can easily fix this. And it’s hard to resist the urge to just fix it then. It might point to a larger issue. Like, you’re just not in a good state of mind to start fixing things. And then as you’re fixing it, ten more things are going to come in. And you’re going to learn that somebody else is trying to fix it. So it’s best just to back off and yeah. You watch the things come in. You’re really just looking for anything super bad and you’re trying to spot patterns.

**Jonas: (00:48:48)** That part is tough as the person who’s built a lot of this stuff. It makes you want to just get in there and fix everything.

**Wailin: (00:48:54)** Jonas is the design lead at Basecamp.

**Jonas: (00:48:55)** I’ve been doing these bug fix rounds for the last month or so. It’s become like a joke. I have these bundles of them and the number keeps going up. So it’s like, bug fixes 1, bug fixes 2, bug fixes 48. Especially when you’re under a lot of pressure. We’re answering a lot of cases right now that leads you to kind of hurry or rush through something to try to get a fix out. And then you might miss some stuff, and then that introduces a new problem which is almost worse. It’s better for the support team to at least know the bugs that are there. You have to just slow down a little bit.

**Wailin: (00:49:30)** We don’t have time to get into all of the fires that got put out during these two weeks. There were mail bomb attacks, including one where Jason got 10,000 emails at once. And there was a DDoS or Distributed Denial of Service attack. The team also realized that the randomly generated burner email addresses were assigning names like, “cow” and “rat” and customers were unhappy about that. So the format got changed to avoid these problematic combinations. There were also a lot of ideas thrown around in these two weeks about how to respond to Apple. The team considered organizing an email campaign to lobby Apple CEO Tim Cook, or making a parody version of the HEY app that would cost $800.

**(00:50:09)** Another big thing that coincided with the launch of HEY was that the lease on Basecamp’s Chicago office was up. Chicago employees had to return to the office individually to pack up their desks.

**Jonas: (00:50:21)** I have trouble moving out of places because I’m kind of a sentimental person. It’s not really so much the place or the stuff, its’ the memories. Like thinking back of what lived experience you’ve had in that place. Working at Basecamp kind of changed my whole career and trajectory and stuff, and so I remembered the first time interviewing there and parking nearby and being scared about it. You know, all those feelings and weird memories kind of pop back up.

**(00:50:44)** You know, it’s that thing, you’re living in an apartment and you’re sad about leaving and then you start taking the posters off the walls and you empty out one of the rooms. You’re like, eh, well this place is kind of a mess anyway, so forget about it. It kind of had that vibe, where it was like, it was no longer the office that it was when we were there.

**Wailin: (00:51:01)** The Chicago office had been Basecamp’s physical home for 10 years. When the company first moved in, it looked quite different from how it looks today. A lot has changed in a decade.

**Jeff: (00:51:12)** We’re more mature now. If something had gotten as popular as HEY 10 years ago, we would have fallen over.

**David: (00:51:18)** About 10 years ago, I did an interview with Jason Calacanis on his This Week in Startups show.

**Jason Calacanis: (00:51:24)** So I’m really excited to have David, and hopefully I’m going to get this right. Heinemeier

**David (TWiS Clip): (00:51:29)** That’s right.

**Jason Calacanis: (00:51:29)** Hansson.

**David (TWiS Clip): (00:51:30)** Yep.

**Jason Calacanis: (00:51:30)** David Heinemeier Hansson. It’s not that hard to say. You don’t have the competitive sprit to go up against Microsoft’s operating system…

**David (TWiS Clip): (00:51:36)** Oh, I do!

**Jason Calacanis: (00:51:37)** Or their Office Suite, because—

**David (TWiS Clip): (00:51:39)** We’re going up against a bunch of their shit—

**Jason Calacanis: (00:51:41)** But you’e not going up against Gmail.

**David (TWiS Clip): (00:51:43)** —SharePoint.

**Jason Calacanis: (00:51:43)** You’re not going after Gmail.

**David (TWiS Clip): (00:51:46)** Because that problem doesn’t interest me.

**David: (00:51:47)** The company we had in 2010 was in no position to take on Gmail. We didn’t have the capacity. We didn’t have the experience, we didn’t have the skills. We didn’t have the ambition. After 20 years of building software, 16 years of running Basecamp, we were ready. And finally kind of that surety in ourselves. Although, maybe people will laugh at this, haven’t you already been completely cocksure of yourself since the beginning? In some ways, but not in this way, and that’s what was different.

**(00:52:23)** We really thought, if not us, then who? And if not now, then when?

**Wailin: (00:52:29)** Change is hard. And it’s particularly difficult to go through a lot of change in a compressed amount of time in public and during a period of painful and scary transformation for the world at large. The early success of HEY essentially created a second company within Basecamp, one that will need additional team members and resources. People here are just starting to process what HEY means for the future of their day-to-day work and for the culture at Basecamp, and what impact HEY might have on the industry.

**Jason: (00:52:56)** It was a chaotic, enthralling, but horrible two weeks. And it feels like 20 years in, this is our 21st year in business, we may have another massive hit on our hands. The last one was from 2004, Basecamp, and now it’s HEY. And so this is a chance. This is where we have to go all in and cash in many, many, many years of calm for a couple chaotic weeks to get it right. And to do everything we had to do to make it happen.

**(00:53:23)** Broken By Design by Clip Art plays.

**Shaun: (00:53:29)** REWORK is produced by Wailin Wong and me, Shaun Hildner. Music for the show is by Clip Art.

**Wailin: (00:53:36)** A huge thank you to everyone at Basecamp who took time out of their still extremely busy schedules to talk to us. I think we ended up talking to maybe a third of the company, but there were still people that we weren’t able to include and we’re sorry that we didn’t have the time to put everyone in.

**(00:53:51)** For the full story on the Apple versus HEY fiasco, our marketing designer Adam Stoddard created a fantastic page detailing every twist and turn. You can find that, that has all of Jason’s open letters and stuff, that’s at HEY.com/apple.

**Shaun: (00:54:06)** Wailin, how about some Twitter handles.

**Wailin: (00:54:08)** Okay.

**Shaun: (00:54:09)** You can find Basecamp, the company at @Basecamp. For questions about HEY, they’re at @heyhey.

**Wailin: (00:54:14)** Hey hey!

**Shaun: (00:54:15)** We are on Twitter at @reworkpodcast and you can find shownotes and a transcript for this episode at rework.fm.

**Wailin: (00:54:23)** REWORK is going on our traditional summer break in August, but don’t worry, we’ll have some bonus content and some reruns for you in the meantime. See you in September!

**(00:54:33)** Broken By Design by Clip Art plays.

This is an episode title
