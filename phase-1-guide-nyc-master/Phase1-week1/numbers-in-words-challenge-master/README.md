# Algorithm Drill: Numbers In Words

## Summary
```ruby
number_in_words(4)
# => "four"
number_in_words(27)
# => "twenty seven"
number_in_words(82102713)
# => "eighty two million one hundred two thousand seven hundred thirteen"
```
*Figure 1*.  Examples of converting an integer to words.

In this challenge we're going to write a method that converts an integer into its English-word equivalent.  We can see examples of using this method in Figure 1.


*Source:* Chris Pine, [Learn to Program](http://pine.fm/LearnToProgram/)


## Releases
### Release 0: Convert Single-digit Integers
We're going to follow the practice of starting simple and building complexity as we move forward.  To do so, let's build our method to the point of converting single-digit integers:  0 - 9.

As always, we should be testing our method as we go.


### Release 1: Ten, Eleven, Twelve, and the Teens
With a method that will convert single-digit integers, let's move on to converting some larger numbers.  Our method should also convert numbers from 10 - 19.


### Release 2: Other Two-digit Integers
Let's continue by expanding the numbers that our method will convert from 20 - 99.  Again, we should be testing the behavior of our method as we proceed.

Also, before we move on, let's take a look at the quality of our code.  Can we refactor our code to improve its quality?  Is it highly readable?  Is it elegant?


### Release 3: Hundreds, Thousands, Millions ...
Let's continue to add to the range of numbers that our method can convert.  At a minimum, our method should be able to convert numbers up to 999,999,999.  If we'd like we can take things further:  billions, trillions, etc ...

As we proceed, let's continue to (1) add complexity incrementally, (2) test the behavior of our method, and (3) maintain code quality.


## Conclusion
This challenge presents a good opportunity to practice developing an algorithm and follow a test-driven development approach.
