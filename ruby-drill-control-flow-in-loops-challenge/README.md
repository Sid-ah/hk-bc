# Ruby Drill: Control Flow when Iterating

## Summary
This challenge is going to expand our understanding of how to control the flow of our programs.  We've already used a few different methods to control how our programs operate:  conditional statements like `if` and `case`; looping using `for`, `while`, or `until`; and executing blocks of code for each element in an array.

```ruby
friends = [ ... ]
open_seats = 5

friends_to_invite = []

friends.each do |friend|
  if friends_to_invite.size < open_seats
    if lives_in_town?(friend)
      friends_to_invite << friend
    end
  end
end
```
*Figure 1*. Finding five local friends to invite, using `if` statements.

In Figure 1 we see some code that attempts to select friends to invite to do something.  We have a collection of friends, and we can invite five of them, but we only want to invite local friends.  The code uses `if` statements to control the flow of the program.  (1) If we've found a friend to invite for each open seat, don't do anything.  If there are still open seats, then (2) invite the friend if the friend is local.

Using this logic, we will end up iterating over our entire collection of friends—even if we want to invite the first five friends in our list.  Why continue looking through our friends, when we know that we can't invite anymore?  Wouldn't it be nice to stop looking for friends to invite once we've found one for each open seat?  And, what if we could just move on to the next friend unless the current friend is local?

```ruby
friends.each do |friend|
  next unless lives_in_town?(friend)
  friends_to_invite << friend
  
  break unless friends_to_invite.size < open_seats
end
```
*Figure 2*. Finding five local friends to invite, using the `next` and `break` keywords.

Ruby provides keywords that give us finer control when iterating and that allow for more succinct and readable code than a series of nested conditionals; Figure 2 uses some of these to refactor the code block from Figure 1.  We're going to look at a few of these keywords in this challenge:  `next`, `break`, and `return`.


## Releases
### Release 0: Control Flow in Loops
A series of methods have been written in the file `in_loops.rb`.  The code for each method is similar except for the use of one of the keywords that we're exploring in this challenge.

A test for each method has been written in the file `spec/in_loops_spec.rb`.  Before we run the tests, we need to read through each method and update the expected value for each test based on how we believe the method should behave.  The expected value of the `loop_no_extras` method is provided as an example.

```
$ rspec spec/in_loops_spec.rb
```
*Figure 3*.  Running the tests for the looping methods

Once we've updated the tests to match our expectations, let's run the tests to see if our expectations match the actual behaviors of the methods (see Figure 3).  Were we correct?  If not, why not?  How did our expectation differ from the actual behavior?  Update the expectations until each test passes, but don't simply copy the RSpec output; we need to write our expectations based on our understanding.

Once all the tests pass, there are some questions to answer in the *In Loops* section of the file `learnings.md`.


### Release 1: Control Flow in Blocks
A similar set of methods has been written in the file `in_blocks.rb`.  Here the keywords are being used within blocks rather than loops.  The tests have been written in the file `spec/in_blocks_spec.rb`.  Follow the same process from *Release 0* for these methods.


## Conclusion
Control flow is a necessary part of programming.  Unfortunately, it can sometimes lead to an unreadable mess of conditionals.  The `next`, `break`, and `return` keywords help us to add complex flow control in a more readable way.