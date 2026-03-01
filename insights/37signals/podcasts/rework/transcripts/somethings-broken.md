---
title: "Something's broken"
description: "Basecamp recently suffered three outages in a week."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/somethings-broken/
tags:
- podcast
---

# Something's broken

**Shaun: (00:00:00)** On Friday, August 28, Troy Toman logged on for what he thought was going to be a normal day at work. Troy’s Basecamp’s director of operations.

**Troy: (00:00:08)** I oversee the team that basically keeps all Basecamp services up and running 24 by 7, we have these summer hours at Basecamp, and it was the last week of summer hours. So because of that, and because of some vacations, there were actually only to the ops team, myself and one of the person that were officially at work. Although one person who was taking their Friday off was on call.

**(00:00:28)** So we have a variety monitoring systems. When they detect an anomaly, they funnel up a thing that ends up causing these screaming sounds to come across my phone. In my case, I have an alarm that there’s some little kid singing, “Something’s broken,” which is really cute until it happens four or five times in five days, and then I start questioning my life choices.

**Child’s Voice: (00:00:48)** Something’s broken, something’s broken, it’s your fault, it’s your fault.

**(00:00:54)** Broken By Design by Clip Art plays.

**Shaun: (00:00:55)** Welcome to REWORK a podcast by Basecamp about the better way to work and run your business. I’m Shaun Hildner.

**Wailin: (00:01:01)** And I’m Wailin Wong. Basecamp, the software suffered three outages in a week starting on that Friday. All told, they added up to a few hours of downtime and slowness for our applications. For customers, this meant that there were periods when they couldn’t access the app at all and during other times they could use some features, but other features were really slow. These outages required a full-throated public apology and explanation for our customers in the form of extensive posts on the company blog, Signal v. Noise.

**Shaun: (00:01:30)** We actually ended up with two long posts about this recent string of outages, one from Jeremy Daer, a programming lead at Basecamp and one from Troy, who you heard from at the top of this episode. These posts were more emotional than technical, which is somewhat unusual in the software industry.

**Wailin: (00:01:46)** Today on the show, we talked to Jeremy and Troy about the human side of managing a technical crisis, and why it’s important to have public accountability for these incidents. Here’s Troy.

**Troy: (00:02:01)** We had a small network outage. That network outage caused some of the communications between our servers to get disrupted, which ultimately caused Basecamp to slow down. So we had to obviously get that back up and running. It took us probably 20 or 30 minutes. We had a very similar incident happen a few days later on a Tuesday. And this time, we knew quickly what happened, we responded really fast. And something else broke because we responded so fast, in retrospect. And then the day after, on a Wednesday, we had two incidents of an unrelated networking problem that had very similar impact. Totally different cause. That’s the simple explanation. But it obviously took a lot to understand that level of what was going on. And at the time, things were a little bit more confusing.

**Jeremy: (00:02:51)** I mean, it’s kind of neat in in some respect, because there was some bug that we couldn’t foresee. I’m Jeremy Daer. I’m on the Security Infrastructure and Performance Team here at Basecamp which is kind of the software side of how we maintain and run our products.

**(00:03:09)** There was one novel bug that recurred. And then it tickled a whole new bug, which was also fascinating and fun to learn about in a much less stressful time. And then that same thing happened again, where the secondary bug occurred again, and then triggered a third bug.

**Wailin: (00:03:25)** So were these bugs our bugs, or are they someone else’s bugs, like the folks that we rely on for all of this server technology?

**Jeremy: (00:03:35)** Well, the thing is, they’re all our bugs, we have to own and take responsibility for every issue, including those that we just we can’t get a handle on. We can’t fix some of these things. But it’s part of the system that we’ve taken ownership of, and we want to support at a very high level. We talk about how many nines we have. Is this like three nines, or five nines and these vaunted, like ever-growing nines, which gets you down into like seconds of downtime per year, which just sounds kind of like mythical territory. Well to get there, you’ve got to accept that you’re going to have bugs that you’ve never foreseen and can’t even fix.

**Shaun: (00:04:11)** And you say nines, what you’re meaning is the app is available 99.9999, whatever.

**Jeremy: (00:04:17)** Right, right. So 99% would be two nines, 99.9%, three nines, and then five nines 99.999. Wow, that’s a lot of nines.

**Wailin: (00:04:27)** And we’ve talked about outages on REWORK before and you’ve come on to talk about outages before. I think the last big incident that we addressed on the show was Big Integer. Did this series of, kind of three outages on top of each other feel very different from the Big Integer outage? Or in what ways did it feel like previous outages and in what ways was it maybe novel?

**Jeremy: (00:04:50)** Well, it felt better and worse, from from my perspective, these were bugs that were out of our control. So the best we could do is identify them, characterize them, and diagnose them. And then hope that we could get somebody else to fix them or come up with a way of avoiding them, say, like a workaround. How can we not trigger this situation again?

**(00:05:14)** Whereas in the Big Integer situation, this was entirely our creation, where we had configured a database schema in such a way that we would run out of integers. Run out of numbers, we just have no more numbers left. And we did this. And so it’s all on us to correct the situation as well, which gives us some control over remediation. What are we gonna do to fix this? Well, we’re going to do the work.

**(00:05:39)** In this case, we can come up with how to reconfigure things, how to reorient our systems, but ultimately, we’re not doing the fix itself, which means we feel like we’re sitting on our hands. You’re dealing with a sense of helplessness. And of course, we’re not completely helpless, but we can’t just dive in and correct it ourselves.

**Troy: (00:05:58)** You know, it’s the nature of the systems we build today that there’s a lot of complexity involved. And it becomes very difficult to think of every possible breakage. I think after you’ve analyzed them, it’s also really easy to go like, oh, we should have seen that coming. Some of those things are true, but at the same time, I don’t know that it’s always feasible to test and triage everything. So to some extent, you have to take an approach around these kind of situations of, can I get better? Can I learn something that not only solves this, but prevents more of these things from happening in the future?

**(00:06:33)** I think in the particular case of Basecamp right now, we’ve run into some issues that are usage based, because the platform has been very stable for us over the last 12 months. Sort of going into this this last week, we’ve been focused on launching, Hey and getting a bunch of new things done. In the meantime, our usage on Basecamp has crept up, not in a big spike way where we were like, oh, we see more usage, we better be aware of this, but in kind of a slow, sneaky way.

**(00:07:00)** And some of those growth issues, certainly related to the severity of the outage and the difficulty of the recovery process that are kind of forcing us to step back and go like, what else are we missing? The detective work does two things. One is you really want to understand what happened, and that you’ve correctly solved things. So it’s not enough for us to just kind of go like, oh, Basecamp is stable again, we’re done. You want to know why it happened. You want to put some preventative measures in to [prevent it] happening again. But it even starts to inform some broader thinking about how much more we should be practicing some of these procedures, and how we can do that more frequently. How often we should be looking at utilization rates of services, to anticipate the fact that the dynamics of the system are going to change in some way.

**(00:07:44)** So lots of questions that come out of these and helpful things that are all geared, not only at really addressing the root cause of the problem, but also in just trying to make us better overall at operations and how we do things.

**Wailin: (00:07:55)** As someone who’s worked in ops for a long time, and has held like a managerial role, like an oversight supervisory role in ops at other places. Is there anything that fully prepares you to lead an outage? Or is it just pure experience, that in this line of work, outages happen, and the more outages that you live through and troubleshoot, the better you get at it?

**Troy: (00:08:21)** I do think, obviously, having done some of this before is helpful. So I don’t want to act like you know that having done lots of these doesn’t prepare you to some degree in terms of your ability to respond or at least understand the proper way to respond. Or, maybe even more so, understand how to stop these from happening in the first place. But the other part of this is, there’s never been one of these that felt good, where I really felt like I had done it well, where I didn’t have a lot of critiques about what I or my team could have done differently.

**(00:08:56)** And that weighs on you over a period of time. And I also think, like anything else, you can sort of get trapped into modes of thinking. And so, sometimes the experience can work against you in a certain way as well. So I think it’s a mixture of both, the practice and the preparation makes it better. But also it’s not like I sit back and go like, oh, I’ve seen this before, let’s just cruise through this incident response. They’re incredibly tense and high pressure and stressful and wear on me as much as some of the first ones that I might have done 10 or 20 years ago.

**Wailin: (00:09:30)** Jeremy’s signal versus noise post about the outages went up first, on September 2, the day of the final incident. He wrote:

“We’ve been leaning on your goodwill and we’re all out of it.  Here’s what has happened, what we’re doing to recover from these outages, and our plan to get Basecamp reliability back on track.”

**Jeremy: (00:09:48)** We need to tell people what’s up, which, we know what’s up. We need to tell them what we’re doing to fix it. Well, we’ve got a checklist here, and our plan to get back to normal.

**Wailin: (00:09:58)** When you sit down to write that Signal v. Noise post, what audience are you picturing?

**Jeremy: (00:10:05)** I didn’t know at first. And so there was some uncertainty, particularly with an outage, like this. Shit was down. Basecamp was not working, and even for 15 minutes when it’s that time where you’re sitting there with a client and loading your project to show them your really sweet little intranet area, and it’s just not there. That 15 minutes may have well have been 12 hours. So it matters and it added up. So that’s the audience.

**(00:10:28)** If I was that person, running my consulting shop and not able to do something with Basecamp at a critical time, like that’s the person who needs to hear what I have to say.

**Wailin: (00:10:38)** And then how do you go about calibrating the level of technical detail you want to provide in a post like that?

**Jeremy: (00:10:44)** You need to say two things. You got really hurt by this, you were harmed by this incident. What can we do to address that? And then also, the transparency side of here’s the actual story of what happened in kind of a brief form. Blending those two together starts feeling like you’re making excuses. And we want to use some lingo and talk about the actual things happening within the application and kind of excuse you too, of needing to understand all the lingo, the impact and the the description are separate things, then.

**Wailin: (00:11:14)** Did you have anyone else give it a once over before you posted it?

**Jeremy: (00:11:19)** Oh yes. Yeah, I talked to Troy, our director of operations, to Kristen our director of customer service, to Jeff, our programming head. Got a lot of feedback on how things were landing, and how it felt to them. That gut sense. How would this land with me?

**Troy: (00:11:37)** We realized we needed to get some explanations up, given the series of events and the relative instability of the platform. And Jeremy started writing, what became the first sort of overview. We needed that kind of slightly removed, but also heavily engaged perspective that Jeremy brought.

**(00:11:56)** And he did a great job of kind of balancing this out for our customers that netted out what we had, but enough detail to also not feel like we were hiding things. When it first happened, I actually had this reaction of like, well, I should be writing that, I’m the ops guy, I own this.

**(00:12:11)** And I quickly realized that I really could not have written that post in that window. And in fact, didn’t start writing my post until about 24 hours later, that, all of the things had been sort of cleaned up. And there were enough hours in the day that I felt like I could stop and breathe, and kind of go back and recreate an accurate timeline of what happened and when and what we were experiencing at the time. I do think that I needed some extra space. And I think it worked out great that we sort of had this really great summary, that probably would have stood alone, fine by itself, but that I had this opportunity to kind of go and give another layer of depth.

**Wailin: (00:12:48)** hat kind of emotional space did you have to get yourself into in order to start writing it?

**Troy: (00:12:51)** It was not a simple post, right? As you’re sort of balancing out the the desire to sort of show what was going on without oversharing, if you will. And getting, too much into the weeds of my own individual emotions and processes I went through, and finding that balance. Being pretty human in part of that and just saying there were some places where I flat out made some mistakes that I regretted.

**(00:13:16)** At the end of the day, writing that was probably the best therapy for me to process the event, whether anybody read the post or not. And based on some of the feedback and comments, I think a lot of people resonated with what was there, both in terms of understanding that the technical details of what we went through, but of just understanding what it’s like to run a service like that and go through a process like that, which I think a lot of people that are in this business, have to struggle with sometimes.

**Wailin: (00:13:41)** Do you feel like writing a post like this helps normalize talking about emotions, when it comes to an ops outage? Which is, you could see it as being on the other end of the emotional spectrum. Figuring out what’s going wrong with the zeros and ones, right. But do you see the maybe lack of emotion otherwise, or the lack of the human element in the way that other companies deal with these outages in a public facing way being maybe unhealthy? And you’re trying to bring something else to the table to make it more normal to talk about feelings?

**Troy: (00:14:16)** Yeah, I mean, that was certainly my goal. In the post. I realized when I went back and reread the post that I wrote that entire post, just so I could put up the last paragraph.

**Shaun: (00:14:25)** Here’s part of that paragraph.

“I want people to understand that humans run Internet services. If you happen to be in that business, know that we have all been there. I have developed a lot of tools to help manage my own mental health while working through service disruptions. I could probably write an entire post on that topic. In the meantime, I want to make it clear that I am available to listen and help anyone in the business that struggles with this. We all get better by being open and transparent about how this works.”

**Troy: (00:14:52)** And it’s interesting, as I wrote that post, that paragraph was kind of the second paragraph, and then I realized it didn’t fit there and I kind of stuck in the middle. And then eventually I realized that’s what I wanted to close with. So in some ways that, I think, was the driving reason I wanted to write that up, was so that people could understand, what goes on during one of these systems. And not as an excuse, we’re supposed to keep these things up. That’s what people expect for us. But I still think it’s too easy to just think that these are bits and bytes. And they’re all technical systems. And every one of these issues has an engineering answer. And I think the reality is these systems are part human. The humans write the software, the humans run the software. Culture and people and emotions, really are central aspects to making these things work. I feel like having open discussions about those factors and realizing that the human systems that are in place for managing these things are every bit as important as the the technical systems that that manage it. So yeah, if I help trigger that thinking, or help open up some of those discussions, consider that a big win.

**Wailin: (00:15:58)** For Basecamp, these public post mortems and detailed apologies also helped normalize a process of accountability.

**(00:16:05)** Were you nervous about writing this up? Does it feel scary to say, a bad thing happened, we’re owning up to it, and we’re not even done fixing it yet. But we’re going to talk about it even before we’re able to present kind of problem and solution in a very tidy package.

**Jeremy: (00:16:20)** No, if anything, this is the easiest part of the job of knowing that the whole company has our backs on this kind of thing. This is what we do. So this is not an act of bravery, or a radical act of I’m going to speak up to the system that would never own its mistakes. It isn’t about that. It’s being transparent with where we are. We recognize that this was a situation that caused harm. We’re gonna own up to it, take responsibility for fixing it.

**(00:16:48)** And it’s the commitment to making it right that makes the apology, we’re going to identify what we did, say it, and change our behavior. As a individual, that takes a lot of courage. As a company that has decided that this is something that we do together… Putting ourselves on the hook in that way, that’s probably the scariest part, we’re committing to doing something. But there’s no other way to do this.

**Wailin: (00:17:12)** And I feel like that stance of opening this process of public accountability via a post like this, it really signals that we’re at the beginning of this process in a lot of ways, right? And not at the end. Because, if you’re saying we’re committed to fixing it, here’s what we’re doing, that kind of promises in a way that you will come back with an update at some later point, right?

**Jeremy: (00:17:39)** Being very transparent about your your business’s work is useless if you have no credibility. This kind of transparency only works if you actually do it. If you come around to the next time and say like, oh, we’re so so so deeply sorry, like, you can only add so many so so so or really, really, reallys. And it just loses its meaning you actually need to close the loop and make it right.

**(00:18:07)** We’re coming up to another cycle of work internally. So we’re going to budget time to treat this to a more formal assessment. What led to this and how can we fix it elsewhere? And that’s the kind of thing that we can share.

**Shaun: (00:18:17)** Troy, one of the things you wrote about in that final paragraph was that you had been developing tools to manage your own mental health. Can you talk a little bit more about those tools?

**Troy: (00:18:27)** Yeah. Have you ever written a blog post where you kind of throw away a line in there that you realize is gonna come back to haunt you someday?

**Shaun: (00:18:32)** Yeah, you just promised yourself more work?

**Troy: (00:18:34)** Yeah, I did.

**(00:18:39)** And the number of people who have responded saying, Hey, I’m waiting for that post.

**Shaun: (00:18:39)** Yeah, what’s up.

**Troy: (00:18:42)** I guess means that I’m gonna write it, but maybe I can preview a little bit of it.

**(00:18:45)** Two and a half years ago, I realized that taking care of my mental health was pretty critical for me surviving this kind of work. I mean, the first thing I would say is find somebody to talk to. For me, I found a therapist a couple of years ago. And that just opened up the ability for me to process a lot of stuff that had been bounced around in my head in a pretty unhealthy way. I didn’t know a lot about what therapy was, it had a little bit of a stigma to me. But it got to the point where I actually got directed to that employee support program that every company I’ve ever worked in, has always had. And I thought that was something that you never wanted to touch.

**(00:19:19)** And processing this kind of stress that goes on during these events in your head is not good. And I think a lot of us are kind of taught that idea of just buck up. Do more, work harder, be better. I’ve just found somebody to process those thoughts with is pretty hugely helpful.

**(00:19:35)** Second thing for me is I started doing meditation a couple years ago. Again, one of those things that I always heard I should do that I thought had this sort of mystical property that I wasn’t really sure what I thought about it. And what it’s done is given me that fraction of a second to interrupt some bad thought patterns.

**(00:19:51)** As an example, during an event, if I start to want to just yell at somebody or just get mad or angry, like I can recognize that and intercept and redirect that. That would be unhelpful, but feels emotionally right, into something more productive.

**(00:20:07)** And then the last thing I got introduced to the idea of self compassion. There’s a website called self-compassion.org. I realized that a lot of my problems specifically in these types of incidents, dialogue would start in my head that just chewed me out worse than any person or customer or boss or anything I’ve ever had. And just learning how to recognize that, being imperfect is a natural part of who we are. And that just yelling at people who are not perfect, whether that’s yourself or somebody else is unproductive.

**(00:20:41)** And trying to carry those into these kind of incident responses. Those are a few. And there’s probably a few more I can throw in some day when I finally write this post. But that’s kind of the general idea of kinds of things I think about when I wrote that sentence. That have just allowed me to get through these in a much healthier space, both in the moment. But honestly, in the days and weeks afterwards, where I think in the past, I just built up a lot of baggage and a lot of heavy feelings that eventually make it really difficult for you to do to do things well.

**Shaun: (00:21:09)** In the past, do you think you could have written a post like the one you wrote after an incident like this? Or do you think even a week from then you would still be stuck in your in your own head about it?

**Troy: (00:21:19)** I spent an amazing amount of the last week writing. Obviously the public post that was written but I was doing, every few hours writing updates on status, I was communicating with the support teams, the engineering teams, our own ops people. And because we’re remote, most of that happens in Basecamp, and is typed out. And so I felt like I was writing nonstop for about four days. And it really made me realize how therapeutically positive experience writing as for me. My mind works very quickly around a lot of things. But oftentimes that allows really silly things to spin in my head and sometimes putting them on paper either helps me get rid of them or sometimes helps me communicate them better.

**(00:22:03)** As a personal goal out of this that sort of came is just to write more. I think it’s I think it’s good for me and getting some positive feedback that other people appreciate it as well. So we’ll see.

**Shaun: (00:22:10)** REWORK is produced by Wailin Wong and me, Shaun Hildner. Music for the show is by Clip Art.

**Wailin: (00:22:24)** You can find Jeremy and Troy’s posts at SignalvNoise.com. And we’ll also link to them in the show notes for this episode, which you can find at rework.fm. Jeremy is on twitter at @bitsweat and Troy is on twitter at @troytoman.

**Shaun: (00:22:38)** We do want to do a follow up episode about mental health in the tech industry. So if you have a story to share about your own experiences or tools you found helpful, feel free to email us at hello@rework.fm or leave us a voicemail at 708-628-7850.

This is an episode title
