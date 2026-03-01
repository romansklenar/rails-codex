---
title: "Listener questions: Ops edition"
description: "In this episode of the REWORK podcast, host Kimberly Rhodes chats with Eron Nicholson from 37signals’ operations team."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/listener-questions-ops-edition/
tags:
- podcast
---

# Listener questions: Ops edition

**Kimberly (00:00):** Welcome to Rework, a podcast by 37signals about the better way to work and run your business. I’m your host, Kimberly Rhodes, and this week I’m joined by another special guest from 37signals. Last week we had Andrea LaRowe from our people ops department, and this week I have Eron Nicholson who is joining us from the operations team. We had several questions coming in from listeners related to his department, so I thought we’d bring Eron back on the podcast. Eron, you are no stranger to the Rework podcast. Welcome back. Glad to have you here.

**Eron (00:30):** Glad to be here.

**Kimberly (00:32):** Well, before we jump into these questions, tell our audience a little bit about you and what you do at 37signals.

**Eron (00:38):** Yeah, so I have been with 37signals for almost 13 years now.

**Kimberly (00:43):** Oh my gosh.

**Eron (00:44):** I know right? Time flies. And I joined as just a plain old SRE and I moved into the director role about three years ago.

**Kimberly (00:54):** Okay. What is SRE? Will you just spell it out for those of us who are not technical like you?

**Eron (00:59):** I sure will. We are site reliability engineers. We’ve been called many things over the years. We were Sys admins. We did sort of DevOps terminology for a while and now SRE is kind of the industry term, so we adopted that a few years ago.

**Kimberly (01:12):** Perfect. And you’ve been on the podcast several times talking about the cloud exit, so I know that’s also been one of your big projects the last what, year and a half now?

**Eron (01:24):** Maybe more than that. Yeah, two years. We’re still working on it, which is a whole other topic. We we’re still working on moving a bunch of storage out of S3, so the cloud move continues, but yeah, it’s nice to come on and not talk solely about the cloud for once.

**Kimberly (01:38):** Well, we did have a couple of questions related to your department, so we’re going to jump right in. Our first question is an email that came from Alex. It’s actually a two-parter, so we’ll go to his first question, which is Hi, Jason, David, and Kimberly. He did not yet. No, you were coming on the podcast. Just finished listening to one of the previous Ask Me Anythings that got me curious, how does operations / DevOps fit into your organization? Are you looking for T-shaped programmers, knowledgeable of operating the systems they build, or do you have a separate role for that? Okay, Eron, I got to be honest, I had to Google T-shaped programmers when I got this question coming in. Do you want to kind of talk us through what that means?

**Eron (02:17):** Sure, and we don’t really use that term that much, but we do live the concept. So I think the term just means that people have a broad knowledge base up top but also specialize and are very in depth in some subject. And we do definitely hire with that in mind, but people can kind of come to us in two different ways. Some people have a good general knowledge base and then they kind of find their specialty on the team as they grow. And some people we hire have a deep knowledge of something that we’re looking for, which is always great to find and then sort of build their knowledge base of our other systems as they go. I came from an internet service provider background way back in the day, so I came to the team with a lot of networking expertise and so that was what I did a lot of the time when I first joined, but I learned a ton about Ruby and Rails and Linux and many other topics as I went along.

**Kimberly (03:18):** Okay. Well since we’re not hiring, we’re not actually looking for any type of T-shaped programmers for the ops department. Eron, why don’t you kind of walk us through what your department looks like? What are those different roles within the organization that fall under the Ops umbrella?

**Eron (03:32):** Yeah, so we’re all one big team, although we’re split into smaller regional teams. So we have a team in the Americas. We have a team in the Pacific and we have a team mostly in Europe that we call Team Atlantic, but everybody is in the same on-call rotation. Everybody does a little bit of everything and then some people specialize in different areas. So as I mentioned, I do a lot of networking stuff when I’m able to, and we have other folks who are database experts, we have elastic search experts, we have everything that you can imagine to run all of our systems because the team really does a lot. We wear a lot of different hats on any given day.

**Kimberly (04:13):** And how many people are on the ops team?

**Eron (04:15):** 11, counting me

**Kimberly (04:16):** 11. Okay. Is that considered small for our size business?

**Eron (04:22):** I think so, yeah. Especially…

**Kimberly (04:23):** It seems small for all that you guys do, but I wasn’t quite sure.

**Eron (04:28):** It is certainly bigger than it was when I joined. It’s grown over the years and we introduced the regional team concept a few years ago, which has made a big, big difference in our quality of life. But yeah, I would say given the amount of customers we have and the infrastructure that we manage and everything, it’s a pretty small team, but we are big on automation. He mentioned DevOps and we definitely live that. We use Chef and a lot of other automation tools, so we try to really make the most of the relatively small team that we’ve got.

**Kimberly (05:02):** Before we jump into that next question, you mentioned the team being kind of more global and that being helpful. Talk us through that. I know since I’ve joined the organization, you guys have made some changes to how you do On Call.

**Eron (05:15):** Yes, we did. The big thing was hiring Team Pacific. We sort of organically grew our team Atlantic over in Europe. We just happened to hire a bunch of great people who were in Europe and then I decided to fulfill a dream that I had where we hired Team Pacific. We had to specifically hire those folks. They were harder to come by, but both of them are amazing that let us split up the on-call rotation so that it follows the sun during people’s business hours. I’ll be on call next week, but during the hours that I’m not working, I’ll have someone covering me from Monday to Friday. So when I go off, team picks up and then they cover it overnight and hand off to Team Atlantic and it comes back to me and I’ll be solo on the weekends. So I might get paged every now and again on the weekends, but for the most part it really relieves a lot of the stress and anxiety of getting paged in the middle of the night during your work week.

**Kimberly (06:16):** And it used to be that you would be on call morning and night during that week.

**Eron (06:21):** So when I first joined, we would do 24 hours a day, but we would do Monday to Thursday, or Monday to Friday morning and then Friday to Monday morning. So we broke up the week into two on-call shifts and we mostly did that because it was just too much to go for a full week. It would completely burn somebody out to do it for a full week. Now we do a full week, but most of it is sort of regionally covered, so you have fewer on-call shifts and the ones that you have are not quite as soul crushing as they used to be back in the day.

**Kimberly (06:56):** And had there been any negative side effects of this change? I know you said it was like a big dream, you fulfilled it. Has there been anything negative about it or is it all positive?

**Eron (07:06):** I think it’s been almost all positive. I would say a couple things that have come up are it can be kind of easy to get pulled into oncall work when you are regionally covering someone else who’s the primary on call. So it can sort of distract your focus from what you’re supposed to be doing in terms of your cycle work sometimes. So that’s one thing that we try to make people aware of, try to have people be careful of. And then the other thing is we only have two folks in the Pacific region right now, and so we’re trying to be cognizant to not have them overwork themselves and get a little bit of burnout just because there’s only two of them and so they sort of flip every other week doing regional coverage.

**Kimberly (07:53):** And I’m sure they have to take some time off at times too, and vacation and working all of that out I’m sure is a little bit of a challenge.

**Eron (08:00):** And we tell them that it’s best effort. The weekly on-call person is still sort of the primary person, and so they’re the ones who are mostly responsible for things that break. You’re just sort of saving their sleep is the way that I like for people to think about it. So yeah, if they have appointments, if they go on vacation, things like that, then we might not have perfect regional coverage and that’s okay.

**Kimberly (08:23):** Okay. Let’s get to the second part of this question, which is you mentioned that you had very little major outages over the last 20 years. How have you set up your systems for that? Do you run separate environments, do extensive integration or manual tests or something else entirely?

**Eron (08:40):** Yeah, I want to say first off that we’ve definitely had outages. We’re not perfect and things happen, we try to control for unknowns as much as we possibly can, but there’s always going to be things that come up. We had a DDoS incident earlier this year, which was pretty painful, but we learned a lot from it and made improvements. But yeah, we’ve made big strides over the years since I’ve been here to try to be more resilient. One of the big things that we did, gosh, 10 years ago plus, was to start a second data center so that we have sort of a failover option in case things go really, really badly in our primary data center, which was at the time in Chicago, we’re still in that facility in Chicago and we opened another one in Ashburn, Virginia, and we did that… We chose Virginia because David’s mandate was that if Chicago gets hit by an asteroid, the other data center needs to be far enough away that it will survive. I

**Kimberly (09:37):** I mean, that’s fair.

**Eron (09:38):** Yeah. So we wanted something far enough away to be out of the asteroid range, but it still needed to be close enough that the latency between the two was not very high so that we could keep databases in sync and things like that. So Virginia was a good choice. So all of our flagship apps, Basecamp, all of the versions and HEY all are active in some way in both data centers. Basecamp for years now has been running active, active in both data centers. So one of them is designated as the writeable data center, so when you make anything that makes changes, we’ll go to that. One of the databases just has to be the writer. There’s no way around that in our architecture anyways, and the other site is a read site. So for me, I live in North Carolina and I am much closer to Virginia.

**(10:31):** Of course, all of my read actions go to Virginia and anything writeable goes up to Chicago. This gives us a lot of performance advantages as well as resilience because if something goes really wrong in Chicago, we can fail over to Virginia. We’re doing a really, really fun project right now to bring up another small data center in Amsterdam that we’re going to run a read site for HEY at. So if you’re a European customer and you use HEY, pretty soon, it’s hopefully going to be a lot faster because all of your read actions will be going to the site in Amsterdam and will hopefully be much, much quicker. It’s not a fully fledged thing, so it’s not a failover target, but it’s just a little mini site, that we call it an outpost that will hopefully improve performance over there.

**Kimberly (11:23):** And how big of a project is that compared to moving out of the cloud?

**Eron (11:27):** Not nearly as big. It’s taken us a little while just because there are complexities in getting everything set up and we actually wanted to have it online much earlier, but the DDoS happened and that sort of took our attention away. So I would say much smaller than the cloud project, but bringing up the second data center a decade ago in Virginia was, I would say, as big or bigger than the cloud project. That one was really big. Not a lot of organizations have a DR site and DR is disaster recovery…

**Kimberly (12:00):** Thank you

**Eron (12:00):** …that they test regularly and will actually flip traffic to on a regular basis. It’s a rarity in tech at all in companies that I’ve worked for before. You get up into the big mega scaler discussions, but it’s pretty impressive I think for us to have pulled that off and to use it regularly. We’re pretty proud of it.

**Kimberly (12:26):** That’s awesome. Okay. I’m going to go into this question that was an email from Michael and it’s kind of an overarching question. I’ll let you dig into it, but it says, I’m a big fan of the podcast books and David’s blogs. In my day-to-day role, I wear the hat of a system admin, Sys Admin, DevOps, SRE and total generalist. And I’m incredibly curious to learn more about how 37signals manages its operations. While you’ve delved into great detail about your development product and support workflows in the past, it seems that system administration hasn’t received as much attention. I’m particularly interested in understanding how you plan and execute work amidst the daily interrupt driven nature of system admin tasks and responsibilities. I appreciate your insights. Look forward to your response, Michael.

**Eron (13:13):** That’s a big one.

**Kimberly (13:14):** So that is a balancing act I would assume between your regular cycle work and on-call response things. How do you guys do that?

**Eron (13:24):** Well, as I mentioned before, we have one weekly on-call and that’s the person that we really try to make the point person for any interrupt driven issues that come up and that helps the rest of the team focus on what their project is for the cycle. So we only kind of work in cycles. It’s a dirty secret of the ops team, but we do our best to fit into the cycle methodology that the rest of the company uses. But the reality is a lot of our projects like leaving the cloud take years sometimes and some of our projects take a day, so it is hard to plan and scope work to fit into the cycle framework sometimes, but we really try to and to be able to do that, yeah, we need to have the on-call person handle all of the unexpected things that come in on a weekly basis. So yeah, as I mentioned, I’ll be on call next week. My focus will be triaging any problems that happen working with our data center folks to fix anything that breaks, dealing with anything that comes in via customer support, things like that. So I’ll put my project work on pause for that week or try to as best I can.

**Kimberly (14:43):** Okay. Since you brought up cycles, I do want to ask a question that we hear a lot from people who are really not on the product side or who are working in departments like you said, that don’t necessarily fall into these six week cycles, people who have ongoing work. Tell me about, we’ve talked a little bit on the podcast about we do kickoffs at the start of a cycle and heartbeats at the end of a cycle. How does that look for you guys where you do have this ongoing work? I mean, you’re obviously doing heartbeats and kickoffs. What kind of structure did that look like for you?

**Eron (15:13):** I mean, I’m mostly just upfront about it that some of our cycles or some of our projects go longer than one cycle. So I just wrote the heartbeat earlier this week and many of those things I just upfront said that we did a lot of work on this cycle and it’s going to continue for another one. We’re now going to be starting next cycle on moving Basecamp 4 into Kamal, which is going to be a huge, huge project and is going to take probably, I would guess two or three cycles to finish. So I just say that upfront that sometimes things don’t fit and that’s okay.

**Kimberly (15:51):** Do you break down the Kamal project into smaller pieces or is it just one big project and it’s just going to take multiple cycles?

**Eron (16:00):** Sometimes we do. For the Basecamp to Kamal project, we’re going to have I think two people working on it this coming cycle, and they will have sort of different focuses. One of them is going to focus on preparing the app to run in this different way, and the other one is going to focus more on preparing the infrastructure that we’re going to need to run it because Basecamp 4 is the biggest app that we have, so it’s going to take a lot of resources to run. So we’ll have somebody working on marshaling all of that to get it ready once we’re ready to run it, but they of course, are going to work very closely together with the other person and also with our SIP team to make it happen. So it’s all collaborative even if they have different focuses.

**Kimberly (16:40):** Okay. Eron, last question before we wrap up, and this actually isn’t from a listener, but it’s from me. Is there anything that the ops team does that we haven’t talked about that you think is particularly unique that we should share with listeners?

**Eron (16:53):** I think the coolest thing that we’re doing right now is what I mentioned earlier, the Amsterdam project. So I’ll take that one to talk about and I’m hoping to write a technical blog post about it pretty soon. It might be out by the time this is published. We’ll see.

**Kimberly (17:08):** Oh, excellent.

**Eron (17:09):** I actually wrote a post that people can look up years ago on how we did the traffic splitting for Basecamp when we first launched it. We use a networking technology called BGP Anycast that basically routes your traffic to whichever of our data centers is closest to you. That’s the very high level way that it works. And that may not necessarily be the one that’s physically closest to you if you’re in sort of a weird spot in between our two sites, but whichever one is closest to you from the networks, from the Internet’s perspective is where you’ll end up.

**(17:49):** And we’ve used that technology for a decade now on Basecamp and it’s worked really, really well. So I’m really excited to extend it out to HEY, which we now have running, and then to add another read site for HEY and Amsterdam to improve European performance. And if that works out as well as it does, as we hope it does, we are going to do Basecamp in Europe in that site in Amsterdam as well. Then we might look at doing something for some of our Pacific customers, either probably in Japan, I think is probably what would make the most sense. So that would be our next outpost that we’re going to try and open. So I’m pretty excited about that. It’s very technically cool, and I’m hoping it’ll make a big, big difference for some of our customers who are in areas that are a long ways away from us and might have sort of bad performance on our sites otherwise.

**Kimberly (18:44):** Well, that’s awesome. You’re now in charge of global expansion. That’s very cool.

**Eron (18:48):** That’s right. We have a global team, so we might as well expand globally to make it. But yeah, I mean we do a lot of things. I will say, we, Ops just by our nature, sort of live in the background a lot of the time. You don’t hear about us until or unless things break, but I’m trying to push the team to publish more stuff on the Dev blog so that people can see more of it. We do a lot of great things, especially some of the technology we built around the cloud exit and the way that we use Kamal and the way that we run stuff with automation I think is really great. And we should share it more.

**Kimberly (19:22):** Well, I’ll link to it in the show notes. That website is dev.37signals.com where many of our programmers have shared a little bit about what they’re working on. And Eron, this will be your pressure to put that up by the time this podcast comes out.

**Eron (19:36):** I got to get it done now.

**Kimberly (19:37):** There you go. Thanks for joining me. Rework is production of 37signals. You can find show notes and transcripts on our website at 37signals.com/podcasts. Full video episodes are on YouTube and Twitter. And if you have a question for Jason or David or Eron about a better way to work and run your business, leave us a voicemail at 7 0 8 6 2 8 7 8 5 0. You can also text that number and we just might answer your question on an upcoming show.

This is an episode title
