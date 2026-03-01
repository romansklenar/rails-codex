---
title: "Please don't like this"
description: "An exploration of the anxiety and social dynamics created by like buttons and applause features, both on social media and within Basecamp's own product."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/dont-like-this/
tags:
- podcast
---

# Please don't like this

**Wailin: (00:00:00)** In the summer of 1962, the pianist Glenn Gould performed at the Stratford Shakespeare Festival in Ontario, Canada.

**Kevin: (00:00:09)** He was actually one of the directors of music at Stratford. He gave an all Bach concert. The second half of which was devoted to excerpts from Bach's Art of Fugue. Now, the Art of Fugue is a very sober and intellectually challenging work of counterpoint that Bach wrote at the end of his life. And it's the very opposite of the Tchaikovsky piano concerto in terms of the impact it makes on an audience.

**(00:00:42)** [Slow, moody piano music plays, from Bach's Art of Fugue.]

**Kevin: (00:00:47)** Before the second half began Gould gave a little speech to the audience in which he more or less said that applause was just an easily induced hysterical mob reaction and not appropriate to something as sober and intellectual as the Art of Fugue, and it's music that should be received with quiet and reverence. So, he asked the audience not to applaud afterwards. And as the last bars of the last fugue were being heard, he had the lights dimmed all the way to black and one or two people ignored Gould, but for the most part the audience didn't clap. And what Gould wanted out of this was to convey a sort of reverent silence. And that's not really what happened. They shuffled around awkwardly after the concert and eventually just filed out.

**(00:01:51)** The critical reaction was very negative. One critic in particular thought it was very arrogant of Gould to ask an audience not to do what it might naturally want to do, which is to share its appreciation for what had apparently been a very good performance. It was a bit of a minor scandal and it did appear that people didn't want to be denied the opportunity to share their appreciation for what they had just heard.

**Wailin: (00:02:20)** Kevin Bazzana writes and teaches about classical music and has studied Glenn Gould for 30 years. He's written two books and consulted on a documentary about Gould. And Gould, in addition to being a world-famous musician, was also a prolific writer. Earlier that year, 1962, he had published an essay called "Let's Ban Applause!" It's written in kind of an arch, humorous tone, but it expressed his real discomfort with this one aspect of performance.

**Kevin: (00:02:48)** He was always a very uncomfortable public performer. He didn't like giving concerts. He had sort of musical rationalizations for that but it was mostly a temperamental issue. He always preferred broadcasting and recording, even from an early age. And he actually retired from concerts permanently in 1964. So, when he wrote "Let's Ban Applause!" he was actually just a couple of years away from the end of his concert career.

**(00:03:20)** "Let's Ban Applause!" was just dealing with one specific aspect of the concert situation that he didn't really like. A heroic performer standing on stage and receiving tumultuous ovations from the ravening audience. That was always how he thought of concerts, as this sort of gladiatorial contest.

**(00:03:44)** Gould didn't hate his audience, he hated audiences as a mass. He didn't like that whole Roman colosseum aspect of performing. But he did want to communicate with people, and that's what recording and broadcasting allowed. And he actually thought that it was a much more direct and profound kind of communication than performing in public.

**(00:04:11)** [Broken By Design by Clip Art plays.]

**Wailin: (00:04:11)** Glenn Gould was asking people to do something very unnatural, which is to hold their applause. It goes against what we're taught in polite society about how to be a good audience. And the questions he raised in 1962 are still relevant today in a social media age when it seems like we're all performing on a digital stage for virtual likes and hearts and thumbs up.

**(00:04:33)** Hello and welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I'm Wailin Wong.

**Shaun: (00:04:37)** And I'm Shaun Hildner. We've been having our own debate at Basecamp around the same issue that Glenn Gould raised in the '60s. There's this feature in Basecamp that lets you applaud what someone else writes. You just click a button, your picture pops up beneath the post and a little sound plays.

**(00:04:52)** [Super Mario Bros. coin sound plays.]

**Wailin: (00:04:53)** And if you receive Applause, you get a report the next day showing who applauded which of your posts. Recently, we removed the feature, just internally, to see how people around here would react.

**Shaun: (00:05:04)** Some people within the company enjoy the feature, or parts of it, and miss it. Others had some serious doubts about it and found themselves less stressed when it was gone.

**(00:05:12)** Today, we're bringing you some of that debate here on REWORK. I recently talked to Basecamp CTO, David Heinemeier Hansson about why the feature was introduced and some of the problems he started to see with it.

**Wailin: (00:05:23)** Then we'll hear from a designer on our iOS team who really likes the Applause feature and draws some important connections between her work communications and her life on social media platforms.

**Shaun: (00:05:44)** Do you remember when we created the Applause feature in Basecamp 3, what was the thinking behind developing that feature?

**David: (00:05:50)** I remember it exactly. Noah, our data scientist writes up these wonderful long reports where he really dives deep into some behavioral aspect of users. He does a bunch of financial deep dives. He does a bunch of deep dives on A/B testing or our marketing pages, and so on. And when we posted those in the previous version of Basecamp, it would often just be crickets, as though he had posted into the void.

**(00:06:18)** And it wouldn't be because people didn't read it! Or didn't appreciate it. It was because they didn't have anything to say. They didn't have any follow up questions or whatever, but the effect on someone like Noah, who put a lot of work into writing a very detailed report, and then to hear nothing back. It's like...

**(00:06:35)** [Sound of tapping on the microphone.]

**(00:06:37)** Is this thing even on? And we thought that that's a shitty feeling. Basecamp should be a place that encourages people to write long-form thoughts. Ideas. Things that take real effort and time. More than just typing into a chat box. And, when people do that, when they put in a serious amount of effort to create something like that. They want to just know that it was received.

**(00:07:03)** The idea we came up with was like buttons. It was heart buttons like pretty much every social and no-social app that launches today has one of these buttons in some capacity, and we chose to call it claps. That you clap for something, right? Applause.

**(00:07:20)** I think it worked really well in that and similar circumstances. Like, when Noah, now, would post a long-form, you'd have dozens of people just go, "yay, that's really cool", and Noah would know that someone had read it and they appreciated his work. Unfortunately, that was not the only expression of Applause, and there were a lot of other ways that Applause got used within Basecamp that we had much less favorable assessment of.

**(00:07:49)** For me, personally, it was really Applause on answers to the questions that people at Basecamp do every week and every day, in terms of what are you going to work on this week, and what did you work on today?

**(00:08:02)** I would read through these at the end of the day or early in the morning and I'd go, like, there's some things that stand out to me more than, oh, that project. I knew about, or had talked to that person about, let me Applause for that. And then I would see, like, well if I applaud for that person on that thing, then there's another colleague just below that perhaps worked on something else no less important, no less interesting. But, not just the thing I had been following, right? But now, if I don't applaud for them, does that mean that I don't appreciate their work? Will they see that I just applauded for their peer and then not for them and thing, oh, David doesn't like what I'm doing. Or, I'm not worthy of Applause.

**(00:08:41)** So, there was a lot of just subtle anxieties around the power dynamics, really, within a company. And not just between boss and employee, but also amongst peers. Do you applaud for all your peers? Do you applaud for some of them? What does that mean?

**(00:08:57)** So, a lot of times, I'd just applaud for everyone.

**Shaun: (00:08:58)** Then it becomes meaningless.

**David: (00:09:01)** It does! And it just becomes fake. This form of passive applause in other mediums, like on Medium, or on Twitter or on Instagram, weren't really good for me. They have these same tendencies of like, oh, I'll post something and it'll do really well, and lots of people will applaud for it. And then I'll post something else the next day I think is way better, is more insightful, is more creative, whatever. And I'll get a tenth of the applause and I'd go, like, what the fuck? And then I'd go like, what the fuck, what the fuck? Why do I care about what people are applauding? I have my own internal compass of what's good and what's not bad. This stuff is messing with my god-damned compass. It's like there's just this iron ore that's just taking the dial out of whack.

**(00:09:48)** So, we had those two factors. I didn't like how Applause was being applied within our company around these anxiety-inducing moments. And then I didn't like how I was receiving Applause from other people. And then Jason and I just had a conversation about that and said, like, there's something here that doesn't smell right. It's this gamification of work that I think is actually terrible.

**(00:10:10)** I remember when Jason and I first got exposed to this notion of gamification that you'd have these sort of dopamine hacks. And we were like, oh, wow, this is really clever. And then you go, this is actually terrible. Gamifying work in this sense and socializing work in this sense of all this anxiety about who likes the work I do? Is not good for business at all. It's not good for humans at all.

**(00:10:34)** A lot of productivity and business software had just been mindlessly harvesting the dark patterns that these social behemoths had been developing and put them into their product. And the reasons why we have all these things are usually, in many cases, born around engagement. Can we make our software more addictive, and we totally did. Basecamp for several employees got more addictive because they needed to go back and check, like, who's applauding for my thing? That's a terrible fucking metric, right? Engagement is not a thing that, by itself, has any value for Basecamp. In fact, I think it has negative value in many cases. We don't have a business model that requires eyeballs not blinking for hours at a time just so we can shove more ads at them.

**(00:11:21)** This is one of those hard problems, right? There's not an obvious solution. There's tons of trade-offs. They're pretty damn subtle. They're all based around psychology.

**Shaun: (00:11:29)** Do you think about Applause in Basecamp differently than you think about likes in Medium or Facebook, or any of the other social platforms?

**David: (00:11:37)** Yeah, I think Applause in Basecamp has the potential of being worse because there's a power dynamic that's not present in most social networks. If someone hearts or not hearts a picture I post to Instagram, I'm not really following up on that. Versus in a business context, Jason and I are the boss of 50-odd people whose livelihoods depend on our long-term approval of their work. So, there's a whole 'nother level of criticality here. We're inducing those anxieties into the workplace where they didn't need to be.

**Shaun: (00:12:15)** In your diminishing social media life, do you consider likes or hearts when composing a tweet or when deciding what to post on Instagram?

**David: (00:12:26)** I try very hard not to. But I'm also just human so I think this is the insidiousness of these reward systems that they're involuntary in many ways. That the mainline into the dopamine production of the brain is not something you can just will your way out of. So, I actually took a one week sabbatical, which, I mean, is kind of a big word to call it a sabbatical when you took a week, right. Let's just call it--for one week, I didn't use Twitter and I didn't use Instagram and I used a bunch of things. Taking that week off was great. I miss some of it, but I enjoyed more of it not being there. But then I still went back on it. I was going to say, I love Twitter, which I do, but I love it perhaps in the same way that an addict loves a rush of heroin. You can love something that's toxic and that's kind of how I feel about Twitter.

**(00:13:22)** [Broken By Design by Clip Art plays.]

**Wailin: (00:13:25)** On the other side of the debate on Applause in Basecamp, I talked to Tara Mann a designer on the iOS team here at Basecamp who is also a delightful Twitter and Instagram follow.

**Tara: (00:13:39)** Hi, my name is Tara, and I'm a designer working for the iOS team at Basecamp.

**Wailin: (00:13:42)** When you think about Applause behavior in Basecamp, what you like about it and how you use it, does it feel similar to the way you behave on other social platforms that also have some kind of like mechanism, whether it's hearts on Instagram or a heart on Twitter, that kind of thing?

**Tara: (00:14:03)** Yeah, I do think so. I think I use them in similar ways. You know, Basecamp, it's not a social network, obviously, but it is sort of this social space for your work. So, I do find it validating when people applaud for me. And I kind of do treat it as getting likes or whatever on Twitter or Instagram.

**(00:14:25)** I've been on Twitter for almost ten years now and or the first, I'd say, five years, I had maybe 500 followers that built up over those five years, and then in the past couple of years I've been tweeting more jokes. More things that are, like, #relatable that people would like and retweet and think were funny. Or, I'd tweet things that were relevant to the industry that I'm in and that really helped me build a lot of followers in a pretty short period of time.

**Wailin: (00:14:50)** What's interesting about the way you talk about how you approach social media is, I feel like it's very self-aware. You know, like, you're going after likes.

**Tara: (00:15:00)** Yeah, no, I definitely recognize that I'm trying to get likes, I'm trying to get followers and engagement, and I sort of see it as a performance almost. I can be a different persona on different networks and I know that those personas are going to attract different people and different levels of engagement across those networks. And I'm really open with the fact that I'm totally trying to be funny. I'm trying to be interesting or relatable or this or that. There have been periods of time in my life when I have been more or less obsessed with it and I think I've had to take a step back at times and be like, okay, this does not define your self worth that you did not get at least this number of likes on this tweet. So, when that does happen, sometimes I just have to chill for a minute or a day and just not post a million things and just remind myself, it's fine! You'll have a hit another day.

**Wailin: (00:15:44)** I also will put out a tweet that I think is funny, and I'll work on the right wording. And when it doesn't get any likes, or if it only gets one or two I'm always like, what did I do wrong, you know what I mean?

**Tara: (00:15:57)** Totally, I have a drafts folder full of tweets and I tweet some of them and I don't tweet others, and if they don't get 10 likes in the first 15 minutes, I delete it. But, if I tweet something, and like, oh, this is a real banger, and it gets like five likes, I delete it.

**Wailin: (00:16:14)** And then do you dwell on it or are you able to move on?

**Tara: (00:16:16)** I can usually move on especially because Twitter is so ephemeral. Something goes by in your timeline and then you don't think about it or see it again, usually, unless it is a tweet that goes viral. I had one tweet go viral. It was a photo of a parking sign and I basically made this fake UI for a fake app that would tell you whether or not you could park in this spot and it was just an idea for a joke app, and so I tweeted that and it ended up getting 18,000 likes or something like that and some really big singers retweeted it like Aimee Mann, Paul F. Tompkins retweeted and some other big comedians that had a lot of followers retweeted it. I was very happy about it. I won't lie. It changed my standards, I will say that because my previous most-liked tweet was maybe like a couple hundred or 600, or something like that. So it set this totally new bar. Now, I'm like, one day I want to get something that gets 100,000 likes. Which is mostly impossible unless you're tweeting about chicken nuggets, so.

**Wailin: (00:17:18)** Does your interest in your own performance on Twitter, does it ever tip into a more anxious place or a place where you start to think this isn't fun anymore?

**Tara: (00:17:29)** I think there are times where it does tip into a place of anxiety. For example, if I say, I want to have this many followers by the end of the year because I do totally set follower goals for myself every year. If I don't hit that goal, I'm just like, damn, I'm not doing that well. I'm not as funny as I think I am. I'm not engaged with the culture as much as I could be, and it does make me anxious, and I recognize that that's probably terrible.

**(00:17:54)** I know that's not healthy. I'm totally aware. But I've also been on social media since I was like 10, so I can't help it.

**Wailin: (00:18:03)** We're now a few weeks into this experiment with no Applause in Basecamp. How have you been feeling about it?

**Tara: (00:18:12)** I miss Applause deeply. I feel like, by taking away Applause, we're removing a layer of communication in Basecamp that we had previously. I often used Applause to say that I agreed with somebody's idea or just to kind of say, hey, I saw that you posted what you worked on today and I looked at your post.

**Wailin: (00:18:31)** Yeah, and then did you pay attention to your own Applause, the Applause you would get from other people?

**Tara: (00:18:36)** I did. I loved looking at that report and it sort of made me feel like I was not just writing things and posting into the void, and I think at a company like Basecamp where we are remote and we're collaborating through Basecamp and you're not seeing people in real life... For me, it provided this level of interaction with my coworkers that I really appreciated.

**Wailin: (00:18:57)** So, since the Applause feature got turned off, what have you been finding yourself doing when you want to acknowledge that someone's written something? Have you been able to find alternatives?

**Tara: (00:19:08)** So, I've sort of been trolling a little bit by commenting with an Applause emoji, so that's my passive-aggressive way of saying that I miss Applause and now I'm posting an entire comment notifying everybody to give my Applause.

**Wailin: (00:19:22)** What's interesting, I think, about this Basecamp experiment is we have a range of ages at Basecamp, and I think maybe some folks who did not come of age during a very social media-heavy time, maybe those folks are able to have more distance from something like the Applause feature.

**Tara: (00:19:42)** Totally, and I think that what I noticed with people who are a little older is it's really easy for them to dismiss social media as this vapid, shallow thing in which you're trying to get likes and engagement. But what they don't realize is it's like a huge part of some people's social lives and it's like, very much a part of how you see this world and interact with the world and it's not just, oh, I want to get likes to like, seem cool. It's like, oh, this is my social life in many ways and it has been for a very long time. And that's kind of how I view Applause at Basecamp, too, is, I'm like, this is my social life at work.

**(00:20:20)** [Glenn Gould piano music plays.]

**Kevin: (00:20:21)** I don't think he ever didn't want feedback or didn't want to know what people thought of his performances or anything like that. He just didn't need that live response and didn't think that it served the music to perform it in situations like that. He would say any performer knows that they can play a certain piece at the end of a concert, or they use certain tricks at the end of their last piece to bump up the applause by 50%. I mean, composers knew this. Find me a 19th century piano concerto that ends quietly. They don't, because that would just confuse an audience. You want to build to something that makes the audience explode in an ovation, but of course, what does that really tell you? And that was sort of Gould's problem with the whole concert situation and with the repertoire that was designed for that situation.

**Wailin: (00:21:17)** Glenn Gould's issue with applause was that it was too blunt of an instrument to convey feedback.

**Kevin: (00:21:22)** He would say that applause tells him nothing. That's literally a quote. Applause tells me nothing.

**Wailin: (00:21:29)** Applause tells me nothing. That's what we've been struggling with at Basecamp. We wanted a way to express a reaction to someone's message or comment, but a simple Applause button was so broad it became meaningless in some cases, and in other cases created anxiety that didn't need to be there.

**(00:21:46)** Gould liked to play different characters and Kevin Bazzana told me he thinks that if Gould were alive today, he would have a great time tweeting as his different comic alter-egos. Maybe he'd have a podcast. It might sound a little like this album he released in 1980, called A Glenn Gould Fantasy.

**(00:22:02)** [Clip from A Glenn Gould Fantasy]

**CBC Announcer: (00:22:03)** He's beginning to play... yes, it is Ravel. As our correspondence suggested it is Ravel. I believe it's his Daphnis and Chloe.

**Kevin: (00:22:13)** It's a kind of mock documentary in which Gould and a CBC announcer play a number of different characters. And the premise here is that the announcer and Gould and a bunch of music critics from different countries are all sitting around talking about Gould and talking about issues--musical issues of interest to Gould.

**(00:22:36)** At the end of the program they start to talk about Gould's decision to retire from concert life and how he never returned to concert life and Gould says, ah, but I did return to concert life. He claims that he made a comeback concert with an orchestra on a drilling rig in the Arctic Ocean. And he actually put together a little ten-minute sort of mock program which is supposedly a broadcast of this great comeback recording. He called it Glenn Gould's Hysteric Return.

**(00:23:08)** [Clip from Glenn Gould's Hysteric Return]

**Female reporter: (00:23:08)** I understand that a major find has just been confirmed at the Step Out Well, XB68, three miles down the delta, would you care to comment...

**Kevin: (00:23:14)** It's Gould and an orchestra on a drilling rig with an audience that consists primarily of oil company executives. And just as the recital's coming to an end, oil is discovered, and his audience all leaves to go talk to their stock brokers or whatever, and he's left alone on the drilling rig to complete his concert and when he finishes he concert, the only applause he gets is from a lone seal. And the program ends with just the seal and the arctic wind.

**(00:23:53)** [Sound of wind blowing with classical piano finishing, followed by a seal's calls.]

**Glenn Gould: (00:23:56)** Thank you. Thank you. Thank you very much.

**(00:24:07)** [Broken By Design by Clip Art plays.]

**Wailin: (00:24:09)** Here at Basecamp we've actually made some decisions about what to do with the Applause feature we talked about today. Next week we'll have a special followup episode where Basecamp CEO Jason Fried will fill us in on what's next.

**Shaun: (00:24:22)** REWORK is produced by Wailin Wong and me, Shaun Hildner. Our theme music is Broken By Design by Clip Art.

**Wailin: (00:24:28)** Huge thanks to Darin Steinkey and to our Glenn Gould expert, Kevin Bazzana. If you're interested in learning more about Gould, I can tell you, it's a super deep and fun rabbit hole and I'll link to some more stuff about him in the show notes for this episode, which you can find at rework.fm.

**Shaun: (00:24:44)** Also even though we just did a whole episode about how we shouldn't be desperately seeking applause, we are not above begging for ratings and reviews on Apple Podcasts or wherever you're listening to this. So, please leave us a review. You can also find us on Twitter @reworkpodcast. Or, leave us a voicemail at (708) 628-7850. We'll see you back here in one week.

**David: (00:25:23)** And I'd go like, what the fuck? And then I'd go like, what the fuck? What the fuck?
