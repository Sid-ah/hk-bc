# Design Drill: Method Chaining

## Summary
As Ruby developers, our aim is to write working code that is also highly readable.  When we initially develop our programs, it is often useful to write them out on many lines so that we can more easily visualize the functionality. This is a great first step, but it might not result in the most readable, efficient code.

We should always refactor our code to make it more clear, readable, and concise.  Method chaining is one tool developers use toward this end.  With method chaining, we can sometimes take multiple lines of code and condense them down to a single, more readable line.

However, we need to be careful.  Method chaining can be taken too far and end up decreasing readability. Refactoring our code to fit on the fewest possible number of lines is nice, but it can also lead to very unreadable and convoluted code.  We need to develop a sense of balance for writing condense code that is also highly readable.

In the Ruby world, it is considered more professional to write readable, elegant code than extra-compact, complex code.  In this challenge, we'll refactor a couple of methods to increase their conciseness and readability.


## Releases
### Pre-release:  Review Code
Two methods are written in the file `method_chaining.rb`.  There are tests for each method in the file `spec/method_chaining_spec.rb`.  Run the tests to see that they pass.  As we refactor the two methods, we need to ensure that the tests continue to pass.  Preventing [regression](http://en.wikipedia.org/wiki/Regression_testing) is one of many reasons tests are valuable.


### Release 0: Simplify with Method Chaining
Refactor the code within the method body of `shout_backwards` into one line of code.  The method's behavior should remain clear.


### Release 1: Refactor for Clarity
The code in the `squared_primes` method has been condensed down to one difficult-to-read line.  Refactor the convoluted code within the method so that it reads more smoothly.  When we're done, it should be much clearer what the method is doing.


## Conclusion
Method chaining is one tool that we can use to write readable, elegant code.  In addition to writing code that works, we should always aim to write high quality code.  As we proceed through challenges at Dev Bootcamp, we should look through our code for refactoring opportunities and then take the time to refactor our solutions to be more readable.  With purposeful practice we can begin to naturally write readable Ruby-like code.
