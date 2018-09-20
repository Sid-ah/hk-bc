# Prime Factors: Sieve Of Eratosthenes

## Summary
In this challenge we're going to refactor a working solution to the *[algorithm-drill-prime-factors-challenge][]* that we've previously completed.  A working codebase has been provided.  We're going to refactor the code to use a specific algorithm for iterating over the possible prime factors of a number.

### Sieve of Eratosthenes 
We're going to refactor the provided code to use one of the oldest known algorithms, the [Sieve of Eratosthenes][].

In the codebase we'll be working with, to find a prime factor of a given number, we run through all the numbers between one and that given number until we find a prime factor.  We check one, then two, then three, four, five, six, etc.

With this approach, we do a lot of unnecessary work. For example, we'll check if a given number is divisible by two.  And then we'll check to see if the number is divisible by four, six, eight, and all the other even numbers in the range.  But we know that if a number was divisible by four, six, or eight, it would have already been found to be divisible by two.  Said the other way, if the number was not divisible by two, it won't be divisible by any other even number.

And we do the same thing with three when we later check six, nine, twelve, etc. And the same again for five, checking then ten, fifteen, twenty, etc.

![Sieve of Eratosthenes](http://upload.wikimedia.org/wikipedia/commons/b/b9/Sieve_of_Eratosthenes_animation.gif)

*Figure 1*.  Using the Sieve of Eratosthenes to find a collection of prime numbers less than 121.

The Sieve of Eratosthenes helps us by creating a collection of prime numbers that we could iterate over to avoid this unnecessary work.  Wikipedia provides an [overview][SoE overview] of how to create the collection of numbers, which has been translated into the following steps.  Figure 1 depicts this process visually.

1. Create a list of consecutive integers from 2 through *n*:  2, 3, 4, ... *n*.
2. Take the first number in the list (i.e., 2) and remove all of its multiples (e.g., 4, 6, 8, 10, etc.).
3. Take the next remaining number in the list (i.e., 3) and remove all of its multiples from the list.
4. Repeat Step 3 until all numbers in the list have been checked. 


## Releases
### Release 0: Implement the Sieve of Eratosthenes
```ruby
sieve_of_eratosthenes(10)
# => [2, 3, 5, 7]
```
*Figure 2*.  Example usage of the `sieve_of_eratosthenes` method.

After we understand how the Sieve of Eratosthenes works, let's write a method `sieve_of_eratosthenes` which takes as its input an integer and returns all prime numbers less than that number (see Figure 2).  As always, we'll want to test that our method is working as we expect.  

Remember that our tests should describe the behavior of our method: given a specific number as input, the method returns a specific value.  The tests won't reflect our implementation, but the challenge here is not just to return prime numbers less than a given number.  The challenge is to do so using the Sieve of Eratosthenes algorithm.

*Note:* In trying to understand how the sieve works, use pencil and paper, a whiteboard, whatever we need to help ourselves understand.


### Release 1: Refactor How We Find Prime Factors
We have a working codebase that will find the prime factors of a given number.  We want to refactor the code base to make use of our `sieve_of_eratosthenes` method.

We're free to change any of the provided code, but the behavior of the `prime_factors` method should not change.  Tests have been provided for this method.  They pass given the provided codebase, and they should continue to pass after our refactoring.


## Conclusion
In this challenge we were given a specific algorithm to implement in code.  We were also given a working codebase that we needed to understand before we could refactor.  Did we struggle with either or both of these?  Was it hard to understand the algorithm?  Was it hard to translate it into code?  Was it hard to understand how the methods in the codebase worked together?  If we struggled with any aspects of this challenge, do we understand where and why we faced these struggles?  And, how can we improve our abilities now that we've identified these areas?


[algorithm-drill-prime-factors-challenge]: ../../../algorithm-drill-prime-factors-challenge
[Sieve of Eratosthenes]: http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
[SoE overview]: https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes#Overview
