# Simple Benchmarking With Blocks

## Summary
When we define methods, it's common for them to accept arguments. For example, we've written methods that accept a string argument in order to [convert it to pig latin][pig latin challenge], [scan it for a social security number][regular expressions challenge], etc. Arguments allow us to pass data to our methods, and as our methods execute, they use this data.  

We can also write methods that allow users to pass in behavior—what happens when a method is called.  Where we use arguments to pass data into our methods, we use blocks to pass in behavior.

```ruby
def calculate
  calculation = yield
end

calculate { 2 + 2 }
# => 4
calculate { 3 * 4 }
# => 12
```
*Figure 1*.  Defining and calling a method that executes a block.

In Figure 1, we define and then call a `calculate` method.  When we call the method, we pass in a block.  The first time we call the method, we pass in the block `{ 2 + 2 }`.  The second time, we pass the block `{ 3 * 4 }`.  The blocks represent pieces of code that we want the method to execute.  Within the method, we [use the `yield` keyword][yield explanation] to call for the code in the block to be executed.


### Syntax of Working with Blocks
```ruby
calculate { 5 * 7 }
# => 35

calculate do
  product = 5 * 7
  product + 1
end
# => 36
```
*Figure 2*.  Different syntax options for defining a block.

We have choices when it comes to how we define the blocks that we pass to our methods.  We can use curly braces:  `{ ... }`.  Or, we can use `do ... end`.  We generally use curly braces if our block only contains one statement and is written on one line.  If we have multiple statements and our code is written on more than one line, we favor `do ... end`. (see Figure 2)

```ruby
def verify(expected)
  yield(expected)
end

verify(5) { |n| n == 2 + 3 }
# => true
verify(9) { |n| n == 2 + 3 }
# => false
```
*Figure 3*.  Defining a block that accepts an argument.

As with methods, blocks can accept arguments.  In Figure 3, the blocks that we pass to the `verify` method need data to be passed into them in order to function.  So, when we yield, we pass the block the argument that it needs—in the same way that we would pass an argument to a method.

```ruby
def calculate
  calculation = yield
end

number = 5
calculate { number + 2 }
# => 7
```
*Figure 4*.  Blocks maintain the scope in which they're defined.

One interesting feature of blocks is that they retain their local scope.  In other words, variables and methods that are available when the block is defined will also be available when the block is executed.  In Figure 4 we define a variable `number`, which we then use when we define the block that we pass when calling `calculate`.  While our `calculate` method is running, the method itself will not have access to `number`, but our block will.  We'll see this feature used in the code examples in this challenge.

## Releases
### Release 0:  Calculate Time Needed to Run Code
```ruby
long_string = "abcde" * 5000000

reverse_start_time = Time.now
long_string.reverse
reverse_end_time = Time.now
reverse_run_time = reverse_end_time - reverse_start_time

upcase_start_time = Time.now
long_string.upcase
upcase_end_time = Time.now
upcase_run_time = upcase_end_time - upcase_start_time
```
*Figure 5*. Calculating the time it takes to work with a long string.

In Figure 5 we're working with a long string, and we calculate how long it takes to reverse it.  Then we calculate how long it takes to upcase it.  Already, we can see that we're beginning to repeat ourselves:  mark the start time, execute some code, mark the end time, and then calculate how long it took to execute the code.

With this sort of repetition, we might want to refactor this behavior into a method, and this would be a great example for when to use blocks. We have a general pattern of behavior that we follow, but we also have some variability (i.e., the code whose execution time we're calculating).

```ruby
long_string = "abcde" * 5000000

reverse_run_time  = benchmark { long_string.reverse }
upcase_run_time   = benchmark { long_string.upcase }
addition_run_time = benchmark { 1 + 2 + 6 + 8 }
```
*Figure 6*. Example usage of the `benchmark` method.

Let's write a `benchmark` method that accepts a block and calculates the number of seconds it takes to execute the block. Regardless of what happens in the block, our method should calculate how long it takes to run the code in the block.  We can see example usage in Figure 6 and in the file `runner.rb`

## Conclusion
When we write RSpec tests, we write blocks constantly, so we've been writing Ruby code with blocks.  In this challenge we've gotten an introduction to how we ourselves can write code that utilizes blocks.  Blocks are a great feature of Ruby, and we'll continue to explore them.


[pig latin challenge]: ../../../pig-latin-challenge
[regular expressions challenge]: ../../../ruby-drill-regular-expressions-challenge
[yield explanation]: http://stackoverflow.com/questions/3066703/blocks-and-yields-in-ruby
