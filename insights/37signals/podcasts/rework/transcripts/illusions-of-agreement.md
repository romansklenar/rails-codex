---
title: "Illusions of agreement"
description: "Simply describing your pitch can cause the illusion of agreement."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/illusions-of-agreement/
tags:
- podcast
---

# Illusions of agreement

**Shaun Hildner (00:01):** Welcome to REWORK, a podcast by 37signals about the better way to work and run your business. I’m Shaun Hildner and as always, I’m joined by 37signals co-founders and the authors of REWORK. Jason Fried, how are you this morning?

**Jason Fried (00:14):** I’m doing great. How are you, Shaun?

**Shaun Hildner (00:15):** Good. And David Heinemeier Hansson, how are you?

**David Heinemeier Hansson (00:18):** Good, good, good.

**Shaun Hildner (00:19):** This week, we are talking about the chapter Illusions of Agreement and it’s all about removing levels of abstraction. And I think maybe we should start out with a primer of what the getting real method is. What does that mean when you say, “getting real”?

**Jason Fried (00:37):** Getting real for us typically means… Well, it can mean a few different things, but it mostly means we let’s look at something. Right? So looking at something could be looking at a sketch, it could be building something and then looking at a prototype early. It’s all about getting to something that we can look at, so we’re not imagining something. Because when you imagine something, we’re naturally all going to imagine different things. Sometimes our imaginations are lined up, but oftentimes they’re off enough or different enough that we think we are agreeing with one another about what the other person is talking about. But, when you look at something together, a sketch, a prototype, a mock-up of some sort or something like that, you go, “Oh, oh, that. Now we all have a shared understanding of what we’re talking about.” So that’s what that’s all about.

**David Heinemeier Hansson (01:25):** I think what’s funny about this is that the illusion of agreement is not just between different people, it’s even within a single person. You think you have an agreement with yourself about how something should be done, and then you see it in the flesh as a screen or something and you go like, “Oh, actually, no. No, no, I was wrong on that one, I was just mistaken.” And that’s what often happens with high level architect types in the technical realm or high level conceptual designers on the design side, you lull yourself into thinking you have figured it out. That, hey, I have a plan here, I have a conceptual model of how it should work. I’ve written it down, I’ve spelled out the steps. And then you see it and you go like, “Well, I don’t even agree with myself. I said that it was supposed to be like this. And in reality, that is not what I want.”

**David Heinemeier Hansson (02:24):** And I think this is that fundamental truth that’s been driving the agile software development movement for decades, is the idea that no one knows what they want until they see it, including the designers. This is why, I mean, in industrial design, car design, they spend so much money and time on clay models. You see, you have this CAD model of what the car is supposed to look like and you go like, “Oh, this looks great.” And then you build the clay model and you go like, “Oh no, the proportions are off. I can tell now that this isn’t the right design, we need nip tuck here and there.” Having something real is what tells the truth.

**David Heinemeier Hansson (03:06):** And we’re actually not that good at imagining things.

**Shaun Hildner (03:10):** As humans?

**David Heinemeier Hansson (03:11):** As humans, right?

**Shaun Hildner (03:12):** Yeah, yeah.

**David Heinemeier Hansson (03:13):** I mean, that just starts with yourself, it starts with you as a designer, as a programmer, whatever. And then it just gets exponentially harder when you involve other people.

**David Heinemeier Hansson (03:21):** Oftentimes, Jason or I will be working on something and we will have that illusion of agreement with the thing we’re on. And I’m like, “Oh wow, okay, we’ll figure it out once we get real.” But, you add like two, three, four other people on it, we’re sitting four or five people discussing something, it just gets exponentially worse. Which is also why I think a lot of large team productions, what they produce ends up not so great many times, because you have these illusions of agreement. You’ve lined up the gears, this is where we’re going. And then it gets hard to stop it. There’s this race to something real, to getting real, to have running software, or if not running software then a close approximation.

**David Heinemeier Hansson (04:07):** Although I’d say, I mean, compared to what we talk about in the chapter, which is prototypes and so forth, we usually run to something more real than that. It starts with a sketch by Jason that eliminates some degree illusion of agreement. If you have just written down the pitch, okay, some of it is gone, but there’s still a fair amount left. And then you get to the running software. The thing that does something, you can click it, you can watch the flow.

**David Heinemeier Hansson (04:34):** So part of this is that it’s layered, right? The illusions of agreements is a pie chart, we’re cutting out first of 40% by having Jason’s pitch sketch. And then we cut out another 40% by having the first part of the running software. And now we’re 20% away from, okay, we’re in agreement.

**Jason Fried (04:50):** I think the other thing I would add too, is it’s not just about accuracy of the idea, it’s about like the completeness of the idea. And a feature we just shipped yesterday was called BubbleUp, which is a great feature, it’s our take on snooze in Hay. There was a feature though that we didn’t anticipate initially, that’s part of this. It actually turned out to be really critical, which is this pop concept.

**Jason Fried (05:11):** The initial idea was you can bubble up an email later, so let’s say you get an email and you want to see it on Friday and today’s Monday, you say bubble this up Friday. So it goes away, comes back up Friday into a section called BubbleUp at the top of your inbox. Now, the original idea sort of stopped there. And then if you looked at that email, it would then leave the BubbleUp area and go back into the standard email flow.

**Jason Fried (05:33):** But, after we began using this for literally 10 minutes, we go, oh, this needs to stay there, it can’t go away. I need this because it popped back up, I’m interested in seeing what it is. So I click it and then if it went away, I’d be frustrated. So we had this idea that these bubbles should float to the top and stay there until you, quote, “pop” them. And we had to use the real thing.

**Jason Fried (05:57):** Now, it’s possible, someone could say, well, it’s possible, you could have just thought of that. And that’s true. It’s true.

**David Heinemeier Hansson (06:03):** Yeah. Yeah.

**Jason Fried (06:04):** But, really, the reason why we came to that is because we began to use it and then that became very clear. And the only way to do that is to use something that’s pretty real. And it was quite real and quite obvious the moment till we began using it.

**David Heinemeier Hansson (06:16):** And what’s so fascinating about that is that the difficulty of design, when you use something real, in that example, it was so obvious. You did not need to be a genius to see that this wasn’t working. We could all see it wasn’t working. Why would you invest so much time trying to imagine all the edge cases and considerations there could be with some feature that requires quite a lot of intellectual conceptual firepower to spin up that entire universe in your head, when you could simply just build the thing and just go, in 10 minutes, as Jason said, oh, this isn’t right? No, no, no, it can’t just disappear. And it’s just apparent to all. It’s no longer a hard design problem.

**David Heinemeier Hansson (07:00):** And I think this is one of those vintage 37signals thing, is we try not to solve hard problems. Can you just move this problem either in time or in concreteness? And then suddenly a very hard problem, like imagining the fact that the bubble can’t go away, just purely in your head becomes a very easy problem when you’re seeing the reality of this not being right in the real world. It just transforms a whole class, if not the majority of design problems from being very difficult to being substantially easier.

**David Heinemeier Hansson (07:33):** Now, not everything is as easy as to go like, oh, it has to stay there. Sometimes you’ll face it. But at least you’ll know, right? That’s the thing. At least it’ll be apparent. You’re highly unlikely to miss a glaring omission of design when you’re looking at something real and you’re actually using it. I mean, that’s the important distinction here, you’re not just looking at it, right? This comes from usage.

**David Heinemeier Hansson (07:55):** And this is another, I think, critical part here is that we’re not just using this in a clean science room somewhere, tinkering with the abstract. No, no, no. We applied this feature to our own data and started using it with real data. This is another step of getting real. It’s not just about building it, it’s also about using it in anger, using it with something real and concrete, not fake data, not ipsum lorem, where things just look just right. You put in all the crappy real world data, the tests of design.

**Shaun Hildner (08:29):** The messiness, yeah.

**David Heinemeier Hansson (08:30):** All the messiness of reality. And then immediately it’s clear where it sticks out, where reality sticks out and you go like, ah, okay.

**Shaun Hildner (08:39):** When you go to present a new idea, a new feature or something, David was saying, you start with a drawing.But, even before that, how do you, within yourself, get to the point where you’re ready for a drawing or a sketch?

**Jason Fried (08:52):** An idea to use the term bubbles up, basically, you have some thought, and that could come from a million different places, but you have some thought about a way to improve the product or to add something new to the product or improve something we have. And you start to just think about it. I just start to think about it. And often I’ll I’ll sketch. Just, it’s like a big mess of just overlapping sketches, right?

**Shaun Hildner (09:14):** Yeah.

**Jason Fried (09:15):** It’s just thoughts that I try to create some structure out of the chaos that’s a new idea. And go, how could this work? But, that’s me trying to get real. It’s not real, it’s a sketch, but it’s real-er than a abstract thought. And then you get somewhere, you’re like, okay, this kind of works. I think there’s something here. And then I’ll bounce it off David or I’ll bounce it off someone else or whatever. And we’ll play with it a little bit. But, typically, the full blown pitch, which we call a shaping doc, when we shape up this idea, is typically words and pictures because they support each other.

**Jason Fried (09:51):** A picture doesn’t actually… What is it? Say a thousand words or whatever, it sometimes does but not when you’re just trying to describe a flow or how things work, because it’s just like a snapshot in time. So these things embrace each other and sort of explain each other. And that’s the first version of getting real, but it’s not that real because it doesn’t actually exist.

**Jason Fried (10:11):** It helps remove some of the illusion, to get back to the topic here. Some of the illusion has been cleared up and now we have a better sense of what we’re talking about. It’s not the answer, it’s a version of a potential answer, but at least we’re looking at something that we can all go, “I understand, at least, what I’m looking at here.”

**Shaun Hildner (10:32):** There’s some path to actually building the thing.

**Jason Fried (10:35):** I think paths begin to unveil themselves in people’s minds. Like, “Ah, we could do that or this could work that way.” It also just brings up questions that wouldn’t have been brought up otherwise, like, “How are we going to do that?” Or, “Here’s a simpler version of that.” Or, “If we do it that way, it’s going to take four weeks, if we do it this other way, it might take a week and a half.” It’s that stuff. But, at least you’re talking about something that you all know what you’re talking about.

**David Heinemeier Hansson (10:59):** And once you’re at that level, the level of the sketch, the level of the pitch, there is enough to do these feasibility spikes that I like to do with a lot of things. Because sometimes I’ll look at a pitch by Jason and I’ll have a hunch of how to do it, but I need to actually try it in the code to see whether we’re, as we like to say, cutting with the grain. Does it fit within the existing architecture? Can we easily get from a to B? And sometimes, quite early on, I’ll remark on something in my brain about the pitches like, “Oh, that thing might not be so easy.” And then we jump into these other phases, like trading concessions. I’ll do a technical feasibility spike and I’ll see what the code tells me, I’m reading tea leaves here from the source code. And the source code will reply back and it will say, yeah, here’s an easy path, here’s a straight shot, but it just can’t have this part of it. It doesn’t have this component of it.

**David Heinemeier Hansson (11:53):** And then we’ll go back and interrogate the pitch, usually means going to Jason’s, like, “How much do you really care about this part of it?” And sometimes he’ll go like, “I don’t care about it, it was a doodle, it was a scribble as part of it. It’s not consequential at all.” And other times he’ll come back and say, “That’s the whole feature.”

**David Heinemeier Hansson (12:14):** I mean, it’s funny. I was just thinking about another HEY feature we worked on. Every from and every to, which is this feature we build in where you can go to a contact page and then you can see every email a person has sent you or you’ve sent to that person. And there was a straight shot where that was simply on a topic basis, as we like to call it, a thread basis, that there would just be one line item for each thread. And we could have done that in half a day. And then the program I’m working on and went back to Jason is like, “Is this good enough? There’s a straight shot here.” And he’s like, “No, this would do absolutely nothing for us. This is not a useful implementation of this feature.” And we had to go to the long route and it took two weeks.

**David Heinemeier Hansson (12:58):** That’s a good illustration of the fact that sometimes on the technical end, you don’t have the full appreciation, even after reading a pitch about what’s truly important or not. And Jason might not even sit with it as he’s doing the pitch of knowing what’s truly important or not. But, once you start building it and you see what comes back from it’s like, oh yeah, yeah, yeah, yeah, no, no, this doesn’t work at all, unless it’d have this.

**David Heinemeier Hansson (13:21):** On the contrary, we’ve had plenty of examples the other way around, where we can cut something off that just feels like… Or that in the pitch, perhaps, gets some attention, but it isn’t a big deal. One we’ve really wrestled a lot with, and I find these to be the most interesting ones, was this participation types we just launched in Basecamp, where you can mark whether someone is working on something or whether they’re just following it. And we were following up trying to rejig how we then do invitations. And there were this approach about how we do client side, whether you can hide something for a client or not, we wanted to expand the concept.

**David Heinemeier Hansson (13:58):** And the code was telling us something very clearly, that there was a path here that would make it a straight shot, but it involved these trade-offs. And we weren’t quite sure what we felt about these trade offs. We went back and forth a bunch of times. It literally was the difference between, okay, we can do this in a week or we can’t do it at all this cycle, it’s got to be something we do next cycle. And it’s going to take six weeks because, as we also like to say, it requires digging up the concrete, we got to hammer away the concrete.

**David Heinemeier Hansson (14:26):** So much of this, the illusions of agreement is also sometimes the illusions of agreement with the computer. The illusions of the agreement with the source code. Like, well, I think this is easy to do, this should be straight shot. And then you get more and more concrete and you go like, oh no, actually not, not at all. This is very difficult.

**David Heinemeier Hansson (14:45):** And it’s funny too, because I see it from Jason’s perspective often. He’ll put out a pitch and something that just on paper or in the sketch seems trivial, turns out to be like, okay, that’s actually totally, really hard to do because of all these reasons, complicated reasons. And other times Jason will present something, “This is a four-weeker.” And I’m like, “Yeah, I could finish that in an afternoon.” Just because that’s just the nature of the materials.

**Shaun Hildner (15:12):** Right. Right.

**David Heinemeier Hansson (15:14):** Which is just what makes this whole thing so fun, and getting real so fun, is that we’re not engaging in these fantasies. The reality of hitting the materials straight on and working with the materials, not working in the abstract. One of the great historical ways of doing this wrong was back in the days of the Photoshop cutouts. A designer back in the early 2000s was someone who sat in Photoshop and pixel perfect at a design of what a web page is supposed to look like. And then he just said, hey, cut this out. Could not be further abstracted from the materials of the web. It was not HTML, it was not CSS, it was not JavaScript. It was made in this artificial vacuum where you could pixel perfect align everything.

**David Heinemeier Hansson (15:58):** The closer you get to the materials, the closer you are to getting real, the quicker you can start working with the real things. I mean, you’re designing a watch, you’re sketching something out on paper and you’re like, okay, what can we actually do with steel or gold or whatever?

**Jason Fried (16:16):** Yeah. This is, I think, important. The more complicated the idea, the more important it is to get real as soon as you can. You can months thinking about something or you can spend a couple weeks and then spend those months that you would’ve spent thinking, building the thing and having far better answers in the end.

**Jason Fried (16:34):** An example of this, I’ll give a little bit of something away is that we’re working on our take on Kanban in Basecamp right now. And this is a feature that we worked on this cycle and we’re going to work on it a bit more. We got a lot of it pretty close, but there’s a lot of things that as you start using it, you realize that certain concepts didn’t work or other concepts really work or things need to be tweaked. There’s no way to get to those answers unless you use the thing.

**David Heinemeier Hansson (16:59):** Yeah.

**Jason Fried (17:00):** Again, we could have tried to aim for perfection in the idea and covered every… We talked a bit about this already, but covered every edge case. Or not even edge cases, but just covered every use case abstractly. And the chances of hitting that 100% are very low and probably even hitting at 80% are very low. You’ve got to get in there and build the thing. And so we learned a lot over the last six weeks and we’re really close now. But, we need to use it some more and make a few more adjustments. We’re going to use it for real this next cycle internally before we release it to customers, whenever it’s done after that.

**Jason Fried (17:30):** So anyway, it’s just one of those things where it’s big new concept for Basecamp, it touches a lot of different things, there’s some brand new interactions in it and we had to use it. You have to use it to know where to go with it.

**David Heinemeier Hansson (17:43):** I’d also say building is just more fun. Building is more fun than thinking.

**Shaun Hildner (17:47):** I’m guessing, right.

**David Heinemeier Hansson (17:48):** And thinking is overrated. As we’ve said, you can drastically reduce the amount of damn horsepower you need in your head, if you just start building. And building is just fun. It’s fun to take something that is not really there and getting it out. I think a parallel, at least for me, is that I’ll have these thoughts in my head about what I think about something and then I’ll try to write about it. And that translation, the grading real part of taking a concept in my head and committing it to paragraphs is a way of getting real with that idea. And oftentimes I’ll change my damn mind in the process of trying to explain, first of all, to myself, what I really think about something.

**David Heinemeier Hansson (18:34):** And we have this happen over and over again when we build products too. We set out with one thing, we set out with one idea and we start building. And then the obviously right thing, the obviously better thing emerges through the process of building. And this is why building is just better. It’s more fun. You should race to building, spend less time thinking.

**David Heinemeier Hansson (18:56):** Now, part of that is that this only works if building is cheap, if it’s fast. If you work in a domain where building is literally skyscrapers and it’s going to take five years until you get the feedback on your idea, okay, different domain. We work with the web, the web has this amazing feedback loop and cycle where we can stick two people on an idea, one person on an idea, figuring out, does it work, does it not work? And we get results back right away.

**Shaun Hildner (19:26):** Well, I think that’s a great place to stop. We do have a question from a listener, this one was emailed in by Tom. It’s mostly for David, but Tom writes, "I noticed in the REWORK book, you frame code review as optional, in the part where you talk about edge case, QA findings, et cetera. Could you please tell me a little bit about this policy, where it came from and how it fits into your development cycle?

**David Heinemeier Hansson (19:52):** It’s funny, we were just talking about this internally, not just in terms of code review, but in terms of QA in general, how do you… Did we talk about this in the last one? Coffins?

**Shaun Hildner (20:02):** Talked about QA briefly last time.

**David Heinemeier Hansson (20:04):** Yeah. So this is like a version of that, that my barometer is that skilled people have a good internal gauge for confidence. Is this good or is it not good? Is this worthy of a large process or is it not worthy of a large process? And code review has some aspects of process to it, that is not always worth it. If you’re new and you don’t know your way around a code base, for example, you should absolutely get a code review. If you’ve been working on this thing for damn five years and it’s a small thing, you may not need a code review.

**David Heinemeier Hansson (20:43):** Now, the code review always has the opportunity of finding something. But, that doesn’t mean it’s worth it because the criticality of what you’re working on right now might be, as we talked about last time, rather low. So running the risks of just pushing something out might very well just be the right thing to do.

**David Heinemeier Hansson (21:01):** Now, code reviews have rather benefits because they’re teaching platforms, essentially, in both directions. Sometimes I love, actually, getting a code review from someone who hasn’t been here for this long, they’re not reviewing me because they’re the more senior person, they’re reviewing it because they’re actually the more junior person. And it’s an opportunity to spell out the assumption that are implicit in the work that we do.

**Shaun Hildner (21:23):** What did you do?

**David Heinemeier Hansson (21:23):** Why did you do this way?

**Shaun Hildner (21:24):** Exactly, right.

**Jason Fried (21:26):** [crosstalk 00:21:26].

**David Heinemeier Hansson (21:26):** Well, it would appear that it would be easier to do this. And then there’s a reason for why we’re not doing that. And sometimes there’s not a reason and you’re just like, oh yeah, you’re right. And let’s change it around. So I really like code reviews. I’d actually say, it’s my favorite form of mentoring when it comes to programming, because it is so concrete. It’s almost like straight injections into your vein, in terms of lessons. It’s not this abstract thing that goes through some sort of filter, it’s being shot straight in because it’s a review of actual work. You don’t have to translate high minded concepts about cohesion or whatever. I’m pointing out, here’s a piece of… Not a piece of code, here’s a line or here’s a character that could be different and this is why.

**David Heinemeier Hansson (22:12):** So, it has that really concrete character that makes these lesson come alive in a way that when you embrace that you allow people to level up quite quickly. I’ve worked with a bunch of programmers at Basecamp where I’ve seen that transition of, hey, we start doing some code reviews and I’ll do five with a person. And the person is at a different level after the five. Again, it’s the getting real part, right? We’re not talking about the abstract notions here, this is apprenticeship forms of mentoring, not conceptual forms of mentoring. This is like, hey, look at this piece of wood, this is how we cut it. You see how you hit the knot here, the grain, this is how you actually, if you twist it in the machine like this and the student will go like, “Oh yeah. Yeah, okay.” And then next time you don’t review that part because they figured it out.

**Jason Fried (22:59):** We do the same thing on the design side. This reminds me. I want to do some more live stream design reviews. Because we had one last week, we’re working on this revamped way to invite people to Basecamp. And it was this really juicy hour of just finding the way to do something. And I wish we’d recorded it. I mean, it was just instructive.

**Jason Fried (23:23):** But basically, we look at things together, a lot of it is riffing on words, like, what does this mean? What does this say? How could we say this in a way that’s clearer, that’s more obvious that doesn’t provoke more questions? Or there might be a flow where there’s a few steps and can we condense this or what’s the difference between this and that? And how do you know this is going to happen when you do that? There’s a lot of that kind of stuff going on. But, I’ll try to get into live streaming some of these things.

**Jason Fried (23:49):** This just reminds me that we should be showing more of our process live. I just think it’s really valuable. And even just for us too, and for new employees, but also for the public, who’s working on similar things too. You don’t really get to see what it’s really like. We just hired someone to help with product strategy and he was remarking how he likes to read these write-ups, companies put together these write-ups-

**Shaun Hildner (24:11):** Yeah, we talked about this a little bit last week. You said they were bullshit.

**Jason Fried (24:16):** Well, yeah. It’s just this is all coming around because it’s more like the real work is, as I talked about, messy and it all relates to that. So it’s just fun to look at the real stuff.

**Shaun Hildner (24:26):** Well, perfect. I think that’s a great place to stop. Thank you, Tom. If any of you out there have questions for Jason or David, you can call and leave a voicemail at 7-0-8-6-2-8-7-8-5-0 or, better yet, record a voice memo on your phone and email it to hello@rework.fm. You can also just write in for me to read your question, but I don’t think anyone needs to hear my voice anymore than necessary.

**Shaun Hildner (24:54):** Okay, next week we are talking about reasons for giving up. But, for now I want to say thank you to Jason Fried.

**Jason Fried (25:02):** Thanks, Shaun.

**Shaun Hildner (25:03):** And thank you David Heinemeier Hansson.

**David Heinemeier Hansson (25:05):** Thanks man.

**Shaun Hildner (25:06):** We’ll see you Next week.

**Jason Fried (25:08):** [foreign language 00:25:08]

**Shaun Hildner (25:17):** REWORK is a production of 37signals. Our theme music is by Clipart. We’re on the web at rework.fm, where you can find show notes and transcripts for this and every episode of rework. We’re also on Twitter at @reworkpodcast. If you’re following along with the book, next week we’ll be discussing the chapter, Reasons to Quit. And if you like the show, I would greatly appreciate it if you could leave us a review on Apple podcast, Spotify, Overcast or wherever you’re listening to this.

This is an episode title
