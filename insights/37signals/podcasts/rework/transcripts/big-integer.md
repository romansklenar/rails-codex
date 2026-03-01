---
title: "Big integer"
description: "On Thursday, November 8, Basecamp 3 went down for almost five hours."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/big-integer/
tags:
- podcast
---

# Big integer

**David: (00:00:01)** It’s funny because it was almost like a sixth sense. I saw that there had just ticked in an alert from, I think it was Basecamp Emergency. So, the bat signal that we use that goes over text message like a couple of minutes before that and I was like, “Hm, I haven’t seen one of these in a long time.”

**Taylor: (00:00:18)** You walk in and you go, wow, this is a significant problem.

**Kristin: (00:00:22)** I was like, oh shit. Like what the fuck is going on?

**(00:00:27)** Broken By Design by Clip Art plays.

**Wailin: (00:00:27)** On Thursday, November 8th, Basecamp 3, a piece of software that is made and maintained right here at our company went down for almost five hours. For all that time the app was in read-only mode, which meant customers could read messages and files but they couldn’t add anything or make edits in their accounts.

**Shaun: (00:00:45)** This was the worst outage at Basecamp in about a decade before. November 8th our uptime for Basecamp 3 was 99.998%. That’s a lot of nines and that’s the way we like it around here. Today, we’re devoting the entire episode to what happened inside the company during the outage, almost like a mini handbook on crisis management. Here’s Basecamp co-founder and Chief Technology Officer, David Heinemeier Hansson.

**David: (00:01:11)** We have such a boring software life in that regard, that is not all exploding cars and drama every five minutes. It’s a lot more mundane than that and the vast majority of times, even if we have small blips or issues, there are small blips and issues. Then, we have a wonderful operations team that deals with all this stuff, so I really very rarely if ever get to see any of the mechanics of it because it just kind of hums along.

**Wailin: (00:01:37)** We’ve been talking a lot on this show about creating a calm work environment. David and CEO Jason Fried just released a new book on this topic and they take a lot of satisfaction and running a calm company. The big outage on November 8th put Basecamp’s culture to the test. It all started early that morning when a few folks on Basecamps Ops team noticed something was amiss.

**Taylor: (00:01:57)** I think the day began with me getting paged that there was a problem and that they needed help. My name’s Taylor Weibley, and I’m the head of technical operations here at Basecamp. If a site is totally down, everyone on our team is going to get paged so all seven of us will get an emergency text and it will call you, too, to make sure that the SMS message reached you.

**David: (00:02:27)** I saw that message and I was waking up with my son in the morning and I was like, shit, my wife wasn’t even awake yet and I’m like, Eh, I’m just going to put you in front of the TV and give you a couple of yogurt tubes and then daddy’s going to go to the office for a little bit.

**Wailin: (00:02:39)** That’s David, Basecamp’s CTO. By the time he arrived to pitch in, Taylor’s team had already diagnosed the problem. We’re going to get technical for a minute. Basecamp has a big old database. That database has multiple tables. One of them, the events table, tracks almost every single activity that happens in Basecamp 3. A new row gets inserted into the table when someone posts a message or updates a to-do list. That table also has a column called the ID column that’s configured in a certain way. In this case as an integer, meaning it could accommodate a finite number of rows. This is where Basecamp ran into trouble. Once the table maxed out that number of rows, new events could no longer be written to the table. That meant if you are using Basecamp 3, you couldn’t post a new message or chat and campfire. So, what was this maximum number of rows that Basecamp hit on November 8th? I asked Taylor to do the honors

**Taylor: (00:03:37)** 2,147,483,647 rows.

**Wailin: (00:03:43)** That’s more than 2.1 billion. We needed more rows and there’s a column type called big integer, which allows more numbers. How many more

**Taylor: (00:03:51)** You can go to 9,223,372,036,854,775,807. Which is a lot more numbers.

**Wailin: (00:04:03)** For those of you playing at home. That’s over nine quintillion. Taylor’s team was able to diagnose within eight minutes that there was a maxed out table and that the column type needed to be changed from integer to big integer. That was the good news, that they identified the issue so quickly. The bad news? A couple of things. First, there was the immediate frustration that this problem was totally preventable. It had already been flagged as an issue several years ago for Ruby on Rails. The framework that powers Basecamp, the framework that David invented.

**David: (00:04:34)** Like, I wanted it to be something spectacular. Something rare and mysterious and, like, aliens had hacked into something and they had encoded it into this foreign language and we had to decrypt it with all sorts of running graphics going on. Like, I got this! And, We’re going to get it! But it wasn’t that dramatic. It was so much more mundane. And not only was it mundane in the fact that the issue was known ahead of time. We were already on it and we just… we had either not calculated, or not calculated correctly how much time we had left. It was kind of like, you’re defusing this bomb and you’re like, all right, let’s just take a coffee break and like there’s 30 seconds left on the clock in. No, it’s not the time for the coffee break. Right? That’s also, I mean in some ways it’s just the ultimate humbling experience that it’s such a rookie mistake and it evaded, not only me, but the rest of our very diligent, experienced and competent organization. That’s just, right. You go like, hmm man, that uh, that didn’t need to happen.

**Wailin: (00:05:40)** That was the first kick in the stomach and there was something else.

**David: (00:05:44)** It took like eight minutes perhaps diagnose exactly what the problem was. Then a few more minutes to figure out what the fix was and then a bit more than that to test the fix. And then quite quickly we were running to fix. The problem was that the fixed took like three hours to run.

**Kristin: (00:06:01)** I’m Kristin. I run the Support team at Basecamp. There’s a huge difference between 10 minutes downtime where you can go get a coffee, go chat with your neighbor, whatever, and three hours, which is like, I need to restructure my day. I grabbed my computer, logged on, made some coffee and just jumped into the mess.

**Wailin: (00:06:27)** Since Basecamp customers would be facing this huge amount of downtime, it became really important to keep them in the loop.

**David: (00:06:34)** I started just running communications on the public side of it in terms of taking over Twitter, our status blog and quickly started posting to SvN article. Basically, just keeping a timeline so to people who are just joining the fun could catch up and see exactly how far along we were. I wanted to make sure that we had an update every 30 minutes to reassure all the customers that we were absolutely on it. A lot of it just runs off, what would I want to know if I was a customer of Basecamp? How would I want to be reassured? Would I want like a very corporate, vague language or would I want a human on the other side that just spoke the truth and told me it straight up. Even if it was not flattering what was being told.

**(00:07:23)** So, I tried to just write in that tone just like I write software, just like we write anything, just like we write the interface. Like we’re humans and we’re talking to other humans and it doesn’t have to go through this weird garbly corporate translator where what comes out on the other side just sounds like this. Like, actually, what happened? I just, I was very intent from the beginning to just own it. We fucked up and we’re going to tell people we fucked up and we’re gonna ask for their forgiveness and we’re going to say we’re sorry. And we’re going to mean it.

**Kristin: (00:07:54)** What I’m thinking about is more how we can be as clear as possible that we know there’s an issue, that it’s not the customer’s fault, that their data is safe and that we are working as hard as we can to get the app up as soon as possible. And, if we have a timeline to share it with them, but also sharing caveats that you know, we’re making an estimate and the estimate could be wrong. And if they ask what exactly is going on, we can give them a more technical explanation. But I don’t want people to get caught up in a technical explanation that would just end up confusing them.

**(00:08:35)** There’s a risk there that you’re only giving them this explanation so that they don’t ask you any more questions. You’re sort of shutting down the conversation by being overly technical.

**Wailin: (00:08:48)** For the Ops and Programming teams, those two to three hours of wait time weren’t just about watching a proverbial status bar crawl across the screen. Although there was a little bit of that too.

**David: (00:08:59)** The main part of it was that we had to make that change to the database. It was going to take a long time because it was a huge table and we had to wait some of that out. But there was still a lot of activity that could happen at the same time and did happen at the same time.

**Taylor: (00:09:12)** My first role is to make sure that we were clear about who owned investigating the problem at that moment. Who is going to make sure that we alerted other people in the company. Who was going to update the status site to let our customers know. Who was keeping our support team in the loop. We need to actually take concrete action here to get other people involved. And then to make sure that they understand clearly what you’re asking them to do.

**(00:09:39)** Basecamp operates a ton of applications. My team is responsible for those, but there are people in our company who have more or less knowledge about each of those applications. And so one of the things that that you want to do is you want to bring in the people with the most expertise and say, hey look, here’s what we think is going on. Is there anything else we need to consider here? If we make this change, is it going to make things worse in some way that we don’t expect?

**Jeremy: (00:10:07)** I’m Jeremy Dare. I’m on the Security, Infrastructure and Performance team at Basecamp. I got kind of a strange wake up because this was at, I don’t know, five something my time. I thought I was getting an alarm because my phone was making a weird noise and it wasn’t an alarm-like noise. So it kind of leaked into my dream. And then when I woke up and I looked at my phone and realized I could, I wasn’t turning off the alarm. I was getting a call from Taylor. Taylor just found some awesome deal online needed to let me know about or there’s actually a huge emergency. So, it got, whatever, my brain stem going immediately like oh geez, totally awake. And so my brain just immediately starts whirring to like, what can we do with a maxed out table? And then there’s like a whole ripple effect of consequences and possible fixes.

**Taylor: (00:10:59)** There’s eight database servers that power Basecamp 3. There’s two data centers. We’re using cloud services, we’re operating, 10 Gig private interconnects across cities and stuff. There’s a lot of things that can just break in weird ways.

**Wailin: (00:11:15)** Taylor and Jeremy’s teams, use staging or non-production environments to try out different scenarios. These are systems that are used for testing so you don’t mess with anything live. They landed on a fix and put it in motion. This is what was estimated to take two to three hours. But there was another wrinkle.

**Jeremy: (00:11:31)** Technically speaking, we run, a primary database which we write to. And we have a bunch of replica databases that we read from. And, in order to a big change like this, without affecting the primary database we perform it on one of the replicas. We take the replica that out of service, we make the change, which blocks access to the table, and then we put the replica back into service and then we swap roles. So we’d make the replica of the primary and we turn the primary and told replica. But when we did the database migration to allow their database table to grow larger, to remove the cap, at first it didn’t work.

**(00:12:12)** And so that was our moment of truth and really the most stressful part of this whole experience because it was no longer a hurry up and wait situation. It was a, we’ve built up to this moment where we’ve given customers a rough sense of this is when we’re probably going to come back online and now we had an actual new crisis of, well everything we’ve said, everything we’ve thought about this might not pan out.

**Wailin: (00:12:35)** The team had to quickly but carefully consider their options, which were both pretty awful. Either have Basecamp 3 go completely down, even worse than read only, or lose the most recent two to three hours worth of customer data. As Taylor was leading the discussion around what to do next, Jeremy and his team were doing further investigations.

**Jeremy: (00:12:54)** In the background. We were looking at why, why isn’t it working? Why can’t the primary database send this data to the replica and have it catch up? And so we had some sense of this should be possible, and so went digging around and found that the replica database could take all those two to three hours of updates to the primary database and apply them to the replica, but it needed to be configured to do so. By default it wasn’t, it didn’t allow it.

**(00:13:22)** So it’s something that we could turn on and that moment of realizing like we can turn this on. Our version of the database does support this. We just tested it in a staging database and it works. It’s just a moment of like enormous relief of we’ve just averted this like impossible decision.

**Wailin: (00:13:40)** By 12:41 PM central time, Basecamp 3 was back up and running. It had been just over five hours. During that time, Kristin and the support team fielded at 1,800 emails. That’s almost as many as they would normally get in an entire week.

**Kristin: (00:13:55)** The 1,800 people who wrote in that day, we had to then write them again and tell them that everything is working again. That took a while and that was sort of like everybody’s just going into the queue and doing as many as they can because we want people to know that it’s working. We don’t want to just like silently fail and then silently succeed. We want to, we want to be proactive and be like, hey, you wrote in about this, it’s working now. Thank you, sorry.

**(00:14:24)** Everyone was so nice. It was amazing. My expectation I guess was that people would be angry and upset and they weren’t at all. People were tweeting at us telling us to take care of ourselves. They were sending us like all sorts of sympathy and compassion and I think that there’s a couple things that that happened. The first one is that we, we haven’t had such a catastrophic downtime in the time that I’ve worked at Basecamp, which is coming on eight years now. So we’ve built up all this trust, like they know this doesn’t happen with regularity.

**(00:15:01)** And then the other thing is that what my team does is remind everybody that we’re a group of humans who work at Basecamp. You know when you email a company and they’ll send you an automatic reply back right away that says like, hey, we got your email. You’re really important to us. It’s going to take us two to four business days to get back to you. And so we don’t want to send anything like that out. But you always get a human being responding to you within an hour, mostly 30 minutes, a lot of times, 10 minutes. And so we’ve built up a lot of trust with people and they know that we’re human beings who are answering those emails. We don’t have anything in place that sort of shuts the door in people’s faces. And so, I think because of that, everyone was like, oh no, their support team is probably dealing with so much. Their ops team is probably really stressed out. So everybody was just encouraging us. And it was really amazing.

**Wailin: (00:15:55)** On a previous episode of the show, David talked about a customer support framework that uses tokens as a metaphor. When something happens, you can either grab the token that says this is no big deal, or you can grab the token that says this is the biggest deal. Whichever one you grabbed the customer will grab the other one on the day of the outage. David went for the big deal token right away.

**David: (00:16:15)** Capitulate early and completely. I think that was basically the answer because that was really what was warranted, right? No one else did this to us. We did this to us. Just own it and own it completely because if you’re gonna own it anyway, why not just own it all the way? Why these caveats? Is anyone going to feel better about you because you’re trying to weasel your way around the edges? No, they’re not. I think by and large, the response to that was exactly what the token strategy tells you will happen. If you take, this is the end of the world, people will line up to tell you, no, no, no. It’s not the end of the world. It’s annoying or it’s frustrating and whatever, but it’s not the end of the world, and they will feel better about being given the chance to be gracious.

**Kristin: (00:17:03)** I didn’t give very many credits. I gave a few. Less than a thousand dollars. People weren’t asking for credits. There were a few people who wrote in who had, it was really bad timing for Basecamp to go down. This one person who wrote in was like, I’m the Basecamp champion. I’ve been trying to get my company to use this app for months. Today is the training I was going to give for everybody. I’ve already gotten push back about this for so long and today was the training. And I was like, oh fuck. Like this person has been trying to use this app. Now we go down like… and nobody wants to use it. So, of course I gave them an extended trial. And I ended up sending a basket of Zingerman’s to their office.

**Wailin: (00:17:55)** There was only one extremely upset customer, a large organization that relies on Basecamp to store a time sensitive information that they needed full access to on that Thursday.

**Kristin: (00:18:06)** They were not happy and that was the only person. I was like, Jason, you can… you can handle this person.

**Wailin: (00:18:13)** That’s Jason Fried, Basecamp’s CEO.

**Kristin: (00:18:18)** To be fair and transparent, Jason was answering emails. Jason was answering emails just like everybody else was during the downtime. The thing is like the way that we have it set up, we didn’t even need that much help. People wanted to help. We didn’t feel ever like we were drowning. We were really busy and it was hard to take a break. To feel like you could take a break but that’s why we have to remind each other that it’s okay to get up. It’s okay to let the email sit for a little while, but we’re set up in a way so that even if something like this happens, we don’t need to ask anybody else for help. We have it under control. The people who were helping, wanted to help. They wanted to feel useful because that’s part of the culture at Basecamp is that they, they don’t want to just sit around and have a day off when they know that the rest of the company is a little stress and panicky.

**(00:19:13)** A bunch of people asked if they could help and you know, we said they didn’t have to and they did it anyway because they’re wonderful.

**Jeremy: (00:19:17)** It feels good. It feels like working as a team and particularly noting organizationally, not feeling like a lot of internal stresses or pressures like kind of sheer forces within the organization as one person’s requesting something from another team. Everybody’s working together and internal communications are smooth. And these are the kinds of things where it’s hard as a company that doesn’t do these things or doesn’t practice them to even know to do. Because you need to have crises and to know that these are things you need to work on. And so when we have a calm experience like this… I try to figure out like, why, what’s going on there? And part of it is like it’s that it’s a known unknown and so there was a lot of hurry up and wait. But a lot of it’s just competence and expertise and trust.

**(00:20:10)** Our trust batteries with each other are very full. We’re all doing what we can. We’re leaving space for other people to do, to fill their incident responder role. Just, it felt great. So it’s a really mixed kind of feeling of this is something we never want to happen, but it’s also a time where we could be as proud of Basecamp as a team.

**Wailin: (00:20:33)** It’s worth noting that even on the day when Basecamp had its worst outage in a decade people didn’t work extra hours. Kristen logged off at her usual time. Jeremy still did a one on one with a colleague that he had previously scheduled and signed off early. Here’s Taylor.

**Taylor: (00:20:47)** If I’m, like, guys, the sky’s falling. We’re all going to be out of a job. Basecamp’s gonna sink today. Well guess what? Everybody is just going to act in that way. If instead I said, hey, this is an opportunity for us to do our best work right now to be cool, calm, collected, then then that’s how I need to act, too. To model that to everybody else, actually. I will literally prompt everybody and say, hey, now’s a good time for you to go take a break. You know? Nothing is so dire that that we need to kill ourselves. It’s just not. That’s not a good thing. Just like getting a good night’s sleep every night, is important. Taking those breaks is equally important, especially when you know it’s going to be a long timeline. It’s one thing if it’s a 20-minute fix. When you’re looking at a couple of hours, it’s like people need to be doing sustainable work here, not running a sprint.

**Wailin: (00:21:36)** There was plenty of time in the aftermath for postmortems and discussions of what to do next. We changed some of our emergency notification protocols and talked about expanding crisis drills from the Support and Ops teams to the entire company and throughout the experience there was great care to avoid pointing fingers. When David said he capitulated early and completely, he also meant that internally he took the blame.

**David: (00:22:00)** I remember just a couple of times I would start a sentence where I’d go like basically how did the fuck does this happen? And then I would just, I would bite it every time because I’m like, it’s just not important right now. It’s not helpful. No one was egregiously negligent. We made mistakes. Some of those mistakes were kind of rookie mistakes, but that’s also what happens, and we should have had a better framework. We should have better controls. We should have had all sorts of things that at the end leads to my desk. Like, I set up the environment, I set up the frames for it. So, when people make mistakes within those frames, I mean that’s on me at least in large part. Right?

**(00:22:40)** And if we’re not actually going to fire people, which we’re not, by the way, just making that clear, because no one was grossly negligent. The opposite was true. Everyone really rose to the occasion after the mistake had been identified. Then what good is it? What good is it to run around and us sort of walk on eggshells and like try to, um, excuse or defend or deflect.

**(00:23:01)** Let’s just get to the facts of what happened within the security that like you’re not getting fired. We just want to get to the bottom of it. It’s not all your fault. Maybe there’s some of it that’s your fault. And maybe some of that drives people to be even more diligent and that’s fair. But there’s also a lot of it that wasn’t your fault. And it’s not on you and no single individual beyond perhaps me needs to carry that because I carry it the easiest. Who’s going to fire me? Jason’s gonna fire me? I mean, I suppose he could. We could blow up the whole company if I was proven to have been grossly negligent, and like willfully trying to blow shit up. But, I mean, that’s not what happened.

**Wailin: (00:23:44)** What David taking the lion’s share of the blame does, is allow everyone else to focus their effort on the more productive work of preventing another outage. And that’s a real cost Basecamp will have to grapple with because it means diverting attention and resources from other projects. But it’s what needs to be done. Even if the result of that work goes totally unnoticed by customers.

**Taylor: (00:24:04)** People used to say, you know, well, being an SRE or a Site Reliability Engineering or being on Ops or whatever is like being a firefighter. Like that is kind of true. So like there are times when there’s a fire and someone dials 911 and they say, hey, you know, there’s a fire. I need you to send the fire department. There’s also times when the fire inspector goes to a building and says, hey, the things you have don’t meet the code, right?

**(00:24:34)** You haven’t done the requisite work to prevent a fire. And so a lot of our work is looking forward for things that might happen and then looking at how we can make sure they don’t or make sure they happen in a way that we intend for them to. You know, that’s often missed because you have a big event and this gets a ton of publicity and it feels really bad, even if you restore the service. And then you kind of are so quick to say, well, hey, what about the other, you know, 10 months of the year where nothing happened. Or maybe something did happen. But the customers never knew. Right? They didn’t, there was no data loss, there was nothing, you know, no interruption to them, etc., etc.

**(00:25:12)** Like, the thing in the industry is like make things reliable, make them available, right? And there’s always tradeoffs in those. And for us at Basecamp, like we’re a seven-person team. There’s a limit to what you can do with seven people. And we just have to be real with ourselves about that. And I think, you know, I even tell myself that personally, like, the idea that I can be perfectly prepared, you know, is pretty foolish. So you just, you got to wrestle with that and say, hey, so it goes sometimes. And in the other times you just do a great job and you know the satisfaction of nothing happening has to feel really good.

**Kristin: (00:25:52)** This feeling that I’ve been trying to write about and it’s really hard to synthesize it. On the Friday after, the next day, a few of us were on a hangout that we had already scheduled and we were all talking about what happened. And the one thing that we talked about a lot was this really strange feeling that we decided there must be a German word for that we don’t know about feeling really good despite a bad thing happening. So we were all really proud of ourselves and we handled it with grace and were organized and nobody lost their shit. And so we walked away from that feeling really good even though it was about a bad thing.

**(00:26:45)** Broken By Design by Clip Art plays.

**Shaun: (00:26:49)** REWORK is produced by Wailin Wong and me, Shaun Hildner. Our theme music is Broken By Design by Clip Art.

**Wailin: (00:26:59)** You can find show notes for this episode and every episode at rework.fm. For this episode, we will put up links to the Signal v. Noise posts where David was keeping everyone updated on the day of the outage. So if you want to look at those in more detail, we’ll have them there for you. And, what else?

**Shaun: (00:27:17)** You can find us on Twitter @reworkpodcast, or if you feel like talking to the old fashioned way, you can leave us a voicemail at (708) 628-7850.

This is an episode title
