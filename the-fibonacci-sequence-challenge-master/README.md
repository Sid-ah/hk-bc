# Algorithm Drill: The Fibonacci Sequence

## Summary
In this challenge we'll again look at implementing the same behavior in two different ways:  iteratively and recursively.  It's assumed that we've been introduced to each of these approaches in a [previous challenge](../../../algorithm-drill-factorial-challenge).

The behavior we're after in this challenge is calculating a number in the Fibonacci sequence.  We'll write two methods, each of which will accept an integer as an argument and return the number at that position in the Fibonacci sequence.  If our methods are called with the argument `7`, they return the seventh number in the sequence.  If called with `23`, they return the twenty-third number in the sequence.


### The Fibonacci Sequence
The [Fibonacci sequence](http://en.wikipedia.org/wiki/Fibonacci_number) is a specific sequence of numbers.  The numbers in the sequence are observable in nature (if interested, see video [Parts 1](http://www.youtube.com/watch?v=ahXIMUkSXX0), [2](http://www.youtube.com/watch?v=lOIP_Z_-0Hs), and [3](http://www.youtube.com/watch?v=14-NdQwKz9w)), and the ratio between the numbers approximates the [Golden Ratio](https://en.wikipedia.org/wiki/Golden_ratio) which has been [used in the arts](https://en.wikipedia.org/wiki/List_of_works_designed_with_the_golden_ratio) for its aesthetic properties.

Why are we interested in calculating numbers in the sequence?  Not for the numbers themselves, but because the sequence represents a real-world system of rules that we can model in code.

The sequence is built by following simple rules:

- The sequence starts with 0 and 1.
- The next number in the sequence is the sum of the last two numbers in the sequence.

![building the Fibonacci sequence](readme-assets/build_fibonacci_sequence.gif)

*Figure 1*. Building the Fibonacci sequence.

Following these rules we can build the Fibonacci sequence:  0, 1, 1, 2, 3, 5, 8, 13 ... (see Figure 1).


## Releases
### Release 0: Iteratively Calculate the nth Fibonacci Number
As described in the *Summary*, we're going to write a method that returns the nth number in the Fibonacci sequence.  For this release, we need to implement this behavior through an iterative algorithm.  Tests have been provided, which we can use to drive our development of this method.

*Note:* We'll use zero-based numbering to reference positions in the sequence.  So, the sequence starts with the zeroth number—like indexes in an array.


### Release 1: Recursively Calculate the nth Fibonacci Number
Now we'll implement the same behavior using a recursive algorithm.  We'll need to supply our own tests.


## Conclusion
This challenge presented us with another opportunity to create behavior with using different implementations:  iterative and recursive.  We want to continue to practice each, so that we can employ whichever is appropriate for a given situation.

If desired, read more [information](readme-assets/fib_description.md) on the Fibonacci sequence.
