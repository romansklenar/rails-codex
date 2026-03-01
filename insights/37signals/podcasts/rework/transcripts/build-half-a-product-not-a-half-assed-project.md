---
title: "Build half a product"
description: "You can’t do everything you want to do and do it well."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/build-half-a-product-not-a-half-assed-project/
tags:
- podcast
---

# Build half a product

**Shaun Hildner (00:01):** Welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m your host, Shaun Hildner, and let’s get right into it. As always, I am joined by Basecamp’s co-founders and the authors of REWORK. Jason Fried, how are you?

**Jason Fried (00:15):** Good, Shaun, how are you?

**Shaun Hildner (00:16):** Good. And David Heinemeier Hansson, how are you?

**David Heinemeier Hansson (00:19):** I’m good.

**Shaun Hildner (00:20):** Good, good. This week we’re talking about building half a product, not a half-ass product. You know, there’s going to be a few episodes coming up that are about deciding what is necessary as you begin to build a product. What was missing from Basecamp on release?

**Jason Fried (00:37):** So the initial version of Basecamp, which we launched in February of 2004, didn’t have a way to share files, if I recall. And actually, to-dos were a latecomer, I think, to the product. We didn’t have to-dos for a long time. We had bullet points and messages, I think, originally, something like that. It didn’t have a calendar. It didn’t have automatic check-ins. It didn’t have a whole bunch of other details and tools and small little things. It didn’t have color coding on documents. It didn’t have folders. We didn’t even have a docs and files section. We had this idea of a files thing eventually, but you had to link things up from external sources and you couldn’t create your own document. Then we edited write board later on, which was a collaborative writing environment thing.

**Jason Fried (01:27):** It’s probably a fraction of what it has now, but the core is fundamentally the same, which is, project management’s about communication, not just about charts and graphs and reports. So Basecamp has added charts and graphs and reports over time, but most of those are actually for communication, less so than just something to ogle at. So anyway, David, you may have some other thoughts about things it didn’t have, but those are some quick off the cuff remembrances.

**David Heinemeier Hansson (01:52):** Yeah, I think there’s just a million things it didn’t have on the technical side of things. The resilience, the backups. We launched everything on a single server that was hosted, I was about to say in the cloth of some company. It wasn’t quite the closet, but it was this local Chicago company called Tilted, where we just from the get-go, and remember the pricing, it was $249 a month. It was the first server we launched on. And we had the one box, and the database ran on that box, the web server ran on that box, the everything ran on that box. And it was wonderful. It really was. There’s so much bliss about that enforced simplicity because, well, we couldn’t do anything else. The kind of technical infrastructure we have today, there’s no way we could have run that then with the people we had.

**David Heinemeier Hansson (02:38):** So we went with something much simpler. And do you know what? It was fine. It was not only fine, it was great. And I think this is one of the things that is often forgotten today, that people think they need to start with the whole honking big machinery, duplicate everything, whatever. That single box did not just service for launch. It served us for I think a year and a half, a year and a half before we needed more. And by that year and a half we had thousands of customers. This is why I sometimes get frustrated with people who are starting today, because they have this notion that, “As soon as we get out the gate we already have to be ready for that mega scale.”

**Shaun Hildner (03:22):** Right.

**David Heinemeier Hansson (03:22):** When, do you know what? If you were just focusing on half the stuff on the technical side, on the design side, on the product side, and just building out those and running with scissors a little bit, right? Doing all the things that don’t scale in terms of how you reach out to customers, in terms of how you built your setup, you’d have time to focus on the essentials, on the epicenter, as we used to talk a bunch about.

**Shaun Hildner (03:46):** Oh, we’ll talk about it next week, in fact.

**David Heinemeier Hansson (03:48):** And that’s just better. And this is why I think I have such fond memories of that, because that’s the most fun part. The epicenter has more of the stuff that engages your creativity in a way where you just go, “Holy shit, work is amazing.” Because there isn’t capacity to do anything else, you don’t feel bad about it. Right now, for example, I just came off a call with another couple of people at Basecamp. And we were just talking about all the things that we feel slightly bad about not doing, because at scale, aren’t we supposed to?

**Shaun Hildner (04:21):** Right.

**David Heinemeier Hansson (04:22):** Those conversations never happened. Literally for years we had no conversations about feeling bad about all the things that you could have, should have, maybe kind of ought to do, because it just doesn’t come up. And I think that that is just that moment of bliss. And we talked a little bit about that in some of the earlier episodes, where you need to … Well, don’t need to, but you should embrace that early phase with just such a bliss that this is not like, “Oh, it’s just so bad we don’t have all these things.” It’s like, “Oh, isn’t it great we don’t have anyone to do that so we don’t feel bad about not doing it?”

**Shaun Hildner (04:59):** Yeah.

**David Heinemeier Hansson (04:59):** We’ve talked about this a bunch lately as we’ve been growing the company more and marveled over the fact that we could go for 20 years and process hundreds of millions of dollars without having anyone on accounting. And now at this stage, that’s not prudent. In fact, that’s kind of reckless. But it also was totally fine for a very, very long time. And not only was it fine, it was better.

**Shaun Hildner (05:25):** It’s 20 years later, you build a new product, HEY. In what ways is HEY half a product? What is missing from that? You didn’t have the same constraints as you did when building Basecamp.

**David Heinemeier Hansson (05:38):** Yes, we did, actually, in part, if I may just intercede.

**Shaun Hildner (05:41):** Yeah, great.

**David Heinemeier Hansson (05:41):** Because the magic here, at least in my opinion, and why it’s so fun, why I had such a great time with us building HEY, was it had exactly those constraints. When we started on HEY it was Jason, me, and Jonas, I think, were three people basically starting up a brand new product. And we ran really far before we started involving the rest of the company. There was absolutely a B1 within more or less three people plus, minus a little bit of help here and there. And then before we went to launch we did apply the whole thing. But we got to define the core of what it was with the constraint of three people working on it, which incidentally was exactly the magic number we used for Basecamp B1 as well.

**David Heinemeier Hansson (06:29):** There was Jason and it was Ryan and it was me, and then we had Matt, who mostly did other things. So in terms of who worked on the product and defined what it was, the magic number was three. And we kept it like that. Now, it ended up getting more, but maybe Jason could talk about it, we still launched with a bunch of things you’re like, “What? An email product didn’t have that?”

**Jason Fried (06:49):** Yeah. One big one, of course, is the calendar. We don’t have a calendar in HEY yet, something we would like to do. A lot of people would assume that calendaring and email are different, but they’re really pretty tightly integrated. So we don’t have that. I was just pulling up my notes. I’ve got a notes document here of all the ideas that I’d like to see us do, and it’s quite long, and none of these things are in the product right now. But we didn’t have signatures when we launched. For example, search, which is something we’re working on this cycle, we don’t really have advanced search or refining a search. It’s just like you can search and that’s it. And it’s time to finally allow that.

**David Heinemeier Hansson (07:24):** We didn’t email import.

**Shaun Hildner (07:26):** Right.

**Jason Fried (07:26):** Yeah, we can’t pull email in from other services. For a while we didn’t let you even just drag addresses between the to and CC field, things like that. I don’t think initially we allowed you to have multiple email addresses per person, we eventually added that so you could merge. A lot of the fundamental things. In any product design, whenever you launch something you have to figure out what’s worth doing, which is the whole point of this chapter, half not half-ass. And where are your values and what do you think is going to make a splash? So for example, there’s some fundamentals we knew we had to have in HEY, but there’s also a bunch of stuff we knew we could do later and it’d be more valuable to have something more novel initially.

**Shaun Hildner (08:02):** Right.

**Jason Fried (08:02):** Because if you’re launching something brand new and bringing some new ideas to the market, you’ve got to double down on the new part of it. You’ve got to have some table stakes in place. You’ve got to get some basic stuff right, obviously. But you’ve got to bring a lot of novelty. And so we focused on that for the initial version and we’ve been backfilling some of the fundamentals that we didn’t have, and then also continuing on the novelty. Because if you stop in the novelty you lose steam.

**Jason Fried (08:27):** So for example, we launched something called cover art last year, which is a very novel idea, which is a novelty on top of a novelty. Because in HEY we have this idea of previously seen emails, which show up below your unreads. And some people didn’t want to see things they already had seen but they wanted them close by. So we had this idea, instead of hiding it, we could cover it with a piece of art like a desktop pattern. And so that novelty was only possible because we had this other novelty called previously seen. So we keep layering that on, but we still backfill on the basics. That was our calculus for HEY, knowing that there’s stuff that’s missing that people are going to want, but we were okay with that because we wanted to give them other things that they didn’t even know they needed.

**Shaun Hildner (09:10):** In either product, have there been any ideas that you’ve thought, “You know what, let’s save this for V2,” or, “This is something I’d like to add later,” and then later comes and you think, “Ah, this wasn’t a really that good of idea anyway,” or maybe the product went in a different direction. Are there any examples of those?

**Jason Fried (09:27):** It’s typically, what it typically is is this sort of advanced version of something. So I’ll give you an example, like cover art. Cover art we ship with, your account I think has, is it like six or nine predesigned things? And you can upload your own custom one. And you want to be able to save the things that you’ve uploaded so you can switch between things, but we don’t have that. Or later on, it’s always like, “Yeah, later we can,” is what we usually say. Or we call it like V1.1 in our head, as V1.1, meaning the version after the initial release, we could backfill it and make it possible to save previous things you’ve uploaded, or to randomize the display, which we don’t do, or to bring in more dynamic versions of this.

**Jason Fried (10:11):** So if you could just subscribe to a monthly updated cover art that just shows up every month, there’s all these things you can do. And if you just keep going down that path you’ll never ship the thing, because you can keep adding more things. So at some point you draw a line, you go, “This is enough. This is the core idea here.” And then V1.1, which again is our internal lingo, we can add more stuff. Many of those things we don’t add. So we haven’t added a single thing to cover art. We’ve talked about it, but we haven’t found it valuable enough yet to get back to that to do those things. That’s just one little corner of the product and there’s probably many more. David maybe has other examples.

**David Heinemeier Hansson (10:44):** This is the magic of Shape Up’s six week budgets, that they force you to pick those things. And then we play this mind trick on ourselves, which is that we keep coming up with these good ideas and say, “Yeah, yeah, we’ll do them later.” And we know it’s not going to happen later. Or at least there’s a 95% chance it’s not going to happen later. But just the V1.1 concept allows you to feel psychologically okay with the fact that you’re leaving things out, because you have to leave things out in a six-week cycle. And that’s how you end up with 1/2 or 1/4 or 1/8 or 1/12, because you have this explosion of ideas. And this is what everyone gets sucked into, because it’s so intoxicating. Like, “Oh, what if it could also do this? And then it could also do this, and then it could also do this.”

**David Heinemeier Hansson (11:32):** We talk about this in so many ways, that software is so malleable and it’s not physical and it can just sprout all these branches. And that’s fun and you should indulge in that, because that is part of the creativity and interestingness of making something out of nothing. But you need these constraints. Because as we talk about so often, if we didn’t have these constraints, we would build the same bloated shit as everyone else.

**Shaun Hildner (11:54):** Right.

**David Heinemeier Hansson (11:55):** You need these constraints. You need to have fewer people than you’d ideally want. You need to have less time than you ideally want. It’s the tension from the constraints that produces something great. Now, that’s how you make a kick-ass … Well, that’s how you make a half. I think the kick-ass part is almost as important. I was just talking to someone else who was telling me about a new thing that they were working on. And one of the things was like, “Oh, it did this and it did that and then it did this.” And then he was talking about, “Yeah, but some screens also take 10 seconds to load and some of it kind of fails to send.” And I went like, “Yeah, that’s not a kick-ass half.”

**Shaun Hildner (12:33):** Right.

**David Heinemeier Hansson (12:33):** That’s just, well, first of all, it’s not even half. But even if it was half, it’s certainly not kick-ass. The commitment we make is, we ship good stuff. Doesn’t mean it’s perfect, but it’s high quality. And we let that be part of the constraints. It’s like you don’t just get six weeks to cram in all the shit you could possibly imagine by running with scissors and tripping over it and just making a mess of it. No, it has to be good. And the back of the cabinet has to be good too. You don’t get to make a mess that someone else has to clean up later, or not even clean up, but just look at.

**Shaun Hildner (13:08):** Yeah.

**David Heinemeier Hansson (13:09):** I open up the code bases we work on all the time, and then I smile most of the time. And then occasionally I’ll spot one corner of it where I go like, “I kind of wish we didn’t,” right?

**Shaun Hildner (13:20):** Right.

**David Heinemeier Hansson (13:20):** But generally we hold the line on quality. Not to the point of perfection, because that’s just going to be its own rabbit hole. But to the point of, this is quality stuff. And it’s quality stuff in ways that customers won’t even appreciate, but we will appreciate that this is the ying and yang of it, that you make half, but you make it good. If you just make half and it’s also shit, then …

**Shaun Hildner (13:45):** What’s the point?

**David Heinemeier Hansson (13:46):** What’s the point?

**Shaun Hildner (13:47):** Yeah. Am I right in assuming that it is much harder to make these cuts after the fact? When is the right time to decide what is going into a product? How much of a half are you going to make?

**Jason Fried (13:59):** It kind of almost happens to itself as long as you have a certain degree of discipline. Because you start with the simplest version of something. This is the epicenter thing, which I guess we’ll talk about next episode, this idea that what we’re always trying to get to is, what is the simplest version of this thing that we’re going to build? And we start there, and we only give ourselves a maximum of six weeks. So we can’t. There are some features, like 1% to 5%, let’s say, that we know, probably closer to 1% than 5%, that we know are two-cycle features.

**Shaun Hildner (14:31):** Ah, okay.

**Jason Fried (14:32):** But we build them six weeks at a time. So we don’t build them in 12 weeks, we build them, the simple version, six weeks, and we layer on more.

**Shaun Hildner (14:39):** You still take that cool-down, that break?

**Jason Fried (14:41):** Yeah.

**Shaun Hildner (14:41):** Uh-huh (affirmative).

**Jason Fried (14:42):** Yeah. And the second level is maybe completing the first level, but the first level could ship probably on its own, but we know it’s not quite complete enough. But for the most part, the time limit and our own internal discipline to get something out there, because that’s what we want, we want to ship stuff, forces us to figure out what the simplest version is first. And then we can always layer on later if we need to. And sometimes it’s frustrating because you go, “This doesn’t do as much as I’d like it to do,” but it’s better than what it doesn’t do today, which is, it doesn’t do it at all. So we’re better off getting that basic thing out that works. That’s why you’re not building a half-ass thing, which is something that doesn’t actually work. If it needs the second half to work, then it’s half-ass.

**Shaun Hildner (15:23):** Right.

**Jason Fried (15:24):** That’s the difference.

**Shaun Hildner (15:25):** So how is this different than MVP, something both of you have railed against in previous episodes?

**Jason Fried (15:30):** Well, the MVP notion is like, you’re not even building a full product. You’re building the minimum viable thing to test. It’s more about, you build it to test. I don’t personally like the approach of building something to test. I think you build something to ship.

**Shaun Hildner (15:45):** I see.

**Jason Fried (15:46):** As your thing.

**Shaun Hildner (15:47):** I see.

**Jason Fried (15:48):** Because I think if you only have this tiny, minimal core of something and you ask people what they think of it, they don’t have the whole thing to think through.

**Shaun Hildner (15:56):** Right.

**Jason Fried (15:56):** They don’t have all the context, they don’t have all the stuff. They just have this little small piece. And then you take that information, then you do something with it, but I think it’s incomplete information. So my feeling is, your 1.0, your initial version you launch, is both minimal, it’s viable, but it’s also the whole thing. It’s not a slice of what the whole thing’s going to become. Eventually you add more and more and more, but it’s not treated mentally as this thing that you’re just putting out there to see what happens. It’s like, no, this is the thing.

**David Heinemeier Hansson (16:24):** Which, I think if you apply that to the products that we build, you take Basecamp, for example, Basecamp, even for all our talk about half and less software and whatever, actually it does kind of a few things. In fact, that is its purpose for being, is that it’s not just a to-do manager. It’s not just a blog. It’s not just a file repository. It is all of those things. And if we had started with an MVP of Basecamp, you know what, maybe we would just have done a blog or another to-do manager. And do you know what? There’s just a trillion of those, and that’s not interesting. HEY, same thing. The feature roadshow that we had on the website when we launched had like 22 pages, I think. It wasn’t minimal in that sense, it was minimal in terms of, hey, what are all the table stakes?

**David Heinemeier Hansson (17:12):** We cut a bunch of table stakes, so to speak, away from it. But it still did a bunch of things. And you could have imagined that, well, if we thought HEY’s grand big idea was just the screener, an MVP of that would have been a plug-in to Gmail that did the screener. I’m not interested in making a fucking plug-in to Gmail. That doesn’t have any interest for me at all. And I think this is where you can go overboard with the MVP thing. You make the one slice of it and then you think whatever verdict comes back from the market is the verdict on the whole idea.

**Shaun Hildner (17:44):** Yeah.

**David Heinemeier Hansson (17:45):** Well, no, because you know what, this is like taking one ingredient. “Oh, I’m going to MVP an omelet. Oh, here’s some eggs.” Well, that doesn’t really tell me whether you’re going to like my omelet or not. We’ve got to make the thing. There’s some more ingredients here that are necessary for it. It’s not just a fucking box of eggs. The MVP for me is too myopic in that sense and just not interesting. And we like to make these kinds of products that are the mixture of all these things. The magic comes from the mixture. It’s not about, we are the greatest at reordering to-dos, or the screener and it’s just that, and we polish that to the nth degree. No, our ideas generally speaking have come from, “Hey, it does these things.” And it’s the combination of these things that makes it interesting.

**Shaun Hildner (18:35):** Well, I think that’s a great place to stop. I want to talk more about scoping and how do we come up with this list of initial ideas for a product. But I think that’s better for next week as we talk about finding the epicenter. Now, before we leave let’s take a question from one of our listeners. And this is from a listener named Mike, who writes, “Hi, just wondering, a question for Jason and David, any plans to revive the Getting Real YouTube series of screencasts? I really enjoyed the raw nature of them, especially the code walkthrough.” And just to make this a slightly broader question, how important is education as a product developer? How important is that to our marketing? Writing the books, doing the podcast, things like that.

**Jason Fried (19:16):** Dave and I have been talking about this on and off, about how we used to do more of this, and everyone seems to be interested in the behind the scenes stuff, and that we should do more of that again. We haven’t formalized it or figured out exactly how to do it, but we’ve talked about some ideas. I’d like to do something this year around that. We were supposed to do it last year. We had this notion, this idea of, I think it was called Basecamp Insider or something, this podcast series and a series of shows about behind the scenes stuff. And I think we’d be able to simplify the idea a little bit down to one show. We had this idea of multiple shows and this whole thing, but I think we should. So after this podcast, we’ll talk about it some more and figure out what to do about it.

**Jason Fried (19:56):** As far as education, sorry, it’s always been huge for us. And that’s why it feels like there’s a bit of a void here, because I think we used to share a lot more of that behind the scenes stuff. And I think part of it, if I can be honest about it, it got a bit boring for us because it was saying the same things over and over.

**Shaun Hildner (20:19):** Yeah.

**Jason Fried (20:19):** But what’s interesting is that there’s a whole new generation of, we’ve been around long enough now that there’s a whole new generation of people who haven’t heard any of these things. And we’re starting to say some of these things in different places and people are surprised by what they are hearing because they haven’t heard it before. So I think the time is right to kick that off again and get behind the scenes and get back to some of the basics about some of the ways we think about things and work and approach things. And I think it is great marketing for us. It’s probably the best we’ve ever had.

**David Heinemeier Hansson (20:45):** I think it also just becomes more interesting when you apply these lessons we’ve been talking about for two decades to whatever’s new. That’s the funny thing about many of these things. As we’re doing in this podcast, we take ideas that were written 10, 20 years ago, and then we apply them to what we’re thinking about right now and it comes out differently.

**Shaun Hildner (21:04):** Yeah.

**David Heinemeier Hansson (21:04):** But that’s, at least for me, what I need. I remember when we used to do the workshops, we did some workshops called Building a Basecamp.

**Shaun Hildner (21:11):** Mm-hmm (affirmative).

**David Heinemeier Hansson (21:12):** And I remember I could do about two repetitions, three at the most, where we would take the same material and just repeat it, and then I’d be just bored out of my mind. I needed something else. And we would mix it up or we would apply it to something else. So sometimes it’s about finding that, an avenue where you can take these principles you have and apply them to something topical or present and go forward. For me with the programming stuff it is often about showing something new. So when we work on a new product of some kind, that’s when I get fired up to show off what we’ve done in a way where, I’m sure I can keep mining Basecamp’s code base forever for lessons to extract, but it’s just so much easier if there’s something new to do it with.

**David Heinemeier Hansson (22:00):** And that’s the same thing with the open source. HEY was just an explosion of sharing when it came to the code and how we built the things on that end, because it required new solutions. So I think as we start diving back into new ideas and making new things in a variety of ways, we have a bunch of things we want to explore. There will be more of that naturally just bubbling out.

**Shaun Hildner (22:23):** Perfect. Thank you, Mike. If you have any questions for Jason or David, you can leave us a voicemail at 708-628-7850, or better yet, record a voice memo on your phone and email it to hello@rework.fm. And that’s the show. I want to say thank you to David Heinemeier Hansson.

**David Heinemeier Hansson (22:39):** Thanks, Shaun.

**Shaun Hildner (22:40):** And thank you for joining me, Jason Fried.

**Jason Fried (22:43):** Great to be here. Thanks for having me on.

**Shaun Hildner (22:45):** Sure.

**Jason Fried (22:47):** That’s what everyone always says on podcast, “Thanks for having me on.”

**Shaun Hildner (22:59):** REWORK is a production of Basecamp. Our theme music is by Clipart. We’re on the web at rework.fm, where you can find show notes and transcripts for this and every episode of REWORK. We’re also on Twitter @reworkpodcast. If you’re following along in the book, next week we’ll be discussing the chapter, “Start At the Epicenter.” And if you like the show, I’d really appreciate it if you would leave us a review on Apple Podcasts, Spotify, Overcast, or wherever you’re listening to this.

This is an episode title
