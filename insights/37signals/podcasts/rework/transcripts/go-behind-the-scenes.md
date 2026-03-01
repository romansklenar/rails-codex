---
title: "Go behind the scenes"
description: "A famous guy once said, “Pay no attention to that man behind the curtain!” But he was a grifter."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/go-behind-the-scenes/
tags:
- podcast
---

# Go behind the scenes

**Wailin: (00:00:00)** What they do in public radio to test levels is they have the interview subjects talk about what they had for breakfast ‘cause it’s an easy conversation starter. And it’s funny to ask two bakers, what they had for breakfast.

**Amy: (00:00:11)** I don’t eat breakfast because I, because I come here later in the day and I end up tasting a million things. So, the first thing I had today was some pieces of hummingbird cake.

**Frank: (00:00:21)** I had a cup of black coffee and two scrambled eggs.

**(00:00:25)** Broken By Design by Clip Art plays.

**Wailin: (00:00:26)** Welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m Wailin Wong.

**Shaun: (00:00:32)** And I’m Shaun Hildner. So, here’s a little bit about my background. I went to film school and one of the reasons I chose to study film was watching the bonus featurettes on the Lord of the Rings DVDs.

**Wailin: (00:00:44)** I love those featurettes.

**Shaun: (00:00:45)** Me too.

**Wailin: (00:00:46)** There’s like 20 hours of them. I’ve seen them all at least twice. And I became a reporter I think because it’s an excuse to be professionally nosy. And one thing I love doing is visiting factories, especially if I get to press a button of some sort. I was thinking recently about all the places I got to visit for our previous podcast, The Distance. Do you want to hear the list?

**Shaun: (00:01:07)** I assume I don’t have a choice.

**Wailin: (00:01:09)** You do not. I wrote it all out. Here we go. Mattress factory, tofu factory, bicycle factory, butter factory, ice sculpture factory, gravestone factory, metal coatings factory, lip balm factory, cheesecake factory—an actual cheesecake factory and not the restaurant, which I also enjoy. Headphones factory, corrugated display factory, embalming fluid factory, leather tannery, maple syrup farm, art storage warehouse, wooden boat workshop, auto junkyard…

**Shaun: (00:01:37)** What is it about giving customers a behind the scenes look that endears people to brands?

**Wailin: (00:01:42)** I think humans have a lot of natural curiosity and it can be really fun to learn how something works or gets made by watching it happen firsthand. And from the perspective of the businesses, opening up can build a relationship with customers who want to know more.

**Shaun: (00:01:57)** What you heard in the beginning was a little bit of an interview with Zingerman’s Bakehouse in Ann Arbor, Michigan. Also on this episode we’ll hear from Jason Fried talking about his YouTube series, taking people behind the scenes of how we do design at Basecamp.And where are we right now?

**(00:02:11)** [Soap factory noises in the background.]

**Wailin: (00:02:11)** I’m at the Method soap factory which they call the Soapbox on the south side of Chicago. It’s owned by a San Francisco company called People Against Dirty, but Method’s manufacturing operations are in Chicago. The factory opened in 2015 and it was a big deal for the city because they built it on a brownfield in a neighborhood that was on the economic decline and they staffed the plant with residents from the neighborhood. They also do a lot of environmentally forward-looking things with the factory, like it’s LEED certified, which is a way of evaluating how green a building is. And, Method has been open for public tours since the beginning. So, I joined a group of sixth graders for a recent tour to see what it was all about. The tours are led by employees who work at the plant.

**Tour Guide: (00:02:57)** Do you guys recycle? Okay. At school. Okay. Do you guys compost?

**Shannon: (00:03:02)** So, I’m Shannon McCann. I’m the director in charge of all production operations within the facility and that covers all of the manufacturing of the bottles, the decoration, the blending, the product, and the filling of the finished bottles.

**Wailin: (00:03:15)** But, we weren’t really here to talk about the soap. I wanted to find out about the building.

**Shannon: (00:03:20)** So this is a really exciting building. If you want to start talking like architecture of factories, which, as a general rule, it’s not an exciting thing. But, this is a LEED platinum factory. We have the world’s largest industrial functioning greenhouse on our roof. We are a William McDonough building and as well we have a wind turbine on the back corner of the property. We have three solar panels in the parking lot. We have another actual solar installation on the roof that heats all of the hot water in the facility and we have a bioswale that actually filters the rainwater that falls on this site so that it enters Lake Michigan in its proper place and proper condition.

**Wailin: (00:03:59)** Was it the idea from the beginning as you were conceiving the building and developing it and designing it, that it would be open for tours?

**Shannon: (00:04:06)** Yeah, so we’ve always talked about we want to be open for tours, but obviously as we’re building a factory and inventing this whole thing, it was really hard to like figure out exactly what that was gonna mean. But we always wanted to do that for a couple of different reasons. One, we feel, even though this is a factory, it’s just a manufacturing facility, it’s a pretty exciting building for all of those reasons that I just talked to. So we really want to let the world know, hey look, this is a pretty exciting little box we have over here. Also, we really want to educate the public on like when you look at corporations or companies or products on the shelf, there are companies out there that want to make a difference. They want to spend the effort to build LEED platinum, they want to spend and for to have renewable energy on site.

**(00:04:54)** So, we want to educate the public that this is actually something that can be done profitably and, just can be done. So, to try to help people understand that it isn’t just, you know, the old, uh, gray soot and smog that we used to have in the ‘60s and ‘70s, right? And the other thing we wanted to do is really tell the world about our products, right? Like this is what we do and this is how we do business. And you know, from us, we feel that everybody should take this model. So it’s kind of more showing off to… maybe this is the way people should look at things when they go to build something from the ground up. And I don’t know, when we were envisioning tours, how much of it we thought would be school groups versus more adults.

**(00:05:37)** So, a lot of our tour material at the beginning, if you were to come in 2015, early 16 was more, here are the facts of the building and this is how much power the wind turbine. And like some of that is tough to resonate with a bunch of six or seven-year-olds. So we had to come up with kind of a twofold tour. One that people who more detail, it makes them comfortable or happy to come to the tour and one that we really want kids to walk out of here excited. So, we you have much more of a kid-friendly tour that Barbara and Sheree and some of our tour guides give. And we also learned that with school groups, one person just can’t manage 30,35 kids effectively. So, we’ve learned over time that you gotta have two people with these larger tour groups.

**Wailin: (00:06:23)** Do you do any advertising for the tour. I noticed if you go on the website there’s a signup sheet and you can put in your contact details to sign up for a tour. But was it something that you publicized or something? I mean, do you print anything on your packaging saying if you’re in Chicago you can come by. Anything like that?

**Shannon: (00:06:38)** No, so, really if you don’t know it by word of mouth or go to our website and actively look for it, it’s not out there. Now, there’s a couple reasons for that. One we, you know, we don’t necessarily do a ton of advertising anyway, so we advertise very wisely. But also, we’re only open for tours one day a week, three tours a week. And for the most part our tours are booked already. So, we don’t have a big need right now to go out and garner more tours. We average about 225 people a month. So if you work that out, it’s about 2,500 people a year.

**Wailin: (00:07:16)** Wow. Do you get a sense of, with the grownups anyway, who they are and how they found out about the tour and why they signed up?

**Shannon: (00:07:24)** So it is a huge, wide range. I can tell you on one side we get moms who are just looking for somewhere that they have a young child and they want a couple hours with the stroller to come through. And on the other extreme I actually get, we’ve seen people come through that have been trying to get in and make… do business with the company. So they’re trying to sign up for the tours as like a way to make a cold call. So, it’s all over the place for the people show up for the tours, from an adult standpoint.

**Wailin: (00:07:53)** What do you do with the cold callers who try to slip you their card?

**Shannon: (00:07:56)** Yeah, we’ll take the business cards and we’ll pass them along. But you know, we don’t manage a lot of that here. So, it really does give us an easy—San Francisco manages most of our contracts and everything. So it works out for us. And then one of the things about this building, you know, we have… our bottles suppliers onsite. So, obviously we’re not going to change bottles suppliers And we have a bottled decorator on site, we’re not going to change bottle decorators. So, we are kind of locked in to like long-term contracts with most of our people.

**Wailin: (00:08:26)** And are there ever any concerns about intellectual property and that kind of thing? I imagine that for a lot of manufacturing companies especially that have complex operations, that would be the number one concern they would have about opening up their facility to the public or for any kind of tour. Is that ever a concern here? Was that something that ever came up during the design of the tour and the plant?

**Shannon: (00:08:50)** So, I think we definitely worry about that at some level, right? We do have intellectual property that is ours and we don’t want the whole world to use our property. I would say that, you know, we structure our tours and we talk about things like wind turbines and bioswales and greenhouses on the roof and really try to make those pieces exciting. And then we don’t have to talk about some of those things that are proprietary to us, like, what is our exact formula or what is our KPI structure and stuff like that. So, I think we can manage the tours without getting into our proprietary things. And, if we get questions about them, we usually will defer them and take people’s business information and pass those questions along to somebody else.

**Wailin: (00:09:37)** Were there ever discussions about, well, you know, running the tours are an expense because you have to take people off the line and you make them tour guides. Was there ever that kind of calculus of saying, well okay, this is, you know, for the bean counters, this is the business case for opening up the factory?

**Shannon: (00:09:52)** Now we never broke it down to like the dollar and cents part of it, but it really falls into one of like we want to… one of the things that we always strive to do is what we call PADvocates. So our company is PAD, or P-A-D, People Against Dirty. So we try to build not just customers but we want to build PADvocates. Those are people who are going to use our products for life and we feel like the tours are part of, once we get people in and explain to people how we use 100% recycled plastic in our bottles, how we’re trying to be restorative, not just recycling but restorative. We really feel this is part of building those customers for life.

**(00:10:33)** Broken By Design by Clip Art plays.

**Shaun: (00:10:35)** What was your favorite part of the tour?

**Wailin: (00:10:38)** Oh, there’s something so satisfying about watching hundreds of a beautifully packaged product come down an assembly line. I think it’s my type A personality.

**Shaun: (00:10:45)** Like watching an ant farm. Like, you like that border?

**Wailin: (00:10:48)** Oh yeah. And it’s so rhythmic and soothing. So, when we were there on one of the main lines, they were making Methods French lavender scented hand soap. So, you could see the bottles. There are these clear bulbous bottles and they’re filled with pastel purple liquid, moving through the equipment in a line is great.

**Shaun: (00:11:06)** Like you said, there is something very satisfying about watching physical objects get made. But what if you make something intangible like software like we do here at Basecamp? Coming up is an interview I did with Jason Fried about how he’s sharing our internal design process here at Basecamp. So not quite a factory tour but

**Wailin: (00:11:21)** As close as you can get in a software company to a factory tour?

**Shaun: (00:11:25)** Yeah, the software company version of a factory tour. I also should note that this interview took place back in April.

**Jason: (00:11:32)** About a month ago we launched new YouTube channel called Getting Real and David was doing some live coding. They’re not really coding demos. It’s more like coding breakdowns. Like, here’s some code in the Basecamp code base, let’s walk it through. Let’s talk it through. Let’s look at why we did what we did and I thought that was pretty cool. I was thinking about doing some design related ones too, like design decisions, why we did this, why we did that, breakdowns of features, or announcing that kind of stuff. And so we decided to combine those two sort of different channels we had into one channel called Getting Real.

**(00:12:06)** For years we’ve been telling people how we work and you know, writing it up primarily and we’re like, why don’t we just show that too. So we’re still gonna write stuff but let’s actually show it for real.

**(00:12:16)** So, I’ll do a live design review with one of the designers. Like, this is actually what we discuss and how we go through it and how we think it through and how we break it down. And so far David’s been doing the code ones. I think it’s working out pretty well. We’re having a good time with it.

**Shaun: (00:12:26)** Can you give me an example of one of the design reviews?

**Jason: (00:12:30)** One with Conor was pretty popular. I think we went for an hour where we were looking at the new client feature in Basecamp 3. We revamped the way firms and clients work together and this was not the final review. This is a few weeks prior to launch and we were kind of looking through where it was at and we talked through copy and we talked through design elements and we just went through the whole flow and looked at some problem areas and some rough spots and some things we knew we couldn’t figure out, some things we thought we might be able to figure out.

**(00:12:55)** Just kind of went back and forth like we would normally do it. We just happened to record our screen and also record our video and our audio. So I did that.

**(00:13:06)** I also did one with Jonas where we talked about the new Boosts feature we’re working on and I think at the time it was called Whispers. When we looked at the work we came up, or, Jonas came up with the word Boosts.

**(00:13:13)** So, we did that. I’ve recorded a few other ones with Adam, which I haven’t pieced together yet cause it’s actually three different parts. I want to kind of do a nice three-part series. But we’re trying to do maybe one of those a week.

**Shaun: (00:13:24)** What do you think Basecamp gets out of letting people look behind the scenes like this?

**Jason: (00:13:28)** I think it’s the same reason we’ve been writing and sharing our thoughts and ideas for almost two decades now basically, which is just, why not? We’re doing it anyway. So, the design review is scheduled. We didn’t schedule a fake one just for the video, so let’s record it and share it. And other people might get insight into how we do things or they might suggest things that we should do differently. I think it’s actually more interesting because we get to get real with it. And that when you write an article, you’re sort of describing something in the abstract or you can show screenshots, but you can’t really explain what it was like in that moment to discuss this thing.

**(00:14:01)** By turning the video on and recording the screen and the audio, you can really get into the extreme detail and it’s sort of extemporaneous in that you’re saying it and it’s not planned. It’s not like a document that you write and you edit and you publish. It’s like this is actually our discussion and it can be messy at times and you can figure out things along the way and change your mind or whatever, but that’s how it goes.

**(00:14:22)** My experience has been that very few companies have been willing to share that level of detail with behind the scenes stuff. They’ll always write up like, here’s our logo design, here’s the 400 variations we had and here’s all our Post-It notes up on the wall, showing all the different variations, but here’s the final product and we’re really happy with it. And they shared the process a little bit, but it’s never really documented in a way that it’s publicly shared. So, the idea was to be very real about this and say, this is actually how it goes. And I think it’s cool to be able to expose that kind of stuff.

**Shaun: (00:14:47)** Is there any benefit that you found to doing it live as opposed to having these prerecorded?

**Jason: (00:14:52)** Yes and no. I found myself, at least, not saying something I might normally say cause I know it’s going to be recorded, so I kind of have to get over that hump.

**(00:15:00)** Which is why I want to do a lot of these. I think we have done six or seven or something and by the 20th that’ll be a lot better than the seventh you know? And part of that is, I don’t want to be censored at all. I want to say what’s on my mind, that sort of thing. Because you’re thinking about that this is being recorded. You try to want to be more thoughtful about what you’re gonna say. And I think that’s a good push anyway.

**(00:15:20)** I think it also is helpful because other people in the company can watch these things too and sort of understand how the sausage is made in a sense. You know, not everybody gets to work on the product. There’s a dozen people really that are actively working on the product, How did you come up with this design and how does it end up this way?

**(00:15:38)** And we don’t really ever share that level of detail with everybody because it would be impractical to do so to have 50 people watching the design review doesn’t make sense. Some of the other programmers had been watching some of David’s stuff, especially I think, I think I saw a comment from Zach who works on iOS, who doesn’t really work in Rails very often. He’s like, oh, I get to understand the Basecamp codebase some more this way.

**(00:15:58)** Naturally, that could have happened some other way, but it never has. So, I think this is sort of a benefit in that respect.

**Shaun: (00:16:03)** I don’t know how closely you follow comments and that kind of stuff, but do you notice any difference in the audience between the blog or the podcast, and this?

**Jason: (00:16:11)** Yeah, they’re very productive comments. Actually, they’re pretty much in SvN, too. But I’m sort of surprised because YouTube comments usually are kind of the worst.

**Shaun: (00:16:18)** Notorious, sure.

**Jason: (00:16:18)** Ever. Right? People have been very thoughtful about them. Some people have given us some different ideas on how to do something, which is kinda cool. But I think people have been very fair and it’s been cool to see what’s meaningful to people and what they take away from these videos that maybe I hadn’t considered.

**(00:16:36)** We contemplated for a moment, I remember, when we set up the channel, like they give you an option to have comments on or comments off. I don’t know if that’s channel-wide, or per video. But just for like a half a second, I’m like, should we turn them off or on? And it was just pretty obvious we should turn them on. We have them on for everything else and I think it was a good decision.

**Shaun: (00:16:53)** Wailin would like me to ask you, I think this is in relation to this, to like a, it was like a bonus episode? Was it like writing live?

**Jason: (00:17:00)** Oh yeah. Right. Well, first of all, I decided that I was just going to turn my screen on with a blank screen and write an article that I had to do for Inc. magazine. And, I’ve always been interested in watching people’s creative process. That’s why I love cooking shows. I love all these shows where it’s like, this is how you make something. And so when I write, I don’t have an outline, I have a topic. I just sort of write what I’m thinking, what I would say out loud and I wanted to see how it would go.

**(00:17:26)** That’s funny because I wasn’t really happy with how that article turned out. I kind of didn’t really make the point I was trying to make in the beginning of the article. By the end, it wasn’t really the point I was trying to make and I think that if I didn’t have the video on, I would have gone back and fixed that. But I remember thinking to myself, if I go back and fix this now, this video could go on for another 45 minutes and I don’t, I don’t really want to do that.

**(00:17:45)** But I think I admitted in the video that like I think I B- this one or C+ this one, kind of. It wasn’t great, but at least it showed the process of how I think about something, how I kind of move some text around. How I put some text at the bottom of the document so I can come back to it later. That kind of stuff, which is sort of I’m watching someone make something in Photoshop or something and you don’t know how they do it.

**Shaun: (00:18:02)** Yeah.

**Jason: (00:18:02)** And you’re like, oh, that’s how you take wrinkles out of the eyes or reduce redness, or whatever. My friend Erika is a photographer and I watched her retouch a photo once and like, oh, that’s how you do that. I didn’t know how you did that, you know? And so by kind of showing the process of writing and you know where I put text and how I think about a paragraph or a sentence or a word or the rhythm of it and whatever, I thought it would be similar to that. And I don’t know if it was successful or not, but it was fun to do. I don’t know, maybe I’ll do another one at some point. But I’ve always wanted to see someone else do that. So I figured I’d try it.

**(00:18:32)** Broken By Design by Clip Art plays.

**Shaun: (00:18:35)** Can I tell you something really weird? When I’m doing the dishes or some chore I don’t want to be doing, I pretend that people are watching. Like, I’m on a cooking show, or in this case a dishwashing show. Like you know, talking my way through it helps it go by quicker.

**Wailin: (00:18:48)** My doing the dishes show would be a dark family drama about how I leave them piled up in the sink for my husband to do. ‘Cause I really don’t like washing dishes. I do like cooking shows though.

**Shaun: (00:18:57)** And, as you heard, so does Jason. In REWORK the book, there’s actually a section called Emulate Chefs that talks about how chefs are known for sharing behind the scenes stuff. You know, they publish their recipes and cookbooks and demonstrate how to make their foods and shows.

**Wailin: (00:19:10)** And that brings us back to the folks you heard from at the very beginning of the episode. I went to Ann Arbor, Michigan to interview Amy Emberling and Frank Carollo. They’re the managing partners of Zingerman’s Bakehouse. The original Zingerman’s is a deli that’s a beloved institution in Ann Arbor, and it’s grown into a constellation of businesses that are affiliated but run independently.

**(00:19:29)** I wanted to interview them because last year they published a book to coincide with their 25th year in business. It has recipes for a lot of their signature items, but it’s also a business book that talks about their history and how they operate today. It’s a great read, even if you don’t want to try the recipes, there’s tons of great stories in there about what’s gone right and wrong and what they’ve learned. Here’s Amy.

**Amy: (00:19:53)** Yeah, so we had thought about writing the book many years ago. I don’t know, seven to ten years ago, and writing a book is entirely different process, you can imagine, from baking or running a bakery. So, it didn’t ever make it to the top of our list. However, when we were thinking about, oh, we’re about to turn 25 or in… about three years before that, I thought, wouldn’t it be great? This is the time to do it. We could kind of make it the capstone for that first quarter century and summarize what has happened in the last 25 years. And luckily we thought of that and had enough time to get a publisher and make it all happen for the 25th anniversary.

**Wailin: (00:20:33)** And it seems like from the very conception of the book, it was important not just to do recipes, but to do a couple of other things, which you actually numerate pretty clearly. You wanted to tell the story of the business and you wanted to take readers behind the scenes and really explain how things work, that might not be visible from someone just stopping in to buy something. Why was that important to have these other aspects to the book?

**Amy: (00:21:00)** You know we live in a college town, a research university town. So, we have a lot of friends who are professors and they’d like to do, you know, research that’s new. And so I thought, well, I don’t want to write just another baking book. There are lots of incredible baking books out there for the public. And so, I wanted to write something and then Frank agreed, that was unique to us. So it got to tell our story. And I think Zingerman’s and the Bakehouse, we’re not just food producing businesses. We’re very much about the process of how we work together, and so we wanted also to share that.

**(00:21:36)** And finally, you know, we all see a lot about chefs in the world, uh, but not that many people know about what the life is like of a professional baker. And I thought people just might find that interesting. People seem to like to know what goes on behind the scenes. And so this was our chance to say what it’s like to be behind the scenes of a bakery like ours.

**Wailin: (00:21:54)** Is recipe writing for the home baker a pretty different beast than sharing recipes internally with trainees? Is there a way that you write the recipes where you have to really reorient yourself?

**Amy: (00:22:10)** Within the bakery, we could pretty much just say bake it until it’s done. And then there might be some verbal communication in the bakery about it. But you know, professional bakers, know, pretty much, at least the bare minimum of when something is done.

**(00:22:23)** But for the home bakers, you know, we had to describe the color, we had to describe what it might feel like in the oven. What all the little different things to look for. So, I think it was a little more painstaking in the descriptions.

**Frank: (00:22:36)** There were certain points that were a challenge to try to go back to being barely competent at something and trying to articulate how you gain competence. Something that we have the opportunity as professionals to have done 500 times and it becomes instinctual.

**Wailin: (00:22:56)** Can you talk about your idea of secrets and why you think maybe that’s a little bit of a misnomer?

**Amy: (00:23:04)** There are very few. They’re not really secrets. Now, some, even professional baker may know something. I have learned something that one of us doesn’t know, but I think that that comes from experience and paying attention. So, they’ve learned it. It’s not that it’s a secret, it’s maybe that they were doing a better job of being a student of the work that they were doing.

**(00:23:25)** So, we try to be very attentive to what we’re doing everyday so that we can really understand what’s happening. And we have the opportunity with a lot of repetition to do that. But when you have a lot of repetition, you could also just stop paying attention because you think, you know, this is just boring. And I did this yesterday. And so, one of our challenges is, with our bakers is getting people to pay attention and to be thinking about why is today different than yesterday? Why is this feeling different? Why is this stretching in a different way? And then speaking to others who were there working, well, what, did the atmosphere change? Is this a new batch of flour? So for a home baker, it seems like secrets because of course you wouldn’t be doing that and you just don’t have that knowledge just as we don’t have it about, you know, pottery. But it’s not actually that it’s a secret that other people couldn’t know, it’s just from experience.

**Wailin: (00:24:17)** I mean the interesting thing about cookbooks, especially cookbooks that come out from restaurants and businesses is, it’s like, oh, like you get to make the thing that they make and sell. And is there ever a sense of, oh, we’re giving away like a trade secret or how do you approach that question?

**Amy: (00:24:36)** There was some small level of anxiety, very small, years ago about giving out recipes, but we opened our school up 11 years ago and we’ve continued to grow and have a thriving business in the other areas. So, and, still when putting the book out there and having it go all over the country, these things are replicable. The real challenges in running a successful business is not just replicating that recipe and that there are so many other things that go into it that to make it successful and to keep it going, that I could let go of that anxiety.

**(00:25:06)** And then the other thing that we learned is in our own business here in Ann Arbor, that there are people who like to learn to make it. And there are people who would prefer to buy it. And sometimes the people who like to come to class to make it, they also don’t want to make it at home. They want to buy it. But what they’re buying is the experience of the class and more appreciation for what they’re making, but they still don’t want to make it at home.

**(00:25:28)** But then there are the people who would never buy from us and now they get to come to the class and we form a really nice and different relationship with them. So, I think overall it really grows our connection with people in the community, whether it’s here or across the country.

**Wailin: (00:25:43)** What about the parts that talked about setbacks that you faced in the business, or even just saying that these are our slow months and sometimes it’s hard to feel really motivated during the winter months. Were those parts difficult to write?

**Amy: (00:25:57)** I don’t mind sharing vulnerabilities. So, it was fun to write and actually I think it’s a service to people to be vulnerable and to share failures. And, it’s something that we don’t do enough in our culture. We only hear about all the good and wonderful things that happened to people. And for many of us we have some, you know, down moments. So that wasn’t hard.

**Wailin: (00:26:20)** If there’s people reading the book who are interested in starting their own business… were there certain takeaways you hoped they would have reading your book and reading what you’ve learned about running a business for 25 years?

**Frank: (00:26:32)** It’s really important that before they start a business, they make certain that they work at that job. Because, someone who bakes at home and really loves that may think that running a bakery is all about fun. And, baking gives us a great deal of joy and satisfaction every day. But, at the end of the day, we get up very early in the morning and we stay up baking until very late at night. And the sourdough process never ends. It’s a 24-hour a day cycle and you have to really be committed and love to work really, really hard. And, we happened to get a lot of joy out of hard work and find a way to make it fun. So, if those things resonate with you, give yourself a chance, work for a while professionally and make sure it not only sounds like a good idea, but it’s actually a sound idea.

**Amy: (00:27:29)** We write about our mission statement and the creation of the mission statement. So, two things really. One is knowing who you are and who you want to be and then being able to stick with it. And then you have to sort of decide what kind of business do you want overall? Do you want one that you’re building, that you want to keep for a long time? Or do you want one that you’re just going to make a lot of money and sell? So, our book is more of an example of a business that you want to build and continue to live in. And so what is the mission? And then how do you build it so that it’s something for life and then be really persevering and not giving up on your mission and just not changing every time there’s a little swing in the marketplace about what’s important. You can stick to your mission and your vision and still be successful.

**Wailin: (00:28:14)** Was there ever a point in the last 25 years where you allowed yourself a moment of, I think we made it?

**Frank: (00:28:21)** Absolutely the opposite of ever allowing ourselves to think that we made it. There’s honestly no success that we do anything other than say, okay, well that was good, but there’s really a hundred things that we need to improve that we did wrong yesterday and we’ve got to work harder to make those things better.

**Amy: (00:28:42)** I’m not sure that we’re the most fun people to work with, because we don’t spend a lot of time stopping and celebrating. I’m sure… there actually was a point and I don’t know frank, if you wrote about it in the book, I think you did, in the whole conversation about failure, where you realized after a certain number of years that you could feel confident that the bakery could survive some challenges. And so maybe at that point you knew that there was a lot more to do and that we could always do, but you weren’t constantly in, in deep fear of failing.

**(00:29:15)** But I… just yesterday I was having a meeting with one of the founders and I said to him, you know, now I look at everything we’re making and I’m thinking it’s all not okay. So…

**Wailin: (00:29:25)** You just wrote the book!

**Amy: (00:29:27)** Well, that was that. Now that’s done. Now we need to keep going.

**Wailin: (00:29:30)** Rip up the recipes, get all new ones.

**Amy: (00:29:33)** ‘Cause everyone else is going to make those recipes. Now we have to start over.

**Wailin: (00:29:36)** I wanted to close this just with like a lightening round of little questions that my coworkers had sent along.

**(00:29:41)** How much butter do you go through the week?

**Amy: (00:29:45)** Gosh, what are we using right now? Is it 2,000 pounds or so?

**Frank: (00:29:48)** At Christmas, it’s more than a thousand pounds a day for a 10 straight weeks, so that’s a lot of butter.

**Wailin: (00:29:56)** Pancakes, waffles or crepes?

**Amy: (00:29:59)** Crepes.

**Frank: (00:30:01)** Pancakes.

**Wailin: (00:30:02)** Cake or yeast donut. This is an extremely divisive issue at my company.

**Amy: (00:30:07)** Yeast donut.

**Frank: (00:30:08)** Yeast donut.

**Wailin: (00:30:09)** No hesitation, yeast, all the way.

**Amy: (00:30:12)** This is the core of our partnership that we both agree on that one question.

**(00:30:15)** Broken By Design by Clip Art plays.

**Shaun: (00:30:15)** REWORK is produced by Wailin Wong and me, Shaun Hildner. Our theme music is Broken By Design by Clip Art.

**Wailin: (00:30:24)** Our website is rework.fm, where you can find show notes for this episode. I’ll link to the form on Method’s website where you can sign up for a tour, if you’re in Chicago. I’ll link to Jason and David’s video series on YouTube and to Zingerman’s Bakehouse. They do mail order so you don’t have to be in Ann Arbor to try their baked goods. You can also buy their cookbook and try the recipes herself.

**Shaun: (00:30:45)** We’re on Twitter @reworkpodcast and you can leave us a voicemail at (708) 628-7850

**Wailin: (00:30:55)** I also really enjoy a guided tour, like when I’m on vacation.

**Shaun: (00:31:02)** Mm-hmm. Mm-hmm. What’s been your favorite vacation guided tour?

**Wailin: (00:31:07)** Well, have you done the one at Alcatraz?

**Shaun: (00:31:08)** Oh yeah, I have. That’s really good.

**Wailin: (00:31:09)** Yeah, it’s really good. They have former inmates narrate as you walk through the facility. Do you want to hear the wildest thing that happened when my family and I went to Alcatraz on a family vacation?

**Shaun: (00:31:18)** Yeah.

**Wailin: (00:31:18)** This is a few years ago. So, we were there on this guided tour and a group of former Marines came in and took over Alcatraz with a cache of chemical weapons aimed right into downtown San Francisco. And we were all just in the cells waiting to get rescued in the u s government had to send in a chemist and the only person who’s ever broken out of Alcatraz to come rescue us and disarm the weapons.

**(00:31:56)** [Soundtrack music from The Rock plays.]

**Wailin: (00:32:02)** I’m going to take pleasure in guttin’ you, boy.

**Shaun: (00:32:04)** I’m going to take pleasure in guttin’ you, boy! Are we still rolling? This is good.

This is an episode title
