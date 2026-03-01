---
title: "Spending in the clouds"
description: "Basecamp has cut back its reliance on Amazon and Google, but there’s one area where it’s tough to find alternatives to Big Tech: cloud services."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/spending-in-the-clouds/
tags:
- podcast
---

# Spending in the clouds

**(00:00:00)** Anyone You Meet Normcore Remix by Clip Art plays.

**Shaun: (00:00:02)** REWORK is produced by Basecamp. Have you ever had a group working on something where some people were using text messages, some were sending out email after email and some were even dropping sticky notes on your desk with tasks on them? It’s a mess. It’s easy to get lost. Basecamp takes all of that work and puts it in one place for everyone. Sign up at basecamp.com.

**(00:00:25)** Broken By Design by Clip Art plays.

**Wailin: (00:00:26)** Welcome to REWORK, a podcast by Basecamp about the better way to work and run your business. I’m Wailin Wong.

**Shaun: (00:00:31)** and I’m Shaun Hildner. Wailin, have you ever gone through all of your monthly charges especially streaming services and figured out how much you’re spending every month?

**Wailin: (00:00:42)** It’s so funny you ask because I’m just doing this now. I made a huge spreadsheet comparing costs. Netflix, HBO, I prepaid for three years of Disney+

**Shaun: (00:00:55)** Of course you did.

**Wailin: (00:00:55)** I put that in there. So the grand total for what we will be spending every month on streaming, not counting Spotify cause that’s music and not TV, BTDubs.

**Shaun: (00:01:07)** Doesn’t count.

**Wailin: (00:01:07)** It doesn’t count.

**Shaun: (00:01:09)** Different spreadsheet.

**Wailin: (00:01:09)** Different spreadsheet. We’re going to be spending $67.25.

**Shaun: (00:01:14)** Oh, not bad at all.

**Wailin: (00:01:15)** Not bad. Right. I think that is okay.

**Shaun: (00:01:18)** Well, on this week’s show, we have the story of how one Basecamp employee went through all of the company’s cloud services and ended up saving more than half a million dollars.

**Wailin: (00:01:25)** For this episode. I talked to Blake Stoddard, he is a systems administrator here at Basecamp on the Operations Team and he went through the bills and looked at where he could save some money and he found a lot of deals. I have to say Blake, very good at getting a deal.

**Shaun: (00:01:51)** Let’s get into it.

**Wailin: (00:01:59)** When we talk about using the cloud for Basecamp, what does that mean in layman’s terms?

**Blake: (00:02:04)** It means taking the hardware that we would run our applications on and kind of removing the hardware piece and letting somebody else manage it. So now all of a sudden instead of going from dealing with physical hardware, the power and the networking and the cooling infrastructure that surrounds it, I just had to deal with the software.

**Wailin: (00:02:22)** Back before we had moved these things to the cloud, we would be dealing with physical data centers, like these big warehouses in undisclosed locations. Right?

**Blake: (00:02:32)** Right. Yeah, we had three data centers. We’ve cut down to two recently. But yeah, if a disk in a server died, we’d have to deal with it. If there was a power issue, we would be the ones that were making tickets with our remote hands folks at the data center saying, Hey, we’ve got a power issue in this rack with this server. Can you go unplug it and plug it back in and hope it turns back on.

**Wailin: (00:02:51)** So then what’s the advantage of moving that to the cloud so that you’re no longer dealing with physical hardware but are now managing it all software.

**Blake: (00:02:59)** So the big advantage is that you can in theory scale infinitely larger than what you can on premise because rather than having to go to Dell or to HP and saying, Hey, I need this server with this specs, I can just go to Amazon or to Google and say I need this much RAM, this many CPU cores. And they could just give it to me. And there’s, there’s just instant scale up time.

**Wailin: (00:03:21)** And so how long ago did Basecamp start moving things to the cloud?

**Blake: (00:03:25)** David wrote up an initial pitch for this in February of 2016 and said, Hey, let’s give this a go. And at the time it was Amazon and then we kind of transitioned over to using Google for some things and then Google kind of let us down. So we transitioned back to using Amazon, right now.

**Wailin: (00:03:38)** How much do we spend on this per year?

**Blake: (00:03:42)** in 2018, I think we spend almost $3 million on cloud infrastructure in particular, not including how much money we spent with the two data centers we still operate and run ourselves.

**Wailin: (00:03:54)** Okay. And so, I mean, it’s fair to say this is, it’s probably one of the biggest line item expenses for the company, right?

**Blake: (00:04:01)** Yeah. After salaries and I… really after people, I think that the Operations Team has is the largest costs that aren’t the company.

**Wailin: (00:04:07)** But that makes sense, right? Because it’s this is where all of our customer data, it’s this is where everything happens, right?

**Blake: (00:04:13)** Right. We’re a software company so we don’t necessarily need to keep an inventory of cars. We’re not selling cars. We do need to keep servers and hardware available to run those things on. So it naturally, it makes sense that would be the largest cost of the company.

**Wailin: (00:04:24)** And so I guess this gets me to another question I had, which is how is this stuff priced? I mean, is it, it sounds very complex.

**Blake: (00:04:33)** It kind of various between being , okay, this is reasonable and holy shit, this got really expensive really quickly, how did we not notice. There are certain technologies that Amazon has, like Lambda, which if you’re operating website that doesn’t see a lot of hits and do you want to run it on Lambda? It might not be that expensive. You may only pay $5 or $10 a month. But if all of a sudden your website gets posted on Hacker News or to read it and you get the Reddit hug of death, then your Lambda bill goes sky high and you’re, you’re left holding the bag for that because ultimately it’s your bill. For a company that’s our size. When we look at running these applications in AWS or on Google cloud, the math doesn’t always make sense.

**Wailin: (00:05:10)** How did you get put on this project to reduce how much we spend on the cloud?

**Blake: (00:05:16)** I kind of volunteered for it. It’s always been something that I’ve been interested in, looking at how we can take what we’re doing now. Can we optimize it? Can we make it better? Are there levers we can pull to reduce the spend while still being efficient with what we’re doing and the resources that we have and being vigilant with provider specific services and things that we’re making use of.

**(00:05:35)** There’s a fine line between having enough resources provision to handle your customer load or handle the request load that’s coming from your customers and having so much provision that you have double the capacity you need and the bills are coming and you’re , why are we spending so much? You’re , like, oh, it’s because we provision twice what we need. Even though in this particular circumstance when we’re using a cloud provider, we don’t need to, if the amount of traffic we get increases in over a couple of hour period, we can just provision more servers. It’s not in a data center where we have to go ask a hardware manufacturer to make us these things and they might arrive in a couple of weeks. This is just a matter of pressing a button that in a couple minutes we’re ready to go.

**Wailin: (00:06:13)** Ah, okay. So you don’t want to be sold more capacity than what you need, especially in advance.

**Blake: (00:06:20)** Right. And ultimately that comes down to the planning that we do in the operations team to say , okay, well, here’s how the app performs with X, Y, Z amount of resources given to it. When there are 100 requests per second hitting it, is that a reasonable target? Can we give it more memory or more CPU cores to deal with a higher volume of traffic? And then how can we scale that? Do we scale it up by giving it more resources or do we scale it out by taking that same box of resources in multiplying it eight or nine times to support the traffic load that we have.

**Wailin: (00:06:49)** You decided to take on this big project with really big numbers attached to it. How did you go about tackling the various steps?

**Blake: (00:06:58)** So one of the things I looked at originally was kind of the older application we were running. So Basecamp Classic and then Backpack and Campfire and To-da List and Highrise and then taking a look at how much we’re paying to run those now. So we were going to spend about $550,000 a year to run that suite of applications. and I was able to cut that down to about $250,000 a year, with an option—

**Wailin: (00:07:19)** What!?

**Blake: (00:07:19)** —to save another.

**Wailin: (00:07:21)** That’s a huge savings!

**Blake: (00:07:21)** Yeah, it was a pretty decent savings. Most of that was done by just looking at traffic changes over the last three years. And naturally, as they’re older apps, the traffic goes down at a pretty steady rate. So we looked at traffic changes for the last three years. We saw what we had originally specced these apps with and then we kind of compared that to what traffic numbers look now.

**(00:07:41)** And then we also coupled that with reserved instances. So when you look at a cloud provider’s pricing, there’s a couple of different ways you can price these things. So with Amazon, using Amazon’s terms you have on demand rates and there’s reserved rates and dedicated rates. So the reserved instances are us telling Amazon that we know that this particular instance we’re going to run it for a year, we tell Amazon we want to prepay for all of these instances for a year, and then we get a bulk, let me say it’s 40 or 50% discount.

**Wailin: (00:08:09)** To sum up what I’m hearing from you, we were looking at unused capacity for our legacy apps, right? We were still being charged for this capacity even that we weren’t using it. And so you found savings that way combined with a lower priced option that Amazon gives you.

**Blake: (00:08:27)** Saying that we’ll prepay for it, rather than [crosstalk].

**Wailin: (00:08:30)** Right. Which is something we’re used to in the consumer world, too.

**Blake: (00:08:32)** Right?

**Wailin: (00:08:32)** Paying for something. Yeah. So then you saved 250 grand that way. That must’ve felt pretty good.

**Blake: (00:08:39)** It did feel pretty good. Yeah. It’s paying for yourself for a few years.

**Wailin: (00:08:43)** And then was that kind of the lowest hanging fruit, dealing with the legacy app? Does it get more complicated when you’re looking at newer apps?

**Blake: (00:08:54)** It does get more complicated from there. So those are the ones that they were jumping out to me saying, look, this is something easy that we can look at. Let’s go ahead and chop this off. And then from there it got much more complicated and it was to the point that I was going line by line through our bills saying, okay, well I know what this service is. I know what it does. Great. Let me go to the next one. Say, I know what this is. What is it doing? Why did it go up to 300% in the last three months? What happened there? And then digging into what caused that change and then can we do something about it?

**(00:09:20)** So we recently moved all of our customer files from Google Cloud Storage to S3. We do this using a service that Amazon has called cross-region replication. And cross-region replication is just responsible for taking the files to be uploaded to one AWS region and putting them in another for disaster recovery.

**Wailin: (00:09:38)** Like, redundancy. Just having backup.

**Blake: (00:09:39)** Redundancy, right. And they include this, it’s called a cloud formation stack and cloud formation is a service that Amazon has that lets you define a bunch of resources and code and then you can click a button and they all just, everything you need comes alive with one button press. So they have this cloud formation stack that you can use that monitors all the parts of cross-region replication for you. It checks to make sure that these files are replicating successfully, that everything matches up between the buckets, stuff like that. Because of the volume of objects that we store in S3, this system was costing $13,000 a month to run all from clicking one button that said, let’s run this.

**(00:10:15)** And the only reason that we noticed that was because I was going line by line to the bill. I’m thinking to myself, okay, this was a pretty massive change in the cost of the service over the last couple months. When did it start? Okay, April. May, okay, I know what happened then. I know that we were working on moving files. It’s gotta be tied to that and then figuring out what it was and saying, wow, okay, this is costing us a lot more money than we thought it was. And I brought it up and whole week later we’d actually rewritten the service and cut the cost of it from $13,000 a month to $15 per month.

**Wailin: (00:10:41)** $15!

**Blake: (00:10:44)** $15.

**Wailin: (00:10:43)** Wow.

**Blake: (00:10:45)** Yeah. Then we’ve had other things, like, one of my colleagues, Matt was looking at our Google bill and notice that our Stackdriver bill, and Stackdriver is the kind of the umbrella term that Google uses for metrics and logging and monitoring and stuff that. And our Stackdriver bill was crazy and we didn’t know why we were spending, like, $10,000 a month on metrics alone. And ultimately we discovered that at some point we had added, a little pod into our Elasticsearch cluster that was sending all of these metrics into Stackdriver, thousands a minute. And we were getting charged for every one of these metrics.

**Wailin: (00:11:15)** Someone had written a piece of software that was just sitting in there and costing you money without you realizing it. Okay.

**Blake: (00:11:19)** Right.

**Wailin: (00:11:21)** When you get these bills, I mean is it kind of when you get a bill from, like, if you ever take the time to look at your cell phone bill and there’s all these random charges, the taxes and stuff like that where you’re like, what is this?

**Blake: (00:11:33)** They’re 50 pages long and you’re like, uh, well the writing, these aren’t full words, they’re just nothing but acronyms. I don’t know what they mean. That’s essentially what the bills look from our cloud providers. Our Amazon bill is 40 pages long or something that. It’s absurd. It splits between having a lot of detail and you have individual SKUs with kind vague descriptions of what these SKUs mean. And then big umbrella charges for like, I bought a lot of reserves and instances this month, so here’s a $150,000 of reserved instances. And those charges sit right next to 7 cents per gigabyte US1 East. And you have no clue what that means and it’s just kind of assumed that you know what this odd phrase of words stands for and what you’re being charged for.

**Wailin: (00:12:19)** So then for those instances, did you just have to call someone at either Amazon and Google and say what is this?

**Blake: (00:12:24)** It’s a combination of looking through their documentation to see if they describe what it is or looking at their public pricing charts to see if the costs line up per unit or if I can’t figure it out then yeah, I’ll email the account to even ask them what is this and what does it mean?

**Wailin: (00:12:40)** It sounds really time consuming. Was it terribly time consuming?

**Blake: (00:12:41)** It is time consuming. When we try to do these cloud spend reports about once a month and they take a couple of days just between gathering the individual bills themselves from our cloud providers. And then Jane on our data team has a script that processes them and then kind of lumps these bills into individual cost buckets, whether that’s computer databases or storage or networking. And then we go by hand and then go through those and look and see what these different parts are have there been services where we’ve seen large percentile changes or decreases and then can we explain those. And then we run it all up and then we post it for the company to see so that they’re aware of the money that we’re spending to both hold us accountable to that money and to also show people how much money or what the cost of doing business is.

**Wailin: (00:13:23)** Have you declared the kind of current cloud spend project to be over or is it ongoing?

**Blake: (00:13:31)** I’d say we’re nearing the end of it. We’re getting to a point that cutting the bill more is going to have increasingly diminishing returns.

**Wailin: (00:13:39)** Can you give a ballpark figure of how much you think you’ve saved the company just by going through the bills line by line like this?

**Blake: (00:13:46)** Let’s look. So, me alone, I think that I’ve through changes that I’ve either carried out myself or I’ve noticed and kind of prodded other people on. I’m sure I’ve managed to cut between 500 or 600, $700,000 off the bill, which is a decent chunk when we say that we’re spending $3 million over a 12 month period.

**Wailin: (00:14:06)** Absolutely. Well, good work.

**Blake: (00:14:08)** There’s even, there’s other things that I can’t talk about that was another couple hundred thousand dollars that we’re going to see over the course of the next two years. Overall we’re looking at maybe we’re going to see a 20 to 30% cut in the operation spend this year, which is a pretty decent sized cut if you’re looking at it from a corporate angle.

**Wailin: (00:14:25)** Yeah. And I mean is that kind of the biggest cut you’ll see for a while? Because it’s like you went through and did kind of a big house cleaning and then from here on out you might get some savings, but it’s not going to be as dramatic as this first go around.

**Blake: (00:14:39)** Right. And the other thing is we’re going to move Basecamp 2 and Basecamp 3 to the cloud at some point in the future. And those aren’t going to be free, so we’re actually going to see the bill go up again. So unfortunately there’s not much we can do about that besides being vigilant and trying to find what levers can we pull again to make sure that we’re being cost efficient in this move compared to what we’ve done in the past.

**Shaun: (00:15:04)** REWORK is produced by Wailin Wong and me, Shaun Hildner. Our theme music is Broken By Design by Clip Art.

**Wailin: (00:15:10)** You can find us on Twitter at @reworkpodcast and our website, where you can find show notes and transcripts for episodes is rework.fm.

**Shaun: (00:15:19)** REWORK is produced by Basecamp. Basecamp is an organizational tool that you use to keep track of everything in one place and not let anything fal through the cracks. Learn more and sign up at basecamp.com.

**(00:15:32)** Broken By Design by Clip Art plays.

**Wailin: (00:15:42)** Did I pitch you my idea for an online cord cutting decider tool thing?

**Shaun: (00:15:48)** You have not.

**Wailin: (00:15:49)** Okay. Here is my idea. This is what I decided that is necessary because it is so confusing to figure out your cord cutting situation. And it’s deliberately confusing because all of these companies have these big disincentives to help customers figure out how to save money. I think they just want everyone to go with the path of least resistance and stick with their cable providers, which I refuse to do. Take that Direct TV.

**Shaun: (00:16:14)** Really sticking it to the man.

**Wailin: (00:16:16)** Yeah, really sticking it to the man by continuing to pay them hundreds of dollars for wireless and internet service. Okay, so here’s what I want. You go to the website, this is an app or whatever and you enter in your zip code and then you enter in what shows you like to watch. So there’s a search bar with shows, if you just want to type. There’s also a whole list. There’s a radio button next to each one. So not by network or by streaming service, but by show that you want to watch. And you go and you click all the shows that you wanna watch and then you hit a big button at the bottom and it spits out a plan for you. Right? So it figures out which of your shows are on which networks and how much it costs. And it just assembles this patchwork of streaming services for you. Because that’s the whole thing is like, you have to go shopping around and Googling which service has which content that you want to watch.

**Shaun: (00:17:14)** Yeah.

**Wailin: (00:17:14)** And it takes a lot of time and it’s really frustrating, especially because when licensing deals expire, stuff disappears and then reappears on other places. We’re just at the mercy of the programming companies and the device manufacturers and other companies in this ecosystem signing this patchwork of licensing deals. And it’s so annoying and we just end up wasting all this money. Right. Anyway, so that’s what I want.

**Shaun: (00:17:43)** I’m sure there are some listeners to this very show that could make this happen.

**Wailin: (00:17:47)** I mean, don’t we work at a company with people who know how to make websites.

**Shaun: (00:17:50)** Come on Basecamp, let’s pivot. We’re no longer doing project management apps.

This is an episode title
