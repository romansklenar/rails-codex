---
title: "Building to flip is building to flop"
description: "A lot of people start businesses with the hope that they’ll be able to sell it quickly for a huge pile of money."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/building-to-flip-is-building-to-flop/
tags:
- podcast
---

# Building to flip is building to flop

**Shaun Hildner:** Well, this is our first episode back from a little break. This should be coming out February 1st. I believe before we went on break, we opened the last episode with a question from one of our listeners, and I would like to continue that little trend here. I have an email here from a listener named Masha who has a question about language which is something, obviously, we talk a lot about on the show. She writes, “You’re very intentional with the words you use inside your products. And that made me think, did you have any hesitations about using the word feed in Hay? Although not an inherently negative word, I think it became negatively associated with uncontrollably consuming junk content. If using feed was a deliberate choice, was there an intent to change the perception of this word?” What are your thoughts on the word feed? We’ve been using that for ages.

**Jason Fried:** Yeah, this is a kind of interesting question. Like newsfeed has become a thing that, the algorithmic-

**Shaun Hildner:** Your Facebook feed.

**Jason Fried:** …Yeah. I do think we maybe talked about that a bit. It just felt like… Because it was mimicking a feed in the sense… It’s not algorithmic, in that everyone does see the same… Well, everyone sees their own email, but there’s no fancy business going on here. But it felt like as an alternative to an inbox style email system, which of course is where you have a list of things, and you click it, and you open it. This is more like a feed. It’s just one thing after the other, and you just scroll down while these things are already open for you like a feed. So we’re trying to simulate something that people are already comfortable and familiar with, but I do agree that it’s taking on a negative connotation more broadly that feeds are manipulative or whatever, but the one in hay is not. But, yeah, it’s an interesting question.

**David Heinemeier Hansson:** I think part of this is that the feed… This is a very successful way of consuming information, and it’s been used in some fairly nefarious ways by algorithmic setups that are just trying to jam that feed full of all sorts of stuff that will keep you engaged but not necessarily, whatever, delighted, informed. And here’s a feed that just has the stuff you picked in it, so you get to use that form of consuming information with more nutrients in it. I mean, this is a very efficient spork to consume your very nutritious, healthy diet with. You could use the spork to eat a bunch of junk food, but you could also use it to eat something good, and this should hopefully be good.

**Shaun Hildner:** Sort of piggybacking on that, how much do you pay attention to the specific language you’re using when designing? This is probably more for Jason.

**Jason Fried:** All the time. So we’re very deliberate about it. Even things like the inbox, which is something… I’m using an “M” for those-

**Shaun Hildner:** The most famous typo.

**Jason Fried:** … I-M-B-O-X, and it was like a long discussion we had in debate, and we went back and forth and sort of flip-flopped on it. And then at the end, we’re like, “Let’s make this different. This is just one letter. What does it really matter?” But it catches people’s attention and makes them wonder why, and there is a meaning behind it, and we’re very thoughtful about that. Probably like we probably spent too much time on a single character. We’re talking about words here. Now we’re talking about a letter. We probably too much on that, but, we do think about it a lot. And like the paper trail, it really represents what it is.

**Jason Fried:** It’s a paper trail. It’s not like a receipt box, and the feed is the feed. And we have a whole bunch of different things, like we have a feature called Clips where you can clip a bit of an email, some piece of the email that you want to get back to versus having to find the original email. And you clip, like in the old school, you’d clip coupons. You cut things out, basically. There’s a million things we could have called those. But, we think a lot about the words. In fact, in Basecamp, we’re launching a feature this week called Lineup which originally was called… Gosh, do you remember what it was called, David, what we were talking about, 50 or 10,000-

**David Heinemeier Hansson:** 10,000 Foot View. Yes.

**Jason Fried:** So we were going to call the 10,000 foot view, which is like a bird’s eye, and then like feet… Well, not every country, some use meters and some use feet.

**Jason Fried:** We’re like, “Oh, that’s kind of weird. Do we call it… Do we use geolocation to decide if it’s 10,000 meter view and whatever? Does that expression translate? Is it something that other people would use?” And then we’re like, “Bird’s eye view could be something, but I don’t know, it’s kind of long.” And then we played around with it and came up with this idea of the Lineup. The Lineup… Basically it’s a lineup of projects in a timeline, so it kind of has that spirit of what it is. It’s short, it’s universal, and I think it works out really well. So we do think a lot about this stuff. And, by the way, this is a good example of… I don’t know if it matters or not. It probably doesn’t really matter, but it matters to us.

**Jason Fried:** And I think that’s a big thing about quality in general. You can make things high quality for others, but you’ve got to make it high quality for yourself first, I think, and then other people will appreciate the quality. But if you don’t care about the quality for yourself, I think it’s a problem. So for us, we try to do things that we are proud of internally and that we feel good about and that sort of make us smile and make us go, “That was good. That was worth it. That’s a clever thing” or whatever it might be, and then hope the customers see that quality in it as well.

**Shaun Hildner:** I assume you’re not A/B testing inbox with an “N” versus imbox with an “M” for engagement or something like that, right?

**Jason Fried:** No, no, and I don’t think we’ve ever actually A/B tested in an app. We’ve done it on the marketing site, but we’ve never done it in app. I know inbox… I know it’s turned a handful of people off, whatever, but it’s a spirit of the product. It’s a fun thing, and before you know it, you don’t even know it anymore. You just ignore it. So it’s fine.

**Shaun Hildner:** Well, fantastic. Thank you. And thank you Masha. If you have any comments about the show or questions for Jason or David, please leave us a voicemail at 708-628-7850, or, better yet, you can record a voice memo on your phone and email it to hello@ rework.fm. You can also, as Masha did, just send me an email, and I’ll read it on the air, but we don’t want to hear my voice anymore than we really have to. Okay, on to the show. Welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m your host, Shaun Hildner. For any new listeners, what we’re doing this season is going chapter by chapter through REWORK, the book, and discussing what’s changed and what’s stayed the same in the last 12 years since it was published. This week, we’re discussing the chapter, “Building to Flip is Building to Flop.” If you’re starting a new business with the sole intention of selling it, your priorities tend to shift from customers, employees, reliability, all those things that make great companies great, to building a company that just looks good on the outside, so you can sell it as quickly as possible. As always here to discuss all this are the co-founders of Basecamp and the authors of REWORK. Jason Fried, welcome back. How are you?

**Jason Fried:** I’m doing good, Shaun, how you doing?

**Shaun Hildner:** Wonderful. And David Heinemeier Hansson, how are you?

**David Heinemeier Hansson:** Good, good.

**Shaun Hildner:** This week, we’re talking about building businesses, just for the sole purpose of flipping them, making it to the end, as we’ve said before, and selling. So what is your beef with building to flip?

**Jason Fried:** It’s not interesting to me. Let’s say I think there’s a few things, so there’s partially that, but the other thing is that it feels disingenuous to customers to build something that you’re going to get rid of down the road. We’ve all had experiences, especially in tech, which is the one place where you feel like this shouldn’t happen as frequently, where you’re using a product that you like, that you’re beginning to rely on. And then the company sells it to someone else three years in or two years in because that’s the only way for them to make anything off it because it’s been free or the business model doesn’t work. And then the other, the new company kills it, and then they kill it for the customers, and they wind it down, and it’s gone. The problem with building a flip is that you… It’s extremely dismissive of customers right off the bat.

**Jason Fried:** It’s like saying, “I’m going to build something for someone else, and then I’m going to take it away from them.” Like I know this is going to go away; they don’t know what’s going to go away. I know what’s going to go away. That just seems like a really weird thing to do in my opinion and also just a depressing thing because people get into products, and they rely on products, and I think it ends up hurting the whole industry when you just begin to assume that whatever you like is going to go away. There’s all of that. I think there’s more to it too, and I’m sure David will fill in some of the other things, but those are a couple of things that bug me about it.

**David Heinemeier Hansson:** One of the comparisons that I’ve been thinking about when it comes to this is spec houses. So when someone builds a house that they have no intention of living in themselves, they build a house that like will look good on paper. And I had became aware of a project that was being built, not too far from our house, and talked to some of the contractors, and all the contractors were like, “Yeah, it looks good, but holy shit, make sure you never buy this.” It was things like it had heated floors or something, and the heated floors were done in some extremely inefficient way where like you could check the box on the spec list and say, “Oh, it’s got heated floors.” But, yeah, okay, if you’ve run them, then your electricity bill or whatever it was, problem was with them would just go through the roof.

**David Heinemeier Hansson:** And there’s something of that to building to flip that, like you’re building a spec business. You’re not building to live in that business. You’re not building it to stay with that business for the long term, and you just end up building a very different kind of thing. If you’re building to flip it, are you going to spend time worrying about the inbox versus imbox. No, right? Maybe… I don’t know. Is that good? Is that bad? I think there’s just… There’s a vibe of where you’re working. Are we doing this because we’re trying to make the best thing happen because that has intrinsic value in and of itself, or are we just like, whatever looks good on paper, and let’s just get it out the door? And one of the reasons, of course, I’m eager for this is that there’s just so many tech businesses that on the tech side, like behind the facade is built totally shittily.

**Shaun Hildner:** Mm-hmm (affirmative).

**David Heinemeier Hansson:** Because I’m not going to be around. Who cares if we’re using whatever shitty framework or whatever shitty approach to it, or we don’t go back and clean up the code? We don’t go back and do… I’m going to be out of here in whatever the average tenure at most tech companies is, like two years.

**Shaun Hildner:** Two years, yeah.

**David Heinemeier Hansson:** There’s just something repulsive to me about that. I understand it’s working fine for other people, and there can be businesses that are sold, and they go on to do well enough, and the customers can be okay with that. But there’s just something in that that is yucky to me. I’d be a very poor general contractor trying to build the spec house because I’d be trying to build the house that made sense for me. That’s not to build the most luxurious thing at all times.

**David Heinemeier Hansson:** We don’t do that with the products. Either we put budgets in place, and we say, “Do you know what? This feature can take six weeks, and that’s it. We’re not going to let it to 18 weeks because we gold plated it to the moon, but we’re going to build something that’s cohesive and good.” And this is the thing that I find with these spec products is that it’ll take a good picture, right? It’ll look really good from this one angle, but it’s not cohesive. The quality is extremely uneven throughout, and I hate that with products too. You use a product where you’re like, “Oh, I really like this aspect of it, but then, ugh, it’s just totally shitty.” And these other parameters that are… I think perhaps we have another essay in this book, or we wrote about to somewhere else that it’s at-home good.

**David Heinemeier Hansson:** A spec business is in-store good. It’s term sheet good. It’s KPI good. It’s not living with it good. It’s not living in it good. I’m just like, “I’m not interested in that. I don’t want to be part of that.” I think you learn many of the wrong lessons, and this is the other thing that then for us really makes the point. We’ve been here for 20 years. Imagine if we had built to flip in 2005, and we then had to live in that shitty spec house for another 10 years after that. Would’ve been miserable. We’re building a home here, a business home that we want to stay in for the long term. And when you do that, do you know what you find out that, “Oh, this is a nice place to be. There’s no reason to flip it at all.” Like, what? Am I going to trade it for something else? What is that something else going to be? And I think that that sense of satisfaction and long term possibility doesn’t mean you have to work at one place for the rest of your life. It doesn’t mean because you build a house, you have to live in that house for the rest of your life. It just means that, hey, you could.

**Jason Fried:** If you watch these shows like on HGTV, these flipping shows and stuff, you can just see shortcuts everywhere. It’s the shortcuts. Flipping mean shortcuts. Maybe they spray paint the furniture so it looks fresh, but it’s a kind of a lie, like it’s not going to last. It’s going to chip easily. The chair’s not comfortable. It’s just a like this crappy thing, but it looks good in photos. And I think that’s the thing with flipping is that the notion of flipping is cutting corners because you’re not going to do something that is going to be worth spending the money on that you’re not going to get the money out of. You have to do things on the cheap if you’re going to flip in order for it to be worthwhile. You’re not going to invest significant time, effort, money because you’re probably not going to get that back if you’re going to flip it because flip it basically suggests selling it rather quickly in a sense.

**Shaun Hildner:** Right.

**Jason Fried:** It’s not like, well maybe you do build a business, and you sell it in 15 years. That’s not flipping a business. That’s building a business and deciding at some point you want to do something else. Fine. But if you’re going to build a business to sell it in two or three years, you’re going to take shortcuts all over the place. And then the person who’s buying it may not even recognize the shortcuts are there, and they’re going to be stuck with them. The whole… It’s just like sending bad cheap decisions down the chain. It’s kind of like a bit of a… It’s not a Ponzi scheme. It’s not that.

**Shaun Hildner:** Poor stewardship.

**Jason Fried:** Yeah, it’s more poor stewardship. Yeah, exactly. That’s a great way of putting it. So anyway, that’s some of the other reasons.

**David Heinemeier Hansson:** To me, I’d say the other aspects here where the parallel with the spec house is sometimes go is that I think when you are the kind of person who’s constantly looking for the shortcuts that won’t get found out right away, it colors who you are. I’ve met a few people who are the kind of people who build the spec houses where the things are spray-painted, or there’s a shitty system installed because they know it just looks good and won’t be their problem when it’s a problem nine months later. And do you know what? It’s hard to say that that didn’t color their character.

**Shaun Hildner:** Sure.

**David Heinemeier Hansson:** And this is part of, I think, what’s important about if you’re going to spend years of your life building a business, I’d like for that to be sort of complementary to who I’d like to be as a person. Like, “Hey, do you know what? Let’s make something proper, something that’s going to last, something that’s cohesive and not about again, building the most expensive thing.”

**David Heinemeier Hansson:** I think that’s the easy straw man you can defend as well. If you don’t build a spec houses just because you want to build a palace where everything’s made out of gold or whatever. No, no, it’s not that. I look at the same way with cars. Some of the cars I respect the most are cars at the low end. They had to work within their constraints. But if the thing is cohesive, and there’s an even level of quality in it, I respect the hell out of that. I think there’s just something in that that you have to be really careful with if you pursue the shortcut road, the built to flip road that you don’t end up becoming a flipper, a short cutter. Is that who you want to be? No.

**Shaun Hildner:** Right, you went into this wanting to become an entrepreneur or a business owner.

**David Heinemeier Hansson:** Right, and you can get dragged into this thing too. This is… Often I think very few people set out to like, “Oh, I want to be a short cutter. I want managers take a shortcut here that no one sees, and then it becomes a calamity.” No one sets out to be, but this is also the realm here that when you get on this path, this is why we talk so much about taking outside money and so forth. The forces will exert on you until you become that person, if you let it. And if you put yourself in those circumstances… Would Jason or I, would we have ended up becoming short cutters if we had been under some of those pressures of… Do you know what? A bunch of money injected that needed a return very quickly and so forth? Maybe, I don’t… It’s not because like we’re particularly holy. We put ourselves under circumstances where we’re likely to flatter and advance who we want to be.

**Shaun Hildner:** There’s a phrase you use in this essay that I really, really liked. In contrast to exit strategy, you talk about having a commitment strategy. Can you define what you mean by commitment strategy?

**Jason Fried:** You know, there’s a commitment to a variety of things. There’s a commitment to quality to employees, to creating an environment where people want to show up and work and put in their good work. There’s a commitment to taking care of customers and not knowing in the back of your head that you don’t really care because you’re not going to have to worry about them in eight months when you sell the damn thing anyway. I think there’s all those kind of commitments that you make, and they all add up to… We’re trying to put something in the world that’s good, that we care about, that we’re committed to continuing to improve over time. That’s ultimately the commitment is stewardship, is caring about out the thing you’re making and building something of a certain degree of quality that’s going to last and letting customers know you’re going to be around.

**Jason Fried:** We’ve been around for 22 years or going into our 23rd year. Like that would give me some confidence as a customer, knowing I’m buying a product from a company that stood not the forever test of time but been around for two decades in the tech world. Like, “Okay, they probably care.” And we just put out yesterday our uptime results from 2021 which were fantastic, 99.99 X percent. That’s commitment. That’s what that is because there’s a lot of ways to take shortcuts there too, and be 97% uptime is pretty good too, right? Well, not if you’re committed to being around for a long time. It’s probably not good enough. So it’s all those things combined to think that lead to a mindset of let’s commit to this, and let’s be respectful to the work, to the people, to the customers. And to the product as well.

**Shaun Hildner:** Have the odds of getting acquired changed in the last now 12 years? Is it harder now? Is it easier? What do you think?

**David Heinemeier Hansson:** I think actually it might well be harder that there are more people allowed to take a shot at this similar number of slots, but I haven’t actually done the math on this. I’m just pulling things out of back end here. I could just imagine that that’s the case because building something that’s good, like actually good as invaluable to sell, it’s still very difficult, even if you do the shortcut route, right? If you build a spec house, there’s pretty good guarantee that you’ll eventually find a buyer. If you build a spec business, very good odds that you will never find a buyer-

**Shaun Hildner:** Right.

**David Heinemeier Hansson:** … That thing that you spend years building just does not pan out, and perhaps in part that is the odds of that is why we get this loop-sided model, where there is a bunch of VC money that knows that the odds are pretty poor, that something’s going to make it all the way from seed funding to the big unicorn slam dunk that’s going to pay back their fund.

**David Heinemeier Hansson:** And, and that makes everything disposable. That’s like, “Well I have like a hundred shots here in my pipeline. I just need one of them to pay it back.” I think there’s some lack of commitment in that. Like, “Oh, okay, it’s not on the path to becoming this unicorn? Shut it down, shut it down as quickly as possible so we can recycle the people who are in it so that they can get another shot at something that is going to become a unicorn.” And I just think… It seems like such a wasteful thing. First of all, why does everything need to be a unicorn? If you were a little more committed to it, if there was a little more skin in the game that wasn’t as diversified, right?.. This is one of those areas where diversification, if it’s too much, it actually means that each individual egg in the basket, like it just doesn’t matter almost.

**Shaun Hildner:** Right.

**David Heinemeier Hansson:** If you had more of like people going like, “Do you know what? This is my egg. I really fucking care about this egg. There’s some consequences here. If I shattered this damn egg, maybe that doesn’t turn into a unicorn, but maybe it just turns into a nice horse or a fucking donkey or mule.”

**Shaun Hildner:** This is the weirdest metaphor.

**David Heinemeier Hansson:** The world needs mules and donkeys more than they need damn unicorns, right? Is fucking… Is the unicorn going to drag the hay to the market? No, you need a damn donkey for that, and we need a lot of donkeys. We need a lot of businesses that don’t become unicorns. We need the Fortune 5 million that are middle-sized, small businesses. Part of that, I think our mission here, both with the book and our advocacy in general, is to give all those donkeys and mules and horses that sense of, "Do you know what? Our place in the world here is good.

**David Heinemeier Hansson:** Fucking world would not go around unless we were here." You can’t make the whole thing just run on a handful of unicorns. So be proud in that work. Put the pride in it. That’s the other thing I find with the satisfaction of having commitment strategy to making something that’s decent and good is, do you know what? If at the end of the day, you end up building a business that has six people, and it runs for eight years, but you did it well. You didn’t take the cheap shot quotes, you got to look back on that, and, “Do you know what? That was good. I feel like my place in the world here has been validated, and I did something proper, and it doesn’t require this slam dunk hit whatever.” I think of the day to day too, a bunch of the things I do at Basecamp, they don’t make the term sheet look better. They don’t make the spec sheet look better, but I do it because I want to, like, “Do you know what? I’m building something proper here, and we take the time to do things properly,” and that in itself is just life satisfaction.

**Shaun Hildner:** You say you hear from people all the time that did get a little bit lucky and built something and sold early enough to retire on. I believe what you call Mojito Island, David, and then they come right back six months later bored. What would… If you guys fucked up and accidentally slipped and fell and accidentally sold Basecamp three, four years after creating it, what would you be doing? Are you a Mojito Island person, or are you… Would you start something new?

**Jason Fried:** I have no idea. I’m not a Mojito Island person. I couldn’t just sit around. That said, I don’t think my natural inclination would be to start another business though.

**Shaun Hildner:** Really?

**Jason Fried:** I’m not really… Yeah, I don’t really have a desire to start a business from scratch. The only one I would maybe start would be one that’s just me. So it’s not really like a business as much as it is just what can I do by myself sort of thing. But to actually go through the process of beginning a whole other business again… And there are a lot of entrepreneurs do that. That’s what they do. They build something, they start over, they build something, they start over, they build something, start over. The start over actually is not that interesting to me.

**Jason Fried:** I much prefer to keep it going as long as we can than to try to do it again. The other thing is you can reinvent your own company many, many times. So you don’t need to sell something or start over to technically start over in a way. I mean, it’s not… That’s quite the same as starting at zero for real. But you know, there was a point in our history, we used to be called 37 Signals. We changed the name to Basecamp. We sunsetted a few products. We started a new product recently called Hay. You can do a bunch of new things, and that’s what’s cool about a company. It’s actually a vehicle for whatever you want to do within reason that works, and we might do some more of that stuff moving forward. So I think that’s how we, I think, get our renewal kicks is by transforming what we have versus feeling the need to do it all over again from scratch.

**David Heinemeier Hansson:** One of the things I fear the most is Groundhog Day. I don’t want to repeat the same lesson twice. I want new damn lessons. And if you start over again, it’s just a ton of lessons you got to do twice. And what I’ve seen too is a bunch of people… They’re just not as good the second time around. The fact that you know things is a disadvantage on your entrepreneurial space some of the times. And not only do you end up not being as good, you end up not being as interested in the thing. I’ve seen that with a number of friends.

**Shaun Hildner:** You already sold your good idea.

**David Heinemeier Hansson:** Yeah, exactly. And first of all, that might be the best idea you’ve ever had.

**Shaun Hildner:** Right.

**David Heinemeier Hansson:** Second of all, there’s so much you have to do when you start a new business from scratch, right? And not all of it is super interesting, but it’s interesting because it’s novel to some extent. I look at the times when we were four people at the company. I’m like, “You know what?” That was a novel time," and then six people and then eight people and so on. But there’s a bunch of the work I did at that time where I was like, “Do you know what?” I don’t know if I need to be the person who wakes up at whatever 11:00 at night because I’m the only one who deals with the technical issues, and there’s no one else to fix it if it goes wrong." You know what? That was a good experience. I’m really glad I had it. I don’t necessarily need to repeat it. I’d like to create new experiences, new challenges, things that are novel and having the company allow us to do that and pursue those things without having to repeat the rest of it is pretty appealing.

**David Heinemeier Hansson:** I think the other part of it is that a lot of people think that they will be happy by whatever material success they get from selling the thing. Like literally, I can’t recall anyone that I personally known or talked to who are like, “Yeah, I sold the thing for a bunch of money, and then I just live the life of leisure ever since, and that was heaven.” Absolutely not. Plenty of people try that for a number of weeks, some months, a few years, and then they go like, “Do you know what? This is not the meaning of life.” The meaning of life is not to just live a life of leisure. It is to do something meaningful and have an impact and use my competencies, all the things that go into the happiness research, finding flow, getting into something, working with others that you’re inspired by. Like all those things happen when you do stuff, not so much when you just spend stuff.

**Shaun Hildner:** Well, I think that’s a perfect place to end. Next week, we’ll be discussing the chapter titled “Less Mass,” pretty fitting for going into a new year. I guess that this will be the middle of February, so we’re already into the new year, but-

**Jason Fried:** Are you calling me fat? Is that what’s going on here?

**Shaun Hildner:** As I’ve already broken all of my resolutions, but that’s for next week. Thank you, Jason Fried, for joining me.

**Jason Fried:** Thanks, Shaun.

**Shaun Hildner:** And thank you, David Heinemeier Hansson.

**David Heinemeier Hansson:** Thanks, Shaun.

**Shaun Hildner:** We hope you all join us next week.

**Shaun Hildner:** REWORK is a production of Basecamp. Our theme music is by Clip Art. We’re on the web @rework.fm where you can find show notes and transcripts for this and every episode of REWORK. We’re also on Twitter@rework podcast. If you’re following along in the book, next week, we’ll be discussing the chapter, “Less Mass.” If you like the show, I’d really appreciate it if you would leave a review on Apple podcast, and if you have any comments or questions for Jason or David, leave us a voicemail at 708-628-7850, or, better yet, record a voice memo on your phone, and email it to hello@rework.fm.

This is an episode title
