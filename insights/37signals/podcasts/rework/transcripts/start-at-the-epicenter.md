---
title: "Start at the epicenter"
description: "When starting something new, you can work on the stuff you could do, the stuff you want to do, and the stuff you have to do."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/start-at-the-epicenter/
tags:
- podcast
---

# Start at the epicenter

**Shaun Hildner (00:01):** Welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m your host, Shaun Hildner and this week we are talking about finding the epicenter. Now last week we talked about the things that you want to do, the things that you could do, and this week we’re going to focus on the things that you have to do. As always, joining me are Basecamp’s co-founders and the authors of REWORK, David Heinemeier Hansson. How are you?

**David Heinemeier Hansson (00:24):** Good.

**Shaun Hildner (00:25):** And Jason Fried. How are you?

**Jason Fried (00:27):** I’m doing well, Shaun. How are you?

**Shaun Hildner (00:29):** Oh, can’t complain.

**Jason Fried (00:30):** By the way, this is probably my favorite chapter.

**Shaun Hildner (00:32):** Is it really?

**Jason Fried (00:34):** Favorite thing, let’s say. I don’t know if it’s a chapter.

**Shaun Hildner (00:36):** But why don’t we start there? Why?

**Jason Fried (00:37):** Because this is what everyone wants to know. Where do you start? Everybody is always asking, where do you start?

**Shaun Hildner (00:43):** Yeah.

**Jason Fried (00:43):** And the answer is you start in the middle, you don’t start at the beginning, which is where you’d think you’d start.

**Shaun Hildner (00:49):** Sure.

**Jason Fried (00:50):** You figure out what the thing is that matters most. And you start there. For, with Basecamp, it was the message board, because we were trying to figure out a way to centralize communication. One of our problems was that messages were everywhere. You had emails, you had messages, we’re using AIM. AOL Instant Messenger at the time. We were using Skype, we would have phone calls with clients. There’s just stuff was everywhere. We needed a way to centralize that have feedback on the record. And that was the message board. And once we had that working, we could use what we were building.

**Jason Fried (01:21):** If we just had an account system like everyone… You could say everybody needs an account. You have to log into this thing, but we just hard coded that. I think to start as well. It didn’t matter. But even if you built that first, you wouldn’t be able to do anything. To build something you can’t do anything with is not really a great way to start. You want to build something, you can do something with, and that’s what the epicenter is all about. And I think one of the examples you gave, I don’t know if it was in getting real or REWORK or somewhere else is the hotdog stand.

**Shaun Hildner (01:46):** Yeah.

**Jason Fried (01:46):** Basically [crosstalk 00:01:47]. Yeah. What’s the epicenter of a hotdog stand? It’s the hot dog. You could sell a hot dog without a bun. You could sell it without ketchup or mustard or onions or relish or whatever. You need to sell a hot dog to have a hotdog stand. And that’s where you start with the hot dog and that’s in Basecamp’s case, that was the message board. And that’s sort of where you begin.

**David Heinemeier Hansson (02:08):** And when you begin there, you get to test the core of the idea. Because as Jason said, if you have, if we had built all these generic things you need, “Oh, you need a way to log and you need a way to change your username.” You need all the affordances that any app will have. That’s not going to teach you about whether this thing is going to work or not. When we build the message board, we very quickly got to see whether this was any help at all. It’s entirely possible that it wasn’t going to help. “Oh, this didn’t solve our problems. Email is actually easier.” We don’t go to it and then you’d know, “Oh, that idea is bust.” We got to come up with something else. But the more time you spend on the generic stuff that everyone else has around the app, the less you’re learning about, whether this thing that’s unique about what you’re building right now actually has legs or not.

**David Heinemeier Hansson (02:56):** And that’s why it’s just so crucial to start there. And it’s also, I think why like, Jason, I love this idea of the epicenter because I remember when we started talking about it was totally novel. The way I started building systems was always start with, what do we always need? “Oh, we need the login system. We need this.” And I’d have this thing where, “All right, before we even start talking about what you’re doing, I need to few weeks just setting things up kind of thing.” Right? And then in a few weeks, let’s talk about what you actually want to do. And this really flipped it on its head to be like, “Oh, actually we could just not do those things.” Because all of that scaffolding is there to be thrown away if the epicenter doesn’t work, if the hot dog you’re selling is gross, no one gives a rap about the bun or the relish, right?

**David Heinemeier Hansson (03:44):** All of that stuff is just irrelevant if you cannot arrive at a good hot dog. For us at Basecamp to arrive at, okay, the message board, as we built out, actually did something. And we started using it right away. And we immediately saw this was better. That’s the kind of stuff that then gives you the stamina and the motivation to build the rest of it. Because like, “Okay, now we have something that works. Let’s make it real.” It’s also the trick that makes it possible to even get going when you have no time at all. The other part of building Basecamp was that we started with 10 hours of my time-

**Shaun Hildner (04:21):** Right.

**David Heinemeier Hansson (04:21):** Per week. I could have spent weeks and weeks and weeks and weeks building all the stuff that we needed around. Right. But in 10 hours, I think within a week or two, I forget how long it took, but it did not take much more than a week or two. We had that epicenter going, we had something to evaluate and that just makes all the difference.

**Jason Fried (04:40):** And I think in HEY, I was just trying to think about-

**Shaun Hildner (04:42):** Yeah. What’s HEY’s epicenter?

**Jason Fried (04:43):** Well, what we built first was I think the ability to receive an email or send an email one of the two, I think, cause maybe send David. I don’t know if you remember that.

**David Heinemeier Hansson (04:51):** Yeah, I think so. It was basically like it needed to do those two things, right? If you can’t send and you can’t receive email, it’s not email. It’s something else. What was interesting though, Jason, I thought about that was so we started with that epicenter and made sure that it could send and receive email because then we could start using it. But then very quickly thereafter, we actually pivoted away from let’s do the things that all email clients do too. Let’s just pick something that no other email client does, because this is the thing that’s going to prove. Whether we have any space in this market at all. With HEY we could have spent years and still will be spending years building out the so-called basics, the table stakes, all the things you’re supposed to have.

**David Heinemeier Hansson (05:32):** And we talked last week about how we actually skirted on a bunch of those things. We didn’t have auto responders, we didn’t have signatures. We didn’t have a bunch of these other table stakes that you’d think like, “Oh, every email client needs that.” But if that was the only thing we built, we would just have rebuilt Gmail with none of the power of Google behind us. That sounds like a bad idea. We needed to, as soon as sort of just the IO of email was going, we needed to have something that was unique, the epicenter of why does this thing even exist?

**Jason Fried (06:05):** And I think with Highrise, by the way, Highrise is our old CRM. Yeah. For those who don’t know, we have a product, although we don’t sell it anymore, but existing customers can use it called Highrise, which is a basic simple CRM tool to keep track of who talked to who when, when you need to follow up next, contacts with vendors and external people and sales and the whole thing. Anyway, that was I think just about adding a note to a person. That’s what primarily Highrise was about, was adding notes to people. And once you could have a person page and just add a free text area to that page and add notes and hit submit, and it saved like you basically got a CRM, you really actually basically have a CRM. Doesn’t do much, but it does that. And that’s what it needs to do first. That’s where we started with that,

**David Heinemeier Hansson (06:55):** Which also was founded in the problem we were trying to solve. I remember the pitch we were talking about at the time, which was, “Hey, Jason, and I both run this business. Sometimes we need to talk to lawyers. Sometimes we need to talk to accountants and you want the other person to be in the loop or whoever else in the company who needs to be in the loop about the conversation with the lawyer.” And it was exactly that, okay. You’ve just talked to Glen, our lawyer, you need to record like, “Okay, it was this, this and this and this because then I didn’t have to be on the call with Glen as well.” We could just spend the time that one person is on the phone with the lawyer or one person is talking to the accountant and the other person is in the loop about what’s going on with the business.

**David Heinemeier Hansson (07:35):** It sounds like, well, just one place to put notes like that’s not a lot. Well, actually it is, right? That is the epicenter. I know what’s going on in my business. Even if it’s someone else inside the business that’s taking or making the calls or having the conversations. And I think that’s another way sometimes where you can be led a stray, if you thought to yourself, “Oh, I want to create a new CRM.” What is CRM? CRM is just a billion different things. It’s hard to pick out the epicenter of that versus if you start with a problem, like, “I need to know what’s going on in my business.” When someone else talks to, or is contacted by the people we deal with to run that business, you can hone in on, well, this is what we need to start. For example, Salesforce or other CRM tools are often focused a lot on the sales activity.

**David Heinemeier Hansson (08:26):** That wasn’t the problem that Jason and I were trying to solve for ourselves. That’s not where we started.

**Shaun Hildner (08:30):** Right.

**David Heinemeier Hansson (08:31):** Highrise ended up having some sales capacity to it because we built that on top of because we thought, “Well, that would do well.” And plenty of people do need that, but it was in the epicenter because the epicenter, I think also in part has to be something you can discern, whether it’s good or not. The problem, if we had started with the sales part of Highrise as the epicenter was, we would’ve needed to complete the whole thing and put it into market before we would have had any feedback as to whether we were on the right path or not, because we just weren’t doing it. I remember at the time we were sort of trying to remember back and simulate, oh, if this was still 2002 and we were doing bids for clients, there were some remnants of some ideas where you could sort of hone on it, but it was so much easier to answer the question of, do I know what’s going on in the business when Jason’s talking to Glen?

**Shaun Hildner (09:18):** Yeah. That seems like the trick, the mental arithmetic you have to do to actually find the epicenter. How did you figure out that message boards was actually what you needed to make a project management tool?

**Jason Fried (09:29):** Yeah. It, it came down to what were we struggling with? Communication was everywhere. There’s no central source of truth. Who spoke to who? It was actually kind of similar to Highrise in a sense sort of, which is funny, because most things are like this. It’s just like, you just need a little bit more than nothing. And we need to keep feedback on the record. So everyone knows who said what and when? And there’s no, “I didn’t say that. Or I didn’t approve that.”

**Jason Fried (09:53):** Well you did it’s right here. Or I didn’t promise that. “Well, yes you did.” It started here, whatever it might be. And that needed to be a central place. You could say, “Well, there’s emails.” You could just shoot emails around, but not everybody’s on every email and everyone’s versions of different emails can be different because some people are on them some people are not, you might forget to add someone to one, you might CC someone who might be CC someone, the other person doesn’t know who’s looped in. When you have everything in one place everyone can see and everyone can see the same thing. It just changes the dynamic and the conversation.

**Shaun Hildner (10:24):** Yeah.

**Jason Fried (10:24):** And that was the aim for Basecamp. That was the epicenter. That was the message board.

**David Heinemeier Hansson (10:28):** In that particular example, the killer app is adding someone after the fact. This project has been going on for two weeks. If this was email, we would’ve traded 75 emails.

**Jason Fried (10:40):** Right.

**David Heinemeier Hansson (10:40):** Now, someone else joins the project and then they need to get up to speed on what’s going on. What? You going to forward them 75 emails? No, you’re not because that would be crazy and no one does that. The new person joining has no context, does not know what’s all already been agreed to. Then you see Basecamp and it’s all there. This is something we actually hear all the time when we bring new people on at Basecamp. The history of so many of the projects and things we work on at Basecamp, they’re able to get up to speed on all of that because it’s all in Basecamp and they can just go back and read it versus a company that was running off email, which is most companies or slack or some other chat system that just scrolls all context away in five minutes, you can’t do that. You can’t join after the train has already left the station. Now that’s a huge undertaking of bringing someone up to speed, where in using Basecamp, it’s mostly just adding that person to the project and say like, “Hey, read up.”

**Jason Fried (11:38):** And because threads are titled and named, you can jump into one without being bombarded by the others, which is different with a chat transcript, you jump into a chat and there might be a dozen different conversations happening and you’ve got to piece it all together yourself. After the fact, it’s a terrible way to get up to speed. Literally if you ask someone to go back and read the last three months of conversations in a chat room. It’s not really a tenable ask.

**Shaun Hildner (12:02):** Right.

**Jason Fried (12:03):** It’s torturous is what it is.

**Shaun Hildner (12:04):** It really is. Yeah.

**Jason Fried (12:05):** But you could say go to this message board, browse the topics, and maybe there’s something in there that catches your eye and you can read it. And then you know that you’re just reading that.

**Shaun Hildner (12:12):** Right.

**Jason Fried (12:13):** It’s a very different approach. Even though it may not sound that different on the surface, it actually is.

**Shaun Hildner (12:19):** How much work do you put into the epicenter? How much work do you put into the message board before you start adding things like inviting another person later on? I think you’re right in the essay that you should be working on the epicenter to make it as good as it can be before adding any of the details. And we’re going to be talking about when to add details next week. Oh, I should say in more detail, but how much work is put into the up center?

**Jason Fried (12:40):** As good as it can be. Maybe is not how I would phrase it today. I like as adequate as it can be. Initially we talk about surface area. What kind of surface area do we need to cover until we have a good sense of this does what it needs to do and the way you figure that is you use it. This is the whole point.

**Shaun Hildner (12:54):** Right.

**Jason Fried (12:55):** The only way to know what it needs is to use it. And you can’t use it unless you build the most basic version of it with [crosstalk 00:13:01], then you bump into the edges and you go, “Ah, we need to push here and expand this and push here and expand that.” At a certain point, you realize you’re not hitting the edges anymore. You’re within this nice confine of the solution. And then you can begin to basically jump off that island onto another one and build the next piece.

**Jason Fried (13:18):** But if you keep bumping into the edges, you’re not quite there yet. I think it’s how we tend to feel about it. You still need a degree of discipline, because you can keep talking yourself into the fact that you’re not there yet. It needs to be this much better or it really needs this, that and the other thing. But it’s really, “How often do you need that? How much does that come up? Can we save that for later? Is it really that important?” Those are the kinds of questions you have to ask. Otherwise you’re going to just keep orbiting the same little small problem area until it’s polished perfectly, but then you don’t get anywhere. It’s important to get somewhere early, use it, expand that a little bit and then move on to something else. And you can decide if you want to come back to the initial thing later on.

**David Heinemeier Hansson (13:56):** What’s interesting here is that the amount of pollens needed in some ways, inversely proportionate to whether you fixed a real problem or not. The bigger, the real problem, the less polish you need, because anything is better than nothing.

**Shaun Hildner (14:10):** Better than nothing. Right, yeah. That’s clever.

**David Heinemeier Hansson (14:13):** And that was the case with Basecamp was very quickly, it was clear that this was beating email. We needed basically very little at all, very little like, "Oh, is this neatly aligned? Is this a compelling design? Is it like? No, no the design was take these conversations out of email, put them somewhere centralized where we can all refer to them, get back to them. Everything’s on the record. You can add someone two weeks in. And when you face those kinds of solutions, where you go, like, “I don’t want to go back.” That to me is the point where you stop. And we had this conversation several times with HEY, where we were like, “I can’t go back to Gmail.” As soon as we fell that it’s time to get this thing out. Because as soon as you have something that’s so compelling that the prospect of going back to the alternatives feels regressive.

**David Heinemeier Hansson (15:04):** You know you have a product that people would be willing to pay for. Because the problem is if you’ve only solved the problem, that’s kind of like a nice to have. I’ve heard this metaphor and mentioned before, where are you selling vitamins? Are you selling painkillers? Right? Like vitamins or prospective. It’s nice to do it. It’s nice to have it. You probably need more polish and you need more things. But if you don’t have the vitamins, what okay someone not taking their vitamins might feel the effect of that 10 years from now or five years from now. If you need painkillers and you don’t have pain killers, it’s very apparent that you don’t have the painkillers and you’d pay a lot right now to get them not tomorrow, not next week, right now. If the problem you’re trying to solve the epicenter that you found has that pain killer variety to it.

**David Heinemeier Hansson (15:51):** And I think it’s very clear that like, “Okay, this worked.” Then it’s done. And then you just kind of have to package it up. And that also comes to the strength of the idea. How good does that packaging need to be? I think what we found with HEY, was we had some ideas in HEY, like this screener for example, where you start using that and it is a painkiller, it makes email feel so much better that it doesn’t actually matter that we don’t have signatures for a lot of people, for the people who have the headache that the screener solves, the lack of signatures, the lack of auto responders, the lack of all these other so-called table stakes are just not nearly as important as the fact that we cured their damn headache. And I think that’s a really key aspect of product management in general, like, is the problem you’re trying to solve, is that high value enough? Is it painkiller like? And then it gives you this wonderful guidance on when you’re done, when you’re ready. As soon as you don’t want to go back to what you were doing before.

**Shaun Hildner (16:51):** And then the inverse of that, of course, if the problem isn’t high level enough, then you do need more packaging. Is that kind of what you’re saying?

**David Heinemeier Hansson (16:59):** I think more packaging can help, but do you know what often happens? And I think we’ve had that over the years, things we’ve tried to build, you just don’t use it.

**Shaun Hildner (17:06):** Right.

**David Heinemeier Hansson (17:07):** And then you get into this thing where like I could just as well go back to the other thing I was doing, that’s when you know you are kind of in trouble and you should start either thinking about different ideas or trying to perhaps move the spotlight of maybe we just mistook where the epicenter was.

**Shaun Hildner (17:22):** Yeah.

**David Heinemeier Hansson (17:23):** Maybe the epicenter is over here instead, let’s try to move the spotlight over there. Maybe we’ll find one of those spots where you get that feeling of, “I don’t want to go back.”

**Shaun Hildner (17:31):** To go back to my previous question and I’m going to use the HEY example, because it’s a more recent memory. How polished was the ability to send and receive emails before moving on to the screener?

**Jason Fried (17:43):** No, I would say pretty unpolished. I remember the two and from fields, usually when you type something in the system sort of verifies it’s an email address of some sort turns it into a pill or there’s some indication that it works, you could have typed anything into that. There was no errors. There was no sense that it wasn’t even a real email address. It was a total just trust honor system. That’s actually an email address. And if it is, we’re going to send it to that address. And if not, it’s just not going to go anywhere and you’re not going to know about it. That’s how it starts.

**David Heinemeier Hansson (18:13):** There was no auto complete. You had to type in the whole damn email. Copy and paste it over. It didn’t have any of those nice and twos. It just did it.

**Shaun Hildner (18:22):** But it did enough that it made you feel that we could move on to building the thing that makes this email app unique.

**Jason Fried (18:29):** What you get is that moment of excitement where like, if I type david@basecamp.com and I send him email and he gets it and he just messages me, he’s like, “Dude, I got it.” It’s like you built something. It works. That’s the excitement. You need to have that. But in this case, right, in this case, it was just like, “Did the email go through?” It did like, we just built an email system. Of course it’s not a full blown thing, but you get excited when things start to work.

**Shaun Hildner (18:51):** Yeah.

**Jason Fried (18:51):** That you can actually use. That’s where it starts. And that’s the spark needs to mostly stay lit that whole time. And it can take years sometimes to build something or months, depending on what it is. And there’s dark moments where you don’t really know where you’re going or you go in the wrong direction or it flames out because you get into the monotonous boring part of the project, because that always happens. But you’re excited enough because you know what this thing’s really about. You need to keep building things that work in order for that flame to stay lit.

**Shaun Hildner (19:20):** And keep using them yourself, I think is the other point you were trying to?

**Jason Fried (19:23):** Yeah, I think one way to think about it is that using something is what fuels the flame.

**Shaun Hildner (19:29):** Yeah.

**Jason Fried (19:29):** If you build something in some corner and you don’t use it, like the film goes out over there and then it gets dark and its moldy and the whole thing starts to fall apart. Because you don’t use it anymore. You don’t see it. You don’t know it.

**Shaun Hildner (19:40):** Yeah.

**Jason Fried (19:40):** And it sort of just degrades in a sense, even though software, you think like, “How could software degrade its digital?” But it does. I guess digital things can degrade over time of course. But you just think like once you know it’s works.

**Shaun Hildner (19:51):** Yeah.

**Jason Fried (19:52):** The thing is that all the other parts of the system are changing around it and you don’t see that one change might affect that change or some style sheet change might blow some design up over here or some other thing we’ve messed with. We’re not in that room anymore. We don’t see what it did to that room. And that’s why you can get into these situations where you build something that’s too big and you don’t don’t use it and you don’t really know how it works anymore. We’ve had that happen.

**David Heinemeier Hansson (20:15):** What I find is so fascinating about this discussion of starting with the epicenter and then keeping the flame lit when it’s working. Is also the exact reason why I think a lot of people are very hesitant at touching the epicenter because this is the time you test the idea. And if you start with the hot dog and the hot dog is gross, well then you don’t get to do all the other things, right? Yeah. There’s no need for the bun. There’s no need for the rush. And to some extent, your dream of becoming a great hot dog vendor is out the window. And I think that this is one of those things that it just feels safer to start with all the around stuff, because none of that is going to disprove your idea.

**David Heinemeier Hansson (20:58):** If you are in love with your idea, waiting as long as possible to subject it to the reality of the epicenter is a comforting place to be. It’s not a healthy place to be for your idea. And ultimately getting it into the world. I remember getting all these emails, like, “I’ve been working on this thing for like however long and I’m still tinkering on like.” Yeah, okay. Then it’s already dead. Whenever any email starts with that, like, “I have been working on this idea for, then they go whatever years or something and I’ve just been building.” You didn’t start at the epicenter. Because if you did, you would’ve known within two weeks.

**Shaun Hildner (21:30):** Yeah.

**David Heinemeier Hansson (21:30):** Whether there was something here or there wasn’t

**Shaun Hildner (21:32):** Well, I think that’s a fantastic place to stop. Next week we’re going to, as I said, we’re going to start talking about when you should start adding those smaller details and how it shouldn’t be early on. We’ll talk about that next week for now. Thank you Jason Fried.

**Jason Fried (21:48):** Thanks, Sean.

**Shaun Hildner (21:49):** And thank you David Heinemeier Hansson.

**David Heinemeier Hansson (21:51):** Thanks.

**Shaun Hildner (21:51):** We’ll see you. Next week. Adios. REWORK is a production of Basecamp. Our theme music is by clip art. We’re on the web at rework.fm where you can find show notes and transcripts for this and every episode of REWORK. We’re also on Twitter @reworkpodcast. If you’re following along with the book next week, we’ll be discussing the chapter, ignore the details early on. And if you like the show, I really appreciate it. If you would leave a review on Apple podcast, Spotify, Overcast, or wherever you’re listening to this.

This is an episode title
