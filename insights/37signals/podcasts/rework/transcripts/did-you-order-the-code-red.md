---
title: "Did you order the code red?"
description: "“Passwords just aren’t cutting it online."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/did-you-order-the-code-red/
tags:
- podcast
---

# Did you order the code red?

**Shaun: (00:00:00)** It started, as most of these incidents tend to with someone in Ops noticing that there was something going on. Something fishy. A hunch. An instinct. And then we realized that there were people logging in using user names and passwords but from IP addresses that we’d never seen before. From locations that we’d never seen before.

**(00:00:23)** Broken By Design by Clip Art plays.

**Wailin: (00:00:24)** Welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m Wailin Wong.

**Shaun: (00:00:31)** And I’m Shaun Hildner. It’s felt a little like firefighting season at Basecamp lately. Back in November, Basecamp 3 went down in what we called the Big Integer outage. We actually did an episode about it that you should go back and listen to if you missed it.

**Wailin: (00:00:43)** The Big Integer situation was what we call a code red.

**Tom Cruise (Clip): (00:00:47)** Did you order the code red?

**Wailin: (00:00:48)** And it was caused by an internal technical issue. Just a few weeks ago we had another code red. This time called by an external threat that we’ve come to be familiar with. Data breaches and stolen passwords.

**Shaun: (00:01:01)** Today on REWORK, we’ll take you behind the scenes of how Basecamp handled an attack that’s become a sad fact of internet life. We’ll also bring you some tips on how to keep your online credentials safe.

**Jim: (00:01:15)** I’m Jim Mackenzie, and I work on the support team at Basecamp. This whole thing is known as credential stuffing, which is both a great name and a bad name. It’s a great name because it sounds really evocative. But it’s a bad name because it doesn’t tell you what it actually is, which is just people using emails and passwords they find on the web to log in to accounts elsewhere in the hope that it works.

**Wailin: (00:01:40)** Credential stuffing starts with these huge lists of emails and passwords that are floating around dark corners of the internet. So, how do people’s emails and passwords get onto these lists? Well, you’ve probably heard of high profile data breaches, like Marriott or Equifax, or Yahoo! And it’s common for people to use the same password across multiple sites. So, bad actors will take credentials that have been exposed in data breaches and try them on other sites. It’s like letting a box of random keys and trying them in every door on a street.

**Jeremy: (00:02:09)** Hey, I’m Jeremy. I lead up the Security, Infrastructure and Performance team at Basecamp. We’ve dealt with credential stuffing before. Typically in either a more scattershot way, where somebody has access to a big list of passwords and is just spamming us with them to see what happens. And in a targeted way where somebody has selected a specific person that they want to get in as, or a specific account. We tried to go back and try to figure out what kind of internet life is this. What happened? Why is this even becoming a thing now more than it was a month ago or eve weeks ago. And we could trace back to what they would call these combo lists becoming much more widely available. And typically these lists of credentials—of usernames, passwords, email addresses, will be passed around and bought and sold. And now a bunch of them are just free and so anybody can get them and combine them into these megalists of billions of emails and passwords.

**Wailin: (00:03:04)** On the day when Jeremy’s team and Basecamp’s Ops team caught the credential stuffing attack, they immediately launched their first line of defense.

**Jeremy: (00:03:11)** And so, we’ll block IPs that we know are attacking us. So, those are the ones we’ve already identified. And for the ones we haven’t identified yet, we come up with other counter measures, like using a Captcha. Which everybody hates. They’re terrible for humans and they’re really not that terrible for bots either. So, the trouble is that most of these credential stuffing attacks can be done with software that helps you automate things like Captchas. Or you can just farm them out to humans who can help you solve them for a pretty low cost. So, you’re talking about a fraction of a penny per Captcha solved. So we can mount a lot of countermeasures but nothing is 100%.

**Wailin: (00:03:53)** And so, the folks here blocked IP addresses and beefed up Captchas. And where Basecamp accounts had unauthorized access, they reset passwords and notified customers. But this proved to be more of a bandaid, because the next day, there was a second credential stuffing attack.

**Jeremy: (00:04:08)** It really is the feeling of, this can’t be us. We can’t be running away from an attack like this. We can’t have an initial response and then feel like we’ve done enough.

**Jim: (00:04:23)** It was, okay, well, knowing what we know, could we leave it in this state? Can we stay safe and sleep sound at night knowing that a bunch of our customers have their usernames, passwords out there? They might be using them in Basecamp today.

**Jeremy: (00:04:40)** And so, taking out the little bit of more sober step in how do we respond to something like this where we can say, we’ve not just addressed this one incident, and maybe the attacker has moved on, but can we deal with future classes of things that are like this. And are we prepared to deal with a new thing that we don’t know yet? Is our incident response process primed and ready for the next thing that is gonna hit us?

**(00:05:08)** And so, taking the time to essentially preempt our other work and say, we’re going to get to the bottom of this. And that’s what led to our second phase of, this isn’t going to be over ‘til it’s over. Of, our attacker moved on but we decided not to move on. I mean, it’s like malpractice. When it’s in your face, of course we would stop and do it. We would stop everything before doing anything else. In that sense it’s a great test piece for how do we address things that are risky? How do we tackle things that we say, like, we’ve got to stop and do something about this? And, we need commitment from other people. We’re small. We work in small teams. This means other people are going to need to stop, also. And, the person who’s calling the stop here, is this going to be a debate? An argument? How deep is this gonna go? Is it gonna turn into a conflict or are we going to see people rally around the feeling of, this is something that we all need to solve together?

**Wailin: (00:06:05)** As it turns out, Basecamp co-founder and CTO David Heinemeier Hansson called the alarm. Which made it safe for everyone to join in phase two. So, what did the work on this stage look like? Well, remember those combo lists that Jeremy talked about that are at the center of credential stuffing?

**(00:06:20)** The team at Basecamp had to take those lists and look through them to see if any of our customers’ logins and passwords appeared on those lists.

**Jeremy: (00:06:27)** And, it took going through huge reams of data. I mean, if this stuff was printed out, it would be boxes and boxes and boxes of data listing tons of email addresses and tons of passwords. And so, coming up with a way to clean that all up because these data dumps are not in, like, an Excel file you can just open up scan. It’s like a bunch of trash. You’ve just got bags and bags and bags of it. You need to dump it all out, sort it, clean it, and then inspect it. And it’s dirty, dirty work.

**(00:07:02)** Nathan on our Operations team, and Rosa on the SIP team, my team, did this together and they used oldschool kind of UNIX sed, awk, grep, join. All these—these are things that have existed for decades. And so, it took some ingenuity. The cleaning, searching, sorting, and analysis work using tools that anybody has access to.

**Ariana Richards (Clip): (00:07:26)** It’s a Unix system! I know this!

**Wailin: (00:07:27)** That was live footage of Rosa and Nathan going through these big data dumps to look for Basecamp customer information. As a velociraptor tries to come through the door.

**(00:07:38)** Now, you might be wondering, because customers wrote in to ask about this. If Basecamp was able to compare my password on the ones on these big lists, does this mean Basecamp has my password? That doesn’t seem very safe at all. Here’s Jim’s explanation of how that process works.

**Jim: (00:07:53)** We don’t ever know what your password is. When you set up an account at Basecamp and you enter your password, you enter it into your browser. It gets sent to our servers, which strips it, taking that password and turning it into a token that we can use to represent that password. And then every time you log back in, in the future, you send us the password to the browser, our server discards that basically immediately, and compares the token with the token that we have. So, we never get to see what the password is. So, people would write to us, saying, hey, can you tell me what the first three letters of my password were to prove that, you know, that it’s the right thing. And we say, no. We have no clue what your password is. But we do know that when you enter it, if it matches what we’ve got stored. We could do the same thing with the data breach compilations. Or, as I like to call them, identity theft mix tapes.

**(00:08:52)** And so, what we were doing was, Rosa and Nathan went out and obtained the widely available, freely available, lists of these billions of email address and password combinations. And we then scanned through to see if an email address for each Basecamp customer was present or not. If we got a match, so, if we found someone’s email address present in these data dumps, then we go, okay, cool, moved onto the next one. Just made a note of those. And then worked back and said, okay, for the ones that had an email address present, did it also have a password present? And if it did, we then created this token to represent the password that was in the online data dump and compared it to the token that we have in our servers for their password. And if we had a match, then we knew that their password had been re-used elsewhere online and was freely available for these handle triers to use.

**Wailin: (00:09:48)** When the work was done, the team discovered that a very large number of Basecamp customers did have their passwords in those identity theft mixtapes, as Jim calls them. And if a bad actor was going to try another credential stuffing attack, these customers could be at risk of having their Basecamp accounts accessed. Or maybe other accounts, too, if they use those same logins across many sites.

**Jim: (00:10:10)** About 1 in 20 of Basecamp customers. That is a six digit number. It’s very easy to say, oh, we don’t need to do this because it’s only 1% of people or whatever. But then you turn it into actual names and faces and it’s a huge number and that changes your approach to things.

**Wailin: (00:10:29)** Even though we didn’t find any instances of data being stolen from Basecamp accounts, we decided to reset passwords for all of the affected customers and warn them that their credentials were freely available for bad guys to use. The challenge here was that this was probably the first time the customers would be hearing about this security threat. Remember, in credential stuffing, bad actors have a bunch of random keys and they’re walking down a street trying every locked door they can find. To take this analogy further, it’s like the home owner isn’t there. Or they’re home, but they don’t notice the knob is being jiggled. Or the thief comes inside, but just looks around and leaves without a trace, so the homeowner has no idea.

**(00:11:07)** Jim and Jeremy had to notify Basecamp customers that their passwords were reset because of a security issue with the account. And, that it wasn’t that Basecamp itself was breached but that someone’s Basecamp password was out there, probably because they’d also used it for a different site that was part of a breach. And that’s very confusing and scary.

**(00:11:26)** Jeremy took the first crack at writing an email to affected customers.

**Jeremy: (00:11:29)** I mean, ultimately, the last thing we want to do is pass the buck and say, like, “To be very clear with you, this wasn’t us, it was somebody else.” And, like, pointing fingers at somebody else is a lot different than explaining that this is how your password was obtained. This is why people use these password lists. That there are breaches all the time. There are thousands of sites that have been breached and when they are breached, all that data gets collected and combined and collated and reused other places. And so, in a sense, the fact that people are trying to log in as you is a kind of breach, it’s just that that word is so loaded and becomes such a high bar that every company wants to avoid talking about it, and so would avoid sending an email like this with the reputational risk that goes along with even talking about it. You don’t want to utter those words.

**Jim: (00:11:29)** Jeremy pinged me asking me if I would take a look at what he’d written and just sort of edit it and tweak it. Try and spot obvious questions that folks might ask if they receive this email. Because people are going to get an email from us saying that, hey, we’ve reset our password. There’s a data breach that we’re mentioning, but it’s not us. And so that was the thing that was going through my head, was, like, how can we make it as simple to understand as we can. How can we put the action that the customers needed to take up front. How can we explain next steps to keep them safe, without it being this overwhelming, huge, task. I love writing with Jeremy, it’s one of the most enjoyable experiences because he has such a personable writing style. He explains incredibly technical things in such an easy to understand manner.

**Jeremy: (00:13:07)** You don’t want to read an encyclopedia article about the topic before you get to what is this, and why does it matter to me? What do I need to do? And so, treating it as layers. You can get deeper into it, but you’re always going to get the important things first no matter how far into it you read, so there’s a lot of restating. Start with what matters at the very basics. Continue with what matters again, and a little bit more about why it happened. So, once you’ve gotten this far and understand what affected your password and what we did, here’s what you can do to secure yourself online.

**Wailin: (00:13:40)** So, what can you do to protect yourself online? Jim and Jeremy recommend going to a site called Have I Been Pwned? That’s P-W-N-E-D. You can enter your email to see if it’s been part of any data breaches and you can sign up for notifications if one of your accounts does get compromised.

**Jim: (00:13:57)** Start with your email account. That’s the most important thing, that controls the keys to everything because if someone gets into that, they can do password resets to all of your other accounts, and so that’s the thing to really do first, and if you’ve done that, then that’s job one done. Using a password manager, that was number two. It makes it easier to generate these long, unique, complex passwords that aren’t used elsewhere because otherwise, you’re going to pick something you can try and remember. The human brain can’t compete with machines that can crack hundreds of thousands of passwords a second, we just can’t. And I said, and then at the end of it, reward yourself. I had lemon drizzle cake. And that’s… that was my top tip.

**Wailin: (00:14:45)** Jim mentioned a password manager. Here at Basecamp, we all use 1Password. There’s also LastPass and Dashlane. And browsers like Chrome and Safari have some of this capability built in, too.

**(00:14:58)** Knowing is half the battle, so on behalf of everyone here at Basecamp, stay safe.

**Jim: (00:15:03)** We’ve learned a lot about how to communicate about this, how to make it reassuring, how to—we had some great feedback from security professionals who wrote back in, and saying, hey, thank you for doing this. Here’s some tips on things that I had concerns about that you could change for next time. Hopefully we don’t need to do a reset like this ever again. Instead it’s going to be stopping the next attack, whatever that looks like.

**Jeremy: (00:15:32)** You can’t live in fear and the best you can do is try to organize your environment so that these kinds of situations can’t occur. Knowing that we have incident response processes, well, I guess I should go back. Knowing that they are going to occur, and then doing everything we can to prevent them from happening. But really, being ready to mitigate them so that when something does come up, we feel prepared. We’re ready to tackle the unknown thing that does happen at the first signal of it, and that we’re going to be ready to remediate it, also. That we know that we can get to the bottom of it. Building our skills, our expertise to the point where we feel that kind of confidence out of the practice of running into problems like this and conclusively getting to the bottom of it is the way that we can experience the fear, or really the danger of operating a service online, and having some courage knowing that when it does happen, we’re gonna be ready.

**(00:16:32)** Broken By Design by Clip Art plays.

**Shaun: (00:16:39)** REWORK is produced by Wailin Wong and me, Shaun Hildner. Our theme music is Broken By Design by Clip Art. It’s that time of year again where we are going to ask you to send in your questions for Jason and David.

**Wailin: (00:16:52)** Or maybe someone else at Basecamp, if there’s someone—

**Shaun: (00:16:54)** Or maybe someone else, yeah.

**Wailin: (00:16:55)** —you want to ask Taylor on our Ops team a question. Jeremy.

**Shaun: (00:17:01)** No matter who you have a question for, you can call and leave a voicemail at (708) 628-7850. You can find us on the web at rework.fm and you can hit us up on Twitter @reworkpodcast.

**Wailin: (00:17:16)** Did you read the number? I can’t remember.

**Shaun: (00:17:18)** I did.

**Wailin: (00:17:18)** Okay.

**Shaun: (00:17:19)** Is that it?

**Wailin: (00:17:20)** Mm-hmm.

**Shaun: (00:17:24)** Clever girl.

**Rick Moranis (Clip): (00:17:24)** So the combination is 1-2-3-4-5. That’s the stupidest combination I ever heard in my life! That’s the kind of thing an idiot would have on his luggage!

**George Wyner (Clip): (00:17:36)** Thank you, your highness.

**Mel Brooks (Clip): (00:17:39)** Well, did it work? Where’s the king?

**Rick Moranis (Clip): (00:17:41)** It worked, sir. We have the combination.

**Mel Brooks (Clip): (00:17:42)** Great. What’s the combination?

**George Wyner (Clip): (00:17:44)** 1-2-3-4-5.

**Mel Brooks (Clip): (00:17:46)** 1-2-3-4-5.

**George Wyner (Clip): (00:17:48)** Yes.

**Mel Brooks (Clip): (00:17:48)** That’s amazing. I’ve got the same combination on my luggage!

This is an episode title
