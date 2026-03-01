---
title: "Please don't like this (Update)"
description: "Jason Fried discusses Basecamp's alternative to the Applause feature called Whispers, a lightweight and quiet way for teammates to acknowledge each other's work."
source:
  type: podcast
  title: REWORK
  author: 37signals
  url: https://37signals.com/podcast/dont-like-this-update/
tags:
- podcast
---

# Please don't like this (Update)

**Wailin: (00:00:01)** Welcome to a special mini episode of REWORK. Last week we talked about an ongoing debate we've been having at Basecamp about the Applause feature which allows you to click a button and clap for what someone else has posted in Basecamp.

**(00:00:20)** So, for the last few months, we've been testing out what it would be like to not have Applause in Basecamp. We turned it off for our own account to see what that would be like. So, today we have Jason Fried talking about something that we're calling "Whispers" for now, and it's our alternative to Applause.

**(00:00:50)** Why don't we open this: can I ask you how you've felt personally without Applause in these last couple months without it?

**Jason: (00:00:58)** What I think has been better is it does seem like more people are speaking up in their own voice and supporting people and saying, great job, or I really like the way you did that, or well handled, or whatever. And I think that hearing people's own voice and seeing their face and having them own their own opinion is good on balance. I think it's really easy to just glom onto someone else's +1 and just hit the button and be a sea of many faces that say clap or whatever. But I think it's nice to hear the words or read the words. So, I think that that's been better. That hasn't happened broadly everywhere, but I've seen it in quite a few places and I feel like it's been better.

**(00:01:41)** I think there are places, though that because the way Basecamp's currently designed, it does feel like a step back in that if you just want to say, great, or awesome, or thanks, you know that it's going to blast everyone else with the comment who's on the thread and in some cases that could be 50 people. And so, I think sometimes you actually pull back from acknowledging something in a positive way because you don't want to bug everybody else.

**(00:02:06)** But, all that said, on balance, I think it's been great. And most importantly, it sparked a debate and you don't know what you've got until you miss it. You also don't see what you could do until you don't have something anymore. I'm always a fan of getting real with stuff, and I think this sort of got [inaudible].

**Wailin: (00:02:23)** What kind of criteria did you set at the beginning for what you wanted to accomplish?

**Jason: (00:02:28)** Number one, we wanted to maintain sort of the playful spirit of Applause. It's very positive, primarily. We wanted to still make it easy to do. We also wanted to make sure that whatever we did, it didn't create more notifications and also we want it to be another way to express yourself and I don't think that Applause is really a great way of expressing yourself, because part of the problem is there's a lot of ambiguity behind it. Like, what does it actually mean?

**(00:02:59)** One of the big problems with Applause, and we saw it because Applause was a stand-in for a dozen other things, was that we wanted to make sure that people could be more specific. So, a clap isn't that specific. But, you know, maybe you could use a thumbs up emoji, or maybe you could say thanks or maybe you could write in, like, great idea. Or, I'd vote for that.

**(00:03:17)** We also wanted to make sure that it was really lightweight and that there was a strong contrast between it and comments. I would assume it was pretty clear to most people, like, do I clap for this or do I write up a comment. And we wanted to kind of maintain that. You wouldn't be stumped as to which one to do. And then, we also wanted to say that text should be cool, too. We don't just need to have symbols or emojis or counts. We don't want to count things. And we wanted everyone to be able to do their own thing.

**(00:03:46)** So, there's other products out there that have this thing called reactions, where there's like, a series of emojis. Someone could put one up there and then other people can say, me too, basically. We wanted everyone to make a little bit of effort, still, to say something. So, it's not something you can +1, or just press a button, you still have to type something in this time. So, that was another thing. So let me see if I can summarize that pretty quickly.

**(00:04:07)** So, no notifications. A flexible short lowfi way to express yourself without having to put a ton of thought into it. Allowing it to be a sort of fun expression, fun release, and you could play with emojis or you can use text as well. It should be attached to the thing that you're Whispering about.

**Wailin: (00:04:30)** I mean, what's interesting to me that seems pretty key is the smallness of it, and it's inherent in the working title, we're using for this feature, which is Whispers. And it's small in terms of how you're encouraging people to think about the weight of that Whisper, right? That it's not a full-fledged comment. But then it seems that it also translated into just its physical size on the screen. How you would display it to also indicate its smallness.

**Jason: (00:05:02)** Yeah, that was key. It did play into the interface design concept, which is that this should be small. We're not even listening the person's name or title like we do in comments. So we're trying to provide more and more contrast everywhere we can. So, small avatar, and then a small response. Sort of in this little cloud thing and just trying to make it look quiet. Make it act quiet. This also ties into the notifications, of course. Since there's no notification, it just is inherently a quieter thing to do.

**Wailin: (00:05:30)** And then, the design of it is also a little bit interesting in that they line up left to right in kind of a little row, right?

**Jason: (00:05:37)** Yeah, they stack horizontally versus vertically, which is another point of contrast that we're going for. Comments, of course, stack, they take the whole width of the screen and they stack vertically. And this idea behind the Whispers is they kind of will brick up is what we're calling it. They'll just go left to right, and they'll wrap, and form what we're calling a crowd. The cool thing about that is they'll take their own shape. I'm hoping that these little Whisper clouds will each have their own little identity which will be a neat visual addition to the comment or the post.

**(00:06:11)** Some people will be wordy, some people use a bunch of avatars. Whatever it is. The shape will inevitably end up different because of the way things stack up.

**Wailin: (00:06:17)** Have you made a decision on the Applause report? Will there be a version of it with Whispers, or no?

**Jason: (00:06:23)** Haven't made a decision, although I think we're going to go without it to start. The reason people don't like the report today is because they can't unsubscribe from it.

**Wailin: (00:06:31)** Oh.

**Jason: (00:06:31)** So, if we allow people to unsubscribe from it, that might solve that problem. But, the other thing we're sort of curious about is should this actually just be more ephemeral? We'll have to see how it all shakes out because I understand the other argument, which is like, it's nice to know that people responded to something that you wrote, and unless you go back specifically and look for responses, then how would you know? I just am not sure it really matters. And personally, I'm more into the ephemeral nature. I mean, they're not really ephemeral, I mean, they don't go away. But it's more about the—what's the word when you run into somebody unexpectedly—

**Wailin: (00:07:07)** Serendipity?

**Jason: (00:07:08)** That's it, serendipity, there you go. So it's more serendipitous. If you're just looking at a thread and you bump into other people's comments and you look at the Whisper clouds, that's, kind of, I think, enough. But we'll see how it shakes out.

**Wailin: (00:07:20)** You know what's interesting about the way you've been framing this is it seems like you want to remove the anxiety that the original poster feels about how other people are reacting to them, right? So, you've got—it's smaller, it's called Whispers and you know, for now there's not going to be this potentially anxiety-inducing report about who did what and who said what about what you posted. And it seems like that's protective of the original poster while giving people who want to react something to do. Does that make sense? It's like you have different constituencies that you want to take care of.

**Jason: (00:08:00)** Yeah, there is the two sides. And there's actually many sides, I guess. I do think this helps the author be recognized for their efforts and it also helps the reader send something nice back to the author without sending that same thing to a bunch of different people. It is these multiple constituencies, but it's also—there's another dimension, which is like, what are you actually trying to say? I think, at a show, at a performance, Applause is enough, because it's a crowd—in a crowd, no one sees anyone's face really. So it is sort of this general sense for all the people there. No one knows each other, either. So, this general sound is enough of an acknowledgement. But in a setting where you know people, you know people's avatars or you recognize people's faces even if they're really small, each individual person might have a different thing to say, and I think that's what's really cool about this unlike Applause in Basecamp, and also Applause traditionally where it's very one note. This allows people to—in fact, to really compose a little small melody of their appreciation for whatever this person did. Wrote, said, whatever. I think that's kind of a neat thing. Actually melody is another cool name for this, although, I think that's a little bit—that's a bit of a stretch. But there's something neat about composing a little melody there.

**Wailin: (00:09:23)** A little ditty.

**Jason: (00:09:26)** A ditty! A ditty would be kind of fun. A ditty would be cool, except that. Yeah. I love those little terms like that. So, we'll keep spinning this around and seeing if we can find a better word than Whispers. But that's sort of the idea, is like, a little ditty back to somebody. While being quiet. I think we can keep mining for a better name. I also don't think it matters that much. And I do think it's kind of more important to be a bit more descriptive about the implications about it. For example, you could say a Whisper's quiet, meaning that there's no notifications. I think that's a really nice tie-in versus if it was like, short comment or a reaction, is another example. Well, what does that have to say about the fact that it actually is quiet.

**Wailin: (00:10:11)** What I appreciate about the debate in general and then how you're taking this new direction with Whispers is it seems like mindfulness is being built into the software in a very considered way, which seems unconventional to me. Does that make sense?

**Jason: (00:10:30)** Understanding that people need to be acknowledged and want to be acknowledged? That sort of thing?

**Wailin: (00:10:34)** Yeah. I mean, I think it's easy to be like, oh, we have likes everywhere on social media now, let's just bring that into this kind of platform. And this is something that David addresses in the previous episode, this mindless gamification of work that ends up having a lot of downsides to it. And I think it's interesting that as you design Whispers, you're thinking about prompting people not just to click +1 on something or choose from a preselected menu of reactions. You're also prompting people to be more considered about what they're saying.

**Jason: (00:11:05)** It is, and that is something we considered, which is, you know, if you can't take even just a moment to write something original. And it doesn't have to be original—like, a thumbs up emoji is not an original thing. Millions of those are sent around the world every day. Billions, probably. But my point is that you actually have to think about what you want to send. Or what you want to put on the record, essentially, even if it's what someone else has already done. You still have to go through the process of doing that with Whispers versus pushing a button and just like—that's the most mindless possible communication. We're trying to avoid that. Hearts, likes, thumbs ups, whatever. All the different things you can do on Facebook. Because it's so easy to do in some ways, it's really a cheap way to communicate. At least do it yourself is what we're trying to say here. If you want to say something, but in a tiny, tiny bit of effort at least, versus just touching something and walking away.

**(00:12:01)** We were talking about should it be 50 characters or 64 characters or something like that? And I think now we're down to maybe it should be 12 characters, or—

**Wailin: (00:12:11)** Ooh, that's short.

**Jason: (00:12:11)** Yeah, really short. We're kind of looking at. I looked at a lot of phrases like, "well done", "that's great", "love it", that kind of stuff. What we want to try to avoid is giving you just too much space that it could almost be a stand-in for a comment. And so, having a really, really strict character count will, again, create more contrast. And force people to think about what they really want to say. And if they really want to say something longer, they should just post a comment. 12 characters should be enough to write a string of emojis that's extremely expressive or use a word or two or a short phrase to express what you're looking for and that should be enough.

**(00:12:46)** And I think David's point, this gamification and counts and totals which is something we're eliminating as well. Currently, Applause has a total after it and with Whispers there's no such thing as a total because everyone's being unique. Even if everyone used the same emoji, it's still—they have to make the effort, so there's no count.

**Wailin: (00:13:04)** Yeah. Cool. Well, I'm looking forward to trying this out when it gets rolled out internally.

**Jason: (00:13:10)** Me too! I'm very hopeful, but you never know. Things—when they hit reality—but I have a feeling this is going to be well-received internally. It's kind of everything we're missing when we got rid of Applause plus some new stuff. So, I'm feeling pretty good about it. The big question will be does the report matter, and I think we're going to need to give ourselves a good month to get over not having it before we really get a sense for it. In most things, I tend to ignore the first two weeks' worth of feedback. Ignore is probably the wrong word, but I give it a 50% weight or something like that. Because, it's always hard to break away from something we're used to, so it's just good to give it a little bit of distance after a certain period of time. Then you really start to pay attention to what people are trying to get at versus, I'm suffering a little bit of withdrawal here. So, let's let that clear out and then see what people really feel.

**Wailin: (00:14:00)** Yeah. Very cool.

**Jason: (00:14:01)** We'll find out.

**Wailin: (00:14:01)** Yeah, well, thanks for taking the time, Jason.

**Jason: (00:14:04)** Any time.

**Wailin: (00:14:04)** Okay, take care.

**Jason: (00:14:05)** Talk to you soon.

**Wailin: (00:14:05)** Bye!

**Jason: (00:14:07)** Bye.
