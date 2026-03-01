---
title: "Ruby on Rails"
description: "In 2004, Basecamp CTO David Heinemeier Hansson released a framework called Ruby on Rails that has since been used by over 1.2 million web applications including Twitter, Airbnb, Hulu, and, of course, Basecamp."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/ruby-on-rails/
tags:
- podcast
---

# Ruby on Rails

**Wailin: (00:00:00)** Welcome to a bonus episode of REWORK, the podcast by Basecamp about the better way to work and run your business. I’m Wailin Wong.

**Shaun: (00:00:07)** And I’m Shaun Hildner. Recently I noticed Basecamp CTO David Heinemeier Hansson has been tweeting about a framework he wrote called Ruby on Rails, and I realized that many of our listeners to this show and certainly at least one of the hosts aren’t really that familiar with what Rails even is. So, I decided to just ask him. David is extremely good at explaining complicated things to idiots like me, and the way he talks about writing code is just really beautiful. So, here’s my conversation with David Heinemeier Hansson on creating Ruby on Rails.

**(00:00:40)** Do you want to just start off by telling me what Ruby on Rails is?

**David: (00:00:43)** So, Ruby on Rails is a toolkit. It’s a toolkit for building web applications, kind of like Basecamp, kind of like Github, kind of like Twitter. Kind of like any of the web applications pretty much that I think most people would be familiar with, using the web. And toolkit really means it’s a series of what we call in computer language, frameworks and libraries that just makes the act of programming easier. You’re not starting from scratch. You’re not building a house by first putting clay on top of straws and baking your own bricks in the sun. That’s pretty much how a lot of programming can be like if you’re not using frameworks and libraries. You’re essentially trying to make your own bricks before you start building a house. Well, as it turns out, with houses as with software, it’s a lot easier if someone else just made the brick and the PVC pipe and the faucet outlets, and you just have to put things together. And that really is what Rails is. It’s all these standard building blocks that most people will need, most of the time.

**(00:01:51)** Now, Rails is built on top of a specific programming language called Ruby. That’s how it got to be Ruby on Rails. Actually, it got to be Ruby on Rails because I could not get Rails.com. Or Rails.org. And then I was like, I have to come up for another name for this in order to get the domain name. So, I was like, what about Ruby on Rails. That sounds good.

**(00:02:17)** But what was kind of neat about that was—it’s not just about Rails. It’s just as much, if not moreso in many ways about this unique special, beautiful programming language called Ruby. That was first christened in 1993. Actually, just a few days ago, I think it was early this week or late last week, Ruby celebrated its 26th birthday. Which is kind of amazing in its own right. There’s been hundreds of programming languages over the years. Most of them have not made it to year 26 and still been able to celebrate being in vogue and still being used. But Ruby has. And I think it’s because Ruby is special.

**(00:03:01)** It’s not just special to me. I think it’s special to a lot of people. I’ll talk about why it’s special to me.

**Shaun: (00:03:05)** Sure.

**David: (00:03:06)** When I first encountered Ruby I had been doing programming for a few years. I dabbled, sort of, in programming for even longer than that. But I had already sort of been making stuff for a couple years. I’d been using something called PHP, in particular. I had also worked with Java. I had also worked with a Microsoft set-up called ASP. But, working in those domains—it was sort of one of those things where you go, “Eh, it’s fine.” It kind of does what I need it to do. But I’m not exactly, like, enjoying myself. Like, I’m not just waking up in the morning, going, oh man, I wish I could write some more PHP code because that’s just inherently fun. I was writing PHP because I wanted results. I wanted specific applications and PHP was fine for doing that.

**(00:03:58)** Well, what happened then was we were actually about to build Basecamp and I kind of felt that I had the authority—in part because Jason didn’t really know either way—to pick the language and the environment that we should build this in. And I’d been sort of observing Ruby from afar for a while. I had been reading about these other prominent computer scientists and programmers who’d been writing articles explaining programming techniques and using the Ruby programming language to do that explanation. And usually, they’d always preface their article basically saying, yeah, I know no one is really using Ruby for commercial stuff but I really like it so let me show you this idea in it.

**(00:04:43)** And I went, well, if all these esteemed people in the industry would really like to write Ruby but they just can’t for various commercial reasons, why wouldn’t I write Ruby if I’m not barred from doing so for commercial reasons?

**(00:04:58)** Here, I basically have this opportunity to create Basecamp from scratch in something new. So, I can choose to use Ruby. And I gave myself this test. I was going to spend one week just getting basically familiar with the language and then I think I said, within two or three weeks, I had to feel like I can do this. I can actually write Basecamp by myself in this brand-new programming language I haven’t really used a lot before. And, it—I mean, it was barely before the week was over before I was completely head-over-heels smitten with Ruby the programming language. I mean, it really just blew my mind. And, I’m imaging myself going through that. It’s not the cosmic brain thing, it’s that other guy that goes “Boof” and you see his kind of hands explode and things fly out of his brain. That was really how I felt getting into Ruby, because Ruby just had so many answers for questions I didn’t even know were possible. Or were there to be asked.

**Shaun: (00:06:00)** What does that mean?

**David: (00:06:02)** It means that a lot of the constructs of the language itself were just really novel to me and they were novel in ways where they were addressing issues and pains that I had felt in PHP but that I didn’t know could be cured. That I didn’t know could be addressed in these elegant fashioned. One of the main areas of discovery I had was this thing called meta-programming, where you’re basically, you’re writing a program that writes another program. Or that generates programming. And Ruby just has an exquisitely nice way of doing that. Exquisitely nice way of meta-programming. You’re writing a small program that then generates a larger program. And that allows you to turn something that used to be sort of this large drudgery into something that just feels so elegant.

**(00:06:53)** We call this DSLs. Domain Specific Languages. And Ruby is exceptional at writing Domain Specific Languages. And that’s why when you look at a piece of beautiful Ruby code, it really kind of reads like English in a lot of cases. You can structure the language and its use in such a way that even a non-programmer could look at a piece of Ruby code and go, yeah I get that. I understand how that works. That’s not a super common thing in programming languages. Sometimes that can happen, and you can kind of do it with toy examples in a lot of languages, but in Ruby you can really do it for most things, most of the time. And that’s kind of exceptional, and it’s not just because, oh well, you can get a non-programmer to read this piece of code, that’s not something that happens a lot, right? It’s that when you get to that level, when you clear that bar that anyone could read it, it’s because it is simple and concise and straightforward in a way that is intensely satisfying and a programmer.

**(00:08:00)** So, for me, discovering Ruby was really discovering software writing. Not just software construction. Not just software putting shit togetherness, but software writing in a way where I became inspired to write elegant code. To write really pure, readable, succinct, clean code. Not just getting it to work.

**(00:08:25)** A lot of programming, especially for people who are not programmers, they think of like. Oh, you do programming because you want to get something to work. Yeah, that’s one aspect of it. That’s one reason why we program. But it’s not the only reason. There’s also an expression of creativity and an expression of self and an expression of taste when you write. Just like there is in writing. Different writers have different styles and I also write a lot of normal prose. The books or the blog posts, or whatever. And I find the same sense of enjoyment in both endeavors.

**(00:09:02)** A lot of that is about Ruby allowing you to think and act as a software writer. They take so much of the distraction of the programming nonsense away. It kind of boils it down to just its essence. And then, when you’re dealing with just that essence, it is so much easier to get into this flow state where you’re kind of dancing with the words in a way just the same as I do when I really get into writing prose. Where, writing the books, you really get into writing this essay, and you’re trying to find just the right expression. Just the right words. Pare down the paragraphs until they really just pack punch and you get to do that in Ruby in much the same way. And it’s just invigorating.

**(00:09:52)** Anyway. That’s a long way of saying that Ruby is an exceptional programming language, one that transitioned me from being a programmer who programmed just to get programs to being a programmer who programmed for its own sake. That’s almost sort of like a programming, programming riddle. But it was really true, and I think it put my programming career on a completely different trajectory than the one that it was on. Because I started just being infatuated with this sense of progression and getting better and learning all the nooks and crannies of the Ruby programming language in much the same way that I’ve tried to master English as a second language and as the primary language that I use for writing. That was how it felt with Ruby and it just had such an invitational gravity to it that I just couldn’t put it down. I wanted to write more Ruby.

**(00:10:46)** I mean, I also wanted to use it to build some stuff but at times it almost became secondary, what I was trying to build and the primary purpose was dancing with this beautiful language.

**Shaun: (00:10:57)** Yeah, I think you tweeted about that last week, about how if you weren’t using Rails, or building Rails to build Basecamp it would have been something else.

**David: (00:11:06)** Yes. It wasn’t that Basecamp was just my true calling of an idea and I couldn’t imagine doing anything else. In fact, Jason and I had worked on several projects prior to Basecamp, including the first one we worked together which was an app called Single File, which was a way to keep track of your books and who you’d lent it to and which one you had and so forth. And, we built that in PHP and if that had been the project that we had embarked on when I discovered Ruby or chose to dive into it, it would have been much the same.

**(00:11:41)** I would still have, I’m sure, fallen in love with Ruby and then realized that at the time I fell in love with Ruby, not a whole lot of other people, especially in the west were in love with Ruby. There was this small passionate community where almost none of the members got to write Ruby professionally. I showed up to the first Ruby conference that I went to, which I think was like, RubyConf3. The third major American conference for Ruby and maybe we were like 42 people there. And I asked, I remember, when I did my presentation on Rails, how many are writing Ruby professionally? How many get paid to write Ruby. I put up on my hand because Jason was paying me to write Ruby and one other person put up their hand. That was it.

**Shaun: (00:12:26)** Wow.

**David: (00:12:26)** There was literally in that congregation two people who got to write Ruby for pay. Everyone else was just writing Ruby for fun.

**Shaun: (00:12:33)** Do you know why that is? Why it became like a hobby language instead of a professional language?

**David: (00:12:37)** It was more the other way around, that it started as a hobby language. That it was not well known in the west, and part of that was it was—it came out of Japan. It was christened there in ’93. And, the Japanese community and the Japanese language barrier, I think, didn’t exactly accelerate its growth in the US. And I think, also around that same time, there were just some behemoths pushing their own languages. IBM and Sun were pushing Java and Microsoft were pushing whatever they were doing. And a lot of organizations of programmers saw those as the safe choices. That you either went with one of these big commercial languages, or you went with one of these other open source languages like Perl or Python or PHP that were all created by westerners and all had documentation in English and so forth. Ruby had to overcome first, I think, its language barrier. And then it had to grow a community of self-sustaining sort of mass in the US and in the western world, which was a lot about just getting documentation and books out in English.

**(00:13:49)** And also having a purpose. There were a lot of programmers who thought, oh man, Ruby is really neat. I’m not sure what to use it for. Like, I don’t know what should I build with it? There wasn’t an obvious answer for a while and Rails helped provide one obvious answer. Oh, you can use Ruby to build web applications. That was really my contribution, I think, to the ascent of Ruby in the west, was to give it a purpose. A clear, defined purpose that was very easy for people to on-board.

**(00:14:23)** They weren’t learning Ruby just because, oh, let me learn another programming language because it’s fun to learn programming languages. There’s certainly programmers like that. I really respect them. I’m not one of them. I’m learning a programming language because I want to do something. Then, as we’ve talked about at length, I then fell in love with Ruby and I’m so thankful that I got exposed to that. But it wasn’t the initial motivation. The initial motivation wasn’t just, let me learn one of the hundreds of programming languages you could possibly learn just for the intellectual stimulation. I learned Ruby because I wanted to build something real in it and I thought there was a better way to do it than the environments I had used before.

**(00:15:03)** And then we wrapped this whole thing up, or I wrapped this whole thing up in a neat extremely accessible package. And we—I used some techniques that at the time were not that common for open source packages, and certainly not for programming languages that weren’t being pushed by a commercial backer. I treated it like it was, essentially, a product. A commercial product that I was pushing. So I invested my time and my effort into marketing.

**(00:15:33)** And a lot of that was of course just guerilla marketing. It wasn’t exactly, I was buying billboards. There was no money behind this. But, it was using guerilla marketing tactics of creating awareness, provoking dogmas and making a mark for the Ruby programming language through Rails. Then, as it were, we had Basecamp that was taking off at the same time and allowing us, and allowing me to use that as a case for, this really works. This isn’t just an intellectual exercise. Look what I built. Do you want to build stuff like that? Here’s how I did it. You can have it for free. I’ve spent many hours documenting this stuff. I recorded videos, screen casts, which was not at all common at the time, either. And, I think it also just fundamentally represented a real substantial leap forward for a lot of people compared to what they were using at the time.

**(00:16:32)** Ruby on Rails truly, legitimately was better. As in, it made the work that they had to do much easier. It abstracted a lot of things that programmers kept doing over and over again that a lot of programmers truly were making their own mud and turning it into bricks. And I showed up and said, hey, you don’t have to do that. You can just use all these bricks for free. And not that surprisingly, that was a pretty compelling argument.

**Shaun: (00:16:59)** Can you talk a little bit about the Rails community as it stands today?

**David: (00:17:02)** Sure.

**Shaun: (00:17:02)** We’ve come a long way from 42 people at Rubyconf.

**David: (00:17:06)** We really have. And we came a long way very quickly, which was also sort of interesting. Ruby had really a rocket ship ascent. After Ruby on Rails was released in 2004, it only took, I think, like a year and a half before we did the first Railsconf of which I think 300 people showed up at.

**Shaun: (00:17:25)** Oh, wow.

**David: (00:17:25)** Then we did another Railsconf the following year and I think like, 800 people showed up. And then we did another Railsconf the following year and like 2,200 people showed up. So, it had a very quick ascent and it captured the spirit of that time. The reemergence and resurgence of web applications and developing for the web, just at the right time. Which really just brought it to the forefront of mindshare rapidly.

**(00:17:54)** And then, of course, there’s some growing pains, I think that come with that. One thing is that people just extrapolate from that in thinking, oh, because you grew exponentially year over year, that that’s going to continue in eternity and Ruby is going to the only programming language that you’re essentially allowed to write web applications in. Which is, of course, utter nonsense.

**(00:18:16)** So, we kind of just reached a level of self-sustainingness for the Rails community very quickly. And then we just kept at it. I think that’s the other thing that’s kind of unique with the Ruby on Rails community, is, certainly from my involvement. I just stayed on. Like, I’ve been working on Rails now for, what is that going to be? 16 years? And I’m still doing that. I mean, I’m—we’re working on Rails 6. I worked on a bunch of the frameworks that’s going into that. I’m constantly tinkering and tweaking with. I’m reviewing pull requests, which is amendments to the framework by contributors. And I’m having a grand old time doing that.

**(00:18:55)** I think that the transition was that there was a transition of its public perception, not so much a transition of my involvement. My involvement and the involvement of many other people who’ve been in the community for a long time kind stayed kind of stable. We just kept using it and kept improving it and kept making it better. But, obviously, you can’t sustain the explosive awareness campaign that we had in the early days, 16 years later.

**Shaun: (00:19:24)** Sure.

**David: (00:19:24)** Like, nothing is that hip for that long. So, we had to transition from being this hip thing, this on-trend thing, to just being this good thing that people just wanted to use because it was good. Not because it was new or novel. Because Ruby on Rails isn’t new or novel anymore. It’s still different, surprisingly so, to my surprise as well, in part because we have a different set of trade-offs and a different set of values in this community than a lot of other programming communities do. And we’ve tried to spell some of those out in more detail. There’s a document on the RubyonRails.org website called the Doctrine where I spell out a bunch of values and choices that informed my development of the framework and help explain why, to this day, Ruby on Rails is still an odd one out, and why it’s still appealing.

**(00:20:17)** But, nonetheless, that novel-ness wore off and we went through several other cycles of other environments that then rose to prominence. Javascript, for example. And then they became novel and then within Javascript, some framework is usually novel for a few months at a time and then there’s something else that’s novel. And that’s how it should be. Ruby on Rails was never created for world domination. It was created to satisfy my desire to write web applications with this beautiful programming language called Ruby. And that’s enough. It doesn’t really need more than that. I mean, I would still be writing Ruby and doing Rails if it was me and two cats and an oyster. But, thankfully there’s more people than that, right? There’s, I think, a million and a half active Rails applications out there. Hundreds of thousands if not millions of programmers have, over the years, worked with Ruby on Rails and we have thousands upon thousands of contributors to the framework itself.

**(00:21:26)** So, the community has simply just matured. Like, it’s no longer a motley crew of cowboys riding west. Like, we founded a city and built a city state and now we’re worried about picking up the trash and the bus schedule and sort of more mundane, civilized questions that you deal with when you’ve worked in the same community for 16 years.

**Shaun: (00:21:50)** Wel,l that’s awesome. That’s perfect.

**David: (00:21:51)** Boom.

**Shaun: (00:21:51)** Thank you so much, David. That’s awesome.

**David: (00:21:52)** Sure, my pleasure.

This is an episode title
