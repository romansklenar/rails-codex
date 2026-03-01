---
title: "Delete your account"
description: "How Basecamp tackled the responsible deletion of 2.4 million long-inactive accounts containing 370 terabytes of data, featuring the history of their data incinerator system."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/delete-your-account/
tags:
- podcast
---

# Delete your account

**(00:00:00)** Anyone You Meet Normcore Remix by Clip Art plays.

**Wailin: (00:00:02)** REWORK is brought to you by Basecamp. Basecamp is software that helps you organize the work you need to do, the work you want to do ,and the people you're working with. Learn more and sign up at basecamp.com.

**Eileen: (00:00:17)** I once made a joke that we should build an app that never saves any data for longer than 30 days. Your project has to be done in 30 days or else will disappear and you don't remember anything that you did. It's kind of like Snapchat or something. But like snap project management.

**(00:00:32)** Broken By Design by Clip Art plays.

**Shaun: (00:00:34)** Welcome to REWORK, a podcast about the better way to work and run your business. I'm Shaun Hildner.

**Wailin: (00:00:38)** And I'm Wailin Wong. So the other day I was on Instagram and you know how Instagram has this feature called Instagram stories where the posts expire after 24 hours? Well I was looking at my own profile and Instagram was like, do you want to make a collection of stories? I guess a collection is a series of posts that stay pinned to your profile. So they last longer than 24 hours. And then Instagram was like, we have suggestions for you. Here's your trip to Ireland last year that you could make into a collection. I clicked on it and then all these posts I made on my vacation last summer were just there.

**(00:01:13)** So I realized, and maybe I was naive not to know this before, but I realized that Instagram is just hanging on to all my stuff, even though it's not publicly available to my followers after 24 hours.

**Shaun: (00:01:25)** Every time we sign up for a new service or post something or make a transaction, we're creating a digital footprint. And it's gotten to the point where it's really hard to keep track of who has your data and how to access it or get rid of it.

**Wailin: (00:01:37)** Basecamp as a project management app handles a lot of people's data and it's an ongoing discussion here of how best to store and delete that information.

**(00:01:45)** Today on the show, we look at a big hairy project that our Basecamp colleagues have taken on to responsibly dispose of old data from long inactive accounts. But first we're bringing back two Basecamp alums for a brief history of the data incinerator that's been part of the app since almost the very beginning.

**Shaun: (00:02:04)** Here's our old friend Jamis Buck, who built the first version of the incinerator. As it happened, this system, which is both the code and a set of policies around data stewardship, came out of a discussion, not about deleting data but undeleting data.

**Jamis: (00:02:21)** I'm Jamis Buck. I worked at 37signals and then Basecamp for about nine years. When we first built Basecamp, there was no undo feature for users. If they deleted something, it was pretty much gone and we had backups. So if there was a critical piece of data that was accidentally deleted, we had the ability to restore the backup and manually pick out the data that needed to be restored.

**(00:02:45)** But it was a really painful process for us and it was a really frustrating process for the users. We just kind of kept doing that until the pain got too high and we decided we needed to allow users to kind of restore their own data. Interestingly, by allowing users to undelete their data, we also needed to solidify the policy of what the window was for that. And so we, I think we settled on 30 days.

**Eileen: (00:03:08)** It used to be 30 days and then we permanently delete five days later. And I pointed out like, that's not 30 days, that's 35 days.

**Wailin: (00:03:14)** Eileen Uchitelle worked at Basecamp for two years and made the incinerator for the latest version of the app.

**Eileen: (00:03:20)** So we made it shorter and did 25 days in the trash, five days where it disappears from the trash, but it's still there so that you can get it back. And then completely gone after 30 days. So it's two or three separate jobs. Each job schedules the next job. So when you put something in the trash, a job is scheduled for 25 days later to delete it. That 25-day job schedules a new job that says permanently delete in five days and then it's gone forever.

**Wailin: (00:03:47)** And when the data gets permanently deleted, we mean permanently deleted. That goes for a single message or file or an entire project. The incinerator can also delete an entire account. Although that wasn't something that customers asked for very much.

**Jamis: (00:04:01)** I'm positive we never deleted anything without a person saying it was okay to delete it. But I do have memories of reaching out to an account owner and saying, hey, we haven't seen you active on here in a while. It's a kind of a sensitive thing. You don't want people to feel like, hey we're trying to push you out. Because sometimes people do take a year or two off and want to come back to it later. If they're paying you every month, then it doesn't matter if they're not using it or not. Like that's kind of a guarantee. We're just going to hang onto it as long as they're paying. It gets trickier when there's free accounts involved and they're not paying and you haven't seen any activity on the account for a year or two. What's your obligation?

**Wailin: (00:04:41)** Jamis raises a central question of this episode, which is, what is our obligation and our responsibility when it comes to long inactive accounts and the data inside them? The first version of the Basecamp app came out in 2004. That means we have inactive accounts that go back as far as 15 years.

**Jane: (00:04:58)** The project of figuring out how do we better treat long inactive accounts that have been frozen, just sort of sitting there for sometimes, you know, 10, 15 years had been on different people's peripheries for while. I think that they'd had the gut that we can do better here.

**(00:05:15)** My name is Jane Yang and I am Basecamp's data analyst.

**(00:05:19)** There were two sets of accounts that were in question. One is there are customers who used to pay with us and then for whatever reason maybe their credit card expired or something. Their account just went and lapsed. And when that happens, you enter what's called a frozen stage. You're not technically canceled. We still have your information and while you're not canceled, we're going to hold onto your information and keep that safe for you in the same way that we do for any paying customer.

**(00:05:46)** And so that was one pool. But also in various points in Basecamp's history, we've offered free versions of our products and there's never a cancellation decision often in those cases because you know, it's free. And in our case, we don't sell customer data, we don't analyze any content in the customer accounts. And so you're also not paying with your data. But still who wants that level of digital footprint to constantly be hanging out there.

**Wailin: (00:06:23)** And what did you decide was the scope of the issue here?

**Jane: (00:06:27)** Yeah, so I looked at it and it ended up being that we had over 2.4 million accounts that had either been free and just inactive for over a year or had been frozen for over a year. That is 2.4 million customers. And then all of their data storage wise, we were talking like 370 terabytes of data that we're keeping it safe there for them. But if they don't want it, that's a lot of data to be holding onto. And one of our colleagues, Jim Mackenzie, had found this tweet. I'd have to send it to you later. But they were saying, data is not gold. Data is uranium. You can make something useful out of it, but if you just hold onto a stockpile it can get really dangerous. And I 100% agree with that sentiment. So my general stance is like if we're not gonna use it, don't collect it. If we're not going to use it and no one else is using it, don't keep it.

**Wailin: (00:07:21)** You know, even if you weren't putting yourself in the shoes of the customer wanting a smaller footprint, even from like a coldhearted business perspective, you could save a couple bucks not storing so many terabytes of data, right?

**Jane: (00:07:33)** Yeah, it's true. And you know, and there's definitely a dollar amount to it and time as well, stewarding this data. If someone for some reason gets involved in a lawsuit and Basecamp is subpoenaed for information, if that account was long frozen and we still have it, we are legally required to hand that over. We can't if it's been canceled and therefore 30 days later all of the account or information has been incinerated there. There are some things they're just prudent to do to limit your liabilities.

**Wailin: (00:08:04)** Oh, absolutely. So you come up with a pretty staggering number and then what are the next steps? How did you go about organizing what you wanted to do and how to do?

**Jane: (00:08:17)** Yeah, absolutely. So these numbers came together as a pitch that Jeff, who is on our core product team, also weighed in on. And then Taylor, our former Director of Operations also weighed in on. I laid out the numbers. I said, hey, here's some other anecdotes that I've heard and I put it out there because I'm not a programmer. So, I alone, could not execute this project.

**(00:08:39)** So the Basecamp way is you make a pitch. And I essentially said, with this additional information, what do people think? Is this something that a team could take on in the next cycle? And our Security, Infrastructure and Performance team, SIP, raised their hand and said, yes, we'll take this on.

**(00:08:56)** Then was helping the programmers figure out how do we scope this? It's easy to say long frozen and long inactive, but what does long mean? So taking a look at distributions and trying to get a sense of, okay, what do we think is like a fair cut off, for, if you've been frozen for this long, we're going to start notifying you and like give you basically a timer. Figuring out how do you treat trial accounts differently. Learning all of this history, I mean we were dealing with 20 years of product accounts and so along the way we were also uncovering some different decisions that were made in the past about how we do accounting and figuring out how do we scope and manage our way around these roadblocks.

**Wailin: (00:09:33)** The team came up with guidelines for determining inactivity and how long different kinds of accounts needed to be inactive before they'd be considered for incineration. They also decided on timelines for these different categories of accounts.

**Jane: (00:09:47)** So for paid accounts we said, okay, we're going to give you six months, basically 180 days. So we'll notify you at 150, give you a little reminder and then it's going to get canceled automatically for you at 180 days. With some grace time in case you want to, like, re sign-in just one more time to download your data, right.

**(00:10:06)** For trial accounts, you probably don't have as much stuff in there. You know, if you don't come back within the next 30 days like okay, you can just sign up for a new trial if you need it. So it was a much shorter leash of 60 days. On the flip side with free accounts, you know, why is it that someone might have a free Basecamp account? Maybe it's for an annual project, like a fundraiser or a book sale. It's probably more normal behavior for there to be long periods of inactivity before then you start hitting it again. So we ended up giving a one-year leash for those accounts.

**(00:10:43)** It's very easy to say, actually I want to keep this. You just have to sign in. And then we're like, okay, you want to keep it, great.

**Wailin: (00:10:48)** So that flags in the system that this person wants to keep it and then they move off of the list. So it's like you're kind of narrowing it down a little bit.

**Jane: (00:10:55)** Exactly. For paid accounts you have to start paying again. But for free accounts, yeah, you just log back in and then we reset the timer.

**Wailin: (00:11:02)** So then you crafted, I assume, kind of like emails depending on the situation, like laying out timeframes and just emailed all the customers you could find.

**Jane: (00:11:11)** Good question. Yeah. So with our automated process, Justin and Jorge, who are the two programmers who worked on actually implementing it started off with draft and then we also brought in one of our designers, Adam, who just has such skill with wordsmithing and helped with that language.

**Wailin: (00:11:32)** What were some of the considerations you put into the wordsmithing of the email? Like what kind of language did you find that you needed to put in there to kind of ensure maximum clarity and comfort?

**Jane: (00:11:45)** We tried to explain, hey, you have this thing.

**Wailin: (00:11:51)** Remember this thing?

**Jane: (00:11:51)** Exactly. We're happy to keep it for you if you really want it, still. And you know, depending on if they're paid or free, there are different ways that they could keep it. But otherwise we sort of said like otherwise we're going to help you out by getting rid of this for you at a certain date and a lot of the tweaking ended up about clarifying what the account was, the product. A nice reminder, again, for folks who hadn't thought about this for over 10 years. We learned that there were small ways that we could tweak the email so that it was easier for folks to self-serve in case they did want to keep it or they wanted to export the data but not actually keep the account after that. We also just tried to be clear about timelines and about like the reminders that they were going to get moving forward.

**Wailin: (00:12:43)** This big project was divided into two phases. First up, frozen paid accounts. And the team made a major decision here. They decided not to notify customers whose paid accounts had been frozen for over three years that those accounts were getting deleted. Part of the rationale for this decision came from a credential stuffing attack that happened in 2019. We did an episode about this last year, but to sum up what happened, there was an attack on Basecamp where someone was trying to access accounts by trying a huge number of credentials. These are credentials that had been stolen in data breaches at other companies and bad actors were trying these logins with us to see if they could get into Basecamp accounts. It's like sealing a huge key ring and then trying all those keys and every locked door you can find. When that credential stuffing attack happened, we emailed all Basecamp customers whose credentials appeared on those lists of stolen IDs.

**Jane: (00:13:37)** And got actually quite a few responses from account owners of long frozen accounts saying, wait, who are you again? Like what is this? And so we still had that memory in our heads and we thought, okay, you know, we're talking about 1.4 million accounts that had been frozen for over three years. And at that point 99% of accounts just aren't going to ever come back. So in our first phase we actually made the call that we said if any account has been frozen for over three years, we're not going to notify them.

**Wailin: (00:14:12)** Did that feel scary?

**Jane: (00:14:14)** It felt very scary. And it was one of those cases where you were trying to strike the right balance. We wanted to avoid spamming or any perception of spamming. We wanted to avoid confusion. And we had a lot of debate around this. There was just a lot of concern that if we were going to email, 1.4 million people, it would overwhelm our support team. It could, you know, but that's just a lot of emails to send out to customers. And that seemed to work out really fine. And then we got one case.

**(00:14:49)** Anyone You Meet Normcore Remix by Clip Art plays.

**Shaun: (00:14:49)** After the break. Jane talks about this customer support case that changed the course of the project. But first let's talk about Basecamp. Ryan Singer, Basecamp's, head of strategy, spends a lot of time talking to customers. So I'm going to turn it over to him.

**Ryan: (00:15:04)** Yeah, so one of the customers that we talked to, she's telling her team over and over again, don't come to me. It's in Basecamp, right? And eventually she just puts a sign on the front of her door that says, before entering, ask yourself, did you look in Basecamp first? She was the one who was sort of like the brain. She held all of the information about the jobs that were running. She had all the documents, she knew all the changes as they were happening, she was the one who knew all the information and everybody who was doing the work, they would go to her and ask what was going on and what they needed to do. And she's thinking to herself, I don't need to be spending all my time answering these questions, I've got my own work to do. I've got stuff that I'm trying to do here and I'm getting interrupted with phone calls and answering emails all the time. Why am I spending my time doing this?

**(00:15:50)** She ended up asking a friend for some advice. She said, look, I've got this problem. Is there something I can do here? And the friend recommended Basecamp and when she went and she looked at Basecamp, what she saw was that everything was going to be in one place and everybody was going to be able to see it. So if she put all the documents and all the communication there in this central place, they could just go see it themselves and they wouldn't have to ask her anymore.

**(00:16:15)** So first off she gets everything in there and she says, okay, I can actually see that this is easy enough that they're going to be able to use it. Because that's the first thing. If it's complicated or weird or hard to get into, then nobody's going to use it, right? So she knows it's possible. She says finally, this is an easy looking one. But of course like habits take time to change. So people are still coming to her at first and she's saying no, go check Basecamp. No. And then she puts the sign on the door. Right.

**(00:16:43)** But before long everybody had figured it out and they had all learned what to do. They all knew to go to Basecamp to find the information that they needed. And then this is the kind of thing where we hear quotes saying I got my sanity back or this kind of a thing, which sounds extreme but you know, go from never being able to get your own work done cause you're getting interrupted all the time to actually having time to focus and do what you need to do. So, she got to a place where now she could focus on her work without all the interruptions.

**(00:17:08)** Anyone You Meet Normcore Remix by Clip Art plays.

**Shaun: (00:17:09)** Basecamp combines everything you need to manage projects and people in one organized place. Head on over to Basecamp.com to set up a free trial.

**Wailin: (00:17:20)** We're back. So the team had decided not to notify owners of frozen paid accounts over three years old, that those accounts would be canceled and incinerated in order to cut down on the confusion of getting an email out of the blue from a service these customers might not even remember using. And then Basecamp's customer support team, got an email from someone saying, I'd like to reopen my account but I'm having trouble getting in. The link doesn't work. It turns out this customer's account, which had over a decade's worth of data in it had been incinerated and we had not given this person a heads up. Again, here's Jane Yang.

**Jane: (00:17:54)** It was pretty heartbreaking. We went back and forth and we actually tried as hard as we could to figure out if we could salvage it, if it was within the timeframe that it hadn't yet been incinerated. And at the end they were very gracious and you know, they sort of understood. We explained that we went through this purging process. But even one example of something like that is enough to recenter, right? And this is one of those cases where the numbers alone made it seem like, okay, this is a good choice right now, but sometimes the numbers aren't enough and you just really need to have the experience.

**(00:18:28)** Regardless of what it was going to do in terms of response rates and having confusion. We wanted to say, okay, we're going to just end up notifying everyone else. We ran a small experiment and we like tried to pick the accounts that we thought might be most confused about getting an email from this company called Basecamp and we tried sending them notifications and like ended up not getting as large of a response back as we expected. So we said, okay, we're going to notify everyone.

**(00:18:54)** And that meant that it's a much longer process now for the remainder of the accounts, but every single account now is getting a notification even if the last time they thought about Basecamp was 15 years ago.

**Wailin: (00:19:04)** Yeah. So it was that one former customer's experience that you heard about kind of midstream that caused a shift in the way you're going to carry out the rest of the project.

**Jane: (00:19:14)** Yeah. And so it was great that we were doing the project in phases because then we were able to adjust because otherwise we were planning to approach the free accounts in the same way of establishing a five-year threshold or something like that for the accounts to purge without clear notification or like direct email notification.

**(00:19:37)** And we ended up like, we're now still sending out 12,000 emails a day to account's owners, most of whom are not responding. Incinerations are ongoing because most of most folks are like, yeah, I don't need that. But if we can prevent anything like that one case from happening again, it's worth it.

**Wailin: (00:19:55)** Yeah. I was peeping along with a little bit of the message traffic with that case and so many people were looking at that case and trying to figure out there was like any way to salvage what had been lost. I mean the incinerator works really well, right?

**Jane: (00:20:10)** It does!

**Wailin: (00:20:10)** Like it does what it's supposed to do, what we promise customers, which is if you delete your data, we delete it, and we permanently delete it after the 30 days, right?

**Jane: (00:20:19)** Yeah. And that is, you know, for good reason. And, you know, based on the customer's responses, again they were so gracious with us. We did everything we could to try to resolve it. It doesn't forgive the fact that that one customer would have appreciated a heads' up. When the customer wrote in, I think someone who had a more direct hand in implementing felt like a huge weight of that decision. It was like, no, we were all here for that decision. That is one for all of us to bear and now we all do better because of it. I'm glad that they wrote in because it really helped us refocus our approach and decide that we're going to take this longer approach for this than we otherwise would have. But again, it's worth it.

**Wailin: (00:21:03)** Has it been okay sending 12,000 emails a day?

**Jane: (00:21:06)** Surprisingly it has been. We went from like a tiny 10 account test to, you know, starting at like a thousand a day and then 2,000 a day and Jorge has been slowly scaling up the number, checking in with OMG, our support team to check, how have their responses been?

**Wailin: (00:21:24)** We're doing kind of like one big cleanup now and then is the idea to do rolling clean outs, then?

**Jane: (00:21:31)** Well, so those automated cancellations are happening ongoing and it's going to happen into the future. So what we've done was a first phase of a manual purge and then we implemented the automated cleanup. And so that automated cleanup is moving forward. We have a cancellation policy on our website. Any time that you sign up for an account now it's going to fall for those rules. So we have now a Basecamp Personal offering, which is free. If you sign up for that and you end up not logging into it or doing anything to it for a year, you're going to get a little email saying, hey, you still want this? Otherwise we'll cancel it for you in 30 days.

**Wailin: (00:22:05)** Has working on this project made you think about your own data differently in terms of when you are doing stuff online and you sign up for things to try something or you sign up for something you think you're going to stick with, then you don't, that kind of thing? Does it make you evaluate like what other companies do and like what you as a consumer would like to see happen?

**Jane: (00:22:25)** Oh absolutely. Yeah. I mean I think that prior to joining a tech company, I mostly optimized on convenience and so, oh, if I wanted to get onto WIFI in a public spot and they asked for an email address, sure. Without really considering what that meant. I think this project and in general working in a company that is entrusted with data. We don't ever look at that data, but it's on us to protect and to make sure it's accessible just to you. That has definitely made me much more aware and so there are a couple of other programs that are starting to do these automated rollouts and there are others that have been sort of way ahead of the curve and have been doing automatic cleanup services for a while. But it's still, I think the minority compared to the number of services that collect your data.

**(00:23:20)** It's really unsettling to realize that I'm never going to be able to fully reduce and get rid of my digital footprint.

**Eileen: (00:23:27)** You really want a way to have a right to be forgotten on the internet and I don't know, I grew up in the age where like the internet sort of started becoming cool and it's like, Ah MySpace, let me make a MySpace account. I have no idea how to log into that MySpace account and delete it. I don't even know if it still exists. I don't know what's on it. I don't know who I'm friends with. Maybe Tom still, but like I don't know how to get into that. It would be nice if I could figure out how to delete my MySpace data. It's really important for security and privacy. You don't want to leave stuff on the internet for a long time and that is kind of like the internet. It's like moving to a different house but like not being allowed to take your stuff.

**Wailin: (00:24:05)** And it was the same with when I deleted my Uber account. It's like you can like deactivate yourself on Uber, but I had to email into their customer support to be like please actually delete me as a customer. Which I don't know if they actually complied. What if my credentials are still floating around in their system somewhere, you know?

**Eileen: (00:24:22)** Like that's the thing is like there's no way to actually prove that they deleted your data. And I don't see a future in which we're going to get to that point unless there's some sort of auditing system that says who asked to be deleted and then verification that they did delete. But what's the consequence for it? A fine that they can write off on their taxes? We need actual laws and actual consequences for them to fix that. We see it all the time with security breaches. I mean, and that's the best way probably for them to like get found out that they weren't deleting stuff is a security breach. But that only hurts the individuals. It doesn't hurt the company enough.

**Jamis: (00:24:59)** Companies have been burned and so now people are talking about it more as insurance than as wanting to be good. I think we won't really turn a corner as an industry until people start talking about it because they want to be good and not just because they want to cover their bases. And I imagine some of that's going to have to come from the consumers and the programmers. The programmers that are hired to work on this stuff, they need to be willing to stand up and take the risks that are involved in speaking up to their bosses when they see something happening.

**Eileen: (00:25:31)** No one's gonna be like, Oh, I'm so glad that you built that system. That creates like jobs off of jobs and checks to make sure it's all gone. No one's going to be like, oh, that's really cool and no one's going to ever see it. I think it'd be hard for teams to prioritize data deletion, but you know how your database grows and you spend more money and more money and more money and you're like, oh, I don't want to spend more money on hardware. Well the easiest way to spend less money on hardware is to delete your data.

**(00:25:55)** If you're one of those companies that don't have a data deletion policy, bite the bullet, put it on your roadmap, make it happen. It's really important and people might not appreciate the intimate technical details, but they will appreciate that you can delete your data.

**(00:26:10)** Broken By Design by Clip Art plays.

**Shaun: (00:26:12)** REWORK is produced by Waylon Wong and me, Shaun Hildner. Music for the show is by Clip Art. You can find Jamis on Twitter at @Jamis. That's J-A-M-I-S. He's written a book of mazes for programmers and a serial adventure called Basil & Fabian that teaches algorithms through fictional stories about a wizard and his apprentice. We'll link to those in the show notes. Eileen is on Twitter at @Elieencodes and her website is Eileencodes.com.

**Wailin: (00:26:38)** You can find those show notes on our website at rework.fm along with episode transcripts. We're on Twitter at @reworkpodcast. We have a voicemail too. That is (708) 628-7850.

**Shaun: (00:26:52)** REWORK is brought to you by Basecamp. Basecamp combines all the tools teams need to get work done in a simple streamlined package. With Basecamp, everyone knows what to do, where things stand, and where to find the things they need. Learn more, and sign up at Basecamp.com.
