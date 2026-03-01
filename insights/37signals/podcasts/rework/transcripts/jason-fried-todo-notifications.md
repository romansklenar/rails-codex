---
title: "Jason Fried on to-do notifications"
description: "Jason Fried discusses the product design decisions behind a new to-do completion notification feature in Basecamp, including the concepts of rolling forward versus rolling back and having a single person with final say on shipping decisions."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/jason-fried-todo-notifications/
tags:
- podcast
---

# Jason Fried on to-do notifications

**[00:00:00]** Broken By Design by Clip Art plays.

**Shaun: [00:00:01]** Hey, this is Shaun, welcome to a very special bonus episode of REWORK. We're going to try something a little bit new with this bonus and hopefully we'll do a lot more of these. This morning Jason Fried sent me a ping, and said, hey I'd been having this really important discussion about some product design and decision-making stuff with a few other people at Basecamp. I'd love to talk to you about it and share it with the REWORK audience. So, this is going to be just a really quick, raw, rough conversation with Jason about a very specific feature in Basecamp and some of the decision-making that went into it. So, enjoy!

**[00:00:45]** So, let's jump into it. You want to tell me about--well, let's first--what is this feature you guys were discussing this morning?

**Jason: [00:00:52]** So, we'd finished feature. It was--or it is a way to specify who should be notified when a to-do is completed. Up until now, there was actually no way to be explicit about that. So, if you wanted to finish a to-do. I'm sorry, if you finish a to-do, but you wanted someone else to know when it was done so they could do their work, you basically had to hack it. You had to go into the comments on a to-do and say something to subscribe that person, because subscribers get completed to-do notifications.

**[00:01:33]** But, it's really abstract. It's not really clear that that's how it works. In fact, it's not even not really clear. It's not clear at all. And there's really no explicit way to do it, so this came through some research that Ryan was doing. Ryan was talking to some customers and it turns out that like, people have always asked for years about dependencies. People want dependencies on to-dos, which means that, like, when this is done, allow someone to start something else. Or when this is done, do something else automatically, or whatever. And we're not going to build full-blown dependencies, it's just not in the scope of Basecamp. But this is a really nice way to basically offer dependencies, which is telling somebody. Being explicit about who should know about something when it's done.

**[00:02:13]** So, anyway, we built the feature and as usual, the real moment, the getting real moment is when you deploy it and then it's available to everybody, to every customer. And prior to doing that, some people were second-guessing it and had some questions about it and Jonas chimed in and had some thoughts about it. And there have been some other people who have asked about it, and people are unclear about it. And that all revolved around the fact that today, subscribers, so anyone who posts a comment, basically, will get notified of the completion. But this field says, when done, notify and then you can put two people's names in that field. But it'd be those two people plus anyone else who's commented but we weren't making that clear. We saw we're not making it totally clear that it's those people plus the other people.

**[00:03:07]** The argument we were making internally was just, it doesn't--it already works that way. It already tells subscribers anyway that it's going to be completed, so do we really need to also explain that's how it works if now we're giving people an option to type people's names in themselves. So, I absolutely, positively want John and Betsy to know when this is done. Now you can do that. And yeah, it might also notify Bill, Sam and Lisa. But it was doing that anyway, so, whatever.

**[00:03:40]** Anyway, some people were bringing that up that it's like, kind of inconsistent in a sense. And it is kind of inconsistent in a sense, but--

**Shaun: [00:03:48]** Or at least invisible.

**Jason: [00:03:49]** Yeah, it's invisible. And the thing I thought was really interesting about the discussion was it revealed something to me, which is that it's easy to defend a system that you're used to. Even when the rules are invisible, and we wouldn't stand for those invisible rules being true had we built--like, if we were building the feature now, the way it works today, we would say, that's just weird that we're notifying people and they don't know why and they don't know when, and it's unclear. But that's just the way the system's always worked for us, so it's easy to come back and defend the lack of clarity because it already exists so we're used to it.

**Shaun: [00:04:32]** Yeah.

**Jason: [00:04:33]** I thought it was interesting--it's interesting when that happens, and it's not that it's wrong to do, but it was sort of a really good discussion to be had, and ultimately I think what we've decided although apparently it's not official. So, Scott is point on that project, meaning Scott has final say on it. I believe we've decided to ship it as-is and understand that it's not a perfect system, but before wasn't perfect either. It's just a little bit better than it was before. Because something is possible that wasn't before. Or something is more explicitly possible than it was before and that that is worth it. So, it's kind of a way to get the ball rolling on fixing other things, perhaps. Like, if this points out that things weren't clear before, that's actually a good thing versus pulling it back and saying, well, let's just live with the unclear system because it was totally unclear. Instead, we're saying, like, let's have it still be kind of unclear, but also have a little bit of clarity. Like, you can see a little bit through the clouds now. And to me, that's the right decision, is just to move forward on that so we can learn something and make some forward progress versus just sticking with what we had and sort of--and making...

**[00:05:46]** It's funny, we're like, holding this new feature to a higher bar than the bar we're holding up for everything that already exists. Everything that already exists, and all of a sudden we're holding--some people are holding the bar really high on this. It just doesn't seem to make sense, so. To me, at least. I get the argument, but I think we're better off just shipping this as is. So, we'll see what ends up happening, but it was a good discussion around some fundamental product design and management things that come up from time-to-time. Like, when is it right to ship something? Did we make it better? Did we make it worse? Sometimes you don't really ask those questions up until the end. Like, the actual moment you're about to deploy is when you actually really feel a different sense of pressure than you ever feel during the actual creation of the thing.

**[00:06:33]** Until you're ready to ship, everything's kind of hypothetical and a maybe. We can maybe change it, maybe can't change it, whatever, you kind of live with it for a while. But then there's this moment where, a second from now, everyone will see it. A million people will see it. Is this really better or not? And that kind of happened this morning and we're still waiting to find out what the final word is. But, anyway.

**Shaun: [00:06:49]** Are you conscious of the different mindset between building something new and changing something existing?

**Jason: [00:06:57]** Yeah, I mean, it's so much harder to change something existing, because even if it's unclear, not good in some ways, people get used to it. And then you're--and you work around it and you learn the workarounds. And you just kind of deal. And then, we do that all the time, in all sorts of ways. The way we all live. You do weird shit, and then you're just used to that, and that's just the way you do it. And someone else sees how you do it? And it's like, this is how you get to the work everyday?

**[00:07:29]** You're like, yeah, I take five busses and this train. And it's like, wow! Did you know you could just take this other thing and get right there? It's like, well, maybe, but I know this route. It's kind of--that's sort of a weird example, but there's kind of like, routes for example. How do you do something? I do it this way, this way, this way, this way, this way and this way, but you could just do it this way instead. And it's like, yeah, maybe that's true, but I'm not comfortable with that way. I know my way.

**[00:07:53]** When you're dealing with product changes, when you have a big customer base, any change is going to--well, not any change. Many changes can adjust or can nudge someone's workflow in a different direction. And even if the new work flow is technically better, it may not be better, especially not in the short-term for someone who's learning something new.

**[00:08:15]** That's different from launching something brand new that doesn't have any effect on what exists because it's purely additive and you're not changing anything. So, you do have to kind of think through the implications in a different way. If it's additive, I think you just have a lot more freedom to try something different. If it's a change, you just have to be--it's not that you shouldn't do it or even that you have to be. You should probably be a little bit more careful, but at the very least, you should simply be aware that there is a difference.

**Shaun: [00:08:48]** Yeah, that people are actually--this is actually affecting someone's work.

**Jason: [00:08:51]** Yeah, again, even if it's taking three steps out, it's like, well, I know those three steps before. I knew those steps. I'm fine with those steps. I do those steps every day. I've been doing those steps for five months, I'm really good at those steps. Now, they're gone. Now, I kind of--everything's different, I'm not ready, I'm busy. I don't have time to learn this, I don't want to learn it. Even if it's going to take you five seconds to learn the new way, sometimes it's just still... it's just a mental thing that's hanging over your head, and you're just like, I don't want to deal with that change. I didn't ask for it, I don't want it.

**[00:09:19]** We make changes all the time. We just launched that refresh which changed a variety of things. And sometimes you just say, it's worth it and after a little bit of short-term reorienting, people are going to know the new way and it's worth it. Sometimes it's not and there's no right or wrong answers, really, it's just being aware of the situation. And then talking about the trade-offs and the odds and the benefits and the whole thing and making a call.

**[00:09:47]** And I should also say recognizing it, like, most of these things you can change anyway, later. And this is actually something that I brought up with Jeff. I was talking to Jeff about this. Jeff had a really cool term that he used on some other project, called falling--rolling forward. So, typically there's this thing we can do. You ship something and if it totally sucks or breaks something, you can roll back. Roll back just means, you go back--it's a technical term...

**Shaun: [00:10:15]** Whatever the previous version was.

**Jason: [00:10:17]** Yeah, it just kind of rolls the code back. The new version is gone, the old version is back. When you do that, when you roll back, though, you can--if it's a really catastrophic problem, you can roll back and it's usually a good idea. Something's really, really badly broken. But the other thing that can happen is if something's like, mildly broken, or something is sort of--there's some negative feedback that comes out of it when you roll back, you're now in a defensive posture. And it's very unlikely that you're going to put something forward again. You're going to, like, wait for a while. And that can really stop your momentum.

**Shaun: [00:10:50]** What is the mindset, there? I mean, is it like, we tried this and it failed?

**Jason: [00:10:54]** I can give an example.

**Shaun: [00:10:54]** So, let's not try again?

**Jason: [00:10:58]** Well, you're just nervous now. You don't want to have two strikes against you, one after the other.

**Shaun: [00:11:02]** You're gonna fuck up once, sure.

**Jason: [00:11:04]** Right. So, for example, when we launched that new unified Hey Menu. We had the Hey Menu and the Pings Menu and the Campfire Menu previously. Then, we launched the new United Hey menu, which is one menu, pulling Campfires and Pings into that. And we got a fair number of heated complaints. Primarily around pings being part of it. The campfire menu got a little bit, but it was was no big deal. The ping thing was the bigger deal.

**Shaun: [00:11:32]** People wanted to keep those separate.

**Jason: [00:11:35]** They want to keep them separate because they're personal. Someone's trying to reach me directly. I don't want to have to wade through other things. Anyway, totally fair and valid. Now, there's two options. We could have rolled back. Which meant that we would have gone back to the campfire, hey, and pings menu. And we could have sat there--put the old one back in place and sat there. But we would have been gun-shy and nervous, and there'd be a lot more feedback coming in, and we'd start to second, third, fourth guess everything, basically. Because that's kind of what happens once you roll back. You actually are given this opportunity to sit back, which can be good. But it can also--I just think in many cases it's not really great. I would do it in a catastrophic situation, but most cases I wouldn't

**[00:12:19]** Jeff, then made a really good point. He's like, if you roll--let's roll forward instead. And the idea was, let's roll with what we have. Let's leave it in a single unified hey menu. We know we're going to get a lot of heat over the last 48 hours, but let's just let it sit there. And the next 48 hours, we're going to start working on a new solution. We're going to separate the pings menu again. So, versus going back to the way it was and then launching just the pings and hey menu. We're going to leave the new design as it is, take the heat, but we're moving forward because we have something out there, and it encourages us to then finish the problem. And now we can do the pings menu also and roll that out.

**[00:12:58]** We're in the process of moving forward and rolling things out versus taking steps backward and being back on your heels. And then being gun-shy about rolling something out. So, I like this idea of rolling forward, and I think in many cases that's what's about to happen here if we launch this thing. Which is that we might--we're kind of in a little bit of no-man's land on this improvement. I actually think it's a nice improvement, but there's definitely some stuff about it that's pulling through. Or pulling along some of the old confusing things we had. It's not solving those problems.

**[00:13:34]** I feel like it's a slow roll forward, where we're rolling forward by making something possible and obvious that wasn't possible and obvious before. Actually, it was possible, but it wasn't obvious before. And now, it's also going to unearth, I think, some other hidden rules and things that we should clean up. But because it's out there, we're now going to be thinking about fixing the other things. Versus if we didn't launch it, we just sort of would forget about the problems that do exist.

**Shaun: [00:14:01]** This is just like our recent episode on Start Making Something. The idea that you can't innovate on something unless it's there. Unless it exists.

**Jason: [00:14:09]** It's got to be out there, right. It's got to be out there so, anyway, that was what happened, and I thought it was like a good example of that. And the thing that was cool about it was that it's really ultimately a tiny little feature. It's one field and one label on a to-do form that has many other things you can do. It's really a small thing, but it's sort of a--

**Shaun: [00:14:36]** But the consequences can be bigger than the feature itself.

**Jason: [00:14:40]** Yeah, it's like a microcosm of product development.

**Shaun: [00:14:42]** Especially on to-dos, that touches so many customers.

**Jason: [00:14:45]** Yeah, it's our most popular thing. So, it is a big deal. And it should be considered as such, but... it was just, I thought, a good capsule example of how changes can be interpreted and applied and how the real moment of truth is actually when you ship it, not any time before that. Every time before that it's like, there's no truth in it quite yet. And how that moment really makes you rethink and then brings out people who've been thinking about it but haven't said anything, and now they say something about it, and then you have other discussions so. But ultimately, the decision was, Scott has point and it's up to Scott to decide what he wants to do. All the information is now on the table. I basically said, let's decide today and I'm bowing out. I've made my point, I'm out. Scott, it's up to you but let's decide today, because let's not let this sit anymore. Whatever you want to do is fine. Totally fine, but we need a decision today.

**Shaun: [00:15:42]** Do you like that feeling as a manager? To be able to trust... I mean, I don't think that's as common as most people would hope to be able to say, you know what? I've made my point and whatever Scott does is correct?

**Jason: [00:15:57]** I like it. It helps me be lazy.

**Shaun: [00:16:00]** Fair.

**Jason: [00:16:00]** No, but I do like it. I mean, I think it's the right--I think it's kind of the only way forward unless you want to be involved with every single decision.

**[00:16:12]** And I don't want to be involved with every single decision. I don't think I can make every decision well, either. And I haven't been working on this intimately. I was part of the original group who thought up the feature, but I haven't been working on the day-to-day, Scott has. And so, Scott should be the one to make the call. Also, Scott has point, again, which is this thing we have internally, which is, who--every project we work on on the product side, at least on desktop, I'm not sure if iOS and Android do this. But on the desktop, we have this idea of point, which means somebody, everybody who's working on the project knows who the somebody is. And that somebody is the person who has the final call, the final say on everything. If the final call or final say has to be made. And Scott is point on this so it's his call. If I came in and made the call, I would be going over the concept of point. And that would sort of dilute the whole idea of point everywhere on all future projects.

**[00:17:14]** Granted, there may be situations where I would have to make an alternative call for some other reason and I would just hold that veto card very close. I would not use that often. And I would probably first talk to Scott about it prior to me just jumping in and saying something. Technically, of course, I could do that, but the more I do that the less hardy that whole idea is in the first place and then people will stop believing that it's even something, and then there's no point in doing it anymore.

**Shaun: [00:17:41]** Yeah, that's a rough precedent to set.

**Jason: [00:17:44]** And, you know, there's times when...actually there have been times since we introduced the idea of point, but there's been some heated moments when I was discussing something with someone I really strongly disagreed with the decision. But, at the end, you still kind of have to say, it's your call. Unless, of course, again, it's some sort of existential thing where the responsibility is going to land higher up because it might impact the business in a way that we can't allow to happen. Something like that? But that should almost never happen, anyway. And it hasn't, so I'm not worried about it.

**Shaun: [00:18:22]** Awesome. So, what's the next step? Scott says, yeah, let's do it?

**Jason: [00:18:27]** Scott says yeah let's do it, or yeah, let's not. So, here are the steps. Yes, or no. There's those steps. Yes would mean, like, ship it tomorrow or. Because we'd probably do it tomorrow now--the decision would be made today, but since Tom worked on it and Tom is overseas in the UK, he's sleeping. So, we want him to be awake, so we'd probably do it tomorrow morning.

**Shaun: [00:18:50]** Sure. Very nice of you.

**Jason: [00:18:51]** Yeah. The other alternative is, like shelve it, don't do anything with it. We built it but we're not confident in it, so just stop. Another option could be pull--pause, figure out what is--is there one thing that's missing from this that would make it work? For example, we discussed, to be totally explicit about this, this is actually my favorite outcome. This is the outcome I'd prefer, but, again, not up to me. I would--although I don't mind shipping it. Let's just say, I don't mind shipping it as is, but ideally I would remove--I would not send to-do completion notifications to subscribers anymore. I would only send them to people in this field that we've added, which is, who should be notified when this to-do is completed. Now we've explicitly--

**Shaun: [00:19:45]** Sorry, so the person who creates the to-do will specify who will be notified once it's complete not necessarily the people who comment on it. Anyone can still comment on it but they might not be notified automatically.

**Jason: [00:19:58]** Yes. To me, that's the ideal version, because, and only because, it is perfectly explicit with no hidden rules. We're trying in general to get rid of hidden rules because no one knows what they are. So right now there's a hidden rule which is, if you comment on a to-do, you're now going to get an additional notification that that to-do is completed. Even if you don't care, you're going to get it. And like, in many cases it's fine, but also, I'll tell you, in many cases for me, I don't want to see. I don't want to get a notification if something's completed. I'm involved in a variety of discussions. I don't want to get an additional dozen notifications if 12 dos are completed. I just don't want that. I'm not interested in that. So, while it sounds like a good thing that it automatically happens, I wouldn't be surprised if it's actually a pretty bad thing in that we might be sending tens of thousands, or hundred thousand, I don't know, I'm just making up a number here, notifications a day that people do not want.

**Shaun: [00:20:56]** I suppose your own, the sum of all your input on this to-do was, great idea. You know, like--

**Jason: [00:21:01]** Exactly.

**Shaun: [00:21:01]** --your comment could just be an emoji thumbs up, and you'll be notified when it's done.

**Jason: [00:21:05]** Right. Right. And it's just kind of unnecessary in a lot of cases. So, my vote would really be to be perfectly explicit about it. We now have a field that says, who should know about this when this is done. And, now that we have that field, we should eliminate all the other rules. All the other hidden rules that send notifications upon completion. That's what I would do, but we could also do that. We could hold up the feature and do that together and then launch it next week, for example, I'm guessing. Or, we could just launch what we have now and see how the market even reacts to it. Maybe it didn't matter anyway. Maybe all this talk doesn't matter, people are just like, this is great and we're fine. Or, maybe we get more feedback, which is like, well, there's only three people listed in this field but seven people are getting notifications upon completion. For what it's worth, I don't think we're going to hear that even once, because nobody--you can't see other people's notifications, so you don't even know that other people are getting notified beyond the three people that you put in the field. I think it's a lot over nothing, to be honest, but I'm maybe wrong on it. Anyway, I'd go with the explicit route, eventually. Is what I'd like to see us do. I think that we're just better off when things are clear and there aren't all sorts of secret, hidden things.

**Shaun: [00:22:25]** Yeah, I mean, we'll see what happens tomorrow.

**Jason: [00:22:27]** Or not.

**Shaun: [00:22:30]** Or not, yeah. We'll see if nothing happens tomorrow.

**Jason: [00:22:32]** Yeah, we'll see if nothing happens tomorrow. That'd be something, wouldn't it?

**Shaun: [00:22:35]** Yeah, right?

**Jason: [00:22:37]** All right, well. There we are.

**Shaun: [00:22:39]** Cool.

**[00:22:41]** Broken By Design by Clip Art plays.

**Jason: [00:23:17]** How's the beard? I haven't seen the beard in a while.

**Shaun: [00:23:18]** Oh, I shaved it. Yeah.

**Jason: [00:23:20]** What!?

**Shaun: [00:23:20]** I had to get rid of it. My skin gets so dry and nasty underneath it and none of my lotion and stuff.

**Jason: [00:23:26]** Yeah, but nobody can see.

**Shaun: [00:23:28]** Yeah, but I can know. That's even worse.

**Jason: [00:23:29]** But you know.

**Shaun: [00:23:31]** Yeah.

**Jason: [00:23:31]** Yeah. But you know.

**Shaun: [00:23:33]** Yeah.

**Jason: [00:23:33]** Oh well.

**Shaun: [00:23:35]** Um...
