---
title: "Designing HEY"
description: "Jonas Downey, Basecamp's design lead, discusses the two-year process of designing HEY email service, from early experimental prototypes to launch."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/designing-hey/
tags:
- podcast
---

# Designing HEY

**Shaun: (00:00:00)** We've never done a true interview with both of us asking questions.

**Jonas: (00:00:05)** Is this the first time ever?

**Wailin: (00:00:05)** You can tell we planned this really well, because I'm just interrupting—

**Shaun: (00:00:08)** Uh-huh.

**Wailin: (00:00:08)** —with questions about your childhood.

**(00:00:09)** Broken By Design by Clip Art plays.

**Shaun: (00:00:12)** Welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I'm Shaun Hildner.

**Wailin: (00:00:17)** And I'm Wailin Wong. Earlier in June, Basecamp launched a new email service called Hey. We're going to be doing about a month of Hey-focused episodes. Last week, you heard from Basecamp's founders about our email philosophy.

**Shaun: (00:00:30)** Okay, so, we need to address this really quickly here at the top of the show. Basecamp and Hey have been a big story in the tech press over the last week because of a conflict we're having with Apple about the Hey iOS app. We're working on an episode about that and hoping to have that ready for you soon. But in the meantime, you can get the full blow-by-blow of that story at HEY.com/Apple.

**Wailin: (00:00:54)** Today we're bringing you a conversation with Jonas Downey, Basecamp's design lead. He's been involved with Hey from the very beginning, before we even really knew we were building an email service. Here's Jonas on the ups, downs, and cool discoveries of the two-year process of making Hey.

**(00:01:11)** Broken By Design by Clip Art plays.

**Jonas: (00:01:15)** My name is Jonas Downey and I'm a product designer at Basecamp.

**Wailin: (00:01:19)** Do you remember your first email address? Your first email account?

**Jonas: (00:01:24)** Yes. I was probably 12, maybe 13. I used to live in Champaign, Illinois, which is a college town and there was an early, early internet provider in that town called Prairienet, which is a very sort of adorable name, now. So I think I got some Jonas@prairienet address.

**Shaun: (00:01:44)** What was your initial reaction when you found out that oh, we're making a new email service?

**Jonas: (00:01:50)** It's very ambitious. It's a difficult problem to take on just because the stakes are very high for everything. The expectations for an email service are that it's up 100% of the time, it's always accessible. It's robust, it renders emails correctly, it's compatible with all the things you expect email to be compatible with. It's just a difficult problem.

**(00:02:13)** If you're going to compete with Gmail, Gmail has been around for 20 years and has thousands of engineers who've worked on it and a huge company behind it. And we're a tiny little company with a few people. So it's a very ambitious project.

**Shaun: (00:02:25)** And this was just you and Jason for such a long time. When do you find out that the product is at a robust enough place that you want to bring programmers in?

**Jonas: (00:02:35)** Before you get other people involved, or at least the way we do it, we want to be relatively certain that this is something we want to dedicate a bunch of time to because we don't have a lot of people. So if we're going to put people on a project, we need to be certain that it's something we're serious about. In this case, we prototyped it for quite a long time to really hammer out what's it gonna do, what is it about? Do we have ideas here that are worth building? So that did take a long time to get through that. In a good way, though, because we had sort of worked out a bunch of stuff in advance before we even brought anybody in.

**Shaun: (00:03:10)** What's that feeling like? Sorry, Wailin, did you want to say something?

**Wailin: (00:03:11)** Oh, I was going to ask if there's a way to describe what the vibe is like when it's you and Jason just doing really experimental stuff at the beginning and you're not quite sure what the thing is supposed to look like or what it could look like?

**Jonas: (00:03:25)** It's one of my favorite things to do with a company is just start fresh and try stuff. We're very loose when we're prototyping, but we're also somewhat disciplined. It's a weird combination of things. We focus on core aspects of the idea to try to work out what is this idea? What should it do? How does it work? How do you get into it? What's the fundamental stuff? We start there and then usually, that's combined with some completely strange, esoteric interface ideas.

**(00:03:59)** The riskiest you can ever be is the very beginning because as you go along, you'll sort of smooth out the risk into making an interface that's kind of common, that people can understand. But at the beginning, you like to just wing it and do weird things because that's the chance to do something weird. So the vibe is relaxed but we try to make progress fast. It's not like we're sitting around just making things and throwing it out and making new things. We're trying to move through the problem so that relatively quickly we have some idea of where we're going.

**Shaun: (00:04:33)** Were there any fun experimental things that just did not work in Hey?

**Jonas: (00:04:39)** We have thrown out quite a bit of work on this over the course of it, which is a normal thing to do when you're building something from scratch because you go off in 15 different directions and sometimes ten of those directions don't really pan out. We had built some features that ultimately we decided maybe are good ideas but we didn't want to do first. There's kind of a thing when you launch a brand-new product, it's important to have a very clear story to tell about what is this product for, what is it about, why is it different? Some features maybe are useful but they don't warrant the time investment because they don't tell that story as clearly. So there's some things we cut that we might bring back later.

**(00:05:21)** And then, lots of visual experiments that were, like I was saying before, wild. That were cool, but don't really make sense in a production product. It was too weird.

**Shaun: (00:05:34)** Like what?

**Jonas: (00:05:36)** It was largely visual design stuff. I was doing lots of strange things with timeline designs. I had little date flags and lots of zig-zag-y elements and a bunch of different colors. It had a cool spirit to it and in some ways it was very human and funky and interesting. But once you actually get into using the product, some of that stuff just becomes distracting. The key with an email app, the fundamental thing you're doing is triaging and reading email. So you don't want the interface of the app to be so drastically distracting and weird that it's taking you away from just what you're trying to do which is just get your email done.

**Shaun: (00:06:13)** Coming from that, sort of, the wacky design. Do you think informed where Hey is now?

**Jonas: (00:06:18)** Yeah, absolutely. And that's the reason we start with weird stuff because you can never get weirder as you go along. So the spirit that you bring into it at the very beginning sticks around even when you pare back some of the strangest stuff. I think where we ended up with Hey is an extremely friendly, bright, colorful, human design. With a lot of workflows built around real human problems. We like to build software that's for people not for computers, and that's a much harder problem to do because a lot of times you end up fighting the computer to get it to work the way you want.

**(00:06:57)** So there's a lot of stuff in Hey that has that sort of spirit behind it and I'm proud of that.

**Shaun: (00:07:01)** Most of what we do at Basecamp is working on an existing product but this was sort of a chance to make something completely brand new. Can you talk a little bit about the differences of product development for a brand new product versus an update to Basecamp?

**Jonas: (00:07:18)** Yeah, it's a totally different experience for a couple of reasons. One is that when you're building onto an existing product that's already out in the world, there are a lot of different constraints that you have to bide by that you don't have when you're doing something brand new. Like we can't materially change Basecamp 3 in some fashion that's like, totally unknown and confusing to people who are already using it. There's also less discipline around the output having to be perfect and bug free and fully functional. We can spin up some 95% broken prototype and use it and test it and see, like, how do we feel about this? Without worrying about customers using it.

**(00:07:57)** So those are the two big differences. The other difference in this case is that we have almost 20 years experience, now, running Basecamps. We've done three different versions of Basecamp over the years. We know that domain very well. We've worked on that problem and so if we're going to go into Basecamp 4, we have a lot of prior art. We can say, okay, it should do all of these things that we already know a lot about. Going into building an email service, we do know some of this stuff because there's some overlap between what email does and what Basecamp does. But it's fresh. It's not something that we have a lot of long-term experience in. So that's also a big difference, too. We're kind of winging it in terms of our internal knowledge.

**Wailin: (00:08:37)** What things did you think you knew or assumed to be true about email that got blown up or completely reimagined while you were building Hey?

**Jonas: (00:08:48)** Well, one thing that really seems silly is that just showing emails, just rendering what an email looks like is very difficult. It's a really hard problem because email's this old technology and there's really no standards around how you format email and how you design it. It's a well-known problem in the design community that designing emails is brutal because most of the email clients are old or inconsistent, and so to get a design that looks nice in an email that works across clients is hard.

**(00:09:20)** So we've had to experience that, like, the totality of that problem and figure out how to do it so that emails look good on a phone, and they look good on a desktop and every possible gross email that gets sent from a marketing person or from LinkedIn, or just your friend writing a plain-text email. Those all have to look good. And it seems like this basic, silly thing that shouldn't be hard, but it's actually extremely hard.

**(00:09:45)** As we found out, it's one of the hardest things.

**(00:09:47)** So there's a lot of stuff in this product that's like that, where it's like, just getting the basic thing to work is a huge amount of work beyond just the new ideas that we wanted to bring to the table.

**Shaun: (00:09:59)** Do you have a favorite thing, little thing that you designed in Hey?

**Jonas: (00:10:02)** There's two features in Hey called Reply Later and Set Aside. They're designed to be little buckets that you can triage emails into that you need to deal with in the future. They're very human designs in that they don't make any assumptions about what you, about the time you have or what your intentions are. They just give you a place. A nice, comfortable place. The idea for them was, you know, when you get actual paper mail. You'll go out to your mailbox, and you get a bunch of mail. Typically you'll sift through it and then there might be two things that you need to deal with immediately. And then the rest of it you kind of just stick in a pile. You'll be like, well, I'll deal with that later. And then at some point that pile is sitting on your desk. It's in your peripheral vision. And there's just like, bills in that pile. I gotta take that out. So you take it out and you sift through it and you throw the rest of it away and you pay the two bills and you're done.

**(00:10:56)** The same thing happens in email where you'll get a ton of email during the day, a little bit of it is important. Most of it you can deal with later, and then there's a few things that you're going to need in a week that you don't need right now. There's a bill you have to pay but it's not due for a week and you have to get your paycheck before you can pay it. So we designed those features around that idea. There's the natural human workflows.

**(00:11:18)** So the way it works in the app is these two little buckets sit in your peripheral vision in your inbox. And when you click on them, whatever you've stacked up in there kind of fans out in this little bouncy fan. And it's just a little joyful interaction that I love. And I like the idea and the sort of philosophy behind those features. So those feel like really playful, but also important and fundamental features. So that's stuff I think I like the best. I think.

**Shaun: (00:11:49)** How early on in the design process were those pitched?

**Jonas: (00:11:53)** Originally, they were more kind of traditional. Like, set aside was called pinning and it was just, it worked like a regular inbox pin that you would expect where you would pin it and then pinned stuff would float to the top. What we found is that that idea is problematic because what happens is… Let's say you have concert tickets that you bought online but the concert's not for three weeks. So you need the tickets. You want the email with the tickets, and you want it to be available and sort of top of mind. If you pin it, like in a traditional app where pins are stuck to the top, now you've got this concert tickets thing in your face, at the top, in the way of other things. But you don't care about it for two weeks. Now is not the time that you need that there. But there's no other way, because it's like, that's how software works. It's just like, that's the only way you can do it.

**(00:12:42)** So, as we started to learn and work through these problems, we figured out this idea of peripheral vision. The pin feature morphed into the set aside feature. So now it still works in a similar way where that stuff is still available right away, but it's not in your way.

**(00:12:57)** And then, I think Reply Later kind of started as snooze. A lot of email apps have this snooze thing where it's like snooze for two days. So the email goes away for two days and then it comes back. And we kind of thought that that's fine, but we wanted something that's just simpler. Because the problem with snooze is then there's all this machinery about how long does it snooze and when does it come back, and when it comes back, then what do you do? Is that the right time? What if it comes back in a day and you still don't want to deal with it? Do you snooze it again? It's just like, it gets pretty fiddly. So we built the Reply Later feature kind of as a replacement for that.

**(00:13:34)** And then on top of that, Reply Later has a mode where you can batch reply to all the things that you've stacked up in there, which is another sort of amazing feature of Hey.

**Shaun: (00:13:43)** Can you think of any low points in the design process? When did it get really, really hard?

**Jonas: (00:13:49)** There's sort of phases when we do work like this. There's a long phase that's exploratory like we've been talking about. And then there's sort of a middle phase where you leave the exploratory moment and start building it. And I always find that to be probably the most difficult time because when you're exploring, there aren't a lot of stakes. It doesn't really matter what you're doing. On some level, you can just keep going until you're bored. But when you start getting real with it, it forces you to start making decisions and figure out where are we going with this. It's like, you don't know the vision of the product until you make the vision of the product. It's like a Catch-22.

**(00:14:30)** There was a period where we were wandering a little bit, trying to figure out what are the core elements of this thing, what does it really do, what's critical? And we hadn't gotten there yet, but we were kind of building it and that's a nebulous time. So I remember that being a little difficult. And then the other difficult time is the end. Now we're very close to launching. That's very hard because you're like, scrambling to fix hundreds or thousands of little problems and you're trying to synchronize all the teams together for everybody to get the apps working the way they should and look similar. So that's also a challenge.

**(00:15:06)** So it's sort of like the beginning is easy and then the end is hard and then there's a middle point that's kind of hard.

**Shaun: (00:15:16)** How do you manage your workload in these last few weeks?

**Jonas: (00:15:20)** Well, we pretty much have everybody on highest priority work to the extent that we can. So we've been getting together frequently, walking through the product. Trying to pick out difficult things. Our QA team has been doing a great job picking out critical stuff. We're also running through things that maybe we don't see as much when we're just using the app day to day. Like we're working on onboarding and payments and sign up and security. There's no way to have anywhere near to perfect software. Software is always just fundamentally busted in a bunch of different ways. So it'll be busted in a bunch of ways, but we wanted it to be not busted in any ways that are critically important.

**Shaun: (00:15:58)** I have a hard time releasing something that's not polished, right?

**Jonas: (00:16:01)** Yeah.

**Shaun: (00:16:01)** How do you work that out in your own mind, of saying, you know what? This is good enough.

**Jonas: (00:16:06)** There's a little thing that we go by, which is that if you aren't embarrassed slightly when you launch, you waited too long. You could continue to polish something for years. We could wait five more years to launch Hey, and probably still have plenty of work to do. We could just keep building features, we could keep fixing bugs, we could keep making it nicer for ourselves, but at a certain point, you need to just get it out there and let the world tell you what it thinks of what you made.

**(00:16:35)** The only way to make that happen is to essentially set a date, and just be like, there is a day that we're going to do this and we're going to cut it. If there's some catastrophic blocker that we discover in the meantime, maybe we'll push the date back. Otherwise, just do it. People are going to report broken things and you're going to get all manner of feedback, some of which will be very negative. But that's just the job. That's the game we're playing. So you just go for it.

**Wailin: (00:16:58)** I mean, in this case, we did push the launch back, right, just because of massive external factors in the world messing with our release schedule.

**Jonas: (00:17:07)** Yes, which we, to be honest, we have a history of always doing that. I've been at the company for almost nine years. I think I've launched four new products in that time. Probably all of them, our original launch date got pushed back a bit. And then, in this case, so we originally were planning to launch this in April. And then the global pandemic occurred and we were like, this isn't going to happen for a bunch of reasons. Too hard for us to focus and it's not the environment you want to be launching something in. It should be a celebratory moment and that was not a celebratory moment. So we pushed the launch back to June, which also is good because I don't think, actually, the product was ready in April.

**Wailin: (00:17:48)** I feel like your professional journey at Basecamp has been interesting in the last couple of years while you've been building Hey, because you got a promotion right in the middle of it. I looked up when Jason announced your promotion and it was April of 2019, so that's almost the exact halfway point, right, of the Hey development process? How did your responsibilities then change once you were given more of a leadership role?

**Jonas: (00:18:11)** So I guess it's been about a year I've been the design team lead. Largely, kind of synchronization and support role, really, is the way I think of it. It's managerial in a sense, but we're a company where everyone is very good at managing themselves. We're the classic thing is the managers of one. So for me the role is more about bridging the decisions coming from product management, which is David, Chase and Ryan and me and a few other people. Bridging that with the rest of the design team. Coordinating those efforts. Supporting the designers. Getting people to talk to each other. Working across platforms so that the iOS and Android teams know what's going on with the web teams.

**(00:18:56)** This has been an interesting time to try to get into that role because we also are shipping a new product which is all-consuming. So admittedly, my management time has not been great in the last month or two because we've been so busy just trying to get the product done.

**Wailin: (00:19:11)** Has building Hey, as you do it in these last few months which have been kind of very weird for the entire planet, has it felt like Basecamp Calm ™ or has it felt like a struggle to maintain that signature Basecamp calm.

**Jonas: (00:19:28)** Candidly, I would say that this is not our calmest time. Compounded with the fact that the world has also been bananas. It's been a difficult period. I've been through enough launches, there's sort of an ebb and flow to doing product work and we're in one of those times where it's flowing very high. When you're launching something, it's just a different degree of velocity, basically. You just have to get a lot more done in the time you have. And it feels more stressful. Everyone is assigned the maximum work that they could have because we're all leading up to this deadline. We're also inventing something that doesn't exist, so there's a lot of tension in that. A lot of disagreements happen. There's a lot of uncertainty. People don't necessarily know all the same information all the time. So there's arguments about the direction, or about decisions that are being made.

**(00:20:21)** And that just comes with the territory. Like I said before, it's kind of the game we're playing. But all of that adds to a higher stress situation, versus if we're just developing features for Basecamp 3, that's already out there in the world, that's a calmer circumstance just fundamentally. Because it's an existing product, it already has a lot of decisions made, you're kind of just fitting things into how it works, versus here, you're like, inventing the entirety of an ecosystem. How does any of this work? How does it all fit together? It just, that's more difficult and more stressful.

**Wailin: (00:20:51)** You had written a note to the whole company, this is maybe a week or two ago, where you said, let's take stock of how far we've come and how special and neat this is. I don't know, I guess I just really appreciated you posting that. It felt like something that a lot of people in the company needed to hear. They just needed to look up from their very busy work lives for a second and take a breath and reflect.

**Jonas: (00:21:15)** Yes, it's hard to reflect when you're deep, deep deep in the weeds on something. And this is any project. It's not unique to product design. If you spent two years focused on some work you're doing, whether you're writing a book or you're painting a painting or whatever your work is. It's sort of hard to step back and look at that from an outside perspective and reflect on what you did. And so that was a sort of happy accident. And I do this thing where, especially when we're prototyping, I take just a million screenshots all the time. We'll work on some feature and I'll do 50 variations of that design, and then I screenshot each one and then I text some of them to Jason and that's it.

**(00:21:54)** And once in a while I do a thing called screenshot bankruptcy where I just kick everything out of there. So when I was switching computers, I was like, oh, it's screenshot bankruptcy time, I better look, and went through all of it. And I didn't intend to do it at that moment, but it was the reflective moment where I was like, whoa.

**(00:22:08)** We are a little company of 50 people and we took on a very difficult, ambitious project. Gave ourselves, basically, two years from start to finish to do it and we built a thing that is really great, and I'm very proud of and that works and I'm happy to use. I prefer to use it. That's a great achievement. It's really cool. We'll see what happens when we release it to the world. I don't know what's going to happen. Hopefully people will like it, too.

**(00:22:37)** But whether that happens or not, I'm proud of the work we did and I think we, as a company, got a ton out of it, even if it's been stressful at points.

**Shaun: (00:22:47)** As we're recording this we are less than a week away from launch. Are you excited?

**Jonas: (00:22:52)** I am excited. Yes. Just in the last couple of weeks, I got excited. I have this internal mechanism that tells me if something is feeling right. I can't explain it really. It's really just a feeling and it's based on my own sort of comfort level with using the product.

**(00:23:13)** So if I'm using the product and I'm bumping into little bits that I feel like aren't resolved or there's some areas that don't feel right, then it makes me feel like we're not ready. At some point in the last couple of weeks, that feeling sort of drifted away.

**(00:23:31)** So that makes me excited. There's definitely tons of stuff, still, that I'm not happy with, but we're close enough now that the stuff that I'm not happy with isn't so critical that it's going to be a show-stopping problem. So that feels good. It feels like we're like there on the cusp of the right time to have it out there.

**(00:23:45)** So I'm very curious to see how people like it. It's going to be great.

**(00:23:48)** Broken By Design by Clip Art plays.

**Shaun: (00:24:01)** REWORK is produced by Wailin Wong and me, Shaun Hildner. Music for the show is by Clip Art.

**Wailin: (00:24:07)** You can find show notes for this episode at rework.fm where you'll find show notes and transcripts for all our episodes. Jonas is on Twitter at @JonasDowney and we're on Twitter at @reworkpodcast.
