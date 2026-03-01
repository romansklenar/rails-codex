---
title: "Support and console-ation"
description: "In the last several years, a group of Basecamp customer support representatives has developed an expertise around “on-call support,” or tackling some of the thornier technical issues that require diving into the code base of our applications."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/support-console-ation/
tags:
- podcast
---

# Support and console-ation

**(00:00:00)** Broken By Design by Clip Art plays.

**Shaun: (00:00:02)** Welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m Shaun Hildner.

**Wailin: (00:00:06)** And I’m Wailin Wong. At Basecamp, we have what I will describe with zero false modesty as the best customer support team in the business. And within that team, there’s a group of specialists who tackle some of the more complex customer issues. These are cases that require diving into the code base for applications and fixing things from the back end. We call this work on-call support.

**Shaun: (00:00:30)** On-call is a relatively new specialty within Basecamp customer support, and it grew organically out of our colleagues’ own interest and curiosity. We now have enough people doing on-call support that it’s an official career path at the company. To hear about what this group does and how it came to be, we’re going to kick things off with the first person to make the jump from regular customer support to on-call.

**(00:00:53)** Broken By Design by Clip Art plays.

**Jim: (00:00:55)** I’m Jim Mackenzie and I’m a support programmer at Basecamp.

**Wailin: (00:00:58)** Jim joined Basecamp, then known as 37signals, in 2012. He was the first support hire based in Europe. Shortly after he joined, two other colleagues in his timezone also came on board.

**Jim: (00:01:10)** They typically started an hour before me because I don’t do mornings. They were superstars immediately. I’d gone from waking up to 200 in the queue to first, 100 in the queue, then 50 in the queue, but there were cases that were sat in the on-call queuing for the on-call programmer.

**Wailin: (00:01:28)** Almost all of Basecamp’s support is done via email. Customers write in and our typical turnaround time for a response is 20 minutes. A lot of cases do get resolved with just one or two emails. These are questions like, can you help me reset my password? Or can you help me update my credit card information? Or how do I perform such and such function in Basecamp? Then there are trickier cases that need further investigation. Those get sent to the on-call queue.

**Jim: (00:01:55)** Often edge cases where the design that we had didn’t quite consider the way that the millions of people using Basecamp would use it. And it was like, oh, right, okay, this is new, we haven’t considered this, we need to think about this problem. Or they tickled some sort of edge case in the code that caused something unexpected to happen, and we needed to fix it.

**(00:02:12)** We had a workflow that would basically park the case for a little while. We tell the customer, hey, we need to get some help from a programmer, this could take a little while. We pass it over to them. And then it would sit there until one of the programmers would be able to look at it. They had a very complex schedule of every three to four days, a different programmer would take the on-call baton. So we pass it over, they look at it, they’d send back a note. And then we’d get back to the customer with either a fix or with like, hey, here’s some things we need to test. It was quite a slow process, though.

**(00:02:43)** I’d been sort of dipping my toes in because I was like, this doesn’t seem too hard. I think I can read the code. I don’t understand what it is. But Ruby is quite a expressive programming language. It’s very close to just plain written English. And I was reading it. I was like, Yeah, I think I understand what this does. And I was encouraged by the programmers to sort of dig in. Like, hey, if you want to have a look and see if you can figure it out, give it a go, write your note down and we’ll see if you’re right or not. And I mostly wasn’t. But I learned from each time that I wasn’t right.

**Wailin: (00:03:15)** At this time. There was one programmer named Jamis Buck who took on a lot of the on-call shifts. He started to have a little fun with his notes to the support team by inserting two quirky fictional characters.

**Jim: (00:03:26)** Basil Smockwhitener was a wizard and his assistant Fabian. And he would write the answers to the problems in these sort of educational little fables, and would explain the Ruby code in those terms.

**Jamis: (00:03:38)** Basil nodded slowly. “It’s a curious request, “he said. “I don’t think I’ve ever seen the like, but…yes. Yes, it should be possible.

Fabian watched curiously as Basil began muttering to himself about “frobnicators” and “glyphnotronic hogplantings” and other widgets even more arcane and obscure. He gave the inventor a few moments before clearing his throat softly. It took three times before Basil realized Fabian was still there, apparently.

“Oh, what’s that? You still here?”

Fabian grinned. “Indeed, I’m still here. I just wanted to know—what do you need from me, sir?”

Basil coughed and harrumphed, stroking his thick white mustaches and considering the request. “Need? Hmm. From you? Yes. Yes. Well, let’s see. I suppose if you could let me know the names of the two tags…yes, that would help. With that I could feed them into the rifflegum and trombulate the climpackie sideways…”

Fabian shrugged. Two tags. That seemed easy enough.

**Jim: (00:04:43)** Well, I tried to teach myself to code in the past. And it never stuck. Just never stuck. Like I’d make some progress, but I’d always get frustrated because the approach is always trying to teach you to build something. And that isn’t what I was interested in doing. I wanted to fix things.

**(00:05:00)** Here was Jamis saying, hey, here’s how you can learn about this in a way that helps you fix things. And also appeals to your love of stories and things like that. And so that just captured my imagination and then it grew from there.

**(00:05:14)** There’s a customer who was loading in a CSV file, and it kept breaking. I couldn’t work out why. I knew it was something to do with the file. I said, it has to be something to do with the file. And eventually, we tracked it down to the formatting of the file. It just needed cleaning up, that’s typically the problem with most data problems is the data is not clean. But I remember getting this very real sense of here’s how I can fix these thousands of records for the customer using code, instead of them having to go and spend hours in Excel, cleaning up the data themselves.

**(00:05:43)** Yeah, I just remember just sitting back and going like, this is so good. This is so good. This feels so amazing. I want to do this more.

**Wailin: (00:05:50)** Jim eventually moved to doing on-call work full time. For a brief period, he was also joined by a full time on-call programmer named Dan.

**Jim: (00:05:57)** And we did some really cool things in on-call that sort of set how I work today still. For instance, one big win was, you never used to be able to create templates in Basecamp 2. You couldn’t create a template from an existing project, you had to start from scratch. And so Dan developed a script that would allow us to do that for the customer. So we tested that. We ran it for a couple of people who wrote in. And then over time, it was like, we’ve been doing quite a lot of these. People seem to really love these, maybe we should turn it into a full feature. And that’s what happened. And that became a pathway for helping someone initially with a problem that they want to solve that we don’t have a design for yet, testing an approach that would work in on-call, proving that it was something that people wanted, and that we could do properly and carefully and safely and then turning into a fully fledged feature. That’s a really nice pattern for solving problems that aren’t necessarily in the main design we want to use.

**Tony: (00:06:55)** When I first started, I’d just refer a lot of the technical stuff to Jim.

**Wailin: (00:07:01)** This is Tony, he works for Basecamp support out of the Asia-Pacific region.

**Tony: (00:07:05)** I just thought it was interesting. And then I started reading Jim’s notes and going through how he was approaching things. And then I just started doing on-call on my own, too. We don’t really have an on-call program in our time zone. Because I work alone, I’ve tried to be self reliant. And part of that is a learning on-call so I can take care of things while I am alone.

**Sylvia: (00:07:29)** Tony and I have worked together on our Monday, Tuesday, Wednesday, but he’s alone on Thursday, Friday, and I’m alone on Saturday and Sunday.

**Wailin: (00:07:37)** Sylvia is the other member of the Asia-Pacific customer support team.

**Sylvia: (00:07:42)** Since we are alone a lot of the time we don’t have the ability to ping a programmer or get a faster answer from the on-call programmer. For customer support, we have a wiki and that wiki has the code that you can run to fix common issues. We can look at that and fix some things. But it was pretty hard to get started because I don’t have any programming experience. I went to law school and I didn’t even really use a computer until I was 18. It was all really new and I really was excited about learning how to code and how to fix things from the back end.

**Tony: (00:08:24)** I definitely didn’t apply for this job thinking I would be doing a lot of on-call stuff and even looking at a terminal. The first time I opened Terminal and ran a script, I was like wow, I’m like hacking into the matrix. It looked like one of those movie screens. So yeah, that was really cool.

**Jabari: (00:08:41)** The console can feel very scary not because of anything explicit, but just being afraid of making any changes that might be a mistake and cause trouble with our customer’s accounts.

**Wailin: (00:08:53)** Jabari is one of the technical leads on the customer support team and is based in the US on the east coast. And the console is the program we use to directly interact with the servers that run Basecamp. It’s how folks like Jabari can make changes to the back end of a customer account.

**Jabari: (00:09:09)** It’s the matter of getting the confidence necessary to continue to delve deeper and understand it. Fundamentally letting myself still press that button at the end that makes the change and not have to worry about it. So really it’s more of a mental exercise. I really feel like I had room to grow into my own role where I am now but also just starting out, I felt like I was encouraged to dig into cases if I wanted to, but also not push myself too much or expect too much of myself. And give myself time to not do too much or not dig into a case that could get kind of gnarly.

**Jim: (00:09:44)** Jabari especially came in and he was like, I want to learn more about this side of things. I feel like a technical kind of guy. I’d love to solve these problems. And so it was like yeah, cool. Have a look. In the same way that Jamis had encouraged me, I tried to pass that forward. But he’s done everything himself Sylvia and Tony have done the the same thing. It’s tricky for them because of the timezone difference. But it means we get really good at writing notes to each other.

**Tony: (00:10:07)** That was really helpful for me when I first started. Jim was adding all of these really great notes to all of his cases. So now anytime I do any on-call stuff, I’ll just add all of my notes in there, as if someone who’s been at Basecamp for 10 years, or someone who’s been here for a week is reading it for the very first time. Kind of as a breadcrumb trail so someone else can learn at the same time. And if there’s anything new, like if I ever create a new script, or I come across a new script, then I’ll just add those to the wiki, so it’s easier to find later.

**Sylvia: (00:10:40)** And I always used to read through all the on-call notes. Because there are times when you just forget that something happened, right? You do so many different cases. And so I always just do a search for similar cases. And usually for that, there might be one that’s exactly the same and I can just follow that. But yeah, I also leave notes just like Tony, just because it’s really helpful. And I like seeing the way that everyone else has done a case. It’s really interesting.

**Jim: (00:11:06)** We are spoiled, we’re so spoiled. Because the people we work with care about words, everyone at Basecamp cares about words and expressing themselves in a clear fashion. And it goes through the check in posts, there. When they’re talking about the weekend. Arguments about pizza, you name it. But people care about telling the story the right way. And that definitely applies to the code.

**Jabari: (00:11:35)** I was lucky in the Basecamp 3 code base. It’s just written in a way that’s really accessible. So after seeing the Basecamp 3 code base, it all made sense. I’m like, this reads like a book or something. It’s so readable to someone who doesn’t really have much experience at all. It’s as if the people who are writing it are keeping in mind that I have no idea who might be reading this in the future, or how many years will have passed, or if I’ll still be here. So I want to make sure this code I’m writing is accessible. And it made me also recognize how important readable code is to diversity inclusion, people from other backgrounds coming into programming in technical roles.

**Willow: (00:12:13)** I really like to help other folks on separate teams get more comfortable with more technical topics. That is just a real treat for me.

**Wailin: (00:12:23)** This is Willow. And she rounds out the on-call team within customer support.

**Willow: (00:12:28)** It’s really easy to get scared of touching things in Terminal or oh, my god someone has an API question, I don’t know what this means. But we have the tools and everyone is super competent. So a lot of it is just kind of getting the right framework so that people can feel comfortable doing what they know how to do.

**(00:12:53)** We had a case the other day about time zones, two time zones not showing up in the drop down list. I was like okay. I’ll figure that out. One of them was the timezone exists, it was just kind of miscommunication about because we’re in daylight savings time right now and the list doesn’t show daylight savings time. It shows standard time. And the other, it was like, okay, that’s not in the list at all. And kind of ended up needing to go through the codebase to see where we’re pulling the time zones that we choose from, to see if it was supposed to be there or not.

**Wailin: (00:13:27)** Oh, was it like a particularly quirky time zone?

**Willow: (00:13:30)** It was +14.

**Wailin: (00:13:34)** I don’t even know what that is.

**Willow: (00:13:38)** A few small islands.

**Wailin: (00:13:39)** Issues that come their way can really vary in terms of the detective work and time required. But as the team has grown in experience, they’ve been able to deepen their investigative skills and build up a knowledge base for their colleagues.

**Jabari: (00:13:51)** Sylvia and Tony created this guide for troubleshooting traceroutes, which is what is often used for when someone’s like, my Basecamp app is being slow.

**Tony: (00:14:01)** If you’re experiencing a speed issue or a connection issue, running a traceroute might be able to tell you, from the results, if there’s an issue connecting through one of the routes that gets to our service. Trace routes is something that is still kind of open to interpretation, because they don’t always provide helpful information.

**Jabari: (00:14:24)** It’s not user friendly tool. It just kind of gives you some numbers about how long it takes for information to travel between different servers. So it’s very abstract. And there’s not that many helpful guides at all online like anywhere. And I’ve looked for probably my entire career as a customer support worker. I’ve never really seen super helpful guides on it. So yeah, so me and Tony created this guide which is really helpful. And that’s the type of instruction that I feel like I wish existed more in the industry.

**Tony: (00:14:52)** And yeah, Silvia and I are working on a guide for Kibana now as well which I think is really cool. For me, it’s been really great to get from a place where I’ve just been like, I have no idea at all how to find this information. Getting to a place where I can actually work with Sylvia and we can write guides on how to do this for other support workers to.

**Jim: (00:15:12)** A lot of the material that’s out there for coding, like I said, it teaches you how to build stuff. Which is not necessarily helpful for what we’re trying to do. Like we’re trying to teach people how to read code to find a problem. Knowing how to build a Twitter clone doesn’t help with that. And that’s actually one of my biggest complaints about the current standard of programming teaching online, is that there is this consideration that the only way to teach programming is to teach you how to build something.

**Sylvia: (00:15:40)** Because there’s so much that you need to be familiar with. You don’t necessarily need to know it, but you need to be a little familiar with code. You need to be a little familiar with networking. And it’s a lot. You don’t have to know everything. So maybe the real secret is you just have to get really good at Googling and learning what things to search for.

**Willow: (00:16:08)** I always have Monday Office Hours With Rosa.

**Wailin: (00:16:09)** By the way, Rosa is one of the programmers here at Basecamp.

**Willow: (00:16:13)** And that’s a really valuable resource for me because I can ask her questions about anything and she’s really super helpful. But she’s not a support on-call programmer. She just does office hours because she’s incredibly nice and kind and helpful. So I really like those.

**Jim: (00:16:30)** People who’ve like headed into on-call, like Willow, Jabari, Sylvia, and Tony, are all curious people. They see something and they want to know, like, why? And that’s just awesome.

**Jabari: (00:16:41)** I feel really grateful that I’ve been able to grow into a role that that wasn’t formalized when I got here and that I’m on a team that had the space to allow for it and to encourage it. So yeah, I’m excited to see how else our team and the role continues to evolve.

**(00:17:00)** Broken By Design by Clip Art plays.

**Wailin: (00:17:07)** REWORK is produced by Shaun Hildner, and me, Wailin Wong. Music for the show is by Clip Art.

**Shaun: (00:17:12)** Basil & Fabian, the series of stories by Jamis Buck, is available online at Jamis’s website and on Kindle. Jamis actually left Basecamp for a few years and just recently rejoined as a programmer, so we’re thrilled to be working with him again.

**(00:17:25)** Welcome back, Jamis. We’ll link to his Basil & Fabian stories in the show notes for this episode, which you can always find at rework.fm.

This is an episode title
