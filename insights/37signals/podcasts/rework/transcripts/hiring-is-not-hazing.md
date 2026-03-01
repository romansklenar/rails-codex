---
title: "Hiring is not hazing"
description: "Why are manhole covers round? How many golf balls can fit in a 747? Why are job interviews so terrible? In this episode, Aja Hammerly, a developer advocate at Google, talks about the drawbacks of common tech interview techniques like whiteboard coding and trivia questions, and shares her tips for..."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/hiring-is-not-hazing/
tags:
- podcast
---

# Hiring is not hazing

**(00:00:00)** Broken By Design by Clip Art plays.

**Shaun: (00:00:01)** Welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m Shaun Hildner.

**Wailin: (00:00:06)** And I’m Wailin Wong.

**Shaun: (00:00:08)** Wailin, I noticed that you have—what is that, a tattered paperback of a Baby-Sitters Club book?

**Wailin: (00:00:15)** You know it!

**Shaun: (00:00:16)** Well, so what’s that all about?

**Wailin: (00:00:17)** Well, I’m so glad you asked. This is #14 in The Baby-Sitter’s Club series by Ann M. Martin. The title is Hello, Mallory and this is my actual childhood copy.

**Shaun: (00:00:28)** Let’s pretend for a second that I’m not a huge Baby-Sitters Club fan. Can you give me just a brief overview of what the story’s about?

**Wailin: (00:00:35)** Yes, I can. The Baby-Sitters Club is a children’s series about a group of middle school girls in Stoneybrook, Connecticut who start a small business, babysitting local children. They are the original girl bosses, a term I despise, but it is literally true in this case.

**Shaun: (00:00:53)** So, you have #14. What happens specifically in this one?

**Wailin: (00:00:57)** The main character in this one is Mallory Pike. She’s a very responsible 11-year-old who wants to join The Baby-Sitter’s Club, but she’s a little bit younger and so the other members give her a test to see if she’s got what it takes. They ask her questions like, what age does a baby cut their first tooth? How to use a tourniquet? And finally, they make her draw a diagram of the digestive system. The club is not impressed. Okay, here is a short excerpt. This is written from Mallory’s point of view.

“Half credit,” said Dawn when I was finished. “She left out the liver, the gallbladder, the pancreas, and about a hundred other things.”

“No credit,” said Kristy, “The test is over.”

“But I didn’t get to tell you guys what I do know,” I protested.

**Shaun: (00:01:39)** Oof, that’s rough. I think this happens a lot of times in job interviews where the people doing the hiring are not looking for your strengths. Instead, they’re trying to expose your weaknesses or get the better of you. Or, even worse, prove how much they know.

**Wailin: (00:01:51)** Right. And you actually learn in Hello, Mallory that the other baby-sitters looked up everything themselves before giving the test to her because even they didn’t know the answers.

**Shaun: (00:02:01)** Unbelievable.

**Wailin: (00:02:01)** So, it was all a sham. And this is a children’s book, just as a reminder. But, I think a version of this messed up power dynamic plays out all the time, especially in tech. You see a lot of horror stories about interviewing in the industry. In this episode, I talk to Aja Hammerly who works at Google and wrote a great blog post in 2017 that breaks down common interview tropes and offers a better way forward.

**Aja: (00:02:26)** I am Aja Hammerly. I am a developer advocacy manager at Google working on our Cloud Platform specifically on outreach for languages and communities.

**Wailin: (00:02:36)** So, what does that look like day-to-day, being an advocate?

**Aja: (00:02:38)** Ah, this is the thing that everyone asks me, and I still, four years later, do not have a good answer for. I like to say that our job is about 50-50 internal/external. The external stuff is the stuff we all see. Twitter, conferences, videos, podcasts like this. We get to do Hacker News and Reddit for work if we choose to. But, the more interesting part for me is actually the internal stuff and that’s when we sit with product teams and we talk to them about the kinds of usecases that we used when we were all developers or otherwise technical practitioners in the community. We talk about the feedback that we’re hearing. We talk about trends that we’re hearing about. We try out stuff. Not in the finding bugs, testy way, but more in a, “Does the whole experience hold together? Does this actually work for the kinds of things that people do?”

**(00:03:22)** And then we also help the product folks meet folks who use stuff. We help the engineers sit down with folks at conferences or get on phone calls or have meetings. I’ve invited folks from the Ruby community, because I started my advocacy work focused on Ruby, to come over to the office and we have some froyo and then they get to meet folks who are working on libraries that they’re using and give them feedback. And the engineers get to ask questions so that they can understand stuff because Google’s lovely. I enjoy it. But, it’s a very big company and we write code differently than other folks.

**Wailin: (00:03:51)** So, I wanted to ask you as we get into this discussion about hiring. As you were getting your first job or interviewing for your first jobs in the tech industry what do you feel like you had been told up to that point about approaching interviews or what to expect in an interview, and how to behave, etc.?

**Aja: (00:04:08)** So, yeah, I do actually have a formal background in CS. I know that’s relatively uncommon and I don’t actually think it necessarily helps, although I know that there’s a lot of folks who just look for that on a ticky box and I have many, many feeling about that, almost all of which are negative. So, the stuff I was told was, you know, wear a suit. Which, I don’t ever do anymore. And do all this studying and memorizing. Memorizing big O runtimes. Memorizing how to balance a red-black tree and a reverse-linked list and… to be fair, that was a lot of the interview questions I got. I remember one place I interviewed straight out of school actually asked me, “How long have you been programming?” And gave bonus points to people who started programming when they were kids, and I’m just like, why? Why does that matter? It doesn’t seem relevant at all to your ability to do the job. And this was back in the 2000s, early 2000s. And, yeah, a lot of people interviewed that way. I did actually interview at Microsoft at one point and I did get asked, “Why are manhole covers round?”

**Wailin: (00:05:07)** Oh, really?

**Aja: (00:05:09)** Oh yeah. Oh yeah. That… luckily—

**Wailin: (00:05:10)** What did you say?

**Aja: (00:05:11)** So that they don’t fall back through the hole. But that’s because someone had coached me on that. I grew up in the Seattle area, I had heard that was likely to happen and someone had told me what to say. I’m sure there were other valid answers to that question but it’s a stupid question. It’s not relevant at all.

**Wailin: (00:05:25)** In those early experiences, even then, were you like, this is broken and this is BS? Or were you like, well, I guess this is what interviewing is like because that’s what people told me and here I am experiencing it?

**Aja: (00:05:38)** So, initially I was very—and this is interviewing is like. And one of the best pieces of advice I got early on in my career was to never say no to an interview. And so, as the person being asked the questions, as the interviewee, I’ve probably done upwards of 50 interviews in my 15 years in tech at this point. Oftentimes for jobs I didn’t want but I just did them for the interview experience and people were like, well, that’s not fair. And as a hiring manager now, I’m like, yeah, I wouldn’t really want to waste my time, but at the same time, people just need a chance to practice and I’m glad that I got that practice. So I thought that was just how interviews were. But, about 2006, 2007, I started actually being the person doing the interviews and overnight I realized I knew nothing about those and that everything I had been taught was wrong and completely useless for helping me figure out if someone was actually going to be able to do a good job.

**(00:06:31)** I was lucky that the first place I did any interviewing actually had us take a training and one of the things that the trainer said was stop asking the questions you were asked. You’re not—it’s not your job to recreate the experience you had, even if it was good. It’s your job to sit down, think about what you do every day, and then figure out how you can find out if the candidate can do the same work. And so, one of the things he recommended was that you write down any interesting problems you’ve solved or interesting challenges you had for a week. And then you see if there’s a way to scope that problem down a bit so that it can be solved in an interview.

**(00:07:06)** I’ve tried very hard to keep my questions—and anyone who’s listened to this who’s intereviewed with me at Google is going to disagree… Tried to keep my questions somewhat relevant and somewhat related to the work we do.

**Wailin: (00:07:18)** So, the reason I had contacted you initially is, well, I saw some tweets, including one where you said “Hiring is not hazing,” which I might borrow for the title of this episode with your permission. And then you had also written a blog post which I found where you kind of went through some of the most common interview techniques and talked about the downsides of each one. And I was wondering if we could just run through each one of those really quick?

**(00:07:47)** So, the first category was trivia questions and brain teasers and this is something you’d talked about just a minute ago, because you remembered that you were asked, “Why are manhole covers round?” And, my husband interviewing at a hedge fund once was asked like, if you could estimate the number of gas stations in the United States, I think… So, what is the problem with this category of question? Because I think the rationale for it is it’s supposed to show how you approach a problem or critical thinking even if you don’t get the right answer, right?

**Aja: (00:08:20)** Yeah, and I get that argument. So, I actually break these into two categories. The trivia questions just test whether or not someone memorized the same stuff that you asked them.

**Wailin: (00:08:29)** Yeah.

**Aja: (00:08:29)** And, as anyone who, especially in tech, knows, we don’t actually get to rely on our memory. Some of us have some stuff we do everyday memorized pretty well. But, we have the internet. We have books. And most importantly, and I think this is the one that people underestimate, we have each other to help us when we get stuck. We don’t memorize stuff, we look it up, and I feel very strongly that I don’t want to work with people who are going to rely on their memory. I want folks who are going to make sure that they’re right and look stuff up and be willing to try things that they don’t have memorized or learn new things. So, I just—I don’t find the trivia questions particularly useful. I do occasionally use them to help me gauge someone’s level of skill in a particular domain. Like, I used to do a lot of interviews about Ruby, and so I would ask a couple really, really simple trivia questions about Ruby. Things like, what’s a class variable, just to make sure that any other questions I asked would be appropriate for the level of skill.

**(00:09:26)** Brain teasers. Okay, I get it. I understand that you want someone to be able to break down a problem in a novel domain and have a reasonable guess at it. Yeah, problem-solving skills are general but people are nervous in interviews, and the more we can make the problem domain, the types of question we ask them relate to stuff they already feel good about, the better they’re going to do on the question. Because I want to set people up for success. I want to make sure that they’re working on—that the questions I ask them, we’re not getting bogged down in any sort of cultural biases or lack of background knowledge that they may have for whatever reason. Because that’s just not fair.

**Wailin: (00:10:05)** The second category you talked about was whiteboard coding. I come from a journalism background so I don’t have any experience in this, but it sounds terrifying.

**Aja: (00:10:12)** It isn’t that the process of whiteboard coding is bad, it’s the how we assess it is just awful. People like to criticize people’s syntax errors. They like to disqualify people or rate people down on their interview feedback because they didn’t know a specific library function that would make this easy. Or because they approached it in a different way. I once had a whiteboard interview where there was two valid ways in my opinion to solve it. I chose one and the interviewer really wanted me to use the other. And the interviewer kept trying to give me hints to go solve the problem his way. And I was like, that doesn’t make any sense to me and I know my way is going to work, will you please be quiet?

**(00:10:49)** I find that when we give whiteboard coding questions, and I do give them on a regular basis, we tend to be assessing the wrong stuff. Instead of looking how someone tries to understand the problem, tries to figure out is the problem well-specified—the kinds of things we do when we get handed actual problems as engineers, we’re like, did they remember every single semi-colon. And you’re like, I don’t care. It’s not actually relevant. So, whiteboard coding questions: not the best. And everyone hates them, so why stress people out?

**Wailin: (00:11:17)** Then the next category was soft questions which I find really interesting. This is the category I have as a non-technical person, have the most experience with, I think.

**Aja: (00:11:25)** It’s something that I’ve always asked at least a couple soft questions because software development is not a solo person’s activity for the most part in the real world. We work in teams, and one of the things is another blog post I have about interviews. One of the things is, I want to make sure that the people we’re hiring are someone that I’m okay debugging an issue with at 3 am if something explodes. Which means they need to be reasonable people. They need to be team players. The problem with soft questions is, and they end up being trivia questions. And someone can’t answer, “Tell me about a time that you had a challenge that you overcame.” It doesn’t tell me anything about how they’re going to deal with challenges that they overcame in most cases. It’s going to tell me whether or not they prepped for the interview in the way that we expect folks to prep for the interview.

**(00:12:10)** And a lot of people answer soft questions really, really poorly when they’re nervous because they’re not in a place where they can access all of their emotional intelligence. And I want folks to do well. Like, I tell folks when I interview, at least, I try to remember to tell folks, and I’ve always thought this way, is my job is to figure out what you’re good at so we can figure out if what you’re good at and what we need intersect. I’m not there to make you look bad. And so I don’t want to ask questions that folks are gonna stumble on if I can avoid it.

**Wailin: (00:12:35)** Right, which I think get at the larger point—I know we have a couple more categories to go through. But, I think that does get at this larger point of if you as the interviewer—I don’t mean you, specifically, I mean you in a general sense. But, if the interviewer’s objective is to try to feel super smart vis-à-vis the interviewee or assert their intellectual superiority or something. Then the whole process is broken right?

**Aja: (00:12:58)** Yep. No, I understand that it’s sometimes really awesome to feel like you’re so smart. And I will admit that some days I come in. Like, when I was doing five or six interviews a week ten years ago at a different job, some days I came in and I didn’t actually give it my best and I feel bad about that now. But, no, I don’t want people to dislike the process. I would prefer if they didn’t dislike the company that I’m working at and making them feel bad, it doesn’t actually help anyone. I really, really try to go into the process with a bunch of possible questions I could ask. And I try and base—sometimes I base them on the resume, sometimes I base them on the job. Usually a combination. And I’m just trying to figure out what this person is really good at. Where they shine. So, sometimes they’re going to answer a question badly, and you know, okay. I try to move on. Why would I keep poking at that particular place if I know it’s hard for them?

**(00:13:48)** So, yeah, the goal is not to feel smart. The goal is not to make the candidate feel dumb. The goal is not even to find the edges of the candidate’s knowledge. Because a lot of folks go in and like, I’m going to keep asking them questions until they get one wrong. The goal is to figure out what the candidate is awesome at and then figure out if that’s what your team needs right now.

**Wailin: (00:14:05)** And then, the next category. And this one I found interesting as well because this is what we do at Basecamp, especially for designers, and I think institutionally we take a lot of pride in the fact that we do this kind of interview. But we give homework, like design challenges, and they’re compensated. But, this is like, take-home work for our candidates. And, can you talk a little bit about some of the drawbacks for projects and homework?

**Aja: (00:14:31)** So, homework has a challenge, a lot of challenges. The primary one that you hear people bring up is that it can be discriminatory against folks who have other outside obligations. Maybe they’ve got kids or a family member who needs taking care of. Maybe they have to work two jobs because they’re still getting their head start in the industry. Maybe they have a home environment or an existing work environment that makes it so that they don’t actually have a ton of time in their evenings. I mean, they’ve got a place that’s working them 80 hours a week. That might be why they’re interviewing with your company. Homework problems tend to favor people who are young and people who do not have a lot of family responsibilities, which tends to be people who are from the US natively and male.

**(00:15:09)** You mentioned that Basecamp compensates, and that’s awesome. I really like it when folks do that, but I actually interviewed for a job a couple years ago, or was going to interview for a job a couple years ago. And they were going to compensate me for my time except at the time I worked for a company with a no-moonlighting clause. And so, that put me in a situation where despite their best intentions, I couldn’t actually take the money and so it was still going to be work for free. And there are also a number of companies out there that are like, great! We’ll give homework! And then they give actual code work that they need doing and then they use the code in production and that is so many kinds of ethically squishy.

**Wailin: (00:15:45)** Very crappy!

**Aja: (00:15:46)** I did have a company that I interviewed with early on in my career where they had me come on site for two days. I was in college so they didn’t pay me but they actually gave me six and a half hours to work on a project. They provided all of the hardware and everything, provided snacks. And provided a mentor that I could call or go grab if I needed help. And if you’re going to do an exercise like that, that’s not a horrible way to do it. I still think back on that experience fondly. Now. I might not want to do that at this stage in my career. But, for where I was in my career it was not bad. And they provided a lot of support and they did not assume that I was going to spend my evenings and weekends doing work for free for them.

**Wailin: (00:16:25)** And then the last category I think you talked about was portfolio review.

**Aja: (00:16:29)** I know a bunch of designers and advocacy, more and more of us are preparing portfolios of talks we’ve written and blog posts we’ve written. And I’m actually seeing this in just standard software engineering jobs, too, that people want to have, you know, here’s [GUID?] I wrote, here’s the open source project I work on. And this hits on a lot of the same problems as homework. It assumes that people have time to do stuff that their employer may not allow. There’s a couple big employers in Seattle that don’t allow software engineers to do talks without extensive training. Sometimes people say, well, they can just show me code that they’re working on at work right now. Almost every software engineering employer is gonna have you under NDA and say you can’t actually share the code. So, uh… that doesn’t work for the vast majority of us.

**(00:17:11)** For design it tends to be okay. And a lot of times designers, they end up—their actual work product is the user interface that everyone can see so it’s not as secret. Which means it’s a little bit easier there. Same thing for advocacy and developer relations positions. My talks are online. My blog posts are online.

**(00:17:30)** But, you are assuming that people have the ability, either contractually or time-wise to do this work. And, not everyone does. And that doesn’t mean that they’re not good developers. It doesn’t mean that they’re not good project managers or program managers or you know, product marketing folks. They just may not be able to because of their circumstances and we shouldn’t exclude them from the process just because they don’t neatly fit our bucket of what we look like.

**Wailin: (00:17:55)** I mean, one thing—or a theme that I feel like is coming out is there is no one type of interview scenario that fits everyone. And, I think in your blog post you advocate for a mix of techniques in the same way that oftentimes a grade in college is determined by X% from the midterm and Y% participation or whatever else. Do you think that it really should be customized like per interviewee? Like, you have to understand an interviewee’s or a candidate’s background and where they’ve been and kind of the circumstances around where they’re coming from and then you can kind of tailor an interview around what you understand of their context?

**Aja: (00:18:41)** Yeah, so I’ve heard of a couple places doing this and I can’t actually think of any off the top of my head right now. But they will say, you know, we’d like to see a code sample. If you have stuff you can provide, that’s great. If you would like a project idea, we’ve got this list of project ideas. And if you’d like to come in and work on it in our office, potentially even pairing with one of us, we can arrange that. What works best for you?

**(00:19:06)** A really great example of this that I think a lot of folks can resonate with almost every tech job, you have to do a phone screen, a technical phone screen. Some companies will offer a choice of doing it over the phone, doing it over video chat, or potentially even just coming in for an hour and, you know, doing the phone screen and then potentially having coffee with some members of the team and doing a tour of the office. And letting people pick what’s best for them can oftentimes help them feel more comfortable and help them feel like they have more control and a better ability to show their best self. And I really do believe that a mix is the right way.

**(00:19:38)** This is one of the reasons that I was actually pretty happy with my Google interview process and I know that lots of people are very unhappy with theirs. There is a lot of articles about that. But, I was pretty happy because I had several conversations just about soft skills stuff with several of the people. I did a homework assignment. I prepared a presentation. There was some whiteboard coding. I know that the videos of my talks were watched by the manager and it happened to be that one of the members of the team was actually going to a conference that I was speaking at. And he watched my talk and then wrote some notes up that he also gave to the manager to help make the hiring decision.

**(00:20:13)** So, I kind of felt like they got a real good breadth of my skills. People feel better when they know that they’re being looked at as a whole person because we aren’t just these one-dimensional code robots. The more we can give folks the chance to show us all of their skills and strength in the ways that they can most easily show them, the better, I think, our hires are going to be.

**Wailin: (00:20:33)** You’ve been speaking about this a lot on Twitter, on your blog and I’m sure in person as well. Do you feel like you’re making progress in terms of—I mean, I remember your tweets from the conference you were saying, oh, I can’t believe… It’s very disheartening to hear people kind of still kind of thinking regressively about hiring practices. Do you feel like there’s progress being made? Is stuff getting better for candidates in the industry?

**Aja: (00:21:03)** So, I think any time a company actually sits down and thinks about what they want from their hiring process. There’s tons of resources out there and they tend to be doing better. There’s folks, like you said, who are compensating for homework problems now, which was not a thing when I wrote that blog post, that I know, at least. And I wrote that blog post even two to three years ago. Folks are getting much better at not including education requirements that aren’t actual real requirements in their job postings. They’re including “this much education or equivalent experience,” or they’re just deleting the line and talking about the actual skills needed or the job. I’m feeling a lot better. You don’t have to reinvent this process. There’s lots of people who’ve tried lots of stuff. There are several companies who have been having people come on site for a whole day and pair program with them for over a decade and they’ve written about it, and they’ve talked about why it works and why it doesn’t.

**(00:21:51)** If you just sit down and think about it and think about what kinds of candidates do you want. Do you want the folks who are exactly like you, who can suffer through this horrific process or do you want to have a diverse set of perspectives and diverse set of skills. I mean, there’s tons of studies that say a diverse set of perspectives and skills and backgrounds makes your team better. And if you want a good team, you need to take a deep breath and actually think about how you’re doing your hiring so that you get the skills and perspectives and backgrounds that you need to be successful.

**Wailin: (00:22:20)** Okay, well that’s a hopeful note to end on, I think. Unless, was there anything else that you wanted to add that I might have missed?

**Aja: (00:22:26)** Just wanted to tell folks that I know it’s hard and that things are getting better and that if a particular company knows their hiring process doesn’t work for you, it doesn’t mean that you are not a good developer and that you will never get hired anywhere. It just means that that particular company’s hiring process didn’t work for you which probably means that company didn’t work for you.

**(00:22:49)** Broken By Design by Clip Art plays.

**Shaun: (00:22:58)** REWORK is produced by Wailin Wong and me, Shaun Hildner. Our theme music is Broken By Design by Clip Art.

**Wailin: (00:23:04)** You can find Aja’s website at thagomizer.com, that’s T-H-A-G-O-M-I-Z-E-R.com. She’s also on Twitter at @the_thagomizer.

**Shaun: (00:23:17)** What’s a thagomizer?

**Wailin: (00:23:19)** Oh, I’ll let Aja explain it.

**Aja: (00:23:20)** Thagomizer is the spikey part on the end of a Stegosaurus. I very much like dinosaurs.

**Wailin: (00:23:25)** I will like to Aja’s blog post in the show notes.

**Shaun: (00:23:29)** Which you can find at rework.fm.

**Wailin: (00:23:31)** Oh, that’s right, yes.

**Shaun: (00:23:32)** You can also find us on Twitter at @reworkpodcast. I think that’s it.

**Wailin: (00:23:37)** Yeah.

This is an episode title
