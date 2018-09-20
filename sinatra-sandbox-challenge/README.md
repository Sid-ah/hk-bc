# Sinatra Sandbox

## Learning Competencies

* map the flow of data through a web application
* describe where rendering occurs in the stack request cycle

## Summary

We're going to build ourselves a Sinatra sandbox that we can use to better
understand the flow of data through a web application.

**Don't rush through this challenge!**  Understanding the abstract basis of
this application will pay **great** dividends when you move on to more advanced
challenges as well as Rails (which is built on the *exact same* middleware
stack as Sinatra).  Master walking so that you might run faster.

As always, you may choose to exend your extant Sinatra application or start
anew with the skeleton provided in this challenge.

## Releases

### Release 0: `puts` debugging

`puts` debugging is something every developer does regularly.  When confronted
with total confusion about how parts of the code are interacting with each
other, a developer might place `puts` statements to see what methods are called
when and what's happening inside each method.

This isn't cheating, this isn't giving up, this isn't something beginners do.
In the Real World&trade; nobody cares if you debug a problem using `puts`, they
only care that you debugged the problem.  That said, the time it will take you
to load your code up with `puts` statements definitely hampers your efficiency.
Take some time and try to find the point where the bug likely was introduced OR
place a puts statement halfway through the flow.  By dividing the "it broke"
domain in half you're [performing a very efficient hunt][binary search] for your bug.
Be sure to pair `puts` statements with your knowledge of the application and
your ability to follow logic flow.

We're going to use `puts` debugging on this Sinatra app.

**Note:** Developers who write nicely-factored, object-oriented code have a knack for
placing a single well placed `puts` statement in exactly the right place to
isolate the problem.  Often difficulty in debugging brings about a pitiful
melancholy where the debugger will lament that the author didn't write nice OO
code, honor the Single Responsibility Principle or committed some other easily
refactored sin.

### Release 1: Build a Simple Application

In your controller code, add the following routes:

```ruby
get '/' do
  puts "[LOG] Responding to a GET request for /"
  puts "[LOG] Params: #{params.inspect}"
  erb :index
end

get '/sandbox' do
  puts "[LOG] Responding to a GET request for /sandbox"
  puts "[LOG] Params: #{params.inspect}"
  erb :get_sandbox
end

post '/sandbox' do
  puts "[LOG] Responding to a POST request to /sandbox"
  puts "[LOG] Params: #{params.inspect}"
  erb :post_sandbox
end
```

Create `index`, `get_sandbox`, and `post_sandbox` views.  The `get_sandbox`
and `post_sandbox` views can contain whatever you want to make it easier for
you to explore how Sinatra, forms, and the HTTP request cycle works.

* Can you ask one of your views to print out all of the instance variables it
  knows about? Test your approach by creating new instance variables in your
controller and see if they appear in your listing.
* Can you ask the view to ask what kind of class it is?
* What happens to instance variables after each request?

Don't forget, just because you're in a web app you still have all the power and
beauty of Ruby's [introspective][] capabilities.  What happens if you print out
the contents of those instance variables' innards by using
[`#inspect`][inspect].  This challenge encouraged you to explore and these
sorts of questions are the ones you should be asking yourself and each other.

Create a simple page with two forms in the `index` view.  It should have one
text field; you can call it whatever you want.  It should also have a submit
button.

The first form should submit a `GET` request to `/sandbox`.  The second form
should submit a `POST` request to `/sandbox`.

### Release 2: Add More Form Elements

Explore what happens when you add other kinds of form elements to your form.
Add fields of the following types:

* [Textarea][]
* [Radio buttons][]
* [Checkbox buttons][]
* [Select box][]

Observe how they interact with `params` on the server side.  Play around and
add more logging if you want.

### Release 3: Add New Form Element Names

Add the the following inputs to one or all of your forms:

```html
<input type="text" name="post[title]">
<input type="text" name="post[price]">
<textarea name="post[description]"></textarea>
```

How does this impact the `params` hash on the server side?

### Release 4: Question and Wonder

The immortal San Francisco native [Bruce Lee][enter the dragon] pointed out
that at times focusing on the task at hand causes one to miss the importance of
the lesson.  Take some time and reflect upon the request cycle, the request
object, the `ENV` hash.  Can you act and interact with these things inside of
your controllers, inside of your templates?  What happens if you create an
instance variable in a Sinatra route handler, can you see that instance
variable in the view?  Sinatra is a web application framework that conforms to
the [Rack middleware][].  What's a "middleware?"  What's _[Rack middleware][]_?
All of these are questions that _you_ as a developer should ask _as you learn_
**and** that you should follow up on understanding, at least at a cursory
level.

Add a file that has a list of 5-10 questions you have about how Sinatra
applications, the web, web applications in general, HTML forms, etc. work.
Forming good questions and good hypotheses is the heart of science as well as
web development.

### Release 5: Your Own Experiment

Come up with your own experiment to partially answer at least 2 of the
questions you have from above.  What debugging statements (`puts` or otherwise)
can you add to help you answer your question?

If you can't answer the entirety of your question, can you answer part of it?
For example, "I don't know where exactly something happens, but I know it
happens after we call `erb`."

Make your question simple and small enough that you can see how to answer it.
Form hypotheses and devise tests to determine whether those hypotheses are true
or false, or to what extent you can say they're true or false if you can't get
an exact answer.

Even if you answer one small question you'll be closer to understanding how the
whole machine works.

If it helps, we're really asking you to use the [scientific method][] to
investigate how this opaque system called "a web application" operates.

Don't roll your eyes.  Yes, you may have learned about it in the 2nd grade, but
you'll be surprised how many developers psych themselves out and forget the
**power** of this technique.

Form a hypothesis.  Devise an experiment that could potentially contradict that
hypothesis.  Run the experiment.  Does it confirm or contradict your
hypothesis?

If you do this enough, you'll be very very clear on what you understand and
what you don't understand, and you'll have a list a mile long of both things to
go investigate but also a framework in which to investigate them.

### Submit!

Having at least partially answered a few of your own questions, submit your
pull request.  When programming in the work force you're going to be given new
techologies or systems build on technologies that somebody made a long time
ago.  While it's much easier to say "Let's do a rewrite, that developer was
clueless!" it's often the case that it's neither time- nor cost-effective to do
such.  Debugging and maintiaining legacy products in this fashion is a core
need of businesses and is a very commmon task set for a new hire.  **DO NOT
SHORTCHANGE THESE SKILLS**.


## Resources

* [Binary search][binary search]
* [One of the best things about Ruby: introspection][introspective]
* [Object#inspect][inspect]
* [HTML Form element: textarea][Textarea]
* [HTML Form element: radio button][Radio buttons]
* [HTML Form element: checkbox][Checkbox buttons]
* [HTML Form element: select box][Select box]

[enter the dragon]: http://www.youtube.com/watch?v=sDW6vkuqGLg&t=1m14s
[binary search]: http://cl.ly/2n3D2V0R0L2f/download/sinatra_skeleton.zip
[introspective]: http://en.wikipedia.org/wiki/Type_introspection#Ruby
[inspect]: http://en.wikipedia.org/wiki/Type_introspection#Ruby
[Textarea]: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea
[Radio buttons]: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input
[Checkbox buttons]: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input
[Select box]: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select
[Rack middleware]: http://rack.github.io/
[scientific method]: http://en.wikipedia.org/wiki/Scientific_method
