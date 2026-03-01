---
title: "Heal the internet"
description: "In August, Basecamp ended its practice of using pixel trackers in emails."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/heal-the-internet/
tags:
- podcast
---

# Heal the internet

**(00:00:00)** Broken By Design by Clip Art plays.

**Wailin: (00:00:02)** Welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m Wailin Wong.

**Shaun: (00:00:07)** And I’m Shaun Hildner. Earlier this summer, a tech executive and writer named Mike Davidson published a long post about an email client called Superhuman. He had discovered that Superhuman was using tracking pixels in their sent emails and what this tracking technology did was create a log of every time a recipient of an email opened that message and their location at the time. Perhaps worst of all, there was no way to opt out of this tracking system in a tweet, Mike Davidson called Superhuman, a surveillance tool that intentionally violates privacy.

**Wailin: (00:00:37)** After the backlash caused by Mike Davidson’s tweets and blog posts, Superhuman stopped sending location data and made some other changes. And this incident had significant ripple effects here at Basecamp, too. On today’s episode, Shaun talks to co-founder and CTO David Heinemeier Hansson about why we decided to stop using tracking pixels in the emails we send. That leads into a bigger discussion about the impact of individual actions on huge issues like tech privacy and climate change and about why we have to move past thinking about ethical choices as a binary.

**Shaun: (00:01:11)** Around the same time that Basecamp was ripping tracking pixels out of emails. David wrote a post on our blog Signal v. Noise titled “You Can Heal the Internet,” which was surprisingly optimistic and we’ll get into that a little bit as well.

**Wailin: (00:01:22)** I have this thing where every time David does one of his signature rants about capitalism, I find it oddly soothing for my own anxieties around capitalism and always leave feeling kind of encouraged in a weird way. So I really enjoyed this conversation you had with him and I hope our listeners will too. Here’s Shaun with David.

**(00:01:42)** Broken By Design by Clip Art plays.

**Shaun: (00:01:48)** So we’re going to start by talking about the recent changes to how we track the emails that Basecamp sends out.

**David: (00:01:53)** Yes.

**Shaun: (00:01:54)** And I think to start with, do you have any idea, just a ballpark, how many emails per day Basecamp is sending to customers?

**David: (00:02:00)** We’re sending out about 5 million emails a day.

**Shaun: (00:02:04)** That’s incredible. How were we tracking whether those emails are opened and what sort of tracking were we including?

**David: (00:02:09)** So, Basecamp was sending out a couple of different types of trackers. We had the emails that went out from Basecamp, the application, which would include a tracker that we called read receipts, actually. It was never anything that was exposed to Basecamp users. They couldn’t access the information directly. You couldn’t send a message in Basecamp and then know whether the recipients had opened it or not. This data was purely there for diagnostic purposes, for the support department to look up if customer’s complaint about emails not making it.

**(00:02:44)** And then the second time of tracker we had was the standard open rate trackers that mailing list software uses. We use a couple of different mailing list pieces of software that would include their own trackers. And we hadn’t even thought about that. It was not until the discussion about trackers in general came up where we went like, you know what, we should do a full inventory. What are all the trackers that we use? Even if we aren’t using these nefarious read receipt trackers that we expose to individuals such that they can spy on other individuals, we probably have something else.

**(00:02:44)** And that led us to first kind of remember that we had this read receipt system that was a diagnostics tool for support and that they weren’t really using it, that they could get to the data in other ways. There are ways, for example, where you can see whether an email was delivered to the server itself and that was actually sufficient. We should never be in the business of knowing whether someone has opened an email or not, which was really the crux of it. It was really the basis of it that there’s this expectation with email that most people have that whether they read something or how many times they read it or where they read it from, that’s not data that’s leaking out.

**(00:04:00)** Now I know that there are people who are savvy in the industry or marketers or whatever, they go oh, you’re tracked 5 million ways from Sunday and like you’re just ignorant for not knowing it. Well, okay. That’s where we start, right? We start by educating people and we start by realizing that the things we are doing perhaps aren’t that great and then doing something about it.

**(00:04:17)** So our realization was we don’t want to track people in any way, shape or form when it comes to this stuff. If there isn’t a specific justification that serves just that user and not like users that person wants to spy on or something else just in the service of that person. Which left us with essentially one quote unquote tracker, which is when we send an email from Basecamp 3 to a user, that’s a notification that that user would receive within the system. We have essentially, still, a tracker that just sees if they’ve opened that email, it’ll mark it as read in Basecamp itself. It’s not a tracker for us to see whether you’re opening it. It’s not a tracker for us to game engagement metrics. We aren’t tracking any of those things, actually. It’s a programmatic thing that if you open that email, it’ll be marked as read in the system.

**(00:05:10)** Just like if you have iMessage for example, and you read a message on your iPhone, you won’t show up as unread on your iPad. So that felt like that was actually a feature. That’s something someone would want. No one wants to be spied on for marketing purposes or for, whether someone who sent him an email wants to know whether they opened the email or not. All those areas really would fail that test that if you were to explain someone in plain English what is going on, they’d go, “Oh, hell no. I don’t want that.” And I think that’s a great baseline test for all of this stuff, for all this data tracking stuff. Can you explain it in plain English? And that doesn’t mean paragraph 23B subsection four of your 25 page end user agreement. It means in two simple sentences, what’s going on? Who are you tracking this data for? And on behalf of who and how is it being stored and would someone then say, oh yeah, that makes sense. That’s fair.

**(00:06:19)** And I think that most measures of tracking actually fail that very basic test. So that was essentially the realization we came to with the two trackers we did have. The one that tracked open rates, which is just a feature that’s built into most mailing list software. But thankfully, we learned, a feature that can be turned off and we turned it off both in, MailChimp that we’re using and in Customer.io, which is another piece of software that we use. And we could turn those things off and we could stop doing those tracking. So we did that and then we turned off our own diagnostic tool that we had for the read receipts because it just wasn’t serving enough of a purpose.

**(00:06:55)** Maybe you could be able to explain to someone in few sentences what that system was doing. But it was too rare. It was too edge-case-y for us to say, “Whoa, well we’re sending out millions of emails every day.” Should every one be tracked in that way just because maybe one person or a few people a week were curious about whether their emails were getting delivered. That was not proportionate and that would absolutely fail the test.

**Shaun: (00:07:23)** So it’s a matter of for each individual data collection system weighing the sort of cost-benefit of having that tracker?

**David: (00:07:32)** Yes, and—although I’m always skeptical when I hear the term cost-benefit analysis because costs to who and benefit to who, right?

**Shaun: (00:07:42)** Right.

**David: (00:07:42)** And plenty of—

**Shaun: (00:07:44)** Well, sort of a moral cost I suppose.

**David: (00:07:46)** Yes. And not just whether it’s a benefit to you, the business owner, the app owner or a cost to you, the app owner or in the case that actually kicked this whole thing off, which was this new email software called Superhuman that allowed individuals to spy on other individuals.

**(00:08:03)** You could say a cost-benefit analysis that just included the customers of Superhuman. You’d go like, oh, this is great. The customers want it. They are asking for it. We’re going to give it to them. Well, you gotta expand your analysis to include all the stakeholders. If you’re not considering the people who are being spied upon and whether they would consent to that spying, you’re really doing a shitty analysis. Which is, I think, usually actually what happens when someone does a cost-benefit analysis. It’s shitty analysis because it’s taking just a subset of the stakeholders in the problem and just looking at their needs and their wants and not considering all the externalities.

**Shaun: (00:08:40)** How much work was it to remove all that tracking from Basecamp?

**David: (00:08:44)** There was work, let’s be fair about it. It was work to take this out. We needed to figure out—this was an old system that had been in place for a while. Needed to figure out whether it was entangled with all sorts of crap and we needed to pull it apart carefully without breaking emails for millions of people every day. So it was real work. It wasn’t a monumental huge effort that required dozens of people for months, but it did require a careful investigation, which was why we didn’t do it right away because this actually came off the discussion about trackers that the whole Superhuman debacle kicked off, where we internally went like actually, which trackers are we using, let’s do the inventory, let’s figure it out. So that was maybe a couple of months before we went all the way through from let’s do something about this to Oh, it’s done. Now, part of that is because we didn’t drop everything. This wasn’t the most important thing in the world to deal with at that moment because our usage of trackers was benign-ish.

**(00:09:43)** If this had been like a super nefarious way we had been using it, like Superhuman continues to use it, where we were actively harming people. Yeah. It would have been probably one of the most important things we could have worked on and we would’ve done it quicker. And I think that’s the other part of it, again, that doesn’t have to be binary, that it can be floating point that we can say this is something we want to tackle, we’re going to tackle it. It may take a couple of weeks, a couple of months, and then after a couple of weeks or a couple months it’s done and we’ve made things a little bit better.

**Shaun: (00:10:12)** And this sort of ties into a post you wrote, was it yesterday?

**David: (00:10:16)** Yes.

**Shaun: (00:10:18)** Which I found funnily optimistic for you, David, who I think it’s safe to say is mostly cynical about the state of the Internet at most times. Can you describe a little bit about how you can heal the internet?

**David: (00:10:31)** Yeah, so I’ve long been on this horse about us as individuals doing something not under the illusion that just because a bunch of individuals choose to do different choices that’ll fix all problems. I think a lot of the problems we’re facing, especially when it comes to technology and especially when it comes to surveillance, are problems that are so large that they require collective action, which usually means legislation of some sort, which is one of the reasons I’ve been excited about the GDPR and other European initiatives. Now there’s a bunch of movement in the U S as well. California has a new strict privacy law coming.

**(00:11:11)** Those things are all great and I cheer those on and they’re very important, but I don’t feel like it fully absolves individuals for doing their part, too. That any comprehensive solution or progress here relies on both factors, especially because most of the time the laws are being driven by essentially popular demand. The public realizes this is a problem, we need to push for solutions, and part of that realization is, and part of that knowledge goes hand in hand with you as an individual realizing: this is fucked up. We got to do something. And then until we get to the part where we got to do something or we’ve done something, go to yourself and see what could I do? Could I be a little better?

**(00:11:55)** I mean, I liken this often to climate change, for example. You cannot stop the warming of the planet by your own actions. No individual is powerful enough to do that. Is that realization or is that conclusion a license to just be an energy hog, to just be wasteful, to just be trashing the planet on an individual level? Of course it’s not. Those things go hand in hand. A) you want collective actions, but also you can do some stuff yourself even if that stuff is not sort of sufficient to fix the whole problem.

**(00:12:29)** So that’s what I was aiming at here in saying it’s so easy to be overwhelmed. It’s so easy to be disillusioned by the fact that you cannot do anything in the face of these massive companies. Especially when you talk about big tech. I mean Facebook has what, 2.4 billion users? What’s one user going to change? What’s 10 users, a hundred users, a hundred thousand users, a million users going to change? Do you know what? More than you think. Most people have not yet factored privacy into their analysis of which tools they pick, but some have and plenty of journalists have, and we’ve changed the entire conversation over the past three or four years from what we used to have before.

**(00:13:18)** And that’s being led by a small group of people making individual choices and being loud about those choices. And that kind of sits the wheels in motion for all the stuff we’re seeing now. You think privacy and breaking up big tech and so on would be major themes in a presidential campaign in the US if there were no individuals who had taken any individual action upon this and being loud about it, of course not.

**Shaun: (00:13:43)** Right, right.

**David: (00:13:43)** So this is how movements start. It’s how they get going and how you get the snowball rolling. Again, a single snowball is not going to tip over an enemy stronghold, but let it roll for long enough and it’ll be a lavina and it’ll cover them and it’ll do something. So that’s where I’m coming from.

**(00:14:06)** And that perspective is then paired with this idea that is not binary. It’s not either-or. I’ve made some binary choices in my own life and saying, for example, well, I’m getting off Facebook, I’m getting off Instagram, I’m not using Uber. I’m making a bunch of choices. And then I’ve made some, let’s call them gray choices or half choices. Floating point choices, perhaps?

**Shaun: (00:14:27)** Sure, sure.

**David: (00:14:27)** Where Amazon for example, I’m like, I’m not a big fan of one company having such an outsized influence on ecommerce in the world. So I will buy less. That doesn’t mean I buy nothing. It just means that I’ve managed to decrease the amount of stuff that I buy from say Amazon by like 90% or 95%. And then occasionally there’s still something. For example, I still use a Kindle. That’s an Amazon product. If I want to buy new books to read on that Kindle, I buy them through Amazon and I’m okay.

**(00:15:02)** Right? It doesn’t have to be this binary choice where it’s either or. We can make tremendous progress by doing a bit and often times you can do way more than a bit that, if you stop seeing it as an either-or, you can realize, you know what? Actually getting to 90% is pretty easy. For a lot of people for a lot of the time. Null cases, there’ll always be these edge cases. I heard this all the time when we were on the barricades about Uber. It was like, well, I live in this like completely desolate area. Uber’s the only choice. Like what would you have me do? Just sit inside the whole time? Okay, maybe you are the exception. Truly. Maybe you are and you’re not in a position to do anything about it. Yeah. The rest of the 98% of Uber’s business does not fall into that category.

**(00:15:44)** And we could all make different choices either by walking or having a bicycle or God forbid take a cab or public transportation or there’s all these other choices that are available to a bunch of people, but we feel like they’re shut down just because we can find one example of where the new thing truly serves a need that wasn’t being met in any way, shape or form before. So that’s part of the tack here. That’s part of the change where I’m hoping to inspire other people to see the world a little bit more in floating point decimals and try to get to a point where they just, they’re following their beliefs to some extent. They try to push themselves a little bit.

**(00:16:31)** You just go for example, with Amazon. So I’ve, I’ve stopped buying physical books on Amazon and now I buy them from indiebound.org. Indiebound.org is not as good as Amazon. The books do not arrive as quickly. They do not have as broad of an inventory, although actually the inventory is surprisingly broad. And it’s a little bit harder to use. You know what? That is a relatively small price for me to pay that I want some physical book and it’s not going to arrive tomorrow, but it’s gonna arrive in like four days. If I’m not willing—

**Shaun: (00:17:03)** Heaven forbid.

**David: (00:17:04)** Exactly, right? If I’m not willing to give that up? That, okay, it’s going to take a little longer. Or maybe the book is $5 more. If I’m not willing to take those downgrades. That is not a hundred percent match for what Amazon is, I really can’t have any stake in the an intention for growing alternatives to Amazon.

**Shaun: (00:17:27)** Right.

**David: (00:17:26)** And that’s the realization I want to push for. Then you have to have some congruence here. You don’t have to be a saint, but you got to do something.

**Shaun: (00:17:37)** You’ve been going off lately sort of along these same lines as far as what individuals can do, switching from Google to DuckDuckGo for your search.

**David: (00:17:45)** Yes. That is another great example of where it doesn’t have to be binary. Google has a very nice search engine and they’ve spent what, two plus decades making it really, really good. It’s a great search engine for a lot of things. DuckDuckGo has as not as good as the search engine. Let’s just come out and say it. I think that’s totally fair. I think they would accept as much right away. But the difference in quality between the two results most of the time does not matter. Most of the time when I use DuckDuckGo I find what I’m looking for and if I do have a, I dunno, esoteric search or there’s something technical that just isn’t being found, it’s pretty easy to drop back.

**(00:18:32)** But I’ve been, with basically zero effort able to move 95% of all the search queries I do on the Internet to DuckDuckGo.

**Shaun: (00:18:41)** And for those who don’t know, what are the benefits of DuckDuckGo?

**David: (00:18:44)** The primary benefit is that DuckDuckGo is not based on surveillance capitalism. So, Google sells advertising to advertisers based on individual information about the people they’re exposing the ads to. So an advertiser can say, well, I don’t care what this person is searching for, I just want to reach people who are between 25 and 29 and live in Naperville, Illinois and they like Lululemon pants or something like that. Right? Like very specific. That to me in itself is a gross privacy violation and I want no part of it. I do not want to be targeted on my individual information. It just feels invasive that Google is hovering and not just Google.

**(00:19:31)** Plenty of other companies in this failing capitalist industry. Facebook of course is a big example. Even if I’m not personally that exposed to it. They’re gathering up all this information such that marketers and politicians and whoever else wants to essentially buy influence can hyper target this influence and exploit our weaknesses and exploit our preferences to a degree that’s truly scary. If you don’t think that you’re influenced by marketing, you’re simply just delusional.

**Shaun: (00:20:02)** Right.

**David: (00:20:02)** Everyone is influenced by marketing and everyone is—

**Shaun: (00:20:04)** Yeah, that’s the point of marketing.

**David: (00:20:07)** Exactly, and everyone is in a vulnerable position or they have certain things that can be exploited if the marketer knows damn well near everything about you. I don’t want to be exploited. I don’t want to have all my weaknesses spotted or sold or packaged up. What DuckDuckGo does is it sells advertisement based on, for example, search terms. So if I go into DuckDuckGo and say I want to search for a new Audi, advertisers can say, I want to buy ads for people who search for new Audi, not because they’re from Naperville, Illinois, not because this, that or the other thing. It has to be aimed at the sort of target.

**(00:20:47)** Which was the original pitch for Google as well. And this was one of the things when Google first got started, I was like, this is the kind of advertisement I’m actually okay with. I’m going to Google for a specific search, like new Audi vehicle or whatever and all the ads I get back, they’re relevant to that endeavor. And that felt kind of fair. I’m still not a big fan of advertisement, but that felt like, okay, there’s something here that that doesn’t feel exploitive.

**(00:21:14)** DuckDuckGo sticks to that sort of vintage model that they don’t have to violate people’s privacy in order to show ads. The second part of their business model as I understand it, is that if you search for something that then pops up in Amazon or some other store, they use referral links to send you to that store and then if you buy something from that referral link, they’ll get a kickback.

**Shaun: (00:21:37)** Sure.

**David: (00:21:39)** Anyway, that’s the model which I think that’s the first thing you’ve got to examine. People can say all sorts of shit. Facebook just came out, was it earlier this year? Like the Future is Privacy or something? Where you just go like, wait, what? It’s like hearing a cigarette company saying the future is health or clean lungs. You’re like, you’re not a credible source here. You’re not a credible source on your own history here because you have done nothing but it prove the exact opposite for your entire existence and you keep being caught in scandal after scandal after scandal. Just, was it, last week? Facebook comes out with this long-delayed feature where you can delete your history and what does it do? It does not delete your history. It unlinks your history and you’re like, what does that even fucking mean? So, don’t want any part of that.

**(00:22:27)** DuckDuckGo is a great example of opting out, still being able to search the internet. Like, again, a lot of this dichotomy comes down to like, “Well, if you’re against ad and targeting and whatever, you could also just stop using the internet.” Yeah. Okay. I could, that’s not helpful. It reminds me, I mean, I must have replied with this cartoon probably 200 times over the years. I forget the artist, Matt something, and he has this a four pane comic about, uh, anyone who dares complain about society while still living in society clearly don’t have a leg to stand on. Um, when you’re like, that’s not how it works. It is possible to live in society and also complain about society. Those two things are not in conflict. It’s possible to own an iPhone and be critical of Apple’s sort of production techniques or a privacy record or something else.

**(00:23:15)** Like, yes, there is a way where you should make certain choices on your own behalf, but if everything gets reduced to this binary choice of either you opt out of society or you lose all claim to be able to be critical of society. I mean what the fuck. We’ve really—

**Shaun: (00:23:32)** That’s not a world that I want to live in.

**David: (00:23:32)** No, we’ve really stuck ourselves into a hole where we are not allowed to critique or scrutinize anything when any improvements that come are just at the pure benefaction of the companies that are already exploiting us. Do you think Zuckerberg would ever have come out with, I mean however ludicrous of a proclamation it is to say Facebook is going to be all about privacy. You think he would ever come up with that if there hadn’t been this scrutiny and all these scandals and tons of people hounding Facebook about basically what a fucking terrible place it is.

**(00:24:03)** No! He’s reacting to people complaining about society while still living in society.

**Shaun: (00:24:10)** Right?

**David: (00:24:11)** And I think that that is something we should cherish. Oftentimes the most stinging critiques actually come from the insiders. People who are still using the thing or involved with the thing. And anyway, I’ve taken my personal consequence on search and saying, do you know what? I’m not giving up everything Google. I still watch videos on YouTube. I still occasionally fall back to using Google Maps when Apple Maps takes me to the wrong location. It is not binary. But if I can reduce my use of, say, Google, again by 95%, you know what? I’m doing my part in a bit to help heal the internet. And if we all do that, actually let’s even stop doing that because there’s nothing you’re going to get everyone to do. If some of us do that for some of the time, and some of us become more of us and more of us and more of us, do you know what it’s going to matter.

**(00:25:03)** You don’t need 100% of people making different choices before you have an influence. Sometimes you just need 1%. Sometimes you don’t even need 1%, you need 0.001%. Reminds me again about Uber, the whole delete Uber campaign. I think in whenever that kicked off in December or something, they lost 150,000 riders or something, deleted the app and signed off it. Like what was that as a percentage of all riders they have across the world?

**Shaun: (00:25:30)** Miniscule, right?

**David: (00:25:30)** Miniscule. Yet it set headlines for months. It dictated and gave permission for cities and national levels for politicians to be far more skeptical because they knew there were a public backing for this. So this change often comes from small but influential groups of people making choices on their own behalf. But kicking off these snowballs that’s gonna, that’s gonna grow into lavinas. And to me, you know what, that’s satisfying work.

**(00:26:03)** It’s satisfying work to help make the fucking world just a tiny bit better. And sometimes you make it a tiny bit better and sometimes you just feel better about your own personal choices, even if it doesn’t fucking matter. Even if Uber still goes public and becomes a what, $60 billion company or whatever, you can still feel like, do you know what? At least I didn’t patronize that.

**Shaun: (00:26:24)** My hands are clean.

**David: (00:26:26)** Yeah, and if they can’t be clean with all the things all the time, but they can certainly be clean with some of the things some of the time and we can all do something.

**Shaun: (00:26:34)** Do you have any advice if a small business internet company would like to start taking a moral standpoint on their own systems?

**David: (00:26:42)** Simply asking that question is a great start because I think what you’ll find in most companies is that lots of setups aren’t carefully thought out. They’re aren’t carefully thought through. We aren’t using a bunch of the systems that we’re using that track a bunch of data we shouldn’t be tracking because we’ve done a super careful cost-benefit analysis and like went, oh, this is, we really don’t want to do it, but it’s just so important that we do it. Most of the time it’s just like let’s just pop in this tracker here and like Google Analytics will give us some information that maybe we’ll look at like once a month or something.

**Shaun: (00:27:17)** Right, right.

**David: (00:27:18)** So if you just go through all the shit that isn’t super critical, you’ll probably cut out a large chunk and then you can keep moving up the chain. First, you dump all the data. You don’t even care about your collecting. That, just taking it as a general principle that collecting data is something you should think about for most people. Still, most companies still, it’s not even a discussion about should we collect this? Like why are we doing this? Like there’s not even a debate about whether to do it. It’s just like, of course we can do it.

**(00:27:47)** Just yesterday I was reading this article about some marketer saying, well, there’s all this tracking going on in the funnel on the marketing sites and so on, but did you know you could also track what people are doing inside their apps and the data’s just there and it’s just you, why aren’t you using it? Why aren’t you exploiting this data to get some advantage yet? This is exactly how most people think about it. While it’s just there anyway, let’s just do it. I’m more optimistic than I’ve been in a long time, that that mode of thinking is going to change and—

**Shaun: (00:28:19)** Like, the default mindset is [crosstalk].

**David: (00:28:20)** The default mindset that we should just collect everything because we can, is changing to, let’s give it at least like two minutes of thought. Maybe it’s not exactly a careful analysis that’s going on, but someone within most organizations will sit with this like, hey, is this really necessary? Do we really need this sentiment? And that’s only gonna grow over time until we get to the point where you’d be crazy for smoking indoors, right?

**Shaun: (00:28:46)** Yeah.

**David: (00:28:48)** Wait, when did we know that cigarettes were bad for you? In like what, ‘50s, ‘60s? Like the science was in way, way, way earlier than when all cigarette smoking indoors or in bars or whatever was banned, I think we’re at the same trajectory here with data. There’s—we’ve clearly defined that collecting all the data that you can is seriously harmful. It has a serious consequences. Not a day goes by basically without some new leak. “Oh, Equifax just leaked a half a billion people’s private information.”

**(00:29:21)** So there’s clear danger. It’s been demonstrated. We’re not yet at the stage where we banned smoking indoors, but we’ll get there. And I think we’re just, we’re taking those steps one step at a time and it takes time. And, and I think that that’s why more optimism is warranted because we’re at least making steps forward. Just in, like, again, I tweeted this the other day, like five years ago, the hottest take on privacy is like no one cares about privacy. I don’t have anything to hide. That just sounds stupid now. Like literally stupid. No one’s going to retweet that shit anymore, right? Versus five years ago everyone was like, yeah, I don’t care about privacy either. Um, I don’t have anything to hide. We moved a far ways just in a relatively short amount of time. And these things can switch much quicker than I think most people notice.

**(00:30:09)** Again, not as total victory, not that everyone’s caring about privacy all the time and companies are all taking it super seriously, but they are taking it a lot more seriously that they used to. Just this latest scandal with Apple, where Apple was essentially caught out collecting recordings of Siri invocations and having humans listen to that and they told people that they weren’t and someone found out that they were. And in a span of what, four weeks, Apple ended up shutting down the entire department and firing hundreds of people who used to sit and do this, completely revamping their approach and the protocol about it.

**(00:30:43)** Now, should Apple have been collecting this stuff in the first place? Of course they shouldn’t, but it’s this new awareness that a called it out and be made it imperative that they dealt with it right away and swiftly versus again, if you go back five years or 10 years, A) no one would’ve noticed because no one would have asked. And if someone would have noticed and would have asked, big company would just, this is just standard. No one, no one cares about privacy, right?

**Shaun: (00:31:08)** Yeah.

**David: (00:31:08)** It’s a different world. And what a wonderful change that is.

**Shaun: (00:31:11)** Well, that’s awesome. I think that’s a perfect place to end.

**David: (00:31:13)** Boom.

**Shaun: (00:31:14)** Thank you so much, David.

**David: (00:31:16)** Yup. Anytime.

**(00:31:18)** Broken By Design by Clip Art plays.

**Wailin: (00:31:23)** REWORK is produced by Shaun Hildner, and me, Wailin Wong. Our theme music is Broken By Design by Clip Art. You can find show notes for this episode at rework.fm. I will link to all of David’s blog posts on Signal v. Noise. He did a couple about our tracking pixel changes and, of course, the one about you can heal the Internet.

**Shaun: (00:31:46)** You can find us on Twitter @reworkpodcast, or if you’re old school, you can leave us a voicemail at (708) 628-7850.

This is an episode title
