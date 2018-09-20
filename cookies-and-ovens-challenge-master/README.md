# Cookies And Ovens: Model a Bakery 
 
## Summary  
*I <3 Cookies* is a bakery specializing in delicious cookies.  The bakery is growing rapidly and is having trouble keeping up with demand.  Some bakery management software should do the trick.  Our job is to build a program that will help them manage the bakery.

Here are a few user stories to help get us started:
    
- As a baker, I want to make different types of cookies (peanut butter, chocolate chip, etc.).
- As a baker, I want to place batches of cookies in an oven.
- As a baker, I want to know when a batch of cookies is ready to be removed from the oven.


### Object-oriented Design
The point of this challenge is to exercise our object-oriented design muscles.  Are we up for it?  Here are some guidelines we should follow.

* Create well-defined classes with a single responsibility.
* Implement clean and flexible interfaces between objects.
* Use composition to give structure to more complex objects.

*Note:* If a refresher on objects is in order, here's a video from Dev Bootcamp days of yesteryear: DBC founder Shereef Bishay going over [Objects and Classes][objects and classes video] from June 18, 2012.


## Releases
### Pre-release: Understand the Problem
Before we begin to write code, we need to think critically about this problem and describe in plain English how to design the program.  At the very least, consider these questions.
        
- What are essential classes?
- What attributes will each class have?
- What interface will each class provide?
- How will the classes interact with each other?
- Does inheritance make sense?


### Release 0:  Implement a Minimum Viable Product
With some idea of what components will make up our program, we'll now start writing some code.  We'll build a *minimum viable product* (MVP)—no fancy features, just enough to accomplish what absolutely needs to get done.

Based on the user stories in the *Summary*, what would an MVP look like?  We should be able to make cookies.  We should be able to move cookies into and out of an oven.  If cookies are in an oven, we should be able to bake them and check their status.

As we build our objects, it's a great opportunity to write some tests describing how we expect them to work.  And then get the tests to pass, of course!


### Release 1:  Additional Features
Our MVP was a success, so we're going to expand the program, adding some new features—and testing them, as always.  We should be sure to implement the following:

- We can make multiple types of cookies, each with a different baking time.
- Cookies have four possible status values depending on how long they've been baked: `:doughy`, `:almost_ready`, `:ready`, and `:burned`.


### Release 2: Refactor
Refactoring is an important part of development.  Take a step back and look at the code we've produced.  Is it of good quality?  In addition to the guidelines presented in the *Summary*, here's a checklist of object-oriented design considerations.

- Are we exposing more of an object's state and behavior than necessary?
- Have we limited what any one object in our program knows about the other types (i.e., limited dependencies)?
- Do we repeat the same logic throughout our code, or is it DRY (don't repeat yourself)?
- Are we following the *Law of Demeter* and limiting the types of objects to which our objects send messages? ([Wikipedia][wikipedia lod], [Avdi Grimm][avdi grimm lod])
- Are our classes orthogonal? ([Stack Overflow][stack overflow orthogonal])


### Release 3: Get Creative!
Put ourselves in a baker's shoes and imagine what other features we might like to have.  Pick the most useful and feasible feature and build it out. 


## Conclusion
In this challenge we've created small, single-responsibility objects and composed them to meet the needs of our application.  Designing objects that encapsulate their own states and behaviors while being able to interact with other types of objects is critical to object-oriented design.


[avdi grimm lod]: http://devblog.avdi.org/2011/07/05/demeter-its-not-just-a-good-idea-its-the-law/
[objects and classes video]: http://shereef.wistia.com/medias/cbb6172797
[stack overflow orthogonal]: http://stackoverflow.com/a/1527430
[wikipedia lod]: http://en.wikipedia.org/wiki/Law_of_Demeter



