Can you believe it's time for phase three already? We are so proud of you all
for making it this far. You've all put in so much hard work. And you can now
develop real things on the web!

You're a web developer now, and the extent to which you energize that label is
a matter of the time and effort you give to continued, focused practice.

So yeah. Let's get ready to work even harder.

## TL;DR

Finish the core work listed here by Monday morning.

Part of that core work is to prepare a 5-10 minute talk and demo of a Rails
feature. Claim your topic in the wiki to avoid duplicate choices.

Your blog must be written and deployed by Monday. You'll notice the README is
really short. You'll have to lean on Google and one another to find good
resources to guide you through the process.

Use model/migration/controller generators only 1x to see the file structure,
then only use migration generators for the rest of the phase.

READ, RESEARCH, & DIG INTO THE ERRORS!

This phase is gonna be hard, and yes, you should still ask for help!

## Long version

We'll be kicking off the Phase 3 on Monday by diving in to Rails (whoo!
Raaaaaaails). Some parts of Rails will look similar to what you've been doing
in Sinatra -- others won't. Along the way, we'll be diving into feature
testing, client-side JavaScript frameworks, and PROJECTS.

The entire section list 'core' in the pre-work is your weekend work.  We expect
each of you to build and deploy a blog using Rails by Monday morning (read the
directions in the guide).

For deployment, you'll need to sign up for Heroku if you haven't already. See
the [Heroku docs for Rails 5](https://devcenter.heroku.com/articles/getting-started-with-rails5).


Make sure you create a Rails 5 application, not Rails 4. ~~For your CSS and JS to
work properly with Rails' asset pipeline feature, you'll need to add the
`rails_12factor` gem to your Gemfile.~~ (The previous line is no longer true for Rails 5 applications.)

Only use generators once to see what they do.  It is expected that you will
only use _migration_ generators in this phase. Generators are for coders who
have done stuff by hand so many times that the process has become boring, not
for coders who have done stuff by hand so few times that the process is still
tricky. Seriously, you'll thank yourself later for being diligent now and
letting your fingers start remembering how those files come together.

We'll be bending and flexing a lot in Phase 3. It will be hard. It will
challenge you. I know you can all do it. Expect to dip into your panic zone,
but reach out. Rails is a big framework and it can feel overwhelming. All the
teachers in the space can answer your questions. We're all here for you. Ping
us, get unstuck, then get back at it.

Phase 3 is about ramping up for the real world. You'll be treated less like
students and more like professional developers. Answers will not be served on a
platter; rather, you'll have to take the initiative to pursue solutions on your
own. We aren't looking for clever solutions; instead, we'll make sure your
process is disciplined, your git log is spotless, and your code is
well-written, tested, and robust. Consider us more your tech leads who you go
to more for design decisions rather than "why isn't this working???" sort of
answers.  This will push you all on reading the errors and digging in on your
own, but you all need more practice with that.

### Core

**Setup**

- Use [this](https://gist.github.com/panw/1523e7289825583bfc45842d20914636) configuration for creating a new rails app.

**Prep for Monday**

* Read [Intro to Phase 3](../resources/intro-to-p3.md)
* Read [Github Workflow](../resources/git-workflow.md)

**Rails**

- [Rails setup guide](https://gist.github.com/panw/1523e7289825583bfc45842d20914636)
- Read the [section in the Overview on Rails](../resources/intro-to-p3.md#on-rails).
* Go through [Learning Rails](../phase-3-prep/learning-rails.md)
* Watch a talk on rails (see below)
* [Build a Rails Blog](../../../../rails-blog-challenge)
* Explore some new technology to give a lightening talk to your cohort (JavaScript packages, APIs). If you need ideas checkout [Railsy talk (Week 1)](../resources/railsy-talk-topics.md) or [Gemsy Talk (week 2)](../resources/gemsy_talk_topics.md).
* [Railsbridge](http://docs.railsbridge.org/job-board/)
* Deploy your Rails app to Heroku **from your personal laptop**

**Rails Testing**

- [Everydayrails](https://everydayrails.com/2012/03/12/testing-series-intro.html) (skip Capybara part)

- [How We Test Rails Applications](https://robots.thoughtbot.com/how-we-test-rails-applications)

**Talks on Rails (watch one)**
- [Intro to Rails with Lucas - part 1 (45 min)](https://talks.devbootcamp.com/intro-to-rails-part-1)
- [Intro to Rails with Lucas - part 2 (1h 15min)](https://talks.devbootcamp.com/intro-to-rails-part-2)
- [Intro to Rails with Mike - (~2hr)](https://talks.devbootcamp.com/2014-coyotes-aeu-intro-to-rails)
- [Intro to Rails with Nate Delage (~1hr)](https://talks.devbootcamp.com/rails-intro-1)

**JavaScript**

- Watch [What the heck is the event loop?](https://youtu.be/8aGhZQkoFbQ)
- Watch [videos 1 - 8](https://www.youtube.com/playlist?list=PL0zVEGEvSaeEd9hlmCXrk5yUyqUag-n84)
- Do/Redo [JavaScript Interview Exercise](https://github.com/nyc-coyotes-2016/p2-javascript-interview-exercises/blob/master/javascript-fundamentals.md)

### Additional Resources

- [Cool Stuff in Rails](../resources/cool-stuff-in-rails.md) (seriously read this)
- [Rails Resources](../resources/rails-resources.md)
- [Rails coming from Sinatra](../phase-3-prep/rails-sinatra.md)

[HerokuGS]: https://devcenter.heroku.com/articles/getting-started-with-rails4.
