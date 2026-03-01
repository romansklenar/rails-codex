---
title: "Scratch your own itch"
description: "Basecamp was originally designed as a way to manage 37signals’ client work and its success can be credited to the fact that it was designed to scratch a very specific itch by the people with that were itching."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/scratch-your-own-itch/
tags:
- podcast
---

# Scratch your own itch

**Jason: (00:00:00)** I got to write something about this. The difference between like hardcore construction and a three year old pounding on your door, there is no difference. It’s the same sound.

**(00:00:09)** Broken By Design by Clipart plays.

**Shaun: (00:00:11)** Welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m your host, Shaun Hildner.

**(00:00:17)** This week, we’re talking about scratching your own itch. When you build a product for yourself, to address your own needs, to solve your unique problems, you gain an incredible amount of insight into what exactly you’re making, and even have a better handle on the quality of the thing. If you’re only building for someone else, well, you may just be left guessing at the needs of your client.

**(00:00:36)** As always, to discuss all this and more, I am joined by Basecamp’s co founders and the authors of REWORK. Jason Fried, how are you?

**Jason: (00:00:43)** Good, Shaun. How are you doing?

**Shaun: (00:00:43)** Wonderful.

**(00:00:45)** And David Heinemeier Hansson, how are you?

**David: (00:00:47)** I am good, good, good.

**Shaun: (00:00:50)** Today, we are talking about scratching your own itch. And to start off, let’s go way, way back, what, 1000 years or so, to when you started thinking up Basecamp? What was the itch you were trying to scratch?

**Jason: (00:01:03)** Back then we were a web design firm. And we were doing work for clients. And we were doing what everyone else was doing and many people still are doing, which is hacking it. You know, like using email and phone calls and jotting stuff down in different places, just to kind of try to keep track of what’s going on. A separate calendar, perhaps.

**(00:01:24)** And when you’re doing one or two projects, you can hold enough stuff in your head, really. I mean, at some point, you kind of can’t, but you kind of can for a while. And then if you start to get a little bit busier, and you start to grow a little bit, and maybe you bring another person on or you bring on another client. Before long, you don’t know what the hell you’re doing. You don’t know who’s doing what and what’s due when and who’s on top of what and who’s not. And you don’t have the feedback in the right place. And not everyone’s seeing the same stuff. And you just kind of lose control, and you start to feel like this is getting really hard. And your clients start to get pissed. And you know, you’re not really putting out a organized image because you’re not.

**(00:02:02)** So we started looking around at figuring out like, what to do about that problem. The tools that existed at the time, there’s only a few. Microsoft Project was the most popular one, it was really more about charts and graphs. It wasn’t about communication. We needed a communication tool to keep all communication in one place and also to communicate updates and schedules and who’s on what and responsibility and all that stuff. Because that’s also communication. It’s not just data, it’s telling other people things when you say like who’s responsible for something.

Initially, we actually built a blog, like a manually updated blog, per project. And we would just post new stuff and like edit HTML files and post new stuff, when there’s new stuff to show a client and gave them like a URL, I think with HTTP authentication, or something to kind of hide behind a password. If we even did that at the beginning. I’m not even sure if we had a password. It might just been some crazy URL, right?

But the thing was, it was working. Like, okay, now there was at least a place, one place. It wasn’t sophisticated, but it worked better than what we had before, where we had many places and tools that weren’t really right. And then eventually, we said, we should build something that we actually want to use here. That we that will scratch the itch that we really have. And we won’t have to update this manually and publish new files to an FTP server when the new HTML is ready. Like, let’s make something.

**(00:03:19)** And so that’s what we did, we set out to make something and it started out actually, at the first feature, I think was just a message board. Because that was the fundamental part of it, which is like we need to communicate. And when you post a message an email goes out, so it’s still sending an email, but at least there’s a central repository in the whole thing.

**(00:03:34)** So anyway, it was just something that we desperately needed. And we started using with our clients and our clients started looking at this and go, what is this thing that you’ve made like, or what is this thing? Not that you’ve made? Like, what is this thing? Well, it’s this thing we made? I don’t know.

**(00:03:49)** And it turns out that they felt like they could use that. And then kind of light bulb goes on over your head, like, oh, there’s a product here. And then we kind of polished it up and put it out there and called it Basecamp.

**David: (00:03:56)** I think what’s so neat about scratching your own itch is you know exactly where to scratch first. As Jason said, the message board was the thing we built first, because it was the most important. This was what gave rise to the whole idea of the epicenter. That when you work on a whole product, there are features that are more important than others. And if you’re working on scratching your own itch and solving your own problems, you know exactly what those things are. This is the blessing in terms of almost automatic product management that comes for free when you’re building for yourself. Because the list of priorities is just very clear. This is what I really need next, so I’ll build that.

**(00:04:38)** Versus when you’re trying to build for other people, it’s so much harder, because you talk to one customer and that customer goes like, “I really need A, B, and C.” Then you talk to another customer, “Well, I need three, four, and five.” And then you talk to a third customer, “I need yellow, blue, and red.” Now it’s up to you and go like I don’t know, what should we build?

**(00:04:59)** I remember from that time Reading a write up about how the Microsoft, maybe it was their Office team, they dealt with that. And they had this master spreadsheet where they would record all the requests that came in. And then they would essentially like, vote it up like a little mini Reddit they had inside were like they would get another request for I don’t know, italic in footnotes. Okay, well, there’s another customer’s requested that and so that has three votes, right?

**(00:05:29)** And I thought, what a miserable way to build software, you’re just computing this all as like raw data coming through and whatever gets the most votes, is what you’re going to build? Really? That’s how you’re going to come up with a great product is you’re simply going to tally the votes on what people think they want, and then you’re going to work on their behest in that regard?

**(00:05:52)** It was like, no, no, no. Listen to your customers, absolutely. But you got to do work on their behalf. That’s why you’re the software developer. If they were the software developer, you’d be buying their stuff.

**Shaun: (00:06:01)** I mean, it’s just taking the pressure off of actually having to come up with any of your own ideas? If you’re just like kind of outsourcing it to your customers?

**David: (00:06:07)** I think that’s part of it, is that you don’t have to have any taste. Which was of course, the long standing Steve Jobs joke about Microsoft is that they had no taste, that there was no coherent, overarching vision behind the products, it was simply just a grab bag of features.

**(00:06:23)** Again, clearly that approach can be quite successful. I don’t see Microsoft hurting too bad these days. So clearly, that works, right? But I just always thought it was such a privilege for us to be able to build things for ourselves such that we didn’t have to go through that.

**Shaun: (00:06:36)** So how had your needs, maybe the needs and wants of the business, but also because it’s a consumer product, how had your personal needs changed in the 20 years when it came around to developing HEY?

**Jason: (00:06:48)** Well, HEY is a different thing. First of all, it actually didn’t start out as a personal product, it started out as a business product. And we were originally thinking about building this for business use, which of course, there is a business version. But actually, before that, it wasn’t even an email thing. It was started out as an improvement. We were trying to redo Highrise, which is our CRM tool. So we started looking at Highrise, we’re calling it Highrise 2 in our minds.

**(00:07:12)** And as we start exploring that, we started with the itch which we had, which was you know, the reason we built Highrise initially was primarily to keep track of conversations we had with vendors. And most of those are happening via email. So I started scratching around the email, vendor contact world. And we got to this place where we realized what we were building was not a CRM tool, but actually an email service or an email, not even a service, an email thing, let’s just say an email thing. And it wasn’t fully formed. But we were going somewhere that was exciting.

**(00:07:44)** And we’re like, I want this for all my email, not just, you know, this business email. And we sort of focused then not just on CRM, but really getting back into the email side of it. And then we kept figuring out like, what don’t we like about email? What’s cool is when you’re headed somewhere, when you’re going down some path, you start to ask different questions. And now it’s like, well, gosh, if we can make an email thing, like, we’re in front of Basecamp, all day, and we’re also in email all day. Email, primarily for outside communication, Basecamp for internal communication.

**(00:08:16)** So if I’m going to be in front of email all day, like, what frustrates me about email? Well, one of the things was like, you know, anyone can email me, that’s actually a fundamental frustration. And so we started to think about that. And that’s how we came up with the screener where you can say yes or no to people, if you don’t want to hear from them, you say, no, you never hear from them again. Now, other email systems have blocking, you can block someone. But that’s just, it’s a thing you can do later. It’s not a fundamental flow.

**(00:08:42)** So the first time someone emails you in HEY, you can thumbs up or thumbs down them and start playing with some ideas around that. And then we got into replying to emails and all these other things. And these are all itches that we were scratching. And we got to ask ourselves, where are all the itches?

**(00:08:56)** So we followed the same approach that we did with Basecamp. In fact, I think, you know, with HEY, the first thing was like, can you receive an email? I don’t think it was even can you send one? It was more like, can you receive one? That was the first thing and we sort of build from there.

**David: (00:09:08)** I think what was so exciting about HEY as well was, unlike with Basecamp, where we had the realization, oh, it’d be nice to have something like sort of soon in advance of building something. With HEY, it’s 25 years of itching that has gone unscratched, where both of us have been using email, I think I sent my first email in what, ‘94 or something like that? That’s a long time ago.

**(00:09:33)** Over that entire period. I’ve been just sending tons and tons I mean, it’d be interesting to figure out like how many emails have you actually sent. I mean, surely tens of thousands. So you’ve just picked up on so many itches, oh, I wish this was different. Oh man, if we got a chance to make it, I would totally do it like this. Which I think is also why HEY premiered as such a quirky, interesting, weird product because there was just so much, so much material. I feel in many ways it was like writing REWORK.

**(00:10:03)** So we didn’t sit down to write REWORK. We had worked on that material for a decade in advance. By the time we sat down to write it, it was more like editing, and like, okay, let’s put the greatest hits into it. That’s how I felt a lot about HEY, it’s like, I spent 25 years making mental notes about how email should work. There’s a lot of material in the book. In fact, the hard part is picking which one of the problems we want to solve. And then it’s just, even more than Basecamp. And we live in Basecamp all day long. I’m in Basecamp all day long, but I’m in HEY longer still.

**Shaun: (00:10:36)** Yeah.

**David: (00:10:36)** I’m in HEY literally, from early morning, whenever I checked the first email, probably too early, right? Until the evening, sometimes when I do follow up on things that are mostly a personal nature. But I thought, hey, Basecamp is one of those dominating products you just have open all day, well, your whole work day. And then HEY is your whole workday, plus, most of the rest of the waking hours that you tie yourself to some form of email.

**(00:11:02)** So it has even more of this. It’s just all your own itches to scratch, which makes it feel just a lot of fun to work on. Like that was the thing, with, as a software developer, as software builders, I would often think like, ah, why can’t I just fix this thing in Gmail? Do you know what if I just had access to the source code, I could just fix this thing, and it wouldn’t be so damn annoying.

**(00:11:26)** Now the source code is sitting right in front. So like, there’s no excuse. If there’s something that’s just really bugging me where it’s like, just go in and fix it and push, deploy and half an hour later, that feature or that bug is solved.

**Jason: (00:11:37)** One of the really neat things, there’s of course scratching your own itch, which is what we’re talking about. But there’s a deeper level, which is actually creating the scratcher. Which is like, when you make the tools you get to work with every day, that’s an even a deeper degree of satisfaction. It’s one thing to scratch an itch sort of that you kind of use occasionally. But when you get to make the tool itself, the back scratcher itself, and you have a lot of itches, it’s really wonderful because you actually have a legitimate impact on your day, and of course, the days of hundreds of thousands or millions of others if you have a successful product. But to make your own tools, it’s great.

**(00:12:15)** And I think about like, you know, Shaun, we were talking about this before we started, and David’s a fan of watches as well. Really, really, really great watchmakers make their own tools, they actually make their tools first before they make the watches that they make with those tools. And that’s kind of what we’re trying to do. And it’s a really satisfying, extra deep level of itch, scratching.

**David: (00:12:38)** What’s funny about this, particularly with HEY, is so, we’re scratching our own itch on the product side. But exactly as Jason said, to build, HEY, we had to build so many tools, we built so many tools. All of Hotwire, our new approach to front end development came out or came together as part of building HEY. So many of the advances in Ruby on Rails over the many years have come straight out of the products that we really go down, not just building our own tools, but figuring out our own unique screws that fit into this. And then you got to come up with a screwdriver. And there’s just such a satisfaction in going all the way down and knowing that you have the power and the capacity to deal with any of it.

**(00:13:21)** And this was one of the big things I think has been a theme at Basecamp over the years, particularly on the product development side. This idea that we’re tool makers. We don’t just take other people’s tools and put those together in variety of ways. Sometimes we do, obviously, it’s not like we build everything from scratch, I’m not sanding down my own silicon and building my own chips and whatnot.

**(00:13:40)** But at a certain level of abstraction, we always keep the door open that if those tools that are on the market are not good enough, no hesitation in building our own. Which is funny because in much of the tech world that is the derided a bit as like not invented here. And I’m sympathetic to that. But also not really, in the sense that if you can invent, if you have the capacity and the competence to do it, it is where so much of the satisfaction is. I get as much satisfaction, in many ways, out of building the tools that makes it possible for us to build HEY, as I get from building HEY. And then when you take both of them together, it’s just like the galaxy brain explosion.

**Shaun: (00:14:22)** One of the examples you use in the book is the Mary Kay Wagner using her own cosmetics. You talk about the importance of being able to assess the quality of what you’re building, if you’re scratching your own itch.

**Jason: (00:14:35)** Judging quality by proxy is hard. So this is one of the hard things about doing client work. Let’s say you’re a development shop or whatever, and someone asks you to build a product for them and you work with them to build the product. But it’s a product that you’re not ever going to use. Not only is it something you’re not going to use but you don’t even necessarily understand.

It would be like if someone asked us to create a medical records system. We could do it. I’m sure we could do it. But I wouldn’t know if it was any good because I don’t know what it’s like to be a doctor. I don’t know what it’s like to have a patient in the room with you. I don’t know what it’s like to have to look up, what kind of data would you be looking up? What kind of information would you like to see? Now you can interview doctors, and you can do all that stuff, right? But you’re still a degree or two away from actually understanding at a fundamental level, what you need, and what’s good in the scenario that you’re in.

**(00:15:26)** Again, you can research forever, but it’s still not direct experience. And I think direct experience really helps you evaluate whether or not what you’re making is going to be useful.

**(00:15:37)** Without question. I think that’s the baseline. Like, without question, you know, that this is going to work for what you need it to do. You don’t need to ask anyone, “Is this what you meant? Is this what you thought? Is this what I understood you to mean?” You know, or, “This is what I heard you say.” It’s like, no, I know this is what we needed to do. So that’s the thing that’s great about building something that you’re going to use yourself, is that you have answers to questions that you might never actually be able to really truly get from somebody else. Again, it’s possible, certainly possible. And there’s great products built by people who don’t use them, of course, I just think it’s, you have a leg up, you have an advantage if you’re the one who you’re building for.

**David: (00:16:16)** And that difficulty, I think, explains so much of why the history of software development is a history of huge failures. Because so many large systems, particularly government systems, or medical record systems, or something else like that, are built for other people where you trying to fumble around in the dark, and just hope that you stumble across something that just barely works.

**(00:16:40)** There are just so many large IT projects that simply fail, and after years of development, they just go like, actually, we’re in a dead end here, we got to scrap the whole thing and start over. That would not have happened, if you somehow could empower the people who knew what a good system looked like, with the capacity to build it, but you can’t.

**(00:17:06)** So I think this is, again, the word privilege really applies here. Such a privilege, when you get to build your own stuff. Not just because you’ll get the satisfaction of doing it, as we just talked about, the satisfaction of building your own tools and your own tools for those tools is very high. But also just the likelihood of success.

**(00:17:23)** I think this all the time, when we look at the number of features that we start building that we end up shipping. We have a whatever, 98% ship ratio, something like that. We were just talking about this the other day, and we were thinking like what was the last major thing that we built, that we didn’t ship.

**(00:17:42)** And I think it was two or three years ago, and it was something we called Client Side 2.0 which hilariously failed, because we were building it for other people. We were like, we don’t actually do client work anymore. We’re fumbling a bit in the dark, we’re trying to remember what it was like 20 years ago. And I mean, we made the second mistake, which was to call it 2.0, which is the worst thing you can ever call any software project in the history because that’s the second system syndrome where all your hopes and dreams goes to die.

**(00:18:13)** But that was the last major thing where we were like we spent a full six weeks and we did the hard thing. The hard Shape-Up thing. It wasn’t ready. We had even given it, I think we gave it one half go or something and it still wasn’t ready. And there wasn’t a path to getting ready. And we said you know what, we’re just gonna flush it.

**(00:18:31)** So that kind of efficiency, that shipping rate, is just a quite unique thing when it comes to software. And I think if you can have it, wow.

**Shaun: (00:18:42)** Yeah. Well, both of you have experience building things for others. I wonder if you can talk a little bit about that. Jason, 37signals was a web design firm, and you had clients that you needed to build for. Right?

**Jason: (00:18:54)** Yeah.

**Shaun: (00:18:55)** And David, you, I mean, you were hired on to build Basecamp to sort of scratch 37signal’s itch, right?.

**Jason: (00:19:01)** You know, we definitely did build things for other people. And as I mentioned, you certainly can. There’s lots of great consulting firms and product design firms that do build great products for other people. I just think there’s an advantage if you’re building it for yourself.

**(00:19:16)** But it’s certainly possible. I remember we, David and I worked together. I think the first project we worked together on for a client was something called Summit Credit Union, which was a credit union intranet. And I did the UI and David did the back end.

**(00:19:32)** The guy who was running the project for Summit gave us a sense of sort of what they thought they needed. But I think we kind of cheated in that we were like, what would we want in an intranet?

**Shaun: (00:19:42)** If we were a credit union?

**Jason: (00:19:44)** Well, like what do I want if I’m working with other—like, I want to go look people up and I need to download these forms. We kind of like asked them questions about what are the things people tend to do? And then I think we kind of decided to do it in a way that wasn’t what they said but was what we thought you would want? Was it any good? It lasted for a long time and I think I think it was quite good. But again, I don’t know for sure.

**Shaun: (00:20:08)** Yeah.

**Jason: (00:20:09)** You know, you, again, you’re just you’re getting feedback by proxy. You’re learning about what other people think about something through somebody else, it’s always one or two degrees removed. And in the game of telephone, the message is always distorted at some level.

**(00:20:25)** The other thing is, is that some people can’t really explain what they want because that’s not how they think. They don’t think about how to explain what they want, or they’re not good at explaining it, or they are good at explaining it but they don’t take the whole system into account. Like, well, we could do it that way but then that prevents us from doing it this way and that can be confusing in this scenario. So it’s very hard to hold all the possible scenarios in your head, if that’s not what you do for a living, first of all, and also, if you’re just asked on the spot, it’s hard sometimes to really explain it.

**(00:20:59)** And then if you’re going only on what other people can tell you, the fidelity of that feedback is fundamental to what you can build. And if it’s not great feedback, or people aren’t really sure how to explain it, that’s the source material you have to work with. And then it’s hard to really get somewhere great, I think, with that. Anyway, that’s a little bit of a riff on it, I would say.

**David: (00:21:17)** This is why I’m not in full alignment with the whole MVP movement.

**Jason: (00:21:23)** Yeah, I don’t like it either.

**David: (00:21:24)** That all you have to do is build the minimum thing possible, get something in front of customers, and then they’ll tell you what you’re supposed to build.

**Shaun: (00:21:32)** Sorry, what is this MVP movement?

**Jason: (00:21:34)** It means minimum viable product?

**David: (00:21:36)** Yes. Well, that’s what it stands for. But the cartoon that goes with it is even better, right? The cartoon is like, hey, instead of starting with, like, you want to build a car, you shouldn’t start with a steering wheel and a prop shaft. That doesn’t do anything on his own, hey, what you’re actually working on is mobility. And if you started with a skateboard, you’d have something useful, and then people will tell you how to morph that into a scooter or whatever. Which, it was a very, I think, impactful graphic that actually made no sense when you thought about it. Which a lot of graphics are like that.

**(00:22:09)** But that that’s why that doesn’t really work. This idea that you can just iterate your way into a coherent vision, I don’t believe that’s true at all. I think if you look at most of the defining products out there, they don’t come from that background. They don’t come from like, let’s just build the minimum viable thing, and then let the committee run it from here.

**(00:22:31)** No, they come from someone who thought about the problems very deeply. And sometimes that can be done by proxy, it’s very hard, and the odds of you hitting on greatness is much lower. But if it comes from scratching your own itch, like, hey, you can build something complete together.

**(00:22:45)** And I think that was, Jason, you put it in the way with, HEY, where we thought, you know what, V1, is not going to be a minimal viable product. It’s gonna be a great product built for me, or us. And then from there, we can talk. We can hear the feedback, because I think the problem with MVP, too, is when you barely have to thing defined, that it doesn’t really have a hard shell, it’s so easy to twist it in 1000 different ways. And you’ll get all this feedback and you’re like, well, should we take in this direction? Should we take in that direction? I don’t know, both sound equally good, there are people advocating on either side. How do I even decide?

**(00:23:19)** I don’t think that’s healthy. Have something with a strong vision. Or if you can have something with a strong vision, it’s much easier to adopt, and know what to say no to. All feedback is not created equal, it will not all flow into a beautifully cohesive product, as we often would say. We’d get a thousand feature requests and if we implemented all those thousand feature requests from everyone who requested it, every single one of those requestors would hate the final product.

**Shaun: (00:23:45)** Right.

**David: (00:23:45)** This is the Homer car syndrome, right? You just listen to consumer feedback, and you end up with like everyone’s request is in there and the final product is total shit.

**Jason: (00:23:56)** I’m not sure if we talked about this so far in the book, but we often reference chefs and food analogies, and I’m going to try one here, because the MVP concept has never made sense to me, either. Because it’d be like baking half a recipe of bread. It’s like, you can’t do that, you have to make the recipe to evaluate whether or not it’s any good. You can’t be like, if I just mix flour and water, why don’t you taste that and tell me what I should add next. That’s like, that’s not how it works. You can’t do that, you know. You need to do the whole thing and then you can evaluate whether or not it’s any good.

**Shaun: (00:24:31)** Yeah.

**Jason: (00:24:31)** So I think you need to make the whole dish. You can make a simple version of the dish, but it needs to be like the whole dish. It can’t be a partial dish and then ask someone, what do you think? Because that’s not what you’re selling. You’re not selling partial dishes. You’re selling a product and a product has to be like, it has to do what it needs to do as a full product. It can be a simple version of that product. It can be a very light version of that product, but it needs to be the whole thing and not just a piece of which someone can then imagine and fill in all the blanks about all the other things it can do. It just doesn’t work that way.

**(00:25:08)** So I’m not a fan of the MVP approach either, even though it’s pervasive. I mean, it’s everywhere in our industry and it’s been taken as gospel like, this is the way to do things. And it’s, you know, always fun to push back on that. But people sometimes just are so indoctrinated in that point of view that they can’t imagine any other way than just to build a partial thing and show people and expect that they’re going to tell you where to go next in the right way. It’s just It’s a strange approach, but it’s common.

**Shaun: (00:25:37)** Well, let’s end with one of the side effects you mentioned, of scratching your own itch and building for yourself, is that you get to fall in love with what you’re making. Can you talk a little bit about falling in love with Basecamp, or HEY or any of the other products that you’ve been making?

**David: (00:25:52)** I’ll talk about it actually from the opposite direction first, which is when we were—

**Shaun: (00:25:55)** “I hate Basecamp.”

**David: (00:25:56)** Not about Basecamp, but when we were building for other people, I would occasionally get enamored with something we would come up with. And then the customer would come back and say, no, actually, no, that’s not what I want. I want this other thing. And I’d go like, no, no, no, no, no,

**Shaun: (00:26:13)** That’s hard [crosstalk]

**David: (00:26:13)** No, no, the thing is good. What you’re proposing makes no fucking sense, you’re going to make it worse. And this was one of the reasons I was not well cut for consulting work.

**Shaun: (00:26:22)** [laughs]

**David: (00:26:22)** Because that’s what I mean. You’re making something for other people so if they tell you straight to your face, that’s not what I wanted, here’s what I want instead. You’re supposed to go, Thank you for the information.” And I would go like, “Fuck your… just, can you get out of here, like, let me just build my perfect thing in my vision.”

**(00:26:40)** And that’s, of course, not what the arrangement is. But that’s what this arrangement is. That’s what Basecamp is, that’s what HEY is, that we got to build the thing as we want to build it.

**(00:26:49)** And we’ve got the power to say no. This was something else that was crucial, particularly early on, was that we didn’t have any individual customer be able to tell us what to do. We didn’t have these mega clients, mega contracts where early stage software in particular, get the great misfortune of landing a huge account that has so much power over them that their software almost turn into consulting-ware and now they’re constantly following up with that client, that client keeps telling them what to build, and they go like, “Ugh, I can see how maybe that makes sense for you, but it doesn’t make sense for the broader product.” But they feel like they have to.

From day one, Basecamp had hundreds of customers. I don’t know how many signed up on day one, but it was probably more than 100. And then after a few months, it had thousands. And after that it had tens of thousands, to the point where no individual contract or sale could determine where we were going to go. And that just gives you an incredible amount of freedom to really follow a vision through and stick with it and go, do you know what? I can say no and it can cost us some money. But it won’t cost us all the money. It won’t risk the existence of the company. That sense of freedom is intoxicating.

**Shaun: (00:28:02)** Didn’t we have a big whale using Campfire?

**David: (00:28:05)** Yes, it was Twitter.

**Shaun: (00:28:06)** Yeah, that’s right, it was Twitter.

**David: (00:28:08)** The only whale we’ve ever had in the history of Basecamp was Twitter using Campfire. And it was funny, we found out because, this was years after I think we’d even stopped selling Campfire.

**Shaun: (00:28:18)** Right.

**David: (00:28:19)** We find like, where’s all this resource consumption coming from? Oh, there’s one account that’s accounting for basically 40% of full all the user debit. And it was Twitter and they were paying us something like $99 a month for us to spend thousands of dollars on infrastructure to service them. And we went like, do you know what, this doesn’t work.

**(00:28:35)** So we actually, we ended up giving them the fuck you price, which was like, I don’t know, let’s fucking just charge them five grand a month, they probably don’t want that, so they’re probably going to leave. So I wrote, I forget who it was, but I wrote like, “Hey, now the price is five grand a month.” And they went like, “Okay, sure.”

**Shaun: (00:28:51)** [Laughs]

**David: (00:28:51)** And I went, “Fuck. We should have charged 50 grand a month. Clearly!” But the problem was as soon as it was five grand, I felt an obligation. It wasn’t even something they asked for. But I personally felt an obligation that I had to be their account manager.

**Shaun: (00:29:04)** Right.

**David: (00:29:04)** So now this person had a direct line. And I felt like, “Ah, they’re fucking paying us five grand a month, I gotta answer this. And I actually gotta fix whatever is bugging them.” And I was like, I don’t like this arrangement one bit.

**(00:29:17)** Oh my god, I’m so happy we never had to do that. And this is a beautiful reminder of why we should stick to those guns. It’s that we don’t end up with single customers who are half the revenue of an entire product.

**Shaun: (00:29:29)** Right.

**(00:29:30)** Jason? Do you want to say anything about falling in love with the products you make?

**Jason: (00:29:32)** Um, no.

**Shaun: (00:29:34)** Okay, well, this is a great place to end.

**All: (00:29:38)** [Laugh]

**Shaun: (00:29:38)** No, this is a fantastic place to end. Next week, we are tackling the essay titled, “Start making something.” So, kind of a lot like this one, to be honest. We’ll try not to a—

**David: (00:29:48)** Just do an MVP. Just do skateboard. That’s how you get started with mobility.

**Shaun: (00:29:52)** Let’s do skateboard.

**(00:29:55)** Well, thank you for joining me on REWORK, Jason Fried.

**Jason: (00:29:58)** Thanks, Shaun.

**Shaun: (00:29:59)** And thank you, David Heinemeier Hansson.

**David: (00:30:01)** Thank you.

**Shaun: (00:30:03)** We’ll see you next week.

**(00:30:05)** Broken By Design by Clipart plays.

**Shaun: (00:30:09)** REWORK is a production of Basecamp. Our theme music is by Clipart. You can find us on the web rework.fm and on Twitter at @reworkpodcast.

**(00:30:17)** Next week we’re discussing the chapter, Start Making Something. So if you have a copy of REWORK the book, flip to page 38.

**(00:30:24)** As always, I’d love to hear from you. If you have any comments about the show or questions for Jason or David, leave us a voicemail at 708-628-7850 or better yet, recorded a voice memo on your phone and email it to hello@rework.fm.

**Simpsons Clip: (00:30:57)** Herb: Homer, I need your help.

**(00:30:58)** Homer: You do?

**(00:30:59)** Herb: Yeah. I want you to help me design a car. A car for all the Homer Simpsons out there, and I want to pay you $200,000 a year!

**(00:31:12)** Homer: And I wanna let you!

This is an episode title
