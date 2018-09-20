# Debugging

Written by [Torey Hickman](https://github.com/toreyhickman).  Based on resources written by [Tanner Welsh](https://github.com/openspectrum) and [Alyssa Diaz](https://github.com/alycit).

## Introduction
Debugging is a technique for finding and fixing errors. All programs have bugs. Therefore, the better you get at debugging, the better you will be at programming.

Debugging is great for fixing problems in your code. It will not necessarily lead you to fixing problems in your thinking.  Furthermore, debugging will not be very useful unless you first understand the problem the code is supposed to solve.

## Debugging Steps
An example debugging process is described in the following steps; this approach will be effective for some people while others will develop their own.


1.  **Isolate the error**  
  Where is the source of the error?
  
2.  **Visualize state**  
  What are the values of variables when the error occurs?
  
3.  **Compare expected to actual state**  
  How does the state differ from my conception of what it should be?
  
4.  **Generate a hypothesis**  
  Why does this dissonance exist?
  
5.  **Modify with purpose**  
  Make changes to the code which directly solve for the conditions in your hypothesis.
  
6.  **Test and iterate**  
  Ensure that the code works as intended; repeat steps above until success is reached.


### Isolate the Error
In isolating the error, we want to identify, as best as possible, where the error is occuring.  A great first step when confronted with an error is to **read the error message**.  Often, the error message will identify the file and line number where the error occured and provide some context about what went wrong.

Consider the following bit of code.

```ruby
def show_me_errors
  (0..4).each do |num|
    something << num
  end

  something
end

puts show_me_errors
```

If we ran this code, we would receive the following error message.

```
show_me_errors.rb:3:in `block in show_me_errors': undefined local variable or method 'something' for main:Object (NameError)
	from show_me_errors.rb:2:in `each'
	from show_me_errors.rb:2:in `show_me_errors'
	from show_me_errors.rb:9:in `<main>'
```

There's a lot of information that we can gather.  First, I can see that in the file `show_me_errors.rb`, the error occured on Line 3.  I also know that there is an `undefined local variable or method 'something'`; in others words, Ruby hit a reference to `something` and didn't know what it was.  Furthermore, by looking at the stack trace—beginning at the bottom of the error message—I can see how the program reached the error point:  the `show_me_errors` method was called on Line 9, the method is run, and the error occurs during the call to `#each`.  Looking at the block passed to the `#each` method, I see that the code is attempting to call the `#<<` method on `something`.  At this point, I have isolated the error to there being no `something` in the scope of the block.

### Visualize State
Often, we run into errors where we think a variable is referencing an object with a specific value, but it's actual value is something different.  Sometimes our expectations are close, and sometime they're not.  It can be helpful to visualize the value of our variables at specific points in our program—isolating the error, as described above, gives us a clue as to where we should look to visualize the state of our program (e.g., variables).

Consider the following code sample.

```ruby
def see_into_code(number)
  x = 0
  result = []

  until x == number
    result << x
  end

  result
end

puts see_into_code(10)
```

Running the preceeding code results in an infinite loop.  We think that our code should break out of the `until` loop when `x == number` but it never happens.

There are a couple approaches that you can take to visualize your variables.  One simple, common approach is to insert `puts` statements.  In the code above, I know that I'm not breaking out of the `until` loop.  Breaking out of the loop depends on the values of `x` and `number`.  By inserting a couple of `puts` statements within the loop, I will be able to see how the values of `x` and `number` change for each iteration of the loop ... or if they change.  

```ruby
def see_into_code(number)
  x = 0
  result = []

  until x == number
    puts "The value of varaible 'x' is #{x}."
    puts "The value of varaible 'number' is #{number}."
  
    result << x
  end

  result
end

puts see_into_code(10)
```

`puts` statements can be an effective tool for debugging, but they don't belong in your production code.  Remove them once you've debugged your code.

An alternative is to use a debugger.  Debuggers are used somewhat similarly to `puts` statements, but they are more robust, allowing you to explore the state of your program as it's running, rather than declaring before runtime which variables you want to see.  There are a few gems to choose from. Examples include ... 

- [byebug](https://rubygems.org/gems/byebug)
- [pry](https://rubygems.org/gems/pry)
- [debugger](https://rubygems.org/gems/debugger) (ruby 1.9.3)

Each of these are gems that would need to be required in your program (e.g., `require 'debugger'`).  Then, similarly to placing `puts` statements where we've isolated the error, we call for the debugger.

```ruby
require 'byebug'

def see_into_code(number)
  x = 0
  result = []

  until x == number
	byebug
	  
    result << x
  end

  result
end

puts see_into_code(10)
```

When the code is run and the call to the debugger is made, an interactive irb-like session will begin, showing the line number where execution was halted and the surrounding lines of code:

```
[5, 14] in show_me_errors.rb
    5:   result = []
    6: 
    7:   until x == number
    8:   byebug
    9: 
=> 10:     result << x
   11:   end
   12: 
   13:   result
   14: end
(byebug) x
0
(byebug) number
10
(byebug) result
[]
```

We can then interact with the program.  In the example above, I've retrieved the values of the variables `x`, `number`, and `result`.  The values are `0`, `10`, and `[]`, as I would expect, so all looks good.  

When I'm done exploring, I can run the `continue` command to resume execution, which will halt again when the next call to the debugger is reached—in this case, the next iteration of the `until` loop.

```
(byebug) continue

[5, 14] in test.rb
    5:   result = []
    6: 
    7:   until x == number
    8:   byebug
    9: 
=> 10:     result << x
   11:   end
   12: 
   13:   result
   14: end
(byebug) x
0
(byebug) number
10
(byebug) result
[0]
```

In this next iteration of the `until` loop, I've again retrieved the values of the variables `x`, `number`, and `result`.  I can see that `number` is still `10` and the array `result` now contains the previous value of `x`, which is `0`, as expected.  However, `x` has not changed; it was `0` in the last iteration and `0` in this iteration.  That's not what I expected; I expected it to be `1`.  `x` should increment until it equals `number`, so I now know that I forgot to increment `x`.  I can enter the `exit` command to stop running the program and then fix the code:

```ruby
def see_into_code(number)
  x = 0
  result = []

  until x == number
    result << x
    x += 1
  end

  result
end

puts see_into_code(10)
```

###Compare Expected to Actual
In debugging it's important to know what you expect to happen when your code runs.  For example given `name = "John"`, I expect `name.upcase` to return the string `"JOHN"`.  In the earlier example, where I was iterating `until` a condition was met, I expected `x` to be `0` during the first iteration of the loop and then be `1` during the next iteration.  Only by having an expectation was I able to see that the actual value was not what I wanted.

Writing tests is a great way to compare expected values to actual values.

```ruby
describe "#convert_to_pig_latin" do
  context "when a word begins with a vowel" do
    it "returns the word" do
      word = "ahoy"
      expect(convert_to_pig_latin word).to eq word
    end
  end
  context "when the word begins with a consonant" do
    it "moves opening consonants to the end and then appends 'ay'" do
      word = "boy"
      expect(convert_to_pig_latin word).to eq "oybay"
    end
  end
end
```

Given the following `convert_to_pig_latin` method ...

```ruby
def convert_to_pig_latin(word)
  return word
end
```

... the second test example will fail, and the rspec output will let us know what we *expected* and also what we *got* when running the method.


```
Failures:

  1) #convert_to_pig_latin when the word begins with a consonant moves opening consonants  
     to the end and then appends 'ay'
     
     Failure/Error: expect(convert_to_pig_latin word).to eq "oybay"
       
       expected: "oybay"
            got: "boy"
       
       (compared using ==)
```

I know that when my method receives an argument beginning with a consonant (e.g., "boy"), it just returns the same word rather than converting it as I would expect.  I can now focus my efforts on making a fix targeted to making this test pass.

### Generate a Hypothesis
When we encounter a situation where our code is not operating as we think it should, we obviosly need to fix the code.  We can use the previous steps (i.e., isolating the error, visualizing state, and comparing expected values to actual values) to gether information about our program, but we still need to determine what is causing the bug.

Sometimes the error will be clear.  At other times, it won't.  If you encounter a situation where you aren't sure what is causing an error, resist the urge to just start making changes.  Generate the best hypothesis possible:  "changing Line X to ... will ...".  

### Modify with Purpose

Make the change identified in your hypothesis ...

### Test and Iterate
... and run the code to see what happens.  Did it work?  Great.  If not, decide the best course of action.  Do you need to go back to the previous code?  Was this one change necessary but not sufficient to fix the bug?  You'll have to use your best judgement, but don't guess.
