---
title: "Good enough is fine"
description: "At 37signals, we tend to solve problems by finding a “judo solution.” The simplest, easiest, cheapest solution that gets you 90% of the way there."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/good-enough-is-fine/
tags:
- podcast
---

# Good enough is fine

**Shaun Hildner (00:01):** Welcome to REWORK, the podcast by 37signals about the better way to work and run your business. I’m Shaun Hildner, and as always, I’m joined by 37signals’ co-founders and the authors of REWORK, Jason Fried. How are you today?

**Jason Fried (00:13):** I’m great, Shaun, how are you?

**Shaun Hildner (00:15):** Wonderful. And David Heinemeier Hanson, how are you?

**David Heinemeier Hansson (00:17):** Good, good.

**Shaun Hildner (00:19):** Good. Well, this week we’re talking about when to say good enough is just fine. And one of the words I know will come up quite a bit, is judo. Can you explain this concept of finding the judo solution? We say that a lot around here at 37signals.

**Jason Fried (00:36):** Yeah. So actually we have a good example, a concrete example. We’re making some changes to some pricing, backend, billing system stuff. And there was this issue we had, which was, we wanted to include the new price in this line of text. And it turns out there was a lot of work involved to do that, but we really wanted to do that, and you could go ahead and just do the work. That’s kind of the default thing. That’s what we want to do, here’s what needs to be done, let’s do the work. Or, we could just not include the price and just say, you’ll now be billed for X, Y, Z next month, versus actually showing the new price. You could just say, what’s the additive number? Or you could just say, you’ll be billed more next month, or something like that. There’s a whole different way of approaching this, which is not necessarily as perfect, but more than enough, and literally one second worth of work eliminating potentially days or weeks of complexity.

**Jason Fried (01:36):** So that’s in our parlance, the judo solution, which is like, what’s the simplest version to get you much closer to complete and final without having to do anywhere near as much work as the final perfect version would be. Basically, that’s sort of the rough definition of what that means. Maybe David as a clearer way to put it? But that’s how I think about it.

**David Heinemeier Hansson (01:56):** No, I think that’s good. Another way of framing it we’ve been talking about lately, has been return on effort. That it has to feel proportionate, the amount of work we’re putting into the stuff we’re getting out. And in this concrete example, we had this one line of text in the UI that had provoked not just a days worth of exploration on how to even do it. Literally a whole day had been spent just trying to figure out, okay, we need this backend thing, and part of it was a timing issue, because we were dealing with two systems, they had to talk to each other, and this line of text was happening right on the next screen. And so a day’s worth of investigation had gone into just figuring out how to do it. And then that had revealed that there might be weeks worth of work here. That’s not proportionate to the line of text.

**David Heinemeier Hansson (02:49):** The compromise we’ve come up with is a little bit worse. The original was quite nice, but the replacement we’ve come up to is almost as good, but in this case, it’s not even just like 20% of the effort, it’s literally 1% of the effort, or less. It’s basically like 0% of the effort. There is no way to get work done faster than deciding it doesn’t need to be done. Then you’re done. You’re like, we thought we had this whole project in front of us and actually we don’t need that, do we? No, we don’t. All right. Finished.

**Shaun Hildner (03:25):** Yeah, let’s get into that a little bit more. I think this is the most fascinating part of when you talk about good enough is fine, is the idea that the problem is negotiable. I think when a lot of people think about this, when you think about a problem, you think a problem’s a problem and the solution is negotiable. So can you talk about how to flip your brain to thinking about the problem itself as the thing that can change?

**David Heinemeier Hansson (03:49):** Yes. There’s a wonderful book, which is really the long form argument of what I’m about to say, called Are Your Lights On? By Gerald M Weinberg. It’s probably one of the best books I’ve ever read. And it’s literally, I think it’s like 60 pages or 80 pages, and it goes through example of example of doing exactly that. Looking at a problem you have, considering those solutions, not really liking those solutions, then going back to the problem and saying, are we even asking the right question? Could we ask a different version of the same question and arrive with something that’s much easier?

**David Heinemeier Hansson (04:25):** It’s basically problem restatement. You have a problem definition, something you’re trying to do, and you go back to that definition. You go, do you know what? There’s another version of this that we could do that’s a close enough approximation to the pain we’re trying to cure, whatever excitement we’re trying to provoke, that does sort of the same thing. It’s not actually the same thing. And that’s the really fascinating part about this, that not only are solutions interchangeable, but problems are too. You can have problems that exist in the same cloud of issues, and you can pick another one. If you don’t like what it takes to solve this one problem, you can go, do you know what? There’s an adjacent problem right next to it, we could do it instead. And in many cases, people won’t even know the difference. They won’t even know that you’ve restated the problem and they’ll be none the wiser.

**David Heinemeier Hansson (05:14):** And this is the work of keeping the pace, which is something that’s really important at 37signals, is to keep the pace. This is why we do the six week cycle. This is why we force ourselves to have all these boundaries, we must make trade-offs all the time. And these trade- offs, the best trade offs are these kind of judo trade-offs, where you’re not losing something of material value, you’re exchanging one problem for another and they’re roughly equivalent. Or in some cases, you pick a problem that’s perhaps somewhat worse, but so much easier to do. You go like, do you know what? I’ll take the 80% version here if I can get away with a 5% implementation.

**David Heinemeier Hansson (05:57):** That’s the kind of stuff that gives you pace. You can’t have pace if you always want a hundred percent exactly as you thought it should be, because that approach does not yield to all the opportunities the materials and the reality of working on the problem actually gives you. This is the thing, you don’t know upfront. Going back to this concrete example, we wrote this line out, not knowing anything about what it would take, not knowing anything about, oh, you have to call it back in the system and it has to calculate taxes, and it can’t do those, but blah, blah, blah, blah, blah. It was just written down, because that knowledge wasn’t available.

**David Heinemeier Hansson (06:32):** Then the programmer looks at that problem and go like, huh, it’s very easy. Oh no, no, shit. I got it… I can’t, mmm. Ah, all right. Thinking, thinking, thinking. Not easy. And now you’re dealing with the materials, are telling you something. The systems you already have, we’re cutting against the grain trying to get this piece of information in real time. This was actually the funny thing about that specific example. I was talking to the programmer about it, we were riffing back and forth on how to solve this issue. And another version of solving this same problem was to actually give you the answer we had designed, this exact price, but just not at the exact moment. If we could give it to you in an email that might arrive in five seconds, or 10 seconds, the problem was trivial, once again.

**David Heinemeier Hansson (07:19):** The hard part was that this design as laid out, had the answer at the wrong time. It was so difficult to give you this instant answer. And I love moving those pieces around, finding something that appears to be weeks of work could be done in a decision. Not even in five hours of work, but in a decision. And then-

**Shaun Hildner (07:44):** In the second, yeah.

**David Heinemeier Hansson (07:44):** And then we went back to Jason, and I think Scott, working on this, just like, do you guys mind if we do this instead? And this is actually always the example I give. They just go like, no, it’s fine, it’s fine. Just put whatever. So much of the hardship of developing products lie in this religious following of what someone sketched out.

**Shaun Hildner (08:10):** Right.

**David Heinemeier Hansson (08:11):** Because they didn’t know. Then you found out it was really hard, and you thought like, well, this is what they say it’s supposed to be, and then it just takes forever. This is the magic of the 10X product development team. This is the magic. If you don’t do this, if you are not willing to restate problems, you can’t move at this pace. You move often at a 10X slower rate. This is why sometimes when I talk to people who ask about our pace and the size of our teams, they go, what do you mean you have one program or one designer doing this big feature over three weeks? I don’t even understand.

**David Heinemeier Hansson (08:49):** Much of that “secret source”, source and source. So source source is right here. It’s good enough, it’s fine. It’s good enough, it’s fine, is in the judo. It’s these huge leaps. This is how you finish a whole product with a tiny team in a reasonable amount of time, and why large corporations where requirements are just thrown sort of one way direction, can’t seem to get anything done even with teams of 20.

**Shaun Hildner (09:20):** Right.

**Jason Fried (09:21):** Another thing to add here is that our process has this flexibility and malleability built into it, which is critical. This document that we produce to roughly describe a feature before we build it, is not sacred. It’s not this thing that can’t change, it’s not long, it’s not detailed. It’s, here’s roughly where we think we’re headed. Here’s enough to guide us, to get us started. And then it’s up to the team to decide what makes sense and what doesn’t. And there was some discussion back and forth. But the team has the agency here to decide and to push back and to go, well, look, this is kind of a big deal, what can we change? Or can we change this? Or here’s a proposal. And the answer’s almost always, yeah. Sometimes it’s not. Sometimes it’s like, no, this is actually really, really, really important. But most of the time it’s not.

**Jason Fried (10:12):** And I just think that you can’t spend four months on a spec, write it up in extreme detail, pour 30 or 40 hours into something, and then expect it to be flexible. Because that doesn’t work. It’s only flexible when it’s short, meant to be changed, not precious, not sacred. And that’s how it’s delivered. And including, even whenever we have interface designs, sketches that are involved, they’re fat, we call them fat marker sketches. They’re very rough, they’re very loose. They say in themselves, in the lines themselves, in the drawing, this does not matter. This is not the important detail here. And if you want to move something around, go ahead. If you want to change something around, go ahead. This is not precise. And I think too much precision early on says this can’t be changed.

**Shaun Hildner (10:59):** Right. Yeah, yeah.

**Jason Fried (11:00):** So you kind of want to dial that back and then you’re just communicating to everybody that this is just a suggestion, and let’s see where we actually take it.

**Shaun Hildner (11:08):** I love the idea of pointing out what is unnecessary in a sketch. Do you also point out, Hey, this actually is the epicenter? To use a rework term, this is the nugget?

**Jason Fried (11:18):** That’s a directional definition. You’re like, this is what we’re trying to do here. I’ll give you an example. Just yesterday we shipped a feature like a week and a half ahead of time, I think it was, which is, we improved the set aside feature in HEY. The original pitch was actually more involved than what ended up coming out the other side. So, we had this idea of creating these groups that you can organize your set aside email in. You could name the groups and all these things. And as we got into it, we kind of realized the naming of the group doesn’t matter. Just like you don’t name a pile of papers on your desk, you just know what’s in them because you put them there.

**Jason Fried (11:54):** The idea, the epicenter of this was still, be able to group like emails together. It wasn’t name them, name the groups. That wasn’t the epicenter. The epicenter was arrange and organize. And that still is true. But the method in which you do that is what changed along the way. And it was great. It is simpler better and easier, faster, all the things we wanted out of it. And shipped early, which is nice.

**David Heinemeier Hansson (12:20):** One thing I just got a window into yesterday when I was sitting down with a small company, smaller than us, much smaller than us, more like the early days of 37signals, was this sense I often pick up from entrepreneurs that they begin, that this doesn’t feel professional, this doesn’t feel right. If you are not super detailed, you’re somehow betraying the fact that you don’t know what you’re talking about. Which is a really fascinating bind to find yourself in, particularly as a starting company. And this particular company had tried a much more rigid approach. They had tried to detail the full use of interface up front, because they thought like, that’s what you’re supposed to do, right?

**David Heinemeier Hansson (13:05):** And they were kind of sheepishly saying, we kind of stopped doing that because it really wasn’t working. And it was just like, what are you apologizing for? This is the right way.

**Shaun Hildner (13:17):** You figured it out.

**David Heinemeier Hansson (13:18):** No one is able to predict what the entire system should be and have it work well up front. I mean, this is what the whole agile software of revolution was about. That until you see running software, until you hit the grain, you don’t know exactly which way to cut. And not only is it okay to delay cutting and making the decisions to change, it’s better. It’s way better. Not only do you produce software faster, you produce better software.

**David Heinemeier Hansson (13:50):** In a lot of cases, there’s less software that has its own quality of its own. But oftentimes these compromises are what brings the ingenuity of the design decisions that they run up against these constraints. And you go like, this is actually better. This is exactly what I felt with that feature we just launched yesterday, because I hadn’t actually seen the in between. I saw the original pitch where we had these named groups, and I was like, mmm I don’t know. Then we have to come up with a default name, so they’re going to match the things. I couldn’t fully see my workflow in it. And then I saw this, the judo version, that didn’t have the naming, it just had the big buckets. And I thought, bingo, that’s it. This is better. It’s not just a compromise where we’re regressing here. This is actually better. It’s more flexible. It feels just right.

**Shaun Hildner (14:37):** Is this just human nature, this drive to find the perfect solution? I think a lot of people instinctively fight back against saying, good enough is fine. I guess is the way to combat that something like, shape up? Something like the six week cycles, putting that pressure on yourself to, well, you either say this is good enough or is fine, or we can’t do it at all?

**Jason Fried (14:58):** You need the time pressure. I don’t think there’s hardly anything else that would do this. And you need to be pretty religious about it. I mean, there are times when things go a little bit long, but if you don’t have that bound pushing back at you, you’ll just keep going. Because everything will take as long as you let it, basically, is the answer. So you’ve got to say that the walls are closing in here. We have got to make some cuts, some decisions, some simplifications. And to David’s point, it doesn’t mean that what we’re shipping is going to be worse. That’s the thing you got to get in your head. Just because we’re cutting some corners, we maybe didn’t need those corners. And in fact, maybe round corners are better than sharp corners. You have to leave the possibility open that the simpler version is the better version. And in fact, a lot of the things you thought you needed, you don’t need.

**Jason Fried (15:47):** We’re finishing up a feature right now, which people are really going to love in Basecamp. It’s like a Kanban style feature. It’s not exactly Kanban, it’s kind of our spin on it. And as we’re rounding the corner to the finish line, we’re cutting some things out of it that we like, but there’s a lot of complexity involved. And it’s like, we can either do this later. We may not need it at all. It may come up with a simpler way to do it down the road. Let’s not leave this complexity in on day one, so if you do, you’re never going to pull it out later.

**Jason Fried (16:21):** And so it’s kind of another thing, is like, keep in mind, whatever you ship you’re basically living with. Even though you could always come back later, you rarely come back to clean it up. You will come back to add onto it, but you rarely come back to clean it up later.

**Shaun Hildner (16:34):** Right. I think we should make that clear, that living with it is, you can add onto it, but it’s much harder to then go back and make the cuts, right?

**Jason Fried (16:41):** You just don’t. Also, expectations are set, customers are used to something.

**Shaun Hildner (16:45):** They’re using it, yeah.

**Jason Fried (16:46):** It cuts both ways, but you got to be careful about that early. So, my point is, the feature is actually better without it, even though I think the thing is if we do add that piece later on, it’ll be a great addition. But initially, all things considered, I think it’s better without it.

**David Heinemeier Hansson (17:03):** I think it’s one of those lovely parallels to writing, where kill your darlings is one of those key tenets of good editing, that you will delete lines that you like. Because if you take that line out, even if you really like that line, it’s a better paragraph. It’s a better page, it’s a better chapter, it’s a better book.

**David Heinemeier Hansson (17:26):** This reminds me actually, a free work itself. When we handed in the first manuscript to REWORK, I think it was something like 47,000 words, I think it’s what it was. And the publisher was initially very excited. Oh, this maps out to exactly 350 pages in a book, that’s exactly the target we’re looking for. I think we even had something like that in the contract, maybe. And then Jason and I went back and like, all right, let’s do the real editing work. And we started not just killing darlings, like absolutely machine gunning darlings left and right, just like hacking off entire chapters, hacking off. Some essays that were like three pages long ended up being like three paragraphs, absolutely ruthless. And when we sent this thing back to the editor, it was 22,000 words. And at first the editor was like, no, no, no, I can’t even look at this. What is this? We can’t publish a book that’s this.

**David Heinemeier Hansson (18:26):** And the book was so much better for it. I mean, this is actually one of those things I wish more business authors would do more of, but the idea here is you’ve got to kill your darlings. When you work on a feature or a product, there’s all these little, oh, I really like that little thing, I really like that little thing. Yes, okay, fine. In isolation you like that thing. It’s weight compounded onto the rest of it, and the complexity it brings, not worth it. Not worth it. And the whole product is better if you kill a substantial number of those darlings.

**David Heinemeier Hansson (18:58):** And this is where the time boundary is so helpful, because when you’re just sitting there arguing about whether a feature should stay in or should it go, should we build it, should we not? A lot of it can come down to like, what, you don’t like my darling? You’re trying to kill my darling? Please, don’t kill my darling.

**Shaun Hildner (19:15):** Like it’s personal.

**Jason Fried (19:16):** It becomes personal. Versus, if you go like, I love your darlings. Your darlings are lovely features, but you know what? There’s two weeks left and we can’t have them all. So you got to pick your two favorites and let go of the other three. This is why, pretty much whenever we end a project developing new feature, there’s still to-dos on the to-do lists.

**Shaun Hildner (19:39):** Of course, right.

**Jason Fried (19:40):** In fact, in some cases, there are many to-dos on those to-do lists, and they’re full of darlings. They’re full of nice ideas that could have made it in, and it didn’t because we hit the time limit and we were done.

**Shaun Hildner (19:50):** Well, perfect. I think that’s a great place to stop. We do have another question here from a listener. This person actually asked to be anonymous when asking this question, but she’s a project manager at a medium size company, about 15 years old. And she writes that the needs of the business are always changing. There’s always new priorities that she needs to interrupt her team to get done now, and that’s coming directly from leadership or someone above her. She doesn’t want to be interrupting her team because she knows she’s not getting the best out of them. So what can she do as a manager to make sure she’s still getting the best out of her team, but also meeting the needs of the business in a timely manner?

**David Heinemeier Hansson (20:30):** This is the cornerstone of shape up, basically. You have to work in cycles. You have to take a chunk of time and say, we are going to work on these things in this chunk of time. And then you have to prove to the business that this is a short chunk of time, it’s not six months. We like the six weeks, eight weeks with cool down. So every eight weeks you get to completely change your mind about what you work on. And in those past six weeks of work, you proved that we will do the things we set up to do.

**David Heinemeier Hansson (21:05):** So you got to do both things at once. You got to sort of create those boxes and then go back to the business and the decision makers and build that trust that you actually deliver things. But then they get these intervals. Like at 37, 6 times a year, we have six cycles in a year, six times a year, we get to completely change what the product, where it’s going. We’re not logged into a long term roadmap, we’re not logged into projects that take three, four months. Projects here, they take six weeks, in almost all cases as a max. And then you get to make a new choice. I think that really is the magic of shape up in a large extent. It’s creating this space where you have to sit on your hands for the next six weeks and just let the work you decided to do, get done.

**Jason Fried (21:54):** I know this is one of those things where, if she could rebut, she would be like, yeah, yeah, I agree. But the directions continue to come down from management or ownership or whatever, and they keep changing their minds, and what am I supposed to do?

**Jason Fried (22:09):** And there’s not a lot you can do in that situation, because you really do need to… I mean, you can make a case, which is like, I don’t know exactly the right words here, but I mean, we get to change our minds every six weeks. That’s pretty frequent. If you have to change your minds every six days, you’re kind of in a manic situation here. And I would also even say, are we happy? So we keep changing our minds, and keep changing directions, and keep changing and throwing more work out. Are we proud of the work that we’re doing here? Are we just throwing work around? Never really finishing things up. Is everything kind of half assed, because we don’t have any time.

**Jason Fried (22:46):** And one question you can always ask is, if someone keeps telling you to change, are you happy with the work we’re doing? I don’t feel like we have enough time to get it done well. And if we had some more time, we could focus on this, not get pulled off, get it done well, move on to the next thing, and sort of sequence these things instead of haphazard throw them around. But then again, this is hard to talk to people above you about. If they just want what they want. So there’s also recognition that in some cases, you just can’t make those changes and you just have to do your best to deal with it. But our point of view is, you can’t keep pulling people off their work and expect the work to get done. It’s just a simple fact of life basically. And so living by that fact and recognizing the human nature surrounding it, is probably the only way to really make this work.

**Jason Fried (23:33):** Here’s the other thing, David and I have all sorts of thoughts and changes in our heads all the time, but you don’t step in in the middle of a project and radically change it, unless there’s a really, really good reason. You just wait. You go, okay, we’re going to hold these new ideas in our head. Maybe three weeks from now we won’t even have them anymore, we won’t even like them anymore. And if we do, then we deal with them the next cycle. But it’s not to say that you can’t be thinking about new things all the time. It’s just like, you’ve got to wait to present them, let them marinate, let them sit with you for a while, see if you even like them. Sometimes, you can sort of be enamored with your thought from last night, so let’s see if you still feel that way in a week. This is a good thing to wait a little bit.

**David Heinemeier Hansson (24:14):** I’d also just recommend pitching, doing it once. Hey, this hasn’t been working well, I’ve heard about this new idea. Could we try it once? Could we try to just decide what we’re going to work on for the next six weeks and you see if you like it? Proving the pudding here that like, oh actually this was pretty good. In six weeks we’ve got all this done. How was that possible? Yeah, because we didn’t change our minds every five seconds, that’s how.

**Shaun Hildner (24:39):** Right, right. Yeah. I mean, this could be an entire episode of how do you talk to your boss about rework. But that’s for the future. If anyone else has questions for Jason or David, leave us a voice mail at 708-6287850. Or better yet, record a voice memo on your phone and send it in to hello@rework.fm.

**Shaun Hildner (25:01):** Next week, we’re talking about getting those quick wins. So I hope you both will join me for that. For now, I want to say thank you to David Heinemeier Hansen.

**David Heinemeier Hansson (25:09):** Thanks Shaun.

**Shaun Hildner (25:10):** And thank you, Jason Fried.

**Jason Fried (25:12):** Thanks Shaun.

**Shaun Hildner (25:12):** We’ll see you next week.

**Shaun Hildner (25:23):** REWORK is a production of 37signals. Our theme music is by Clip Art. We’re on the web at rework.fm, where you can find show notes and transcripts for this and every episode of REWORK. We’re also on Twitter at REWORK Podcast. If you’re following along in the book, next time we’ll be discussing the chapter, Quick Wins. And if you like the show, I’d really appreciate it if you would leave us a review on Apple Podcast, Spotify, Overcast, or wherever you’re listening to this.

This is an episode title
