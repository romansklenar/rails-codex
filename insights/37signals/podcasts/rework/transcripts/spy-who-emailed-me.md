---
title: "The spy who emailed me"
description: "An exploration of email tracking pixels, featuring an anonymous email marketing insider and The Markup's privacy-first approach to newsletters."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/spy-who-emailed-me/
tags:
- podcast
---

# The spy who emailed me

**(00:00:00)** Anyone You Meet Normcore Remix by Clip Art plays.

**Shaun: (00:00:03)** REWORK is brought to you by Basecamp. Introducing Hey, our love letter to email. Email has become a chore. You get stuff from people you don't know, you lose control over who can reach you, and an avalanche of automated emails clutter everything up. But it doesn't have to be that way. Hey is a redo, a rethink, a simplified, potent, reintroduction of email. Head over to HEY.com, that's H-E-Y dot com to find out how you can be one of the first to try it.

**Nick: (00:00:33)** The amount that gets tracked when you open an email, it's not just that you opened the email, it's when you opened the email, how many times, the IP address, which is tied back to your location. The email client that you used, mobile or desktop. Webmail or in the browser. That gets used for segmenting and targeting customers. You can send an email to your customers based on their location, where they are, without them ever having to give you that location.

**(00:01:14)** I consider myself fairly tech-savvy, and if I didn't work in this world, I would have no idea.

**Wailin: (00:01:19)** This is someone we're calling Nick and he works in the email marketing industry. He asked that we disguise his voice to protect his privacy and that of his coworkers.

**Nick: (00:01:28)** It's overall a very good company culture and apart from the fact that the tracking kind of unsettles me, I really like what I do. Going through my inbox, I just got one about headphones and, honestly, I wouldn't mind seeing more of this content. But now that I opened that email, they know that I opened in Gmail, on Chrome, where I opened it, how often I open their emails. So they might even, if they look at my profile in their list, see that that's not a usual occurrence for me, and infer some kind of data from that. And I'm not comfortable with the company having that much information on me on a regular basis.

**(00:02:21)** Broken By Design by Clip Art plays.

**Shaun: (00:02:21)** Hello, and welcome to REWORK, a podcast about the better way to work and run your business. I'm Shaun Hildner.

**Wailin: (00:02:27)** And I'm Wailin Wong. We here at Basecamp are in a position not too dissimilar from Nick. We like newsletters and we've been sending them to customers for years now. We use email newsletters to announce new features and books, give customers tips on how to use Basecamp, and share our point of view.

**(00:02:43)** But like so many other parts of the internet, email newsletters aren't that simple anymore. Tracking is now the default and companies are adding more ways to monitor when, where, and how people are reading emails without the consent of the receiver. This is done with technology called tracking pixels and it makes us really uncomfortable.

**Shaun: (00:03:02)** Basecamp is actually launching a new email product called Hey next week and one of the really cool things about it is that it blocks these tracking pixels. We feel so strongly about this issue that we're devoting an entire episode to it.

**(00:03:15)** On today's show, Basecamp's head of marketing and our marketing designer talk about the trouble they've had finding a new email newsletter provider. Then we look at what one very privacy-centric organization did when facing a similar dilemma. So let's kick things off with Andy Didorosi, head of marketing here at Basecamp.

**Andy: (00:03:35)** Because we've largely said no to most social media aside from Twitter and we've said no to a lot of the targeted tools, like retargeting that other people use, we don't have that many tools left, so that puts more importance on a thing like a newsletter. We're treating it as something that we're putting together with a lot of care and compassion. We're trying to make something useful that we'd want to receive. We don't want to just create more digital trash out there. Digital junk mail doesn't do anybody any good.

**Wailin: (00:04:06)** What do you feel like you give up in terms of knowledge gathering or business intelligence when we're not putting tracking pixels in emails? Are we giving something up?

**Andy: (00:04:18)** Well, you put these things in emails because it costs almost nothing. You're thinking that, because you have data available to you that it's somehow inherently useful. But I can tell you from experience that we're not going to change the content of our emails based on if they're opened more or less. It's just not that interesting to us because what we have to say is based on what we're trying to get across. It isn't that we're putting out a little message, seeing how people respond to it. Does it cost us a little audience? Totally. But it's a trade-off that we're willing to make.

**Wailin: (00:04:52)** So there is a trade-off, but Andy says he's satisfied with how our newsletters perform based on the data we do measure. He sent his first email newsletter in December. This is Basecamp's main newsletter that's usually sent out once a month.

**Andy: (00:05:05)** Our last campaign that we did, we had excellent results.

**Wailin: (00:05:08)** And how did you measure that?

**Andy: (00:05:10)** We looked at how many people clicked onto the website. Now I will say, just in full transparency, that being my first email, the default Mailchimp settings were on, so it did go out with open tracking which is totally on me. I'll tell you, we haven't looked at it or used it for anything. We're not managing our audience based on who opened it or what—for all future sends there will be no open tracking whatsoever.

**Wailin: (00:05:35)** But we do look at whether people click onto the website from a link in the newsletter? That's something that we do like to look at?

**Andy: (00:05:41)** Correct. What a link will have is a UTM code. It's very transparent. We advertise in the Farnam Street newsletter and so it says source = fse, which literally means Farnam Street email. And so when you come to our site and you sign up for a trial, it scores one in the trial box for Farnam Street. That's it.

**Wailin: (00:06:01)** I've been in the habit of always deleting the UTM at the end. You know, it's like, you get a link and you're like, I want to share this, and then when you copy paste it, you're like, oh, I've got all this gobbledegook.

**Andy: (00:06:10)** I make sure that we only have one UTM tag. Some, you'll actually—you can actually see what they're thinking of you in the tags. You'll see there'll be like a demographic tag and a location tag and a what ad brought you there, tag. Like, the creative. Some of these tags can be five or six tags long. I'm just trying to have one of them. How you got to us is really the only thing we know anymore. And I'll tell you, it's not super accurate. Like you said, you can take tags out. Some people have blockers on their browsers that strip tags out. You cannot look at a data source like how many users were referred via the UTM tags and say that that's a definitive number. It's been off by a factor of two.

**(00:06:55)** So, kind of the blinder we are, the less creepy it is. I want it to be sort of like a vague inclination to how this thing did. I'm not looking at dollars and cents.

**Wailin: (00:07:03)** So Basecamp does use these UTM tags. They're campaign-based, not personal. So they're not linked to anyone's individual email address. We view it as the equivalent of using an offer code on an e-commerce website.

**(00:07:16)** Figuring out what passes our smell test is a process that started several months ago and has required Andy and our marketing designer Adam Stoddard to reevaluate our entire approach to newsletters, including what provider we use. Here's Adam.

**Adam: (00:07:29)** When Jason and David first started talking about disabling tracking pixels, it wasn't that big of a deal, we thought, because Mailchimp provides at least some control. With Mailchimp it's unfortunately on a campaign by campaign basis so there's a really strong point of failure there that someone has to remember to click the checkmarks to turn off pixel tracking, but it was kind of fine.

**(00:07:53)** But then someone on Twitter pointed out to David, I got an email from you with a tracking pixel in it. And so we dug in and it turns out that the confirmation emails, so when you sign up for an email list, you usually get a confirmation email that you have to click on to actually confirm the subscription. So those emails had Mailchimp's pixel trackers in it that aren't for our purposes at all, they weren't for customer reports. It's for whatever inscrutable purposes they're collecting that information for. Can't disable them, the only workaround in the short term was to just turn off double opt-ins completely, which isn't great in and of itself.

**(00:08:34)** With double opt-in, it's a little more work that you do have to confirm, but it also means that every email that gets on the list is an actual, real email address.

**Wailin: (00:08:43)** So the team went shopping for another newsletter provider to replace Mailchimp, which was itself a replacement for our old provider, Campaign Monitor.

**Adam: (00:08:51)** The problem is that the industry caters to the exact opposite of what we're looking for. A lot of services now are offering personalization features where it pulls in data from your own service. Like, if you run a store, it pulls in their purchase history, or maybe pulls in data from social profiles.

**Wailin: (00:09:14)** Mailchimp has a feature that we definitely don't use at Basecamp, but it speaks to how much tracking technology has evolved. It's a program where customers can send snail mail postcards to people using shipping addresses they've provided. If there's no physical mailing address on file for someone, Mailchimp tries to find one in another customer's audience based on that person's email.

**(00:09:36)** This is where the industry is headed. Even taking physical mail out of the equation, it's about increased personalization and targeting.

**Adam: (00:09:42)** Based on your activity and actions, you'll get a different sequence of emails that all provides the veneer of seeming like you're interacting with someone potentially. But it's just a logic tree of oh, this person clicked on this link, so we're going to give them this other email sequence.

**(00:10:04)** Again this is another thing that we have just absolutely zero interest in. So we're kind of in this position of trying to find some kind of workable solution and it's just concessions on all sides. So it's just a matter of which poison pill do we feel like swallowing.

**(00:10:22)** Our needs for the most part are very basic. Most of what these services offer are just so far beyond what we actually want. There's really not that many services that are catering to more of that, at least for businesses. For just like that, I just want to write a newsletter and send it to people kind of audience, there's some more personally oriented services like TinyLetter, which is now owned by Mailchimp. But they're definitely not meant for the volume that we're sending.

**Wailin: (00:10:54)** What's our biggest subscriber list? Is it a list in the tens of thousands, hundreds of thousands?

**Adam: (00:11:01)** The list was, at least for our main newsletter, it was like 800,000. But we just went through a big process of cleaning that up to be more in line with GDPR. And so, right now, it's around 200,000.

**Wailin: (00:11:15)** Oh, that's a big clean-up you did, then.

**Adam: (00:11:18)** Yeah, and a lot of that was because after we sent the last newsletter, David was like, hmm, that was 800,000 people, are we sure we're doing the right thing here?

**(00:11:29)** And as it turns out, once we dug in a little more, it's actually not kosher to automatically add people who sign up for a trial of Basecamp to the marketing list. Like what we can communicate with people without explicit marketing consent, is directly material to the service we're providing. Like, there's a service outage. This part of it, it's been no one's job so it's just been sitting around and unfortunately, that means we're dealing with a little bit of a reset.

**(00:12:06)** Whereas, if we had been a little bit more diligent about how we're collecting consent and all of those things, we'd be in a little bit better shape. So right now the trade-off is there's some software that's more self-hosted that we would have a little more control over, but then we're kind of getting back into owning the mailing list manager software and that's another thing we have to take on.

**Wailin: (00:12:25)** Yeah, that's something you would then probably have to be in charge of, right?

**Adam: (00:12:29)** Yeah, so that's not super desirable and also, at least the one we're looking at, which is Sendy.co, uses Amazon SES for sending the email. Yeah, we can turn off tracking pixels, but then we're kind of brushing up against another thing we don't want to do which is get further in bed with big tech companies. And then there's the option of a bunch of smaller senders, some of which are very promising and probably would be pretty open to making modifications to their platform, but also, I don't know if they're quite there in terms of being able to serve larger audiences.

**Wailin: (00:13:05)** Were you surprised when you were shopping around that there was no Goldilocks provider out there? Because there are so many competitors. Were you like, surely if I just keep trawling around for recommendations and do more Googling, I will find that company? Were you surprised not to find a company that seemed like a really good fit?

**Adam: (00:13:24)** Yeah. I feel like within this industry, no one feels like pixel tracking is a bad thing, it's just fundamentally accepted as a fact of nature that this is something that you do, and it's just not questioned. And I think that's why so many people are kind of bristling when David describes them as spy pixels, because they're like, well, that's not what we're doing. But yeah, yeah, you kind of are.

**Wailin: (00:13:51)** Adam and Andy are still shopping around for a newsletter provider. Now let's talk to an organization with very strong views on privacy that also wanted to send newsletters and learn how they found a provider that they felt comfortable with.

**Nabiha: (00:14:03)** My name is Nabiha Syed, I am the president of The Markup which is a brand-new investigative journalism outfit looking at how technology is being used to remake society.

**Wailin: (00:14:14)** And The Markup is obviously privacy-focused and takes that very seriously on all sides, both in its reporting and in its relationship with its readers and how it's just set up in general. How would you summarize your privacy promise?

**Nabiha: (00:14:28)** It's important to us that we are independent and trustworthy brokers when we explain to the public what is happening on the internet. And there's some vague sense that the internet doesn't exactly work the way we think, that there's seedy underbelly, some transaction is happening. And our job at The Markup is to help folks navigate that. To say, this is how stuff is really working. And so, because it was so important for us to be trustworthy as we're sort of brokering and explaining what's going on, that we thought it would be a little strange if we were also enmeshed in this surveillance infrastructure, the surveillance economy of the internet. Right? So we could talk to you all day about Facebook's tracking, but if we have a "Hey, share this on Facebook!" button at the bottom of our website, it's kind of a funny position.

**(00:15:18)** So our privacy promise is simple. We will not sell your data. We will collect the minimum amount of data from you possible in order to run our business. And we will always be transparent about what we're doing. The promise seems simple but the way it manifests itself can be complex, because when we want to have a Twitter embed on our page, we can't just use the one Twitter makes for us, we have to make everything from scratch to avoid the kind of tracking that is, of course, everywhere on the internet.

**Wailin: (00:15:48)** And so when you say minimum amount of data, how did you come up with what that meant?

**Nabiha: (00:15:54)** We'd like to say no data, but as we're learning, there are some things that you just collect by virtue of having an e—We'll know, in order to see how many people come to our website, we will maybe have some sense of what the IP address is. Now the question is, how much do we store, and how much do we keep. And so minimum is really just a way to say, look, we know that some incidental collection may happen but we really want it to be as close to zero as possible.

**Wailin: (00:16:20)** One line that really stood out to me in the letter that you wrote that was posted on The Markup when it launched is you said, because we don't track you, we don't know if you like your work. We don't know if you open our newsletter or if your cursor lingered over a particular story. Do you not even record a basic open rate?

**Nabiha: (00:16:40)** Nope! We have no idea. So it means that we don't know if people like it and we don't know if people are marking it as spam and we're ending up in people's spam inbox and that may be something that has consequences for us. Our privacy promise is so important to who we are that we're willing to experiment with all of these different features just as sort of a proof of concept of whether it's possible. Because since we're not going to track open rates, we have to do other things to determine whether people like our content or not. Like, talking to them. So we have to ask people directly, hey, do you like what we're providing to you? Fill out this survey. Or, hey, we observed this thing online, did you see it to? Participate in this call-out. So what it requires of us is to have a really hands-on approach to building a conversation with the audience because we can't rely on even basic metrics that will tell you just that.

**(00:17:37)** That is a very laborious process and it's not for everybody. But it is right for us because that's part of what we're trying to show and examine and explore whether it's possible to build the internet a little bit differently, and to build a media organization a little bit differently.

**Wailin: (00:17:53)** Of course, all these privacy concerns lead back to the issue of email tracking pixels.

**Nabiha: (00:17:58)** We knew that we wanted to have a newsletter provider that would agree to remove all tracking technology. And we have this amazing email thread where everyone's jumping in and someone's saying, you know what? It looks like there's some link decorators here. You know, this looks like a unique ID. And so the team actually rallied around the entire process of identifying what does no tracking technology mean, and is this actually possible. So then we found a couple. We found Revue and we found Substack and we ended up going with Revue, in part because it was a small team and it felt like… we were a small team about to launch, they were growing, too, and they were really responsive.

**Martijn: (00:18:38)** Hi, my name is Martijn de Kuijper, I'm the CEO of Revue. We're a editorial newsletter tool for writers and publishers. I actually started it on my own as a side project. We noticed that a lot of writers and journalists started joining our platform and that's when we started to realize that it really resonated with them. It's about content publishing, so it's not about converting people to buy more products in your webshop, for example. It's really about engagement and reaching your audience and building a more loyal audience.

**Wailin: (00:19:11)** Did you find that you were getting some ideas as well from your customers about what they wanted to see in terms of tools and ways to measure engagement, and then you were able to incorporate those into your product?

**Martijn: (00:19:22)** We're thinking about that a lot and working with publishers to find the right balance between how much they want to see and privacy. I think that's one of the important things that we're thinking about.

**Wailin: (00:19:33)** And Revue's relationship with The Markup came out of a series of conversations about privacy and what could be possible.

**Martijn: (00:19:39)** They reached out to us. When they came to us, they also started talking to us about privacy. We were always thinking about that and discussing that with publishers, but we didn't have a feature that would allow them to specifically disable everything, like, every form of tracking. And then when they talked to us, that really resonated with us and that's why we built that specific feature for them.

**(00:20:03)** And funny story is that while we were building it for them, other publishers reached out to us asking exactly the same thing, which was proof for us that this was something that was important also for publishers, and not only for us.

**Wailin: (00:20:16)** Can you talk about the range of tracking that you offer so I can get an idea of maybe what The Markup was asking for that perhaps goes further than what you had been asked for before?

**Martijn: (00:20:27)** So, obviously, the first thing you want to do is disable open and click tracking. That's the most obvious one, at least for us. Not a lot of people know that they're being tracked that way, but that's the first step. But then when we continue talking to them, we also, for our own purposes, for optimizing a platform, we track certain landing pages. We automatically add UTM tags, so yeah, we basically gave them the option to disable everything. And that's what they're really happy with.

**Wailin: (00:20:59)** And now is this offered to everyone else?

**Martijn: (00:21:01)** Yeah, so the way our platform works is we have a pro plan where everybody can just sign up, that's more for individuals that want to do a newsletter. And we have the publisher plan, so the publisher plan obviously is focused on publishers, and that's something we usually set up for them. So right now, it's still only available in the publisher plan.

**Nabiha: (00:21:22)** We wrote our very first newsletter at The Markup about the process of finding a newsletter, and the number of folks I had slide into my email saying, this is a folly. You are making a huge mistake. It's not necessarily bad to track people, it's how you understand what your audience needs, don't paint it as evil. And I responded, saying, I know the information, the knowledge I'm leaving on the table. I know that I'm not going to know open rates, I know what the down side is, but what I'm here to explore is, is there an upside. Is there something else that we can learn because we decide to connect with our audience in a more analog or more labor-intensive way. Can that be a substitute? And I think it's worth it to even try and see if that's the case, which is what we're doing.

**Wailin: (00:22:08)** Other publishers on Revue's platform can adopt The Markup's strict no tracking policy on their newsletters too, although Martijn says he expects more of a range.

**Martijn: (00:22:17)** They take a pretty strong stance there, they want to disable everything. And I think between having everything available and what they decided to do, there's a lot of room, still, right? This is something that we are thinking about a lot right now is what's in between. For example, you could also still have the open and click tracking but just not make that information available and only use aggregate analytics, for example, if that makes sense. Those are things that we are thinking about and we're discussing with publishers.

**Nabiha: (00:22:54)** Most companies are saying, we want more analytics. We're data hungry. We want everything. We don't know how we're going to use it, but it's good to have, is really the mindset. And ours is fully data minimization. We don't want it unless we know exactly what it can give us and whether that's worth it, and that last piece, whether it's worth it usually means we don't want it.

**(00:23:16)** Broken By Design by Clip Art plays.

**Nick: (00:23:17)** If this unsettles you, there are opt-outs and if you are really committed, you can find them. If you go through the big email marketing providers, Constant Contact, Campaign Monitor, Sendinblue, Mailchimp, Klaviyo, contact them. There are opt-outs available. Unfortunately, they're hidden and buried in a lot of places and really hard to find. Plead at them. Contact their support. Contact their abuse desk. You can opt out of a lot of this.

**Wailin: (00:23:58)** REWORK is produced by Shaun Hildner, and me, Wailin Wong. Music for the show is by Clip Art.

**(00:24:03)** We're on Twitter at @reworkpodcast and you can find show notes for this episode at rework.fm. If you want to sign up for Basecamp's newsletter, which goes out monthly if we have something to say, visit Basecamp.com/newsletter.

**Shaun: (00:24:16)** You can follow The Markup's investigative reporting on big tech and privacy at TheMarkup.org. And you can scroll down to the bottom of their home page to sign up for their tracking-free newsletter. They're on Twitter at @themarkup and on Instagram at @the.markup.

**(00:24:33)** You can find Revue at GetRevue.co, that's Get-R-E-V-U-E dot C-O.

**Wailin: (00:24:39)** As we mentioned earlier, Basecamp is launching a new email service on June 15th called Hey. And one feature of Hey is that the software blocks these spy pixels. Next week on REWORK, we have Basecamp co-founders Jason Fried and David Heinemeier Hansson on the show to introduce Hey and explain what it does, including protecting user privacy. That's next week on REWORK.

**Shaun: (00:24:59)** REWORK is brought to you by Basecamp. Basecamp is the all-in-one toolkit for working remotely. Because of COVID-19, your company is likely scrambling to figure out how to transition to remote work. It may feel daunting, but Basecamp is here to help. We built Basecamp to run our entire company and we've been working remotely for 20 years. We know what it takes, we do it every day, and we built those learnings into Basecamp. Check it out for yourself at Basecamp.com.
