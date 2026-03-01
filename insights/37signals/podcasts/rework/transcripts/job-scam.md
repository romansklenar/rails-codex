---
title: "Job scam"
description: "We’re introducing a new segment called Check-Ins, where we talk to folks at Basecamp about their answers to recurring questions that get asked of everyone here."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/job-scam/
tags:
- podcast
---

# Job scam

**Shaun: (00:00:00)** Welcome to a bonus episode of REWORK, the podcast by Basecamp about the better way to work and run your business. I’m Shaun Hildner and today we’re introducing a new segment we’re going to call Check-Ins.

**(00:00:13)** Something we do here at Basecamp is we ask everyone at the company recurring questions like, what have you worked on? Or, what are you reading? And did anything inspire you lately? Answers are voluntary and are posted for everyone in the company to read. So, for the podcast, we’ll be bringing you short conversations with people at Basecamp based on some of those answers.

**(00:00:30)** On a recent “What have you worked on” question, a couple folks mentioned that they had been dealing with this interesting case of fraudulent job postings. Someone on the internet had been pretending to be Basecamp in order to collect personal information from job applicants. Here’s Wailin Wong talking to Jeremy Daer on Basecamp’s Security, Infrastructure, and Performance team.

**Wailin: (00:00:48)** I guess you had said in your check-in that some folks on the support team had alerted this first. So, do you want to talk about how it came to our attention?

**Jeremy: (00:00:58)** Yeah, so, I got a ping from Kristin and Chase saying that there was something fishy going on. Somebody had been writing in to us saying that they had taken a job with us. Okay, well, crap. We didn’t—there’s no job. And it turns out there was all the evidence of the job. There was even a job application with Basecamp and its logo. There was an initial test of work. There was a whole bunch of stuff that made it seem like a real job, and we see all this play out after somebody contacted us to make sure, like, was this a real thing? I haven’t gotten paid.

**Wailin: (00:01:34)** Ugh.

**Jeremy: (00:01:34)** And what can we say? Like? Somebody was posing as Basecamp to hire people to try to get their personal information, try to get access to their bank account, and they did a really convincing job. The person posing as Basecamp was trying to spoof a Basecamp email address so that it looked like it actually came from Basecamp and it had everything Basecamp-like about it.

**Wailin: (00:01:55)** Oh, because I think you had mentioned it said, like info@basecamp.com or something.

**Jeremy: (00:02:00)** That’s right.

**Wailin: (00:02:00)** Like, something we don’t actually use but it looks plausible.

**Jeremy: (00:02:02)** That’s right, yeah.

**Wailin: (00:02:05)** And so this person had actually written down their bank account information and sent it over in hopes of getting paid for spec work?

**Jeremy: (00:02:13)** Right. That’s exactly what happened. Somebody has kind of a long-winded explanation. You’re working as a freelancer, and the person who’s employing you gives you a plausible-enough sounding reason. You’re eager to get paid and you’re willing to go along with your deal. And then you don’t get paid, or in the case where you have a—you give them your actual bank account and they can either take your money or set up another kind of scam using your personal information. Thankfully the person affected here used a different bank account that wasn’t able to be drained, so they dodged a bullet.

**Wailin: (00:02:47)** Oh, gosh. That’s lucky. Because that was going to be what I asked next, was did this person just have their whole bank account drained. But it sounds like thankfully in this one case, it didn’t happen.

**Jeremy: (00:02:56)** Thank goodness, yes. That would just—that would be terrible. I mean, we felt terrible enough. Our name’s being used and somebody did actual work for this person which may or may not have been real work. It could have just been part of the scheme and you just don’t know. And they’re expecting to get paid… just victimizing people who are job-seeking seems extra terrible. I mean, come on.

**Wailin: (00:03:20)** Oh, gosh. So, then you got alerted about this, and obviously, I’m sure Chase and Kristin on the support team would have told this person immediately, no this is not us. This is some kind of scam that uses Basecamp’s name. And then was there anything else you could do for this person?

**Jeremy: (00:03:38)** The most we can do—well, so this is where I was kind of puzzled. Because I was thinking, gosh, as I looked into this, it’s super common. It happens on most job boards. It happens on Craigslist and it happens on Facebook. These are some of the signs you see posted along the side of the road saying “Work from home” opportunity. And it turns out to be some kind of bogus shady thing. In this case, it did come from Facebook, and it was a work-from-home opportunity that was advertised there and led into this kind of scam lead generation set-up where you contacted somebody online who was getting paid by a company and they front like they’re working with the company. So, they’re your social proof that this is legitimate. I’ve got paid, I’ve been doing this for months. It’s totally cool. Here’s how you set it up. Don’t worry about it. It seems a little bit funky, but I’ve been doing this. Look, it’s paid off for me. So, there’s no reason to doubt it.

**(00:04:33)** And then as we get deeper into this seeing… How brazen can you be and not get caught? There’s a bunch of people involved advertising using known platforms like Facebook or like a job board and it’s just a dead-end there. We can contact them, but there’s no further to go. And to build a criminal case is a huge challenge, apparently. The best we can do is report to the Federal Trade Commission, there’s a couple—and the FBI—there are two websites that are publicly available that anybody who’s noticed a scam like this or been personally affected by it can report it.

**(00:05:08)** Apparently, it’s maybe through the volume of reports and if they notice somebody who has done this a lot, they might go after them. I can’t tell. From all I can tell is that this happens to everybody, all the time, everywhere, and I don’t want to apply to a job, because jeez.

**Wailin: (00:05:30)** That’s really dispiriting.

**Jeremy: (00:05:30)** Yeah, it’s terrible. And so, the fact that this is the most we can do—we tried tracking down what we can do about our own known, our likeness, our trademarks being violated like this, and there’s also not much we can do. We can report and hope. And we can go after the specific sources that were used. So, they used a Gmail account. Gmail has a page where you can report scams and fraud, kind of a step above spam or phishing. And they’re particularly interested in people who are fraudulently saying they’re from Google. Google has a huge problem with this also, saying that, I’m from Google, I’m using a Gmail address, so I’m kind of official. So you use something official at gmail.com. So, they’re encountering this on a much larger scale than us, of everybody wanting to say, hey Google’s got this thing for the next two months, you can enroll and get a payback from Google.

**(00:06:27)** Or, you can work for Google. And, look, I’ve got this Google recruiter at gmail.com address, so, I mean, it sounds—it stretches plausibility, but you can imagine how it feels credible if you’re looking for a job and you really need it, and particularly that its targeting people who are looking for remote work.

**Wailin: (00:06:49)** Right, right. Is this the first time this has happened at Basecamp that you know of?

**Jeremy: (00:06:52)** As far as I know, which doesn’t mean it hasn’t happened before because it seems like any company that hires remotely and has a web presence and previous job posts that talk about remote hiring are vulnerable to this because one of the first things somebody that’s looking for a job like this would do is Google this company and look to see what it says about working there and what they do about jobs. And it turns out that we’re a remote company. So, it helps the scammer’s story fit together.

**Wailin: (00:07:22)** Yeah. Gosh. So, now it’s basically in the hands of the FTC and the FBI, right?

**Jeremy: (00:07:28)** Yes. Yeah.

**Wailin: (00:07:30)** Well, that’s a big bummer.

**Jeremy: (00:07:31)** Yeah. To the credit of many of these job boards and Craigslist and everybody has lots of disclaimers and try to educate people about this. And it’s all these other channels that don’t. So, for example, like, getting a Facebook ad. Facebook ads aren’t a job platform, but they are a way of getting your scam in front of a lot of eyeballs. And so, there’s no disclaimer there saying, hey, you might be getting scammed by this ad.

**Shaun: (00:07:57)** When Jeremy wrote about this job scam incident for his check-in, our colleague Shanae Dykes on the Support team chimed in, saying she often gets asked for advice about finding remote jobs. She had some great tips about staying save while looking for work. So, we’re going to share them with you.

**Wailin: (00:08:11)** When you learned about the job scam, did it sound familiar to you?

**Shanae: (00:08:15)** Yes. It sounded very familiar to me, because, of course, I’ve been working from home for a very long time. And so, I’ve seen it all. It’s something very common in the remote industry.

**Wailin: (00:08:29)** And is that because since you’re not getting called in to a physical office to do the interview there’s fewer levels of vetting, or kind of like, fewer opportunities for you as the candidate to kind of figure out what’s going on?

**Shanae: (00:08:43)** Yes, definitely. If you use a name that’s very common, very well-known, a household name, people tend to just trust that it’s legitimate.

**Wailin: (00:08:53)** And, where did you build up, kind of your knowledge base on these kinds of job scams. Was it as a job searcher? Was it as someone working at a company where you were hearing about people impersonating your company? Or was it both?

**Shanae: (00:09:09)** Well, it was a little bit of both. When I was looking for an opportunity myself, I’m very protective of my personal information as well, and so when you just come straight out the gate asking me for my date of birth or my contact information, I’m wondering like, who is this behind this email?

**Wailin: (00:09:28)** Yeah, because it’s like with these job scams, they’ll ask you for something like date of birth like, right up front—

**Shanae: (00:09:34)** Right.

**Wailin: (00:09:34)** —and that shouldn’t really be the case in a legit job interview situation, right?

**Shanae: (00:09:38)** Right. That’s correct. You really want to be very careful. You have to keep in mind that you don’t know who this person is behind the email that’s actually sending you this information. And also what you want to keep in mind as well when you’re looking for a remote job, the process should be very similar to if you were walking into the office. The person who’s hiring you, they want to know if you are a real person. They’re not going to just hire you off of an email exchange. They’re wanting to know who you are as well. So, when people are looking for remote jobs, they want to keep that in mind that the process should be very similar to if you were looking for a job outside the home. Application. They want to interview you. They want to have a background check. They want all of that. Just keep that in mind and that will cut down a lot of those scams.

**Wailin: (00:10:30)** Because if you’re moving through what seems like a job opportunity but you’re never actually getting on the phone or like on a video call with a real person, that should be a big red flag. Right?

**Shanae: (00:10:41)** Yes. Definitely. If you’re not being asked to interview over the phone at minimum, then that is a huge red flag. Also, if you’re being emailed from a free email account, what organizations use those? None of them use those. You know, someone emails you back from Microsoft and it’s from a Gmail account. I mean, come on now. You know? That’s a technical company, why would they email you from a Gmail account. But you know, that’s with any organization. And then if they’re not wanting to, you know, talk to you personally, then that’s definitely a red flag. No one would hire anyone just off of an email exchange.

**Wailin: (00:11:22)** Yeah. Any other tips you can think of?

**Shanae: (00:11:26)** Just be patient. Finding remote work can be very challenging. There’s so much information out there on the internet. Do your research. If you do run into a company you’ve never heard of. Google it. Always pair a company’s name with the word scam, and if someone has been scammed by that company, it’s gonna show up. There’s a lot of websites out there that you can definitely check out. One of them is called ripoffreport.com and it has a lot of information. People that have reported rip-offs they’ve provided their services and were not paid. And one last tip I want to say, too, is never give money. Never give money up front. A lot of times people freely give money, you know, when people ask for money up front. Hey, to learn more about this information, you have to pay me $15 or $20, you know. I mean, that’s not a standard procedure when you’re looking for a job opportunity. So, if it sounds too good to be true, typically it really is. You’re not going to make a thousand dollars in two days.

**Wailin: (00:12:33)** Yeah, like there’s no magical remote opportunity that—

**Shanae: (00:12:37)** Right.

**Wailin: (00:12:38)** —where it’s just going to be, like, nothing like any other job opportunity.

**Shanae: (00:12:43)** Right. You’re not going to just sit at home and press a button and then your bank account is just gonna fill up, you know, with all kinds of money or whatever.

**Shaun: (00:12:53)** That’s it for this Check-Ins episode of REWORK. The show is produced by Wailin Wong and me Shaun Hildner. We’ll be back with some of our regular programming next week.

This is an episode title
