---
title: "Big brother at the office"
description: "Between cameras, sensor-equipped ID badges, and keystroke-logging software, employers are keeping an ever-watchful eye on their workers, all in the name of security or increased productivity."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/big-brother-at-the-office/
tags:
- podcast
---

# Big brother at the office

**Shaun: (00:00:00)** REWORK is produced by Basecamp. Basecamp combines all the tools teams need to get work done in a single streamlined package. With Basecamp, everyone knows what to do, where things stand, and where to find things they need. Give it a try with your team at basecamp.com

**Jason: (00:00:15)** We had found a Chinese threat actor exfiltrating really sensitive data out of our infrastructure.

**Wailin: (00:00:24)** In 2010, Jason Meller was starting his career in computer security at General Electric.

**Jason: (00:00:30)** GE is a conglomerate and back then it was even bigger and we had NBC, Universal. We were worried about influence from China on the Olympic Games. In 2008, and 2009 we had healthcare, aviation. You know, we had dishwashers for gosh sakes, you know, like we had all those things And we had one team really helping the various businesses with detecting evil in the organization. A dedicated computer incident response team. It’s called a CIRT.

**(00:01:00)** The way that we ran our detection mission at GE, which at the time is hundreds of thousands of devices, was by surveilling the network. And this is back in 2009, 2010, you know, SSL and TLS, the green lock that’s next to your browser. That wasn’t standard back then. And so when we saw traffic, we could read it in plain text, we could see exactly what sites you were looking at and what order you looked at them, how long you were on those sites, what you clicked on and you know what was in that. No matter what it was.

**Wailin: (00:01:29)** And that’s how Jason’s team detected this Chinese threat actor. Someone was trying to smuggle out a large amount of sensitive data from GE’s servers.

**Jason: (00:01:37)** We got word from GE, some of the high levels at the time that if you guys are able to access where they are pulling this data, we want you to go in there and use their own credentials to delete it because we don’t want them to have the data that they might be grabbing. It could be anything, it could be schematics for like the joint strike fighter or something horrific. So we want to just delete it and we want to show that we have this capability to kind of hack back if we need to. So we did that and we were so proud of ourselves. We were congratulating ourselves, this is great. We’re able to not only detect something in realtime, but we were able to actually delete it, so that they had no access to the data that they exfiltrated.

**(00:02:17)** Three days go by after this happened and we learn that we didn’t stop anything from happening. In fact, there was no attacker at all.

**(00:02:25)** Broken By Design by Clip Art plays.

**Wailin: (00:02:26)** Welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m Wailin Wong.

**Shaun: (00:02:31)** And I’m Shaun Hildner.

**Wailin: (00:02:32)** Are you a fan of the casual dining restaurant chain, Outback Steakhouse?

**Shaun: (00:02:37)** I’ll be honest, I’ve never been to an Outback Steakhouse. I do love the name of the bloomin’ onion though.

**Wailin: (00:02:44)** Right, but you’ve just never eaten one.

**Shaun: (00:02:45)** I’ve never eaten there, yeah.

**Wailin: (00:02:46)** Right? I haven’t eaten there since high school, but the reason I bring it up is because Wired Magazine last month published a story about how an Outback franchise in Portland, Oregon is testing a program called Presto Vision, which sounds like a fun, magicians thing. But what this actually does is take camera footage from restaurants and spits out metrics about stuff like how often does a server check in at a table or how many customers decide to leave rather than wait around in the lobby.

**(00:02:46)** I looked up the press release from Presto about this product and it said quote, “The system uses AI to alert managers of opportunities to optimize restaurant operations.”

**Shaun: (00:03:26)** Oh, that just sounds so gross.

**Wailin: (00:03:28)** It’s not just workers and customers in the service industry that are being watched by machines these days. There is software out there that lets employers track every keystroke and website visited on a work computer. You can even get employee badges that come with location sensors and an accelerometer.

**Shaun: (00:03:45)** If these stories of workplace surveillance make you uneasy, you’re not alone. On today’s episode, Wailin talked to Jason Meller who has made a career of walking that fine line between keeping data secure and outright spying.

**Wailin: (00:03:57)** Let’s get back to Jason’s story. He was working at GE and his team thought they had prevented a huge theft of sensitive data, but it turned out there hadn’t been any threat at all.

**Jason: (00:04:08)** What actually ended up happening, there was this poor contractor that was in India and he decided to just encrypt all of his photos into a zip file and then send them over FTP or somewhere to like a personal server and that looked like actual sensitive information. It hit all of the triggers and detection rules that we had that matches that pattern of behavior, which is very unusual. So we actually went and we deleted all of his photos. We deleted all of his family photos. And the thing that really bothered me was, in India, the contractor that we were working with at the time didn’t really look kindly on doing any personal stuff in the office, so they ended up firing him.

**(00:04:53)** That was the moment that I realized, at least personally, that you might be able to stop evil with a lot of surveillance, but at the end of the day is it worth the one or two casualties of the collateral damage of you making a misdetermination. Is all the security theater and the surveillance that we may decide to add to our lives really worth innocent people actually being caught in the net inadvertently and having their lives potentially ruined.

**(00:05:18)** That was the moment where I realized that surveillance and invasion of privacy for the additional insight into maybe solving some security use cases isn’t always a perfect trade off. And we have to be very, very deliberate about what the security value is of the surveillance that we add and we need to make sure that we’re being very intentional about what we don’t include as well.

**Wailin: (00:05:41)** That was almost 10 years ago. Today, Jason runs a security company called Kolide, which he co-founded in 2016. Originally Kolide was based on software made by Facebook as an internal tool for its employees.

**Jason: (00:05:53)** Facebook created this open source endpoint agent, you put it on Mac, Linux, Windows devices. And basically what it does is it allows you to kind of transform that device into a queryable database. You could actually pull information from the device. We thought that a great premise for the company would be to simply take this end point agent and then build a user interface around it. And in some cases that panned out, but there were only a limited amount of companies that really saw value in the transparency of the agent. And even worse, we saw that the types of things that they were querying for kind of didn’t, at least in my opinion, serve the needs for the security team, but almost felt a little like surveillance. From my perspective, that just wasn’t something that sat right with me.

**Wailin: (00:06:41)** Did you have any conversations with customers or potential customers where they were asking you for features or something like that where you thought, gosh, I’m not sure this is being used the way we want it to be used?

**Jason: (00:06:53)** Absolutely. A good example of this is we were talking with one prospect and they wanted to track the location of the device and notify administrators when that device potentially moved into a particular set of regions in the world that they deemed to be high risk like China or Russia. But the way that they sort of were advocating for us to build it was that they wanted us to really kind of show the location at all times and then allow them to build their own alerting on top of that. That’s sort of the situation where we realized, “Oh my gosh, we’re building a people tracker where people can actually sit down at a console and see where everybody is physically located in their organization.” Like, that’s not acceptable.

**(00:07:38)** That was the moment where I realized that we had no North Star in our organization to actually make good decisions about the features that we wanted to build. And we could be in a position where, as we grew as a business, as I had more product managers underneath me, they could essentially make that decision without necessarily feeling guilty about it because we just don’t have any guidelines around how we want to handle that.

**(00:08:01)** So that was a huge turning point for me, I would say, morally where I realized, Oh my gosh, we have to be very, very intentional about the features that we’re building because the security value might be there. There’s an argument to be made, but it’s not worth the cost of that end-user’s privacy and we may need to be the arbiters of that and not work with customers that want to spy on their employees.

**Wailin: (00:08:23)** When you came to the realization that you didn’t like the direction you are going, how hard of a stop was it?

**Jason: (00:08:30)** Well, it turns out that it’s really hard to grow when you’re just selling what is essentially user interface on top of an open source project. So we kinda hit a point where I realized that we weren’t going to grow as a business unless we were solving a real problem. So we had an opportunity to hit a reset button at the beginning of this year and then really taken all these learnings and then develop a product from scratch that I’d say adhered to all the philosophy and our North Star that we have inside of our organization now.

**(00:08:59)** So we had this incredible privilege to be able to do that at the beginning of this year and really just start fresh because the direction that we were heading wasn’t going that well. And it seemed as though, in order for us to succeed with our original product, we would have to violate the ethics and morals that at least I personally hold over and over again to the point where we were building, essentially, security spyware. And that just wasn’t a direction that I was willing to go in.

**(00:09:27)** The United States isn’t quite there yet, but other people are waking up and realizing that you can have security and compliance without simultaneously surveilling your employees and you can give them control over their computer and not necessarily lock things down and make them impossible to use. Those are all ideals that we could, we could bring in together and you know, in this primordial soup and conceive of a product that’s really awesome. So we were lucky that we were unsuccessful so that we could actually take the time to build something great.

**Wailin: (00:09:56)** It wasn’t just about what not to do. Jason’s revamped company and product would have to be clear about what it did stand for and what problem it wanted to solve.

**Jason: (00:10:05)** There really is a lack of security solutions out there that meet the following requirements. One is that we trust end users to do the right thing, but we want to remind them in case they, you know, temporarily forgot or they, misconfigured something by accident. So working off that base assumption. Number two is we don’t want to surveil our users or make them have this sort of psychic cost of constant surveillance. We want to be very transparent that we have an agent running on their device, but we want them to be keenly aware of what it can and cannot collect and who in the organization can see the information that’s actually collected. So that’s really important to us. We saw this as a massive gap in the market and that’s really what we built, Kolide to resolve.

**(00:10:55)** So at the end of the day, if someone asked me what Kolide does today, it’s just simply an app that messages your employees when their laptops aren’t meeting security best practices. It pings them or sends them an email with instructions on how to fix the problem and then it gives them some tools to just make sure that they did it right. And that’s all it is. And if you work off that premise, you can get a lot done without necessarily violating the security of your users.

**(00:11:16)** And this has been incredible for us as a business in terms of finding all these organizations that we’re looking for the solution because their cultures align well with that philosophy. An end user, especially a software engineer, they have to violate the security policy in order to do their job. And so if you generate all these alerts or you give an administrator all this ability to sort of lock down their device, that actually can impede them from doing their work and they can end up bringing actually their personal computer in to work around some of those restrictions.

**Wailin: (00:11:49)** Is that because they’re always testing something or they’re trying something new that perhaps the system as it’s set up doesn’t recognize as being like a legitimate use case or something?

**Jason: (00:11:58)** Yeah, exactly. So a good example, this is on Mac OS, there’s a feature called Gatekeeper. And the whole point of Gatekeeper is to prevent you from running apps that aren’t signed by an authentic developer. And when you’re building apps, you don’t necessarily sign them every time that you’re working on them in real time. And so when you want to launch those applications, suddenly, you know, it makes sense. Maybe I just want to turn off Gatekeeper for a few minutes while I’m working on this use case. Well, most people will turn it off and then they forget about it for months or maybe even forever.

**(00:12:32)** That’s the issue. Is that if you prevent them from ever turning off Gatekeeper, suddenly they feel restricted in their ability to do their job. They are more motivated to actually bring their own personal device to work. And if you don’t ever remind them and just give them an allowance to control it themselves, they’re going to turn off when really they only wanted to turn it off for a few minutes.

**(00:12:53)** And that was sort of a key understanding that we had to embrace that use case, that in order to do your job effectively, you need to freedom to be able to use your device properly. But you also need a little reminder sometimes to just set the things up correctly.

**(00:13:11)** And I think that that jives a lot with the cultures of a lot of the organizations that we’re working with, where locking out a device and then asking users to go through this long multistep process to get an exception made for a policy to get something done. It just, it’s not going to work out from a productivity standpoint. Or they’re going to get frustrated and they’re just going to start bringing their own devices into the office. Security teams are definitely motivated to just make sure everything is as secure as possible because they don’t necessarily have to put themselves in the position where you have to empathize with the end users as much until it’s like a really serious issue. And we wanted to build a security platform that kind of brought that empathy to the forefront and really kind of considered how people really use their devices and then actually build a solution around that.

**(00:14:02)** Broken By Design by Clip Art plays.

**Wailin: (00:14:04)** After the break, Jason talks more about building security for real use cases of technology in the workplace. But first Lexi on the Basecamp customer support team is going to tell you how she used Basecamp to write a book.

**Lexi: (00:14:16)** I wrote my first book last year and I started writing it bit by bit with no clear timeline or narrative. So four or five different times I have literally printed out all the pages and like laid them out on the floor to rearrange them, to change the timeline and like change the sequence and stuff. The third time I was like, why didn’t I just organize this bit by bit in Basecamp because you can just like drag and drop a document into a different location. So now that I’m doing an essay collection, I’m writing the essays in Google docs and then putting them in Basecamp as a Basecamp document and then moving them around and color-coding. It’s so satisfying. So now I don’t have to like print a bunch of stuff. Spend money on my ink toner, which is a big budget item.

**Shaun: (00:15:02)** Learn more and sign up at basecamp.com.

**Wailin: (00:15:06)** So Jason Meller wanted Kolide to be about empathy for the end user and really understanding how people use technology at work. It’s not just about the problem of employees bringing their personal devices to work to get around overly stringent security protocols. A lot of employees use their work devices for personal stuff. Jason says his European customers have a more realistic grasp on this.

**Jason: (00:15:29)** They don’t try to create this concrete definition of this work computer that is never going to be used for a personal item ever in the future. Again, they understand the realistic aspect that when a company buys you a computer, it’s probably the best computer that you own, if you work for a good company.

**Wailin: (00:15:43)** Yeah.

**Jason: (00:15:43)** And you’re gonna want to use it for stuff. If you’re working remotely and you like to work during your own hours, it’s just not something… it’s not realistic to expect an employee to be so regimented that they’re going to close their work laptop and open up their personal laptop every time they want to like check their Amazon order or something like that. And so to kind of hide behind this idea that, Oh, this is a work computer, therefore we have the legal right to fully surveil it. I just don’t, I don’t think that that argument holds water anymore.

**(00:16:20)** And I believe that the companies that we deal with, in Europe especially, agree with that. But in the United States and you know more broadly in North America, they’re still operating under that false assumption. It might be legal to, fully surveil a and asset that you’ve given an employee, but is it morally correct? And are we moving in the direction, at least in the United States, where eventually we’re going to catch up. And we realize that it’s really unacceptable for an employee to give us a device that really kind of is something that we need to use every day. And then suddenly they’re allowed to monitor every facet in the name of security and compliance. We just don’t think that’s acceptable.

**Wailin: (00:17:00)** What would you say are some of the most salient transparency features that you offer that you might not see out in the world?

**Jason: (00:17:10)** So, it’s so funny. I was showing our product to somebody else, another security person, and they looked at me and they go, Oh, that’s a cool GDPR dashboard you got there. And I realized that the things that the GDPR sort of advocates for are the common sense things that a normal person would have about data that they believe is valuable. And imagine it’s your healthcare data or something about your financial records. What are the concerns that you’re going to have? Well, you’re going to want to know exactly what data that they’re collecting. And how long they’re storing it for. And you want to know who can see that data and when they see that data, you want to know every time they do that. There’s a lot of great discussion right now about constant consent around data collection. And that’s something that we feel strongly about as well, where an end user should have to continuously consent, at least on a regular basis to that data being collected.

**(00:18:11)** And you should be able to use very clear language to explain what data is being collected, how it’s being used, who can see it, and when they do see it without kind of resorting to these massive privacy policies that are hard to read and sort of scan through as a lay person.

**(00:18:29)** And we didn’t look at this from the perspective of trying to achieve GDPR compliance. In fact, that wasn’t even on our roadmap. We just wanted to build something that was easy for people to understand and we accidentally sort of slept walked our way into a GDPR compatibility. So that was something that was really interesting to us is that I think it says a lot for that set of laws that’s sort of under scrutiny right now by the greater tech community, that there’s a lot of common sense stuff in there and you can actually do the right thing and be in compliance with GDPR just by trying to anticipate what a concerned user would want when you’re handling data that’s valuable to them.

**Wailin: (00:19:09)** Are you hoping that in maybe a small way or maybe a big way that having your product out in the world might start the kinds of conversations, especially in North America that would lead to kind of more grassroots efforts to question data collection and things like that?

**Jason: (00:19:29)** Yeah, I hope that we can help at least start that conversation in the United States. One thing I will say though is that it’s not necessarily fair to blanket the entire US as sort of accepting, I guess, passively all of the surveillance and sort of security theater that we see on a regular basis. Obviously, you know, September 11th had a big contributor to that sort of a notion that that was something that we should be doing. There’s a lot to our history where we have decided to increase surveillance and we haven’t necessarily measured the positive impact of that. But as a nation we’ve certainly embraced more surveillance to minimize our, I guess, perceived threat of the things that could happen to us.

**(00:20:17)** That being said, I think that there are great United States companies out there that embrace the right cultures and attitudes. Basecamp is definitely included in that list. We are in a position to build a product that matches that culture. You don’t necessarily have to sacrifice that culture that you’ve created to get to positive security and positive compliance. You don’t necessarily have to throw out your entire methodology for how you build products and how you ship software just so that you can be secure.

**(00:20:51)** Basecamp proved that that was true with Shipshape. Netflix did it with another thing that they built called Stethoscope, which is very similar, and they decided that they were going to put their culture first and use that as the North Star for how they really approach security and compliance and how they think about, you know, potentially surveilling or not surveilling their employees.

**Wailin: (00:21:13)** Yeah. Do you know if Netflix is considered to have good security practices when it comes to collecting data on customers?

**Jason: (00:21:22)** I don’t know exactly what they do from a data collection and I think that one’s a little bit tricky because it’s very important for them to gauge the success of a particular program on Netflix based on how many people are watching it, how often they watch it, what are their behavior patterns there. And I think that, you know, they would be foolish at least to their own shareholders to not do that. But what they’re doing with their own employees at least matches this user focus sort of security ideal that I mentioned earlier.

**(00:21:53)** Now, can you really be of the same mind where you’re scrutinizing every moment of your customer, but you’re also kind of leaving your software engineers alone? Is that really fair? I don’t know. And I think that I’m just glad that at least one of those populations of people are at least not under sort of a thumb of surveillance.

**Wailin: (00:22:13)** You heard Jason mention Shipshape. This is an audit tool we developed in house at Basecamp that makes sure employees’ computers have the most up to date security settings. It’s a continual work in progress, too because it’s good for companies to reevaluate their security practices, dare I say, constant surveillance of your soul. Without this kind of vigilance, small decisions can calcify into entire pillars of corporate culture that actually cause harm.

**Jason: (00:22:40)** Google, you know, is sort of the famous, or I guess infamous example now, of “Do not be evil.” That’s not necessarily concrete enough to really not be warped and manipulated later on in the company’s life cycle with a totally different set of executives and corporate leadership. Where suddenly evil is this very relative term. I think it’s very important to be precise about what is evil, what do you consider evil, what’s going to be sort of morally or ethically out of bounds for your organization as you understand it today. And I think it’s important to revisit that North Star guiding principles on a regular basis as your business changes and you learn more about the data that you’re collecting and why you’re collecting it. I think that it’s important to collect data because that’s how you add value. You need information from other people in order to generate value, but you have to take that with at least a minor amount of responsibility about reasoning about all the use cases about how this data could be utilized to do something that you do not intend. And you need to think around those use cases, just like you have to think about business risk for all sorts of other things.

**(00:23:48)** I think as a data holder, we all have to think about the risks of collecting the data, holding onto that data, and then exposing that data to other people who wouldn’t necessarily have it. Even in the same legal entity, inside of an organization. And if you’re not doing that today, I think you’re going to be in a position where suddenly you have this up and running program that’s contributing revenue to your organization and now suddenly, you’ve created a monster and it’s really hard to stop it without it really looking like you’re hurting your shareholders or you’re hurting your investors. And I think it can be easily avoided if you just sit down and really think about the risks associated with your data and the things that you feel are morally and ethically out of bounds for your organization.

**Wailin: (00:24:32)** REWORK is produced by Shaun Hildner and me, Wailin Wong. Our theme music is Broken By Design by Clip Art.

**Shaun: (00:24:38)** You can find show notes for this episode rework.fm. Follow us on Twitter at @reworkpodcast and if you have a second we’d love if you’d leave us a review on Apple podcasts. This really helps other folks find the show and keeps us shipshape and Bristol fashion.

**Wailin: (00:24:54)** I thought you were going to do a Cockney accent.

**(00:24:56)** REWORK is a production of Basecamp. Basecamp is an online program that helps you manage business and personal related projects. It has several tools for keeping you organized like to dos, message boards, and schedules. Sign up at basecamp.com

**(00:25:12)** Broken By Design by Clip Art plays.

**Shaun: (00:25:22)** I can’t remember. Did you watch episode three of Watchmen?

**Wailin: (00:25:25)** Yeah.

**Shaun: (00:25:26)** So you’re watching weekly now.

**Wailin: (00:25:27)** We’re watching weekly. I’m fully caught up.

**Shaun: (00:25:29)** Okay, good, good, good, good. I’m really excited. I love the Laurie Blake character.

**Wailin: (00:25:34)** Yeah, and I you had to fill me in on who she is because I have not read the novel and I had also forgotten everything that happened in that movie, which was very confusing. Like the movie made—

**Shaun: (00:25:43)** It was a very bad movie.

**Wailin: (00:25:45)** The movie made no sense to me.

**Shaun: (00:25:46)** No, no.

Wailin [00:25:46] You would probably recommend from the Zack Snyder oeuvre 300 over Watchmen.

**Shaun: (00:25:51)** I would recommend 300 as the only Zack Snyder movie worth watching.

**Wailin: (00:25:56)** I think I saw he made Batman? Batman Versus Superman?

**Shaun: (00:26:00)** Yeah.

**Wailin: (00:26:01)** Is that a movie? I think I saw that one.

**Shaun: (00:26:03)** The Dawn of Justice, I believe that movie is called.

**Wailin: (00:26:06)** I think I saw that. Does that have Wonder Woman in it?

**Shaun: (00:26:08)** It does, briefly.

**Wailin: (00:26:09)** Okay. Then I saw that one.

**Shaun: (00:26:09)** And also their entire—Batman and Superman’s entire conflict was resolved because their mothers had the same first name.

**Wailin: (00:26:18)** Is that what happened?

**Shaun: (00:26:18)** Yeah.

**Wailin: (00:26:19)** I blocked this all out of my memory.

**Shaun: (00:26:20)** Yeah.

**Wailin: (00:26:20)** Martha?

**Shaun: (00:26:20)** Yup.

**Wailin: (00:26:23)** Oh, yeah. Their moms do have the same first name.

**Shaun: (00:26:25)** And that’s when they became friends.

**Wailin: (00:26:27)** Huh.

**Shaun: (00:26:27)** Yeah. It’s pretty rough.

This is an episode title
