# Model an Orange Tree

## Summary
Fran the Farmer is interested in building a model of her orange tree farm.  As a proof-of-concept, she's hoping to model one orange tree and its yearly production over its lifetime.  Fran began working on the program herself, but the success of her farm has left her little time for development.  We've been hired to complete the application for her.

In this challenge we'll be designing a custom Ruby class:  `OrangeTree`.  We'll design its interface and all of its behaviors to specifications provided by Fran.  Once the model is complete, we'll create a script that will model a tree's production.


## Releases
### Pre-release:  Review Provided Code
As mentioned in the *Summary*, Fran has already started to develop this application.  She's created a complete and tested `Orange` class, which we'll make use of—our orange tree will grow oranges afterall.  Fran has only begun to dabble with creating the `OrangeTree` class.  She's laid out a few methods and written some comments on what they should do; she's also provided some skeleton code for testing the orange tree.  And, finally, she's written some of the script that will run (`runner.rb`) when we want to see a tree's production over its lifetime.  Review the code to get the gist of what Fran was planning on doing.


### Release 0: Model an Orange Tree
Here are some details Fran has provided for how she would like this early orange tree model to behave.  Remember, this is an early proof-of-concept application, so we won't worry about modeling things like how the temperature affects production.  We're just building a basic model.

Each of Fran's details should be translated into tests, so that we can verify that our model conforms to each expectation.  In parentheses, Fran has provided the method she intended to match these details.  Our class may very well include more methods than these, but these will form our class's public interface.

- A tree should have an age, which we should be able to check (`#age`).
- A tree should have a height, which we should be able to check (`#height`).
- Each growing season (`#pass_growing_season`) ...
  - Any unharvested oranges from the previous season should drop.
  - A tree should age one year.
  - A tree should grow 2.5 feet taller until it reaches its maximum height, say 25 feet.
  - A tree should bear fruit if it is mature (i.e. at least six years old), say 100 to 300 oranges.
- We should be able to check if a tree is old enough to produce fruit (`#mature?`).
- A tree should die at age 100, and we should be able to check if it's dead (`#dead?`).
- We should be able to check if a tree has any oranges (`#has_oranges?`).
- We should be able to pick an orange off a tree (`#pick_an_orange`), or raise an error if we try to pick an orange when the tree has none.


*Note:*  In the tests, don't use methods like `#instance_variable_get` to "peek inside the objects".  Write tests that assert correctness using only the object's public methods.  Ask for help, if stuck.


### Release 1: Complete the Production Modeling Script
We now have fully tested and functional `Orange` and `OrangeTree` classes.  Now it's time to use these models in an application.  Remember, Fran wants to see the yearly production of an orange tree over its lifetime.

We need to complete the file `runner.rb`.  Specifically, we need to calculate the local variable `average_orange_diameter`, which tells us on average how large each of the harvested oranges were.  Once that is done, establish an expectation for what the script will output.  Once we have our expectation, run the script to see our classes in action.

Did the script meet our expectations?  If not, what are the errors or unexpected behaviors?  Do we understand them?  Write tests to catch any bugs in our `OrangeTree` class.  We might also need to update existing tests if we find we're asserting the wrong thing, or in the wrong way.  Continue until the script runs correctly.


## Conclusion
We've modeled a real-world object to fit the needs of our application.  We'll be doing this a lot going forward.  We've had to make decisions regarding the internal state of our tree (i.e., which instance variables it needs).  Each tree needs to keep track of its own age, height, and oranges.  And we're able to use that state to calculate more information about the tree:  is it old enough to bear fruit, is it dead, does it have any oranges?


