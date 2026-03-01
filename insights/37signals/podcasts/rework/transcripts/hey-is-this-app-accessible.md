---
title: "HEY, is this app accessible?"
description: "How Basecamp’s Michael Berger approached accessibility during the development of HEY, including collaborating with a blind Basecamp user on accessible features that ultimately improved the experience for everyone."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/hey-is-this-app-accessible/
tags:
- podcast
---

# HEY, is this app accessible?

**(00:00:00)** Broken By Design by Clip Art plays.

**Wailin: (00:00:01)** Welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m Wailin Wong,

**Shaun: (00:00:08)** And I’m Shaun Hildner. Today on the show, we’re talking about an important topic in software design and development that we will be the first to admit, took a while to get onto Basecamp’s. radar. And that’s accessibility.

**Wailin: (00:00:19)** Because we didn’t start working on these issues in earnest until we had a fully mature product, we learned how difficult it is to improve accessibility after the fact. It really is essential to build, from the outset, a product that is great to use for people who might have visual or hearing or motor impairments. And as you’ll hear, we took that imperative when we built HEY, our new email service.

**Michael: (00:00:50)** I’m Michael Berger, and I lead quality and accessibility here at Basecamp.

**Wailin: (00:00:56)** And Michael Berger, how did you get interested in accessibility?

**Michael: (00:01:00)** I’d been doing QA at Basecamp for a number of years. In the back of my head, I always felt like accessibility was something that fell under sort of the umbrella product quality. During QA, we have these ebbs and flows of work to be done, because we’re very reactive to the features that other teams are developing. And so there would be these times when there wasn’t anything to be testing. And you get into this feeling of like, well, how do I spend my time, what should I be doing right now? And because I had this thought, in the back of my mind that like accessibility is something that I could be doing. I just sort of compelled myself to like start digging into it.

**(00:01:43)** I had been exposed to it a bit, a few years before Jason Zimdars, who works at Basecamp, had shared a recording of someone using Basecamp using a screen reader. And it was just so painful, this cringe-worthy experience of everyone that the company listening to this recording and wondering how on earth someone could operate our interface based on what they were hearing from the screen reader.

**(00:02:08)** If you are low vision, or if you’re blind, what a screen reader will do is describe the webpage to you and how to interact with elements and such.

**Wailin: (00:02:19)** When using a screen reader, you press tab and the screen reader technology will focus on different elements of the page and tell you what you’re focusing on. So it might sound something like this. This is an example of a screen reader going through HEY, our email service,

**Screen Reader Voice: (00:02:34)** One item selected. Reply later, set aside, mark unseen, move to paper trail, move to the feed.

**Wailin: (00:02:40)** Now this was not what Michael witnessed when the company watched this walkthrough of someone trying to use Basecamp 2 with a screen reader.

**Michael: (00:02:48)** Because we never really considered that experience completely, there would be three focusable elements that served the same purpose, like links to the same thing right next to each other, that someone using a screen reader would have to hear announced several times in a row.

**(00:03:04)** Another common case was you land on element. And it was just unclear how you interacted with it and what it was used for.

**Screen Reader Voice: (00:03:12)** Interact with edit text, insertion on word, edit text insertion on word, type your message here, back, did button back didn’t blink back did button…

**Michael: (00:03:19)** And that just really impacted me. I was just so blown away by how bad it could be.

**Wailin: (00:03:26)** You know, just to take maybe a quick step back. What does accessibility mean for software products and web apps like Basecamp? And what are the aspects of the customer experience that you want to prioritize when you think about accessibility for products like ours?

**Michael: (00:03:41)** The sort of overarching principles fall under what’s called the Web Content Accessibility Guidelines. And the four primary basic principles of this focus of design is that the content is perceivable. That all interface elements are operable and can be operated by anyone. That the content and controls are understandable and clear, and that the content must be robust enough to work with current and future technologies.

**(00:04:10)** The most common way that people look at it is designing for screen readers, screen reader technology. Going along with that is also making sure that every element on the page can be operated without the use of a mouse. Let’s say you have a motor function disability, or even a temporary motor function challenge, like a broken arm or something. Being able to operate the complete web app without using a mouse is really critical.

**(00:04:38)** It also goes into things like color contrast, making sure that everything on the page has enough contrast to be visible by both those with low vision or color blindness. We also make sure that all of our video content or our demos have subtitles and can be accessed by people who are deaf or hearing impaired.

**Wailin: (00:05:01)** Here’s a screen reader 101 question. Do screen readers work basically the same or then do you have to worry about how it’s going to work on this screen reader versus this other popular model of screen reader, just like you have to make sure that your mobile apps work on an Android phone of this size, and that size, and then an iPhone and an iPad and all that stuff?

**Michael: (00:05:24)** It’s wildly different across screen readers. There’s sort of three main screen readers on desktop. There’s VoiceOver, which is made by Apple, it’s sort of the one that you use, if you have a Mac. And on Windows, you have two main options, JAWS, and NVDA.

**(00:05:42)** They all have their own unique way of implementing how to render an element. And so it’s a lot of work to make sure that something works across all of these screen readers. When you bring into account that we might also want to support different browsers, and these screen reader combinations, it adds an extra layer of complexity.

**(00:06:08)** And this sort of thing needs to be considered at every level of product design. There’s one baseline of creating a functional experience. And then there’s sort of how do we create a really good experience?

**Wailin: (00:06:20)** And that’s the bar that you wanted to hit with HEY, right? Because for the first time, since you started taking on accessibility as part of your job responsibilities, you had an opportunity to say, what if we designed for accessibility from the beginning, right? Rather than what you were doing with Basecamp, which is trying to make features accessible after the fact, which I don’t know if you want to talk about that for a little bit. But that seems like it would be such a challenge.

**Michael: (00:06:48)** Exactly. So as a company, we are a small team. And we need to be very selective with how we spend our development time. And with Basecamp 3, I sort of started looking at accessibility, maybe like midway into the product’s lifecycle. The product had been out in the world for a few years before I started looking at accessibility. And so based on this way of operating, we were making sure that each new feature that we shipped from that point forward was designed in an accessible way. But there were all these preexisting challenges with the product that made it perpetually inaccessible.

**(00:07:30)** Which is hard when you’re three or four years into your job as an accessibility professional, and you can’t quite show as much as you’d like for it. You can’t wave a flag and say, check out this accessible product that we have, because there are still these aspects of it that are not hitting the mark.

**(00:07:48)** So with HEY, it was a really exciting opportunity to start fresh, and because not only myself, but our entire team had built up this muscle for considering accessibility and knowing what sorts of considerations might be necessary very early in the design phase of a project. By the time we launched HEY, a lot of things were fixed. But more than anything, we had very clear sense of what about this product is good from an accessibility perspective and what do we really need to improve?

**Wailin: (00:08:20)** What were some of the top things on your wish list, on your priority list for HEY, when you think about how you want an email service to function for someone who might have a visual impairment, who might have an impairment with their motor skills. What are the things where you’re like, these are almost my non-negotiables, or these are the things we have to do?

**Michael: (00:08:44)** It’s sort of interesting, because so much of this comes back to the basics of UX design. And there’s this principle in the accessibility world that designing for accessibility, oftentimes results in better features for all of your users. And this was a really great example of that. The keyboard navigation was a huge one, making sure that everything can be operated using keyboard shortcuts, or consistent keyboard navigation. And we’d sort of gotten halfway there before launch, for example, we have the Imbox, which is one of the main screens in the app was very functional with the keyboard navigation. But it wasn’t 100%. And with accessibility, like kind of need to get to 100%. If you can expect that things are going to work the same across every page in every sort of instance, it affects the mental model that your user is creating in their mind.

**(00:09:42)** Because if you’re blind and you’re using an app, as you’re using it, you’re sort of designing it in your head, you’re understanding, you know, what is this product? How does this work? And so that’s where the consistency needs to be really considered.

**(00:09:55)** Some other really critical aspects that we needed to make sure were implemented well for HEY, were a lot of our autocomplete pickers and things like that needed to be really clear in announcing the number of results that were in the list. And live results as you filtered. If I’m sending a message to you, I would type in like, W and it would say, “There’s 30 email addresses that have W in that.” And then as I type A, I, L, it’ll filter down to just you and it’ll announce your name. And it’ll be clear that there’s only one result there.

**Screen Reader Voice: (00:10:30)** Menu pop up, combo box, article, Wendy Wallace selected one of 20. Wailin Wong. Selected. One of four. To display a list of choices, press control option…

**Michael: (00:10:40)** And this is something that’s super obvious if you are looking at your screen. You can see that after you hit enter after typing Wailin, the address is there. But if we don’t put in the effort to communicate that, you could be unexpectedly sending an email to someone.

**(00:10:56)** So those sorts of live announcements are something that was also really critical for us to add. And we’re still incorporating some of those. But anytime that there’s a visual communication that something has happened, then there needs to be a non-visual equivalent for that.

**Wailin: (00:11:10)** Were there any aspects of HEY, that we’re particularly challenging to figure out from an accessibility perspective? Because there’s probably quite a bit of prior art for traditional email systems, something like Gmail or Microsoft Outlook. They’ve been around for a long enough time that I imagine there’s some interesting precedent there maybe industry standards. But with HEY, there’s all these features that only we have, that you don’t find elsewhere. And so did you have to really find your own way on some of those features?

**Michael: (00:11:44)** It was really nice being able to reference the other email web apps that are out there. This was an area where incorporating feedback from a couple of blind customers that I work with was really valuable for them to be able to share, for example, like whether the Gmail keyboard interaction experience was good or bad. You can only be so close to it as someone who doesn’t use accessible technology on a daily basis.

**Wailin: (00:12:10)** When in the process did you bring in blind and visually impaired customers to do some testing and feedback?

**Michael: (00:12:17)** That’s been sort of an interesting area of exploration for me. Sort of understanding, when is the best time to do this? You can’t really do it super early on, because if you’re aware of these major accessibility pitfalls in the product, you can’t expect good feedback from someone as they struggle through using your product. But I, pretty early on, partnered with a couple people who use a screen reader full time just to get sort of general feedback.

**Wailin: (00:12:44)** One of those people is Scott.

**Scott: (00:12:47)** I’m Scott Ballard-Ridley, I am a healthcare improvement coach by background, which kind of means that I deliver healthcare improvement training to healthcare professionals. I trained as a physical therapist originally, back in 2007. And then I suffered quite a major stroke, which caused me to lose my vision and I was 22 at the time. My involvement with Basecamp was, as most of these things come about, started about scratching my own itch. The company that I work for were looking at a project management solution so I looked at Basecamp. And this was about three years ago, I think? And it was okay in terms of accessibility. But it wasn’t really great for me to be able to use on a daily basis. But to be honest with you, none of the apps in the same space were.

**(00:13:40)** I contacted support, and they put me in touch with Michael, and he was great. He contacted me and said, we’re aware of lots of accessibility issues with Basecamp. It’s something that we’re looking to change. But do you have any specific feedback, are there any things that would make a real difference to you? And that kind of really started our dialogue. And that made a real difference for me to how I could use Basecamp within our organization.

**(00:14:08)** And then that led on to when he was coming into development.

**Wailin: (00:14:13)** We’ll get back to how Scott and Michael worked together on HEY. But first, we’re going to hear from Scott on his experience with screen reader technology in the last decade plus.

**Scott: (00:14:20)** I kind of had to relearn life with lots of physical impairments. But a really big part of that, for me, was learning to use a computer and it was also around that time that Apple introduced their screen reader VoiceOver on the iPhone, which meant that people with a visual impairment could also use a touchscreen for the first time, which was really revolutionary, so.

**Wailin: (00:14:42)** What were some of the hardest parts to get used to when you were learning to use the screen reader as someone who had interacted with a computer and done everything on a computer without a screen reader before? What was the experience like of having to use a screen reader and have the elements read to you that way?

**Scott: (00:15:01)** The biggest one initially was actually learning to touch type. I was a fairly proficient typist before, and thought I was a touch typist. But actually, when you have your vision taken away, you then realize, actually, you’re not as good a touch typist as you thought you were. So I had to really, really learn how to touch type and learn what all of the keys were and all of the function keys and the number row and things like that. And that was a really big learning curve for me, because the screen reader uses keyboard shortcuts to do a large number of secondary functions. So yeah, that was a really big and quite steep learning curve.

**Wailin: (00:15:40)** Has screen reader technology improved quite a bit in the years since you’ve been using one as well?

**Scott: (00:15:47)** Yeah, massively. Desktop screen readers, there’s kind of more use of AI to help with things like picture recognition and things like that. Mobile screen readers have improved immensely, since I started using one so I can now use my smartphone in the same way probably that a sighted person would do. And it’s down to the manufacturers of the devices. So whereas previously, I would have had a phone, and it would have been say, Nokia [pronounced with short O] phone or Nokia [pronounced with long O] phone, as you guys say, in the States.

**Wailin: (00:16:23)** I didn’t realize he said that differently, too.

**Scott: (00:16:25)** Yeah. I would have had a phone and I would have then had to spend not insignificant amounts of money putting a screen reader on that phone. And then if I wanted to change device, I would have then had spend a separate amount of money to move the screen reader from device to device. But also would have had to get sighted assistance to help me put the screen reader on the device in the first place.

**(00:16:48)** Now, the device manufacturers have built in the screen readers into the devices, which means that I can just buy any off the shelf phone, and can set up without any sighted assistance, which has been a huge boon for me. But also many of the apps and common things that people use are accessible as well so they tie into the screen reader. I mean that I can use many of the same programs and software features that my sighted peers are using as well, which is a huge thing for me and has been something that a lot of blind and visually impaired people have been talking about for a long time, is that they feel very isolated from the rest of the world, because they’ve got sighted friends who are talking about new services or new platforms that they want to be able to have access to, but they just can’t because they’re not accessible.

**Wailin: (00:17:42)** Speaking of new apps, it wasn’t too long ago that Scott heard a little scuttlebutt about a novel email service that Basecamp was building. Scott reached out to Michael.

**Scott: (00:17:51)** I’d been hearing a bit of drums beating about this product. And I contacted him and said, look, I’d really like to try this out. And he said, yeah, we’d love to get some testers involved. He set me up with an account and I just fell in love with it. And it really suited my kind of sensibilities. But there were some accessibility issues that kind of needed addressing as well.

**(00:18:18)** And then when it was released more publicly, that kind of surfaced more issues as well. And actually, for me, I was really keen to try HEY for Work. For me, that was really key if this product was going to be used in the workplace, you know, if you’ve got employees who are working for an organization, the levels of accessibility on a corporate level almost needs to be higher than for a commercial level. Because if you’re using email, on a personal level, you know, if it’s not meeting your needs in terms of accessibility, you can leave. But if you’re being forced to use an email product by your company, you don’t have as much agency to leave.

**(00:18:57)** For me, that was a really around how can we make this product as accessible as possible? It’s just been really great working with Michael and I’ve had a few kind of engagements with other members of the team as well.

**Wailin: (00:19:10)** Can you talk about some of the most critical issues that you were able to raise with the team during the development process? This can be either the original HEY personal product, or HEY for Work. But what were some things where, when you started testing it and using it, you said, oh, these things need to be fixed before launch if possible.

**Scott: (00:19:33)** Michael and the team had done a really good job on the main functionality. For me it was more about workflow things in the iOS app, for example. To compose a new message it’s written as like, write, W-R-I-T-E. But when that’s spoken by a screen reader that could be misinterpreted as like right as in to go right. I found that that just didn’t give enough clarity as to what that button was used for.

**(00:20:05)** I felt for a new user coming to the app, and somebody who was looking to write a new message, there wasn’t enough clarity there. So Michael actually added some more context to the button. And actually, I don’t think it’s changed anything visually for any sighted users of the app, but he’s just changed slightly the description of the button. So for anyone using a screen reader, I think it’s now like, “Write a new message,” which makes huge difference for a screen reader user.

**Screen Reader Voice: (00:20:34)** Imbox, window, link. Write a new message has keyboard focus.

**Wailin: (00:20:39)** Yeah, I mean, and and that’s an argument in favor of bringing on testers to provide feedback earlier on in the process, right? Because you need to kind of give enough time to poke into all the corners of the app, right?

**Scott: (00:20:53)** I would even go as far as to say, is maybe even an argument for having a blind member of staff on the QA team. But yeah, certainly bringing people in who can really kick the tires and are able to articulate what the issue is, in a clear and concise way. Once you have that process working really well, it then doesn’t cause too many issues.

**(00:21:17)** So one thing that I’ve encountered a lot with accessibility issues, certainly other organizations, is that if the accessibility consultation process had happened right back at the inception, and these things had been taken into account when the product is being built… It’s much easier to implement good accessibility practices when something’s being built, rather than to build something with not so good accessibility practices, and then have to go back and retrofit accessibility changes.

**Michael: (00:21:53)** I used screen reader users as an example here, but in general, you want to test with and incorporate feedback from people who have a variety of different disabilities. But it helps when you have something to show and then still time to go back and make tweaks. Sometimes that’s the case for us. Sometimes it’s not. And so we sort of need to find that line of seeking feedback early enough, when there’s still an opportunity to make some tweaks. But it needs to be far enough along that you still have something to, to look at together.

**Wailin: (00:22:19)** To help find this balance and because he wanted to have dedicated programming resources for the accessibility work, Michael decided to bring on an outside contractor.

**Michael: (00:22:28)** You know, all along, we had ambitions to make HEY our most accessible product to date. It was always my attention, at least. So when we’re getting closer to shipping the product, I was aware already that there were a number of accessibility concerns that we still needed to address. When we launched, it was sort of like a frenzy for our whole team. There was so much just general bug fixing and improvements to spend time on that it was pretty apparent, quickly, that there wasn’t going to be an abundance of time from our core product team to spend on working on these accessibility issues.

**(00:23:08)** And so both David and Kasper, a member of our core team here, had separately suggested the idea of bringing on a contractor to help out with this. When I considered this, I thought this is a great opportunity to have someone who’s also familiar with accessibility work to sort of come in and help us lay a really good foundation. Kasper is also a member of the Rails core team. And he had spotted some accessibility flavored pull requests from Sean Doyle, who is the contractor that we ended up hiring from thoughtbot. It was sort of like a slam dunk moment for us.

**Wailin: (00:23:49)** And so I think this is something you mentioned in your write up for the company summing up a recent cycle of work that you finished. You had mentioned that a next step might be a third party audit. Do you want to talk about what might be kind of in the near future as we keep building out HEY?

**Michael: (00:24:03)** So before we started to address the accessibility concerns in HEY, myself, and this team we work with through Aspiritech. Aspiritech is a really great organization. They employ people on the autism spectrum to do QA testing work. Myself and them went through and sort of reviewed every aspect of HEY and documented areas where the accessibility was falling short. This was the base that we used for deciding what to prioritize and what to work on for accessibility remediation.

**(00:24:37)** As sort of a final piece of the puzzle, what we’d like to do is bring in a third-party company who specializes in doing these audits. And that’ll sort of just give us this additional stamp of approval that we can share with our customers.

**(00:24:53)** Another next step. For me personally, what I’ve been challenging myself to do is to develop my I basic programming skills and to be able to fix a lot of these accessibility concerns on my own.

**Wailin: (00:25:08)** What advice would you give someone working at a software company who wants to start tackling accessibility, but they might be coming to it kind of late in the game, or maybe their company is coming to it belatedly?

**Michael: (00:25:21)** Tshe most important thing is building awareness, I think, both for yourself and across the company. When I, you know, back in the day had this feeling of like, oh, accessibility is something we should be working on. First thing I did was take a deep breath and turn on my screen reader. Well, first I did like a little tutorial on how to use the screen reader because I had no idea. And then I turned it on. And I just started reviewing the product in the most basic way, and documenting issues as I saw them and trying to sort of create some level of priority among those issues that I was discovering.

**(00:26:01)** When I then went into trying to remediate those issues and researching the proper way to do things. I got a little overwhelmed pretty quickly. And, must have been like, a week or two, after this first time, I turned on a screen reader that I started to look into conferences. I was like, Oh, well, maybe a conference would be a great way to learn.

**(00:26:24)** I saw that the big, accessible technology conference, which is called CSUN was coming up the next week, I was like, am I just jumping into this too quickly? Am I over eager, but one of the best decisions I’ve made in this whole journey was just buying that conference ticket, buying that flight, and getting right out there. And that first year at the CSUN conference was so illuminating. I guess it sort of depends on your learning style. For me, sitting in a room, hearing a lecture, visual aids and being able to ask questions, and then starting to build some connections among community is really how I learn best. And so that first year out at CSUN was so clarifying, for me. I came back with this huge backpack of knowledge that I could share with the company. Both how to technically make things accessible, and also techniques for how to build awareness among the company.

**(00:27:19)** At the time, it wasn’t something that anyone else save for sort of a few people casually were really like tuned into, and I have this agenda that I gave myself of making this something that we cared about as a company. I think in part, we’re still at a point where accessibility isn’t yet considered a baseline requirement norm of software development. It’s still perceived as like this extra thing. And because of that, when you show your commitment and interest in making it a priority, the community really responds.

**Scott: (00:27:57)** A lot of developers think that implementing accessibility or good accessibility practices is going to be huge amounts of additional work for them. But actually, some of the things that will make the biggest difference to many users are actually fairly low level. So things like labeling a button properly, actually makes some of the biggest differences to particularly blind and low vision users. So yeah, things like labeling buttons or labeling assets correctly, are some of the biggest and quickest things to do.

**(00:28:36)** I say this as somebody who isn’t a developer, but it’s certainly been reported by many developers who had a previously inaccessible or very inaccessible app and have made some of these changes. They’re actually really surprised by how little work it takes to make their app fairly accessible or even completely accessible. But then actually just familiarizing yourself with something like a screen reader. So just running your program with those screen readers turned on, will actually turn up some fairly standard issues. It’s quite a big addressable market. I think there’s something like 15% of people on the web will have or have some form of disability. Good accessibility makes things more accessible for everyone. And also, we don’t know when we may also need to use some of these accessibility tools ourselves somewhere on the road, so we’re kind of future proofing things for ourselves as well.

**Wailin: (00:29:42)** REWORK is produced by Shaun Hildner and me, Wailin Wong. Music for the show is by Clip Art.

**Shaun: (00:29:47)** You can read more about Michael’s work on HEY at hey.com/accessibility. That’s hey.com/accessibility. We will link to that in the show notes for this episode, which you can find on our freshly redesigned website rework.fm It’s the same URL but a totally different look. And it’s absolutely amazing.

**Wailin: (00:30:06)** We should play like an air horn sound here.

**Shaun: (00:30:07)** If you keep calling me out in public about not adding enough air horn to this show I’m quitting.

**Wailin: (00:30:17)** [Laughs] Oh, okay. If you’re a new listener, be sure to click on explore the archive on the left-hand side. You can see our previous episodes sorted by category like privacy, small business, and episodes featuring Jason Fried and David Heinemeier Hansson. There’s all kinds of other neat features too, like you can play an episode and it’ll keep playing even if you click around to other parts of the site.

**(00:30:39)** Big thanks to our colleague Adam Stoddard for the website makeover. And if you want to hear him talk about his approach to design. I suggest Episode 90, which is called Manos: The Hands of HEY.

**Shaun: (00:30:50)** The greatest of all titles.

**Wailin: (00:30:52)** Oh, thank you. I really just shouted out this episode because I was so proud of the title.

**Both: (00:30:57)** [Laugh]

**(00:31:11)** Air horns!

This is an episode title
