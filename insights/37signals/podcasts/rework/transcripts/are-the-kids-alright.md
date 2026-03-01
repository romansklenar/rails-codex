---
title: "Are the kids alright?"
description: "In this anxious era of bullying, teen depression, and school shootings, tech companies are selling software to schools and parents that make big promises about keeping kids secure by monitoring what they say and write online."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/are-the-kids-alright/
tags:
- podcast
---

# Are the kids alright?

**(00:00:00)** Anyone You Meet Normcore Remix by Clip Art plays.

**Shaun: (00:00:02)** REWORK is brought to you by Basecamp. When your internal communications are spread across emails, document drives and group chats, people put things in the wrong place, things get lost in translation, and it’s hard to hold anybody accountable. Basecamp puts all your internal communication in one place so everyone sees the same thing and nothing gets lost. There’s still time before the new year starts to make a change. Put a stop to scattered information and miscommunications and set your team up for success in 2020. Go to Basecamp.com to sign up for a free 30 day trial.

**Wailin: (00:00:39)** When Gennie Gebhart was a kid, she and her friends wanted to get on a cool new website called Myspace. The problem was that site was blocked on their school computers.

**Gennie: (00:00:47)** I wanted to get to Myspace. I couldn’t do it, and so I figured out how to use a proxy and that was the first time I realized wow, I can make the computer do what I want it to do. It was a big light bulb moment. That was kind of cute and fun.

**Wailin: (00:00:59)** Today, Gennie is Associate Director of Research at the Electronic Frontier Foundation or EFF, an online privacy rights group.

**Gennie: (00:01:06)** My very first day here in the office, I was assigned to working on student privacy and leading a report that we ended up publishing a little over two years ago. We were looking at Google apps for education and school issued Chromebooks primarily, but now the lines have blurred so far beyond any of the issues that were really kind of state of the art in terms of the student privacy playing field in 2017.

**(00:01:30)** Now we’re seeing students, what they’re exposed to, face recognition, exposed to gait recognition and surveillance, exposed to kind of comprehensive text mining of everything they’re typing out. I worry very much that we’re kind of socializing a new generation that this is the bargain. That you trade your privacy and your interiority for convenience or for safety.

**(00:01:52)** Broken By Design by Clip Art plays.

**Wailin: (00:01:54)** Welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m Wailin Wong.

**Shaun: (00:01:58)** And I’m Shaun Hildner. We’ve been talking a lot about privacy and surveillance on the show recently. We did an episode about how Basecamp removed tracking pixels from its emails and we did an episode about how employers monitor their workers. Today we’re looking at a population that’s being monitored at an earlier stage, children.

**Wailin: (00:02:14)** Parental or societal anxiety around the safety of children is not new, but these fears have been amplified by technology at the same time that we’re dealing with teen depression, mental health challenges and school shootings. Adults are desperate for solutions and there’s a number of companies that are marketing software to both schools and parents promising to help keep their kids safe. These programs might pinpoint a child’s location or scan their social media posts for certain keywords.

**Shaun: (00:02:43)** On today’s episode, we’re going to take a closer look at the software that monitors kids and the tradeoffs we’re making in the name of protecting young people.

**Wailin: (00:02:50)** This episode gets us into territory I’m pretty allergic to on a personal level, which is evaluating how people parent. Women and mothers in particular are subject to scrutiny and shame around parenting decisions on a level I find horrifying. But the issue of children and privacy is an important one, not just for parents, but for anyone who’s concerned about surveillance capitalism, which I suspect is much of our audience. And if you’ve been following our show, you know that we’ve been talking a lot about privacy, big tech, artificial intelligence, and the harm that gets perpetrated, often unwittingly. We operate as though technology platforms are neutral.

**(00:03:27)** This issue touches on all those topics and Basecamp, both as a company and as a software product is not neutral when it comes to these issues. I’m not neutral, so we’re going to get into it.

**(00:03:38)** One quick note, you won’t hear directly from any of the software companies themselves. I reached out to several of them, but they either didn’t get back to me or declined to be interviewed.

**(00:03:47)** Okay. Here’s the show.

**Caroline: (00:03:50)** My name is Caroline Haskins. I’m a technology reporter at Buzzfeed News. I covered things that have to do with surveillance capitalism, tech power, things that come in between those things.

**Wailin: (00:04:01)** Buzzfeed News has been doing a series on school surveillance and in November it published a piece by Caroline about Gaggle, a company that makes what are called for-profit safety management tools.

**Caroline: (00:04:12)** I knew that Gaggle was a thing for a long time because it was actually used at my high school. It’s been around since 1998 but the difference is that over the past couple of years, Gaggle has been offering more and more services and recently it became a Google Partner for Education, meaning that it’s promoted by Google as something that partners with it’s G Suite tool. And the reason why it’s adopted by so many schools, especially over the past couple of years, there’s an increasing amount of paranoia about a couple of things.

**(00:04:41)** There’s a lot of anxiety around school shootings and around mental health issues in students, meaning teen depression, suicides. Both of these things require a lot of resources, but where Gaggle comes in is that it pretty much offers itself as a tool that’s able to address these problems at a relatively low costs. I mean it still costs like tens of thousands of dollars, but it’s less than the typical salary of one on-staff individual. It promises that it can save student lives from suicide, hundreds of lives per year by pretty much monitoring anything that kids input on their school accounts.

**(00:05:21)** So this includes email, calendar, events, chats, and even documents like a Microsoft Word document or a Google document. They’re looking for trigger words and artificial intelligence driven tools are going to scan things and look for specific words. So this could be a combination of profanity and things that Gaggle deems to be associated with self-harm, bullying, harassment, things that are questionable, things that have to do with drugs.

**(00:05:48)** Even things that have to do with being an LGBTQ student, like the word lesbian was flagged for instance. That’s basically how Gaggle works. The AI flags the words and a contract worker that’s paid around $10 an hour is responsible for going through it all and escalating if they believe a student is actually at risk or not.

**Wailin: (00:06:09)** The response can range from emailed warnings to students to emailing or calling administrators directly if there’s evidence of imminent self-harm or violence. And if the company can’t get in touch with the school for urgent alerts they call law enforcement.

**Caroline: (00:06:22)** When I talked to adolescent mental health professionals, one thing that they emphasize is that escalating things like this, calling the police, calling teachers, that could also have adverse consequences for their mental health treatment. And could actually set them back rather than helping them if they aren’t actually at risk of harming themselves in that situation.

**Wailin: (00:06:45)** Gaggle prominently touts its ability to prevent self-harm among students on its website. It says in the 18-19 school year, Gaggle helped districts save 722 students from carrying out an act of suicide. That’s a very specific number and they’re not the only company making big claims about saving lives. The website for Bark, a company that makes monitoring software for both schools and parents says “16 school shootings prevented, 20,000 severe self-harm situations detected.” Caroline Haskins, who’s reporting at Buzzfeed News focused on Gaggle. So these kinds of numbers are difficult to verify.

**Caroline: (00:07:21)** You’re trying to quantify something that did not happen. Just by the nature of the situation, it’s really hard to point a firm number on it, especially given the way that Gaggle actually works and the way that it’s disconnected from the end of the line outcomes.

**Ryan Stanley: (00:07:37)** The sales pitch is it stops shootings. It stops self-harm. A lot of that I don’t see. But I am involved in, let’s get it set up, let’s get it integrated into the systems and whatnot and then it’s sort of a set it and forget it kind of thing.

**Wailin: (00:07:53)** Ryan Stanley has worked in IT for Alaska Public Schools for the last 20 years. He’s based in Juneau, the state capitol, and provides IT services to mostly rural districts.

**Ryan Stanley: (00:08:03)** I think we have about a dozen districts right now. One of them has one school with 10 students in it. Another one has six schools that are each in their own village and each village is 150-200 plus miles away from the others. One of those villages, when you look at it from the aerial map, the entire village is smaller than the landing strip.

**Wailin: (00:08:26)** Ryan has seen school districts around Alaska contracting with companies like Gaggle and another one called Managed Methods. Both integrate with Google G Suite and Microsoft Office 365 making them attractive to schools that are already using these educational tools.

**(00:08:41)** Ryan is also a parent. His daughter attends a middle school in Juneau that uses Bark. This is the company that has products for schools and families and said it’s prevented 16 school shootings. Bark for families is $9 a month. Bark for schools is free and has a feature called the Parent Portal that sends notifications to families during non-school hours, like weekends and holidays. The portal also sends weekly summary emails.

**Ryan Stanley: (00:09:06)** In the email it says something like activity: five Google documents and seven emails or something like that. But when you click on the links, it invites you to sign up and subscribe. So they can give it away for free to schools so that they can get access to advertising directly to those families, so that the families can then sign up and use it on more than just the school device.

**(00:09:30)** In my daughter’s case, she and her friends were specifically researching the rates of domestic violence against women in Alaska, which is ridiculously significant, those numbers. And that caused our principal to come in and chat with her about it because the principal got an email that had a list of keywords in it but didn’t really know what was actually happening in the classroom.

**(00:09:52)** Some of the emails quite literally are just a list of the keywords with the number of instances in them, so it doesn’t say the students seems like they feel this. It says, this document has this many instances of the word gun, this many instances of the word hate, this many instances of the word die, or whatever.

**Wailin: (00:10:12)** Ryan wrote an Op-Ed for the Juneau Empire about the use of Bark in local schools. In it, he argued that using the software could lead to young people censoring themselves. He talked to one of his daughter’s middle school classmates who’d also been flagged for a false positive.

**Ryan Stanley: (00:10:26)** When I asked her, is this going to change how you do your schoolwork. And she said, well, I probably just won’t use those words anymore. She wasn’t concerned so much about getting flagged or even at that her principal came to talk to her, but it was more just that she didn’t want to have the hassle. And so rather than take a risk of having the hassle of having to have a conversation with the principal, she’s just going to avoid using certain words in her schoolwork. And that’s hard because especially in the younger grades, you want to figure out how to get students to be as creative as possible. You don’t want them to be censoring themselves.

**Wailin: (00:11:06)** In Juneau, the school district got pushback back from students and parents over their rollout of Bark. As a result of the backlash, the district got the company to make some changes, like holding data for a shorter amount of time and cutting the profanity filter. Bark also agreed to stop sending marketing emails to parents about their paid service.

**Ryan Stanley: (00:11:24)** Yes, we do need to be able to use technology to help deal with the huge tidal wave of technology, but we have to also figure out a way to bring the humanity back to it. My hope for the school that my daughter goes to and the high school that she’s about to go to is that we’ll have more than just these sort of false positive-laden emails going to a principal, but that we’re actually being a bit more active about teaching students and the adults how to build good academic relationships that support each other.

**Gennie: (00:12:01)** There’s an argument that false positives are worth it. If we can save those 700-something lives.

**Wailin: (00:12:06)** Again, this is Gennie Gebhart from the EFF.

**Gennie: (00:12:09)** Again, kind of no evidence of what the counterfactual is. No evidence of what other more tried and true interventions would have done. Right. It’s very hard to test that claim. We haven’t seen any independent evaluations of those claims. But the false positives that we see, you have comical cases where, for example, students are texting about To Kill A Mockingbird.

**(00:12:28)** There was a school where one of the teachers last names is Razor. But then we keep going down the false positive road. Well, what if a student is texting about lyrics to songs? Would that disproportionately impact students of color, or students who are listening to music by musicians of color and listening to hip hop? And so it’s exposing kids to much more scrutiny, much more automatically, in ways that have really concrete harm, that are going to disproportionately impact kids who might already behave in ways that are outside the norm.

**(00:12:57)** It could in many districts impact disabled students disproportionally, students of color disproportionately. We’re seeing a rush across the nation, really, of school districts. A rushed to this technological fix to these problems with huge emotional stakes without enough investigation of what the harms could be to students.

**Wailin: (00:13:15)** Caroline Haskins at Buzzfeed News has identified another concerning aspect of Gaggle. It has a three strikes rule, which contacts school officials in the case of multiple violations. Because the system scans for words like gay, lesbian, and queer, this means that a student using the word queer three times for example, may get flagged.

**Gennie: (00:13:35)** So even though it’s not the same as threatening another student, which gets escalated to teachers immediately, if you do something three times and meet Gaggle’s three-strike rules, it’s still going to get escalated.

**(00:13:48)** Sarah Roberts, who’s a scholar who specializes in content moderation, she also talked about how three-strike rule like that and books this sort of logic or the judicial system in a way that’s a little bit strange for a student that’s using profanity or things that have to do with like LGBTQ expression on a school account.

**Marika: (00:14:05)** We’re concerned about the fact that this information will be shared with law enforcement and that it could actually be used to create profiles of young people that would not have interactions with the system while they’re still in school.

**Wailin: (00:14:20)** Marika Pfefferkorn is the Executive Director of the Midwest Center for School Transformation in Minneapolis, Minnesota. Her work focuses on data, smart cities, and education.

**Marika: (00:14:30)** This is data collection. This is surveillance and data collection and it just makes it much easier to criminalize students when you have all this information.

**Wailin: (00:14:39)** Earlier this year, Marika was part of a group of community leaders in St. Paul that helped end a data sharing agreement between the public schools, the city, and the county. The agreement would have used predictive to assign a risk score to young people.

**Marika: (00:14:54)** One of the indicators that they were going to use to assign a risk score was a student’s suspension record. And understanding that in Minnesota the suspensions are punitive in nature and harm a lot of black and brown children. And in 2018, 43 school districts were identified for discriminating in out of school suspensions with black and brown students. There are trends that say, a white student might do one behavior. A black student do the same behavior, but it’s described differently and therefore the punishment is also very different. Where a white student, they’re just precocious. Where a black student would be described as loud and disruptive.

**Wailin: (00:15:35)** The Brennan Center for Justice, a think tank, and advocacy group has been tracking the use of surveillance technologies in schools. It says that school districts spent $1.1 million on social media monitoring in 2018, up from just $15,500 in 2013. The Brennan Center was pulling its numbers from a database of self-reporting government purchases so it thinks the real amount of spending on the software could be much higher.

**(00:16:00)** Marika Pfefferkorn, Gennie Gebhart, and others say this environment of increased surveillance and law enforcement in schools is one that feels especially punitive to students of color and other vulnerable populations. That atmosphere can lead to students getting pushed out of the traditional school system.

**Marika: (00:16:17)** A lot of conversation has been emerging around safety in particular after the school shootings. And so there are a lot of vendors out there that are providing what they’re calling alternatives to school districts to prevent such things from happening. What we have seen is an increase in surveillance of students, whether it’s by having more metal detectors, the increasing use of cameras across schools, school resource officers that have body cams

**Gennie: (00:16:47)** Using face surveillance, using gait recognition on students. Using GPS to track where they are on school grounds. We’re also seeing different kind of text mining and kind of artificial intelligence or machine learning powered tools to do things as simple as flagging keywords, to kind of much more insidious things like trying to flag what activities a kid may be interested in doing and when.

**Marika: (00:17:09)** The way you interpret what you’re reading on social media can be looked at through a racially biased lens and again you end up hyper-surveilling students of color because of the way they talk, not because of actions that would actually lead you to believe that they were a threat.

**(00:17:27)** There’s a long history of concern with communities of color about how that information is being used or will be used, whether it’s for identifying undocumented students with ICE and sharing that information with them. Or it could actually be used against families that they’re collecting social media information around that one student, but they’re also collecting information about their siblings, their peers, and their family members.

**(00:17:52)** And so what is on one person’s social media page could include a lot of people that are giving up their information without their knowledge. When it comes to this monitoring, we look at the school shootings that have happened and it has not been our black and brown students that have been involved in those shootings or are being the shooters and yet we see this hyper level of surveillance that’s going to be happening in our urban communities that will fixate on black and brown bodies and that really is concerning to us.

**(00:18:24)** This new approach to school safety is not coming from youth, it’s not coming from parents. It’s often coming from officials and vendors who are trying to sell solutions. Because what folks, and myself included, have been asking for is we’d like to see a greater presence of counselors and social workers versus having school resource officers and metal detectors. And what we see as a divestment in those types of solutions and investment in technology versus human-centered approaches and solutions.

**Gennie: (00:18:58)** This approach of surveilling your children in the name of keeping them safe, it’s again kind of this techno magic cure that promises to see patterns and catch signs that we as humans miss. But again, there’s very little evidence that it does, and it’s an easy out when maybe the harder thing is talking to your kids. We see the same thing for schools, right? It is maybe in some ways an easy out that promises to be a new thing that will improve on the methods we already have. But maybe dedicated professionals and involved parents are already some of the best methods out there that are very hard to improve upon and that I think machine learning certainly can’t match.

**(00:19:32)** Anyone You Meet Normcore Remix by Clip Art plays.

**Shaun: (00:19:37)** After the break we explore the normative transparency and data implications of this monitoring technology at home and in schools. But first let’s check in with Basecamp’s, head of product strategy, Ryan Singer. Recently he’s been interviewing customers about some of the problems Basecamp helps to solve.

**Ryan Singer: (00:19:53)** Yeah, so one of the customers that we talked to, she’s telling her team over and over again, don’t come to me. It’s in Basecamp. And eventually she just puts a sign on the front of her door that says, before entering, ask yourself, did you look in Basecamp first? She was the one who was sort of like the brain, she held all of the information about the jobs that were running. She had all the documents, she knew all the changes as they were happening. She was the one who knew all the information and everybody who was doing the work, they would go to her to ask what was going on and what they needed to do. And she’s thinking to herself, I don’t need to be spending all my time answering these questions, I’ve got my own work to do. I’ve got stuff that I’m trying to do here and I’m getting interrupted with phone calls and answering emails all the time. Why am I spending my time doing this?

**(00:20:40)** She ended up asking a friend for some advice. She said, look, I’ve got this problem. Is there something I can do here? And the friend recommended Basecamp and when she went and she looked at Basecamp, what she saw was that everything was going to be in one place and everybody was going to be able to see it. So if she put all the documents and all the communication there in this central place, they could just go see it themselves and they wouldn’t have to ask her anymore.

**(00:21:05)** So first off she gets everything in there and she says, okay, I can actually see that this is easy enough that they’re going to be able to use it. Because that’s the first thing. If it’s complicated or weird or hard to get into, then nobody’s going to use it. So she knows it’s possible. She says, finally this is an easy-looking one.

**(00:21:23)** But of course habits take time to change. So people are still coming to her at first and she’s saying, no, go check Basecamp. No. And then she puts the sign on the door, right. But before long, everybody had figured it out and they had all learned what to do. They all knew to go to Basecamp to find the information that they needed. And then, this is the kind of thing where we hear quotes saying, I got my sanity back or this kind of a thing, which sounds extreme but go from never being able to get your own work done because you’re getting interrupted all the time to actually having time to focus and do what you need to do.

**(00:21:55)** So she got to a place where now she could focus on her work without all the interruptions.

**Shaun: (00:21:58)** You too can reclaim your time just like she did. Take a look at Basecamp before the year’s over and tell everybody there’s a new place to find their answers in 2020. Go to Basecamp.com to set up a free 30 day trial.

**Adam: (00:22:15)** One thing that we do is prevention education, going into schools and talking to students, not about abuse, but about healthy relationships that are founded on trust and respect and safety. And trying to build social norms around that. And I would argue that we should be doing this as early as possible, in elementary school.

**Wailin: (00:22:39)** Adam Dodge is the founder of EndTAB, a nonprofit that trains social service agencies, law enforcement, state court systems and other groups to prevent and counter what’s called tech-enabled abuse.

**Adam: (00:22:50)** This is the way in which familiar forms of abuse that have existed for a long time are simply being perpetrated by technology, or augmented by technology. What we see with teens and tweens who are early adopters of technology and high-volume users of technology is we see forms of abuse that were usually reserved for the real world really amped up in those environments.

**(00:23:14)** So for example, rumor spreading. That form of abuse has existed for a long time, but when you add that to social media, it’s like pouring gasoline on a fire. 59% of teens 13 to 17 report experiencing cyber-bullying and that can be name-calling. That could be rumors spreading, nonconsensual, intimate imagery, physical threats, things like that.

**Wailin: (00:23:38)** These are the kinds of issues that keep parents and administrators up at night. And they’re especially anxiety-inducing when a lot of adults don’t know how to keep themselves safe online or don’t fully grasp the technology their children are using. It’s no wonder that when companies come along marketing these apps that promise to keep kids safe, parents see it as a lifeline.

**Adam: (00:23:58)** I’ve talked to a lot of different parents about whether using the existing apps like Family Sharing or Find My iPhone or different built in location, sharing functionality in existing phones or adding an app like Life360 that will tell you the child’s location. It will tell you how much battery they have left on the phone. It will tell you how fast they’re driving. All these things that are, inherently, hey, I just want to make sure my kids following the speed limit. I want to make sure if they’re in an emergency, their phone’s not dead. But that is a slippery slope.

**(00:24:30)** I have real mixed feelings about them because I see the apps, especially ones that are monitoring apps or tracking apps. I see those used maliciously all the time. So I’m always a little concerned that introducing that kind of framework to a young mind introduces an idea that they can use in the future. Oh, well this is normal. My mom did this with me and tracking someone because you care about them is okay, so I put this on my boyfriend’s phone or my girlfriend’s phone, because I care about them and I want to know where they are. So you can start to see how the, the lines start to get a little blurred between safety and something that maybe a little more unhealthy.

**Wailin: (00:25:10)** Gennie Gebhart at the EFF doesn’t have mixed feelings about these apps. She sees them as stalkerware, which is software that allows someone to surveil another person without their knowledge. In October the US Federal Trade Commission brought its first ever case against a maker of stalkerware. The company had sold three products that it said were for monitoring children and employees. One of them was called TeenShield.

**Gennie: (00:25:32)** One thing that’s quite clear about these different apps and software is that I think they are absolutely on the spectrum of tech-enabled abuse. And on the spectrum of domestic abuse. And it’s often advertised as child safety software and then it is overwhelmingly used to spy on spouses or spy on ex’s. What we’re also seeing is that some of the companies that are surveilling in schools are also advertising to parents. There is a very uncomfortable relationship between child safety software and terrifying stalkerware and spouseware. They’re doing the exact same things on a technical level.

**(00:26:06)** Even if a parent I’m talking to has no intention to abuse or hurt their child, it’s worth reminding them that these tools are used by people who do. People who are engaged in actual domestic abuse, people who are secretly spying on their child with the intent of controlling them. Do you want to download the same app and use the same technology as them? These technologies and these techniques, regardless of how they’re packaged or how they’re advertised, they come down to spying. They come down to secretly spying on the people you love and that’s not love, that’s control.

**Wailin: (00:26:36)** One important thing to note in the FTC complaints against the stalkerware company is that the government makes it clear that monitoring children and employees are legitimate uses of these apps. In fact, the FTC’s proposed settlement with the company would require people who buy the software to promise that they’ll only use it on kids, employees, or adults who give them written permission.

**(00:26:57)** In short, in the eyes of the government, there is no expectation of privacy in schools or in the workplace. Ryan Stanley, the parent in Alaska with misgivings about his daughter’s school using Bark, sees this distinction very clearly. In his job in IT for Alaska public schools, he’s sometimes asked to monitor student activity.

**Ryan Stanley: (00:27:16)** We had a student who was off task and the teacher contacted the IT group and wanted the IT group to help monitor the student’s work. And so throughout the day, the IT team would take periodic screenshots of the student’s screen. We could see that the student’s screen would quit very quickly, change between tabs, the book report that they were supposed to be working on regarding coffee, and hunting scopes. So this is a student who lives in a rural place where hunting is a big deal. The fact that you’re on your school account and you’d have this feeling like it’s yours. That’s misguided. Like a modern, healthy, digital citizen would know that all those zeros and ones belong to the school and it’s the school’s job to keep students safe so they get to make those kinds of decisions.

**Wailin: (00:28:10)** This idea of promoting digital citizenship is what the companies say a lot too. Here’s Caroline Haskins of Buzzfeed News.

**Caroline: (00:28:16)** The thing that’s worth noting is the way that the logic of Gaggle translates into the workplace. The logic of having everything that you write and do on an account that’s associated with an institution that you’re a part of. Having all of that surveilled and monitored is something that translates beyond the educational space and it’s something that students are from a very young age taught to see is okay.

**Wailin: (00:28:41)** There’s also no easy way to opt out of monitoring at school when the software is integrated into the tools and devices that students need to complete their assignments. There’s often a lack of transparency that this monitoring is even taking place. Several of the companies, including Gaggle, say they recommend disclosing this information to parents, but the backlash in communities like Juneau has partially been about families feeling like they’ve been kept in the dark.

**Caroline: (00:29:05)** All of these decisions are not made typically in a public space. I mean these are decisions that are made among school administrators with people that are selling the software. It’s not like this is happening at a PTA meeting or a town hall. But among some of the experts that I spoke with, a lot of them argued that this is something that should be discussed a little bit more publicly among everybody that is going to be involved and their caretakers.

**Marika: (00:29:30)** Here in the Twin Cities, Minnetonka Public Schools had started social media monitoring and it was to the surprise of many of the students, their families and community members.

**Wailin: (00:29:42)** Again, this is Marika Pfefferkorn, the education advocate in Minnesota.

**Marika: (00:29:46)** Often when it is included for information with families, it is tucked into the terms and conditions that folks sign off at the beginning of the year and not paying a lot of attention to what they’ve given permission to happen with their children’s information. When you don’t know about it, you don’t get to weigh in on whether you agree to it or not fully. What we have seen is what we call engineered consent. Where it’s that massive influx of information where they sign off and they don’t know.

**Wailin: (00:30:15)** It’s easy to monitor children’s devices and accounts at home without them knowing, too. That’s the whole premise of a lot of these apps. Even Bark, which touts its policies around privacy and says it’s meant to be used alongside open communication between parents and children can be installed discreetly. In practice, people who work with youth say they can easily circumvent the monitoring by doing stuff like hiding social media accounts from their parents. Adam Dodge of EndTAB has seen young people go even further and use the technology on their parents.

**Adam: (00:30:42)** Well, I was giving a presentation to a group of folks that I worked with and I was describing some of the functionality about Find My Friends or Find My iPhone and things like that, and one of the women said, oh yeah, I was just at CVS or Rite-Aid the other day and my daughter texted me and said, hey, will you pick up some toilet paper? And she just said, sure, and went about her shopping. Then she stopped and said, wait a second, how does she know I’m at CVS right now? And we asked her, said, oh, I set up a Find My Friends on your phone, just, I didn’t tell you about it. I just set it up.

**(00:31:16)** It’s a two-way street and it’s really not about the technology, right? It’s about consent, it’s about respect, it’s about trust, all these foundational concepts that we’re trying to work into healthy relationships. It’s all showing up in the ways we use technology responsibly and hope that we can bestow those lessons on our kids.

**Wailin: (00:31:36)** Having an ongoing conversation with a child around consent, privacy and healthy behavior can feel like the scariest thing of all. Ryan Stanley in Juneau, Alaska knows this struggle firsthand. He and his wife use an app called ScreenGuide that’s part of a bigger plan they hashed out with their daughter, he sees it as kind of putting on training wheels for a few years.

**Ryan Stanley: (00:31:55)** I want to say that we have a great recipe figured out and I think we have a pretty good recipe, but it’s just constantly being challenged and it’s a moving target. We called it the family media plan. It says things like you have to talk to Mom and Dad before you create a new account on anything. Mom and Dad will always know the passwords for all these accounts. If we ever feel like we need to, we’re going to take a look and see what’s going on.

**(00:32:19)** I use ScreenGuide which allows us to turn her phone, just give it a timeout altogether, but then it also lets us enable only certain apps. We definitely talked about it and we were able to kind of say, okay, here’s this thing. It’s called a phone and it’s an amazing privilege that you’re getting. And with it is going to come this period of time where we’re going to be up in your business trying to help make sure that you’re safe and kind of learning along the way.

**(00:32:50)** One of the ones that a lot of the kids do on Instagram is they’ll friend bots that will get them followers. She was telling me about one of her friends who has so many followers. And I was scrolling through them and they were all… all the followers were from foreign countries and they were very kind of weird names, not like human names. And just that conversation, it was difficult in our household, at least for a 13-year-old. She just wants to have like her own identity and her own space and her own experience of these things and having her parents constantly being like, what’s that? What’s that? What do you think about that? Let’s sit down and talk about this is annoying.

**Wailin: (00:33:31)** Another thing that Ryan’s seen his middle school daughter and her friends do is take those online quizzes. Like what Harry Potter character are you? Sometimes one person will pass their phone around and everyone takes the quizzes on the same device.

**Ryan Stanley: (00:33:42)** And so I try to talk to her about really nerdy things like, well, you know, if you’re signed in as you and you’re filling out that survey, then it’s possible they’re collecting data on you. And then if you hand the phone to your friend and they fill out stuff or they go searching for stuff or type stuff in, then those databases record it as you. So do you want that? How do I care about privacy and how do I care about whether my survey about which Harry Potter character I am is being recorded by Cambridge Analytical or whatever. They’re gonna like look up all the Hermiones and all the Hermiones are going to vote for so-and-so.

**Wailin: (00:34:22)** That’s the other thing about digital citizenship, to borrow a term that these monitoring companies use. Privacy experts have a lot of concerns when it comes to how apps like Bark and Gaggle store the data they collect and for how long. Again, here’s Gennie Gebhart with the EFF.

**Gennie: (00:34:37)** Are they collecting it and keeping it until you graduate and are no longer in the school system? Okay, what happens then? Is it actually deleted and thrown into a volcano off the face of the earth? Very technologically difficult to do, right? Secure deletion is a very difficult problem and if not that, okay, is it aggregated? Is it anonymized? Another really hard thing to do, to effectively anonymize data sets. We can expect a dataset at Bark or Gaggle perhaps to be leaked. We can also expect it to be shared somewhere down the line.

**(00:35:07)** That’s the thing that we have to prepare for, right? Even if the current leadership of a company says they’ll never do that, well, they could be sold, right? Even if we trust the holder of this data right now, we might not trust the person in charge of it tomorrow. And then let’s say our anonymized aggregated dataset is shared and all of a sudden it becomes much easier to de-anonymize it.

**(00:35:25)** With every headline about a data breach, with every headline about people de-anonymizing census data, it becomes more and more concrete to people that this is something we need to think about. Even if it’s not actively happening right now, there is a high likelihood that it will. Look at the business model. And is that business model in the interest of your children and their safety? Are there ways that that business model could corrupt a service that you might like and trust today? How could that change in the future? Can you imagine advertising playing a role in it? Can you imagine certain types of data sharing, whether with other companies or with the government? There are a lot of ways that even if, and it’s a big if, even if you trust and value a service right now, that it could change in a big way in the future. I mean, look at the erosion of Facebook’s privacy policy over the past 10 years.

**Wailin: (00:36:08)** The need for overall consumer education about privacy and online security is why at a lot of Adam Dodge’s trainings, he recommends that families sit down and tackle this stuff together. He says, start by Googling yourself and putting your email address into, HaveIBeenPwned.com to check whether it’s been exposed in a data breach. Then drill down into setting up strong passwords, getting a password manager and enabling two factor authentication. Those steps establish a baseline for trickier ongoing conversations.

**Adam: (00:36:37)** I can’t tell parents, hey, don’t put these tracking apps or these monitoring apps on your kids’ devices. But what we can say is, look, you should really be having conversations about the reasoning behind that. Because I feel like if you’re just putting a tracking app on a kid’s phone and saying, hey, this is normal and this is normal behavior and this is healthy behavior, then they’re going to grow up thinking that and if they decide to use that in a way that’s not healthy, they might have a real tough time delineating between the positive and negatives of a decision like that.

**(00:37:07)** There isn’t a parenting app, right? I mean there are monitoring apps, but there isn’t a parenting app. And I think knowing the difference is really important and really having conversations about consent and privacy and expectations with how that technology is going to be used is so powerful because not only does it affect the relationship between a parent and their child, but you’re also setting an example for how they should treat others moving forward and how they should treat their partners or their kids in the future someday. And I think, I think that’s incredibly powerful. We shouldn’t mistake this as a technology issue. We should see this for what it is, which is the human relationships issue. It’s a parenting issue.

**Wailin: (00:37:48)** I was in high school when the Columbine shooting took place and I’m now old enough to have a daughter who is the age of the children who were killed in Sandy Hook. I don’t know how to address depression and bullying and mass shootings and white nationalism and all of these existential threats to my child and her classmates, but I also know that for me personally, I’m not going to find the answer in an app made by a venture-backed tech company.

**(00:38:15)** Gennie Gebhart from the EFF, for her part, thinks we should look to kids for ideas.

**Gennie: (00:38:18)** If there is a silver lining to this pervasive surveillance panopticon that we are putting our students in, I say that with a big if, if there is a silver lining, it’s that it’s going to give students a chance to realize that they can control their own technology. That they can circumvent surveillance and censorship imposed on them. It could be that same light bulb moment that I had in middle school trying to get to Myspace, but on a much larger scale.

**(00:38:40)** So I think there’s at least an educational moment both for students and for parents. There’s all sorts of ways, right? Every family is different. Every parent is going to have different fears and priorities, but across the board they need more information. Bark and Gaggle are not going to give them the facts they need and increasingly schools aren’t either. I think parents should not be expected to go get computer science degrees and law degrees so that they can read through all these privacy policies and look through all the settings themselves.

**(00:39:07)** The goal of keeping students safe is one that we absolutely all agree on, but these kinds of privacy invasions that affect really your sense of self,  affect your ability to learn, affect how safe psychologically you feel at school and at home. That has to be considered, too.

**(00:39:20)** What we could be teaching children is not to succumb to their technological overlords, but how to make them better. Certainly we all agree, in this moment of tech-lash against big tech and this lack of faith in technology’s role in our lives. That perhaps the next generation is very well positioned to make that better and improve upon it.

**(00:39:40)** Broken By Design by Clip Art plays.

**Shaun: (00:39:45)** REWORK is produced by Wailin Wong and me, Shaun Hildner. Music for the show is by Clip Art.

**Wailin: (00:39:50)** Special thanks to Max Nesterak, Brandi Howell, Sally Lee, and Kiana Swearingen for their help with this episode. You can find extensive show notes for this episode at our website, rework.fm, where I’ll link to all of the organizations and resources mentioned, like Buzzfeed’s ongoing series about school surveillance.

**(00:40:08)** I’ll also link to some resources that didn’t make it into the episode. Marika Pfefferkorn is part of a national coalition called Dignity in Schools that’s working on a campaign called Counselors, Not Cops, and the Electronic Frontier Foundation has published a surveillance self-defense guide which is available at SSD.EFF.org and has specialized tips for LGBTQ youth, activists and student journalists. Again, that’s an SSD.EFF.org.

**Shaun: (00:40:37)** We are wrapping things up before taking a break for the holidays, but we’ll have a couple of new things for you before the year is over. So if you are not subscribed to the show, please do so on Apple Podcasts, Google Podcasts, Overcast, Stitcher—

**Wailin: (00:40:52)** Sure.

**Shaun: (00:40:54)** Radio public.

**Wailin: (00:40:53)** Spotify.

**Shaun: (00:40:54)** Wherever you get your podcasts and maybe you tell a friend about us.

**(00:40:59)** REWORK is brought to you by Basecamp. Basecamp is software that helps you to organize the work you need to do, the work you want to do, and the people you’re working with. Learn more and sign up at Basecamp.com.

This is an episode title
