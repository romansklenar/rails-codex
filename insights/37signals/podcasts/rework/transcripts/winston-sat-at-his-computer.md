---
title: "Winston sat at his computer"
description: "A growing number of companies have turned to employee surveillance software to monitor their newly remote workforce."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/winston-sat-at-his-computer/
tags:
- podcast
---

# Winston sat at his computer

**(00:00:00)** Anyone You Meet Normcore Remix by Clip Art plays.

**Shaun: (00:00:02)** REWORK is brought to you by Basecamp. Basecamp is the all-in-one toolkit for working remotely. You might be wondering how you’ll quickly transition your team to remote work. People are stressed, work feels scattered, projects are slipping, and it’s tough to see and manage everything. With Basecamp, everything will be organized in one place. Your team will be working together, even though they’re physically apart. You’ll be on top of things, and a sense of calm will set in. Check it out for yourself at Basecamp.com.

**(00:00:33)** David, I love having this Awair right above my desk to tell me how quickly I’m dying.

**David: (00:00:39)** It goes quick, doesn’t it. You can just see it tick up. Tick tick tick tick tick tick tick tick.

**Shaun: (00:00:43)** Exactly. Okay. How you doing?

**David: (00:00:47)** Good. You?

**Shaun: (00:00:49)** Good, you know? Hanging in there. Really settled into sort of a routine.

**David: (00:00:53)** Hermit life.

**Shaun: (00:00:54)** Yeah, exactly.

**(00:00:55)** Broken By Design by Clip Art plays.

**Wailin: (00:00:56)** Hello and welcome to REWORK, a podcast about the better way to work and run your business. I’m Wailin Wong.

**Shaun: (00:01:02)** And I’m Shaun Hildner. I should probably start by explaining what the Awair thing is David and I were talking about at the top. It’s a little air quality monitor that measures CO2 levels among other things and David got one for each of us here at Basecamp a couple of years ago. It tells me exactly how quickly I’m suffocating in my little closet / recording studio when the door’s closed.

**Wailin: (00:01:21)** Well, I like to burn scented candles in my office, which my Awair hates. But you know what, I’m an adult who can make my own choices about my work-from-home life. Unfortunately, not all employers feel that way about their workers. Especially ones who have recently become remote during COVID-19. In fact, some companies are using pretty invasive technology to monitor their employees. We’re talking about software that sends your boss screenshots of your computer, flags keywords, or even ranks employees with a productivity score.

**Shaun: (00:01:53)** On today’s episode, I talk to Basecamp CTO David Heinemeier Hansson about employee surveillance and what Basecamp is doing to push back against the makers of those technologies. Basecamp’s revised Terms of Service in this area came out of a group at the company called Moral Quandaries. I’ll have David explain more.

**(00:02:09)** Broken By Design by Clip Art plays.

**David: (00:02:14)** Basically it’s a group of, a cross-section of individuals from the entire company. A bunch of team leads from relevant departments like support and operations and security, that come together to essentially discuss, what should we do when someone violates our policies. Or, violates the spirit of what we’re doing.

**(00:02:33)** We’ve recently put in a bunch of work to upgrade our whole policy framework. Everything from our Terms of Service to our Privacy Policies and the promises that we make to customers, like our Until the End of the Internet approach to legacy applications, and so forth. We’ve treated them as careful pieces of writing that should be humanly readable. That they should not be written by lawyers, that they should be written by someone who takes a fair approach to protecting the company, protecting our employees, protecting customers, protecting users. Sort of all the stakeholders you have when you deal with an online service like Basecamp.

**(00:03:16)** We stepped up our process for evaluating any of those potential breaches. We had a case, maybe that’s, four or five months ago where someone was using, actually Campfire of all things, to organize a campaign of abuse against someone. I think it was a journalist. We were made aware of it, and we investigated this, and all that investigation happened in the Moral Quandaries project.

**Shaun: (00:03:42)** The Terms of Service are there to look out for Basecamp the company, as well as our customers and users. There’s another group that has to be taken into account, and that’s third party companies that integrate with Basecamp.

**David: (00:03:53)** Basecamp has an API, and that API is a way for other applications to talk to the Basecamp application and expand it or integrate it in a variety of ways. One of the most popular categories is time tracking. We don’t have built-in time tracking in Basecamp 3. So we’ve added an API that essentially allow other third party time tracking tools to integrate in such a way that you can track time on, say, your to-dos. We’ve had integrations with Basecamp since the launch, almost. 15 years. And we’ve had time tracking integrations, in particular, for a very long time. And it hadn’t been a thing. People were using it for these completely normal, non-abusive ideas.

**(00:04:39)** And then here comes the pandemic, here comes a new focus on remote work. Here comes new scrutiny about how employees and employers are dealing with that and what systems are being set up, and journalists start to dig in. Several of them start asking me about, so, what do you think about, essentially, employee surveillance systems. I thought it was not a big thing. I thought it was a very niche thing and I didn’t have a full appreciation of just how abusive and comprehensive some of these systems were.

**(00:05:10)** And Drew Harwell’s report for the Washington Post took that fuzzy picture and it made it crystal clear.

**Shaun: (00:05:16)** So David did what he does best. He took to Twitter. After a few tweets railing against the evils of employee surveillance, a Basecamp customer popped up and let him know that some of these tattleware companies were integrating with Basecamp and even using the Basecamp logo to promote their software.

**David: (00:05:31)** A bunch of these employee surveillance vendors were integrating with Basecamp. They were using our APIs, they were using our logos to both provide additional functionality within their employee surveillance toolkit, but also to lend credibility to those tools. That like, hey, look, we’re an upstanding part of the tech community. Here’s names you may know that we’ve integrated with, and here’s a list of companies that you may know. Why are we integrating with them? Why is there a fucking Basecamp logo on employee surveillance software vendor’s websites? That’s not right. We’ve got to fix that. We can’t just sit idly by while they’re using our name and our logo and our credibility to promote their shitty software.

**(00:06:18)** When it comes to employee surveillance software, it’s a thing where you can’t just go like, oh well, we’re just supplying an API and whatever people choose to use that API for is fine with us. No. It’s not fine with us. If you’re using that API to essentially abuse your employees, we’re not going to be complicit in that. We’re not going to be a partner with you in that, if it’s something that we’ve been advocating against for 20-plus years. And unfortunately, it seems like something that needs an even stronger pushback in these days of the pandemic and a general rush from a lot of insecure, incompetent managers, to install employee surveillance software because they don’t know how to deal with remote work in any other way than surveillance and control.

**(00:07:11)** Technology’s not neutral. What we choose to sit silent with is a form of endorsement, and in this case, it was a literal form of endorsement since these vendors were using our actual logos and had pages up about, like, hey, here’s how you can use the time tracking information you’re extracting from Basecamp and pair that with screenshots of employees’ desktops for every five minutes and isn’t that wonderful.

**Shaun: (00:07:38)** Right, there’s a big difference between tracking your time so you can bill your client the correct amount of hours, versus having your employer track how much you’re working on Basecamp itself. Is that sort of where the employee surveillance breaks down as far as time tracking is concerned?

**David: (00:07:54)** That’s a good question. I think if it was just about time tracking, and if the time tracking was all about self-reported tracking, it’s fine. This is a, as you say, a completely natural part of the billing relationship that lots of consultants and service companies have with their clients. They bill on an hourly basis and Basecamp should totally help them do that.

**(00:08:15)** The problem is that a lot of these employee toolkits kind of come at it from a different angle. They’re coming at it from an angle of, hey, your employees are trying to rip you off. They’re trying to goof off on the company dime. They’re trying to not do work when they say they’re doing work. They’re seeding all this mistrust, essentially, and stoking at the insecurities that managers, especially managers new to something like remote work might have. I mean, a bunch of these tools pair things like, collecting time tracking data together with taking, for example, a screenshot of employees’ work stations every five minutes.

**(00:08:50)** In 2013, when we wrote Remote: Office Not Required, there’s a chapter in the book that has a lovely illustration with a bald boss with a cigar in his mouth sitting and watching 12 employees through webcams, right? And that was satire, or it was meant to be satire. Here we are, 2020, this is a thing.

**(00:09:14)** One of the tools had essentially that illustration we had from our book, where you can see 19 different screens at once, and then they point out, look! Someone is watching a video of cats on YouTube. [Simulates siren noise]. RED ALERT. RED ALERT. RED ALERT. Right?

**(00:09:31)** Apprehend that criminal right now! They’re watching a cat video. On the company dollar! And I thought, like. How is this a thing? How is the thing you use as the example of “abuse” a fucking cat video. I really just truly don’t understand. How does someone get to that where you’re like, yeah, that’s a grave offense and it’s worth all this machinery, it’s worth all these huge security holes. If you’re taking a screenshot of someone’s desktop all the time, you’re going to catch all sorts of shit. You’re going to catch confidential information, you’re going to catch sensitive information, and you’re going to send that off to a third party? And they’re going to store it? And they’re already in the business of essentially not trusting anyone? Why are you trusting them? It just seems like a profoundly bad idea. It’s a bad idea because it doesn’t work.

**(00:10:21)** Employees that do especially creative work, they’re not going to be better employees because you’re surveilling them. They’re going to be worse. That’s not how you extract that deep, creative diligent, motivated work. The human condition is not one that is eight hours of straight work.

**Shaun: (00:10:38)** No.

**David: (00:10:39)** You don’t show up and turn on your computer and then for 60 minutes out of every hour, for eight hours straight, just like, pump out productivity. That is not a thing. It’s a complete misnomer. So if we normalize that, no actually, that’s what you should be doing, we end up in a really, really dark place.

**Shaun: (00:11:01)** With all that in mind, David brought this issue to the Moral Quandaries group at Basecamp.

**David: (00:11:05)** And we then discussed it back and forth, what should the terms be, what should the rules be, and we came up with essentially two new clauses to our Terms of Service. One clause basically saying, you can’t use the API to integrate with employee surveillance software, and we defined what that means. And then the other clause said, hey, you have to get permission to use our logo for any API application. We’ll grant it in most cases, if this is a sort of benign integration, that’s wonderful. We want to actually promote that, that’s why we have the Basecamp.com/extras page, to promote all those integrations. They’re good for customers, they’re good for us, they’re good for everyone.

**(00:11:41)** They’re not good if the integration is into something like employee surveillance software. So we don’t want any part of that. So we put those two new clauses into our Terms of Service, and then we essentially went through our extras list, found all the violators, and sent them an email saying, hey, this is going to end. You have three months to pack your shit and get the fuck out of here.

**Shaun: (00:12:04)** Or change your ways?

**David: (00:12:05)** I mean… it was funny, because we discussed that, right? Are you going to tell someone where the basis of their business is employee surveillance and then you’re going to like, hey, you can stay integrated with us, just if you get out of the business that you’re in. That’s just not a realistic thing, right? It’s like someone writing Basecamp and saying, hey. We’re going to shut something off unless you get out of project management. Okay.

**(00:12:28)** So let’s not pretend, here. Let’s not pretend that people are going to do something that their paycheck depends on them not doing.

**Shaun: (00:12:32)** How many integrations were affected? How many emails did you have to send?

**David: (00:12:36)** I think we sent maybe four or five.

**Shaun: (00:12:38)** And have you heard anything?

**David: (00:12:40)** Yeah, it was interesting. It was very cordial, right? One of the smart things I think we did was to not have me send the emails. Because at the same time that these emails were going out, I was going off on Twitter, not exactly putting on my polite face to address these matters. So my personal stance was very clear. So, Kristin, our head of support—

**Shaun: (00:13:05)** Fantastic choice.

**David: (00:13:06)** Yeah, exactly. Kristin wrote, in a very sort of cordial way, just like, hello. Just letting you know. Essentially just saying, yeah, you’re in violation of our new Terms of Service and here’s a deadline by which you must get out of here. There were clearly a couple of responses that were aware of the general situation, probably perhaps, some had read my tweets or comments in the media about what I felt about it. And they were very short. Like, yeah. We’ll scrub Basecamp from all our pages. Or something like that. And then there was another one where it was like, oh, can you tell me what we can do to fix this? And you’re like, ah, let me, where do I start here. And then essentially reiterated, this is the policy, you’re now in violation of that policy. And what was funny was when this got announced, I basically just tweeted the pull request to our GitHub repository for all our policies that Jane had written up with these changes, and I just tweeted that out and I didn’t really make a bigger deal about it. Then one of these vendors writes us back, like, hey, could you maybe write something up on your blog that we can point customers to, to explain why this integration is being cut off.

**(00:14:18)** Dude, are you sure?

**Shaun: (00:14:20)** And that’s where the SvN post came from?

**David: (00:14:20)** That was where the SvN post came from. I was actually like, yeah, actually I should write this up, thank you for reminding me. I don’t think you’ll be pointing your customers to this page for some reason. It was not exactly, again, a neutral, professional, sort of, assessment of the situation. It was a very personal, enraged, assessment of the situation. But it’s one of those few things where I just… I mean, maybe it’s hard to tell the difference, but I get mad.

**Shaun: (00:14:49)** Genuinely mad.

**David: (00:14:50)** I get mad in the core of my soul. These employees, they go home, they donate their fucking spare bedroom, maybe part of their dining room table, whatever, to do the work. This is how you’ve repaid their willingness to make it work, that you go like, well, fuck you, I’m going to install an always-on camera that’s going to watch everything that you do in your own home?

**(00:15:17)** You think back on scenes from books like 1984 and you go, like, oh, Winston was sitting in a corner in his apartment because that was the only place the panopticon could not watch him. And then he knew that he couldn’t sit for very long because the panopticon would also notice his absence. And I’m like, yeah, that sounds about what’s going on right now. Except the technology’s even more invasive than what Orwell could have envisioned when he wrote that book, what? 60-70 years ago.

**(00:15:47)** It’s even worse. The authoritarianism and the surveillance that’s possible with modern software like this is significantly worse, and the ease with which it can be processed is way worse. One of the other segments from 1984 was this idea that you never knew when someone was watching. Orwell even had it in his mind that, oh, well, to get the effect of monitoring, you kind of needed to have someone watching. But if the person being watched never knew, they would always try to internalize this idea that they are being watched, right?

**(00:16:22)** Which is very similar to what’s going on. You don’t know whether that screenshot that just got snapped at the five minutes mark and at the next five minutes mark, is that going to be reviewed by someone? No one tells you. And I think what it does to the human mind to have this sense of constantly thinking, like, I am being watched, but maybe? It’s just so corrosive. And it’s just so damaging for the relationship between a manager and rapport. It is this adversarial thing, like, I think you’re cheating, and I think you’re trying to rip the company off. I’m going to set up systems so that I can catch you in the act.

**(00:17:05)** It’s one of those things where I’m just… I get these flash visions, right? Like, remember the Apple commercials?

**Shaun: (00:17:11)** The 1984 one? Yeah.

**David: (00:17:12)** Exactly, we’re swinging this hammer and letting it go and it’s smashing. And I’m like, I want that fucking hammer, and I want to smash that fucking source code right now. Just seeing, it goes down, and I’m imagining an old-school hard drive and the hard drive just goes flying and that’s the only version of the source code.

**(00:17:29)** That’s kind of how I feel about it. It’s not sort of like a, meh. It’s like, just boiling rage. Yeah. I mean, as soon as I start unspooling this tape, and there’s just all these directions where I’m like, this is disgusting, this is disgusting, and I just, I gotta calm down.

**Shaun: (00:17:48)** Well, I think that is a fantastic place to end. David, it’s always a pleasure.

**David: (00:17:51)** I was going to say, any time. But do you know what? I hope there’s not going to be another time where we’re going to have to talk about employee surveillance and despicable set-ups that are involved with that because they should just burn in Hell.

**(00:18:04)** Broken By Design by Clip Art plays.

**Shaun: (00:18:04)** Thank you, David. Oh, we got up to 2700 parts per million of CO2.

**David: (00:18:10)** How much?

**Shaun: (00:18:10)** 2700.

**David: (00:18:12)** Holy fuck. Yeah, open that door. Get out of there.

**Shaun: (00:18:14)** All right.

**David: (00:18:15)** All right, later.

**Shaun: (00:18:15)** Take care.

**Wailin: (00:18:22)** REWORK is produced by Shaun Hildner, and me, Wailin Wong. Music for the show is by Clip Art.

**Shaun: (00:18:27)** David is on Twitter at @dhh. And we are at @reworkpodcast. David has a nice write-up about Basecamp’s response to employee surveillance integrations on our company blog, Signal v. Noise. We’ll link to that, as well as the Washington Post article David mentioned earlier in our show notes, which you can find at rework.fm.

**(00:18:46)** REWORK is brought to you by Basecamp. Basecamp is the all-in-one toolkit for working remotely. Because of COVID-19, your company is likely scrambling to figure out how to transition to remote work. It may feel daunting but Basecamp is here to help. We built Basecamp to run our entire company and we’ve been working remotely for 20 years. We know what it takes, we do it every day and we built those learnings right into Basecamp.

**(00:19:08)** Learn more at Basecamp.com.

**Apple ad: (00:19:23)** [Grunt.] We shall prevail. [Explosion sound]. On January 24th, Apple computer will introduce Macintosh and you’ll see why 1984 won’t be like “1984.”

This is an episode title
