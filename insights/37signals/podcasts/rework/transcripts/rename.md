---
title: "Rename"
description: "On the last episode of REWORK, we talked about the dangers of using violent language in a business context."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/rename/
tags:
- podcast
---

# Rename

**Shaun: (00:00:00)** Welcome to a special bonus episode of REWORK. On the last episode, we talked a lot about the language we use in business and how important it is to sort of pay attention to, and it reminded me of this thing that Jeremy Daer who is the head of the SIP team here at Basecamp…

**(00:00:14)** Wailin, what does SIP stand for?

**Wailin: (00:00:17)** Security, Infrastructure, and Performance.

**Shaun: (00:00:19)** Thank you. Jeremy wrote a post in Basecamp, maybe three years ago, about some of the terms that the industry uses to refer to database relationships that as you’ll hear can be a little problematic. So I sat down with Jeremy to talk to him about it.

**(00:00:34)** First, I guess, explain to me what the master/slave relationship is when we’re talking about data storage.

**Jeremy: (00:00:39)** So a master/slave has a long history in communications and it started out, I believe in serial ports and in kind of old-school computer systems where you could do, for example, a printer being slaved to a serial input, meaning that everything that the master did was automatically followed by the slave device. So, you could slave a whole set of devices to a master and they would do exactly what the master does.

**(00:01:08)** Technologists have continued to use that terminology for all manner of things since the original usage, partly out of convenience and who knows what. Technology terminology just gets passed on naturally. But it’s been used for other cases, like in databases, where the primary database will replicate itself to a secondary database. And the terminology used there is the master database and the slave database given that the master database is kind of leading and the slave databases following.

**(00:01:38)** And so, that’s the terminology we inherited from the database systems that we use because in their own technical documentation they talk about having a master/slave system in the protocol that they speak with and the commands that you issue, everything uses that vocabulary.

**Shaun: (00:01:55)** It should be obvious that this language is problematic to say the least. When did you first start thinking about making that change?

**Jeremy: (00:02:05)** We’ve thought about it many times over the years, which is kind of the interesting thing about this, how you can do nothing. And it feels like there’s no harm in that, like there’s a legacy to this. And it should seem obvious, it can seem obvious, but is it? Given that it stuck around for literally decades and it was non-obvious at the very beginning. We could have used other terminology from the start. So why did we use that terminology, and particularly, why have we kept it? And every choice where we’ve used it in a new system was it was an opportunity to not keep it. Seeing as there’s a kind of a competence gap of if you don’t want to use that terminology, you need to meet this high bar to demonstrate why it’s wrong. Rather than me at a much lower bar to say there’s other vocabulary that fits better. So, for example, leader and follower or primary and secondary. There are other things that are more precise, more accurate, and don’t carry this unnecessary baggage with it. And also don’t suggest that you need to say why the old one’s wrong in order to adopt a new one.

**Shaun: (00:03:12)** How often do—when you’re talking with your team or with other people that know more about computers than I—How often does this language come up in conversation?

**Jeremy: (00:03:22)** It comes up constantly in the context of the system at hand. So, for example, we recently had this a BigInt database outage, that brought Basecamp down. And this was very closely related to primary/secondary database systems or master/slave. And so in just everyday communication about the outage, we’re using this terminology constantly. And so recognizing this is in such constant usage, like we do have the power to control and decide how we want to talk about it.

**Shaun: (00:03:58)** Yeah. You mentioned that Elasticsearch had changed their language around the master/slave relationship. Is this something that’s been sort of circulating in the tech community for a while?

**Jeremy: (00:04:07)** Yeah, and it goes back decades and some people just never used it in the first place. So there wasn’t much controversy about making a change because there is no change to be made. It was a new system and they adopted different terminology. I believe Elasticsearch used primary and replica from the beginning which adequately captures the fact that there is a primary data source and then others that are get copies. They are literally replicas of the primary and so they never needed to make the change from having a master and a slave.

**Shaun: (00:04:38)** And then finally I just wanted to talk about, I really like your sort of elegant solution that you wrote about in your post. Can you talk about what, what you suggested we do, because it wasn’t just, you know, go through and find, replace every usage of these terms

**Jeremy: (00:04:55)** Personally, I had some anxiety about suggesting something like this, which really gets to… Why was I personally afraid of doing something like this? Because it gets down to a core kind of fear underlying something about anxiety, about suggesting such a simple obvious change. Like not wanting to cause conflict. And I’ve been at Basecamp for a long time. I’m best positioned to suggest something like this and help make it stick. And it doesn’t need to be a directive. It doesn’t need to be forcing people to do something. It can stand on its own merits. And so the suggestion that we don’t need to see it as like an overbearing, somebody telling you what to do. But here, let’s decide on something that’s simple together. Let’s get together. And we made the choice together. We talked about it, and everybody was onboard, and we don’t need to drop everything and kind of demonize our past.

**(00:05:47)** Just, like, we’ve used master/slave incidentally. And we’ve just tossed it around like that’s part of our lingo. Well, we just don’t need to it anymore. It doesn’t mean we need to go excise it from the full history of things that we’ve done. But, we can gradually evolve our way forward and shed the baggage as we go. And the important thing isn’t to have the language gone, but as to kind of check ourselves and be conscious about our choices from here on. And that’s up to us and we can make that choice every day.

**Shaun: (00:06:21)** Yeah. So, what is Basecamp using now when we refer to these relationships?

**Jeremy: (00:06:26)** We generally use primary and replica because that matches our actual data usage. So, we’ve got multiple data centers, we’ve got stuff in the cloud and each application is talking to a primary data source and often doing reads against the replicated data source. And so, that precisely matches the actual relationships between our data stores. So we’ve stuck with that for our setup and I’ve seen other people use leader/follower or primary and secondary in cases where something isn’t only a replica, but may also be accepting rights. So, there’s a lot of terminology you can use.

**Shaun: (00:07:02)** Well, that’s all I had, and thanks for mentioning the the Big Integer outage because that’s the next episode.

**Jeremy: (00:07:10)** Oh, snap.

**Shaun: (00:07:10)** I think you’re on that one too, actually.

**Jeremy: (00:07:12)** Yep.

**Shaun: (00:07:13)** It’ll be fun.

**Jeremy: (00:07:15)** Oh, fingers crossed.

**Shaun: (00:07:18)** Thank you so much for doing this, Jeremy.

**Jeremy: (00:07:18)** Thanks, Shaun.

**Shaun: (00:07:20)** All right, have a good one.

**Jeremy: (00:07:20)** Bye.

**Shaun: (00:07:20)** Bye.

**Wailin: (00:07:21)** You heard Jeremy mention the BigInt outage or the Big Integer outage, and we are going to go way in depth into what happened, what it was all about and how we at Basecamp dealt with it. That is coming up early next year.

**Shaun: (00:07:37)** So, Happy Holidays for those celebrating holidays this time of year, and we’ll be back in 2019.

**Wailin: (00:07:46)** Oh, remember to change the date on your checks.

This is an episode title
