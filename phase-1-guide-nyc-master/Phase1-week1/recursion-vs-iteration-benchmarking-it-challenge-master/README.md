# Benchmarking Iteration and Recursion

## Summary
As developers, we write the best code that we can.  We write code to be elegant, concise, and readable, and we also want that code to be performant: execute quickly, use less resources, etc.  It's not always possible to have both.  For example, sometimes elegant, readable code executes too slowly for the needs of our application.

We've explored implementing the same behavior both iteratively and recursively.  Recursion often leads to elegant and concise code, but the performance of a recursive algorithm can sometimes be less optimal than that of an iterative algorithm.  Other recursive algorithms perform well against their iterative counterparts.

In this challenge, we're going to compare the performance of iterative algorithms and recursive algorithms.  We'll benchmark the performance of each and compare them to see how greatly their performances differ and under what circumstances.


## Releases
### Pre-release: The Algorithms
In a [previous challenge](../../../algorithm-drill-factorial-challenge) we wrote iterative and recursive algorithms to calculate the factorial of a given number.  In [another challenge](../../../the-fibonacci-sequence-challenge) we wrote algorithms to calculate the nth number in the Fibonacci sequence.  Example methods for each of these algorithm pairs are provided for us to use in this challenge, but we may use our own methods if we prefer.


### Release 0: Benchmark Calculating a Factorial
We'll begin our iterative vs. recursive benchmarking by looking at the two methods for calculating the factorial of a given number.  We'll use Ruby's [Benchmark](http://www.ruby-doc.org/stdlib-2.1.0/libdoc/benchmark/rdoc/Benchmark.html) module to perform the calculations for us—a small part of this challenge is to learn how to use this library.

We're going to use each method to calculate the factorial of a series of numbers:  0, 1000, 2000, 3000, 4000, and 5000.  And for each number, we'll calculate it's factorial 500 times.  In the end, for each of the numbers, we'll be able to say something like, "It took *n* seconds to iteratively calculate 3000 factorial 500 times, and it took *m* seconds to do so recursively."

As we benchmark the performance of each method for each value, we should chart the results on a piece of paper, whiteboard, etc. ([sample factorial results chart layout](chart-examples/factorial.png)).  This will help us to visually compare how each method compares to the other as the numbers increase.

*Note:* Running each method 500 times for each value helps to smooth out noise—such as another process on the computer taking some of the CPU's resources while one of the benchmarks was running.  It also gives us numbers that we can better relate to, since computers calculate so quickly.

### Release 1: Benchmark Calculating the nth Fibonacci Number 
Now we can benchmark the methods for calculating the numbers in the Fibonacci sequence.  As in the previous release, we'll want to run each method 500 times for each number we're working with.  But, we'll be using a series of much smaller numbers:  0, 5, 10, 15, 20, 25, and 30.

Again, we should chart our results for each number ([sample fibonacci results chart layout](chart-examples/fibonacci.png)).


### Release 2: Compare Results
With the charts of our results in hand, let's compare them.  Are there any differences?  How did the performance of each pair of methods change as the number we were dealing with grew?  Were the recursive methods able to keep up with their iterative counterparts, or did the performance of the recursive methods degrade?  Why is this?  When we call a recursive method with a given number, how many subsequent method calls are made as a result?


### Release 3: Improve Performance (optional)
Let's try to improve the performance of any recursive methods that began to perform poorly.  A good question to start with might be "Is the computer doing rework (i.e., calculating a number it's already calculated before)?"  And, if it is, how can we prevent it?

*Hint:*  If we're stuck, we can look into memoization and adding default parameters to our methods.

## Conclusion
What's the best way to implement the behaviors that we want for our methods?  An iterative algorithm?  A recursive algorithm?  We need to know the tradeoffs for each approach.  We also need to know what performance constraints we're under, so that we can balance writing elegant, readable code with the performance requirements of our program.

As we're growing as developers at Dev Bootcamp, let's prefer writing concise, readable code over performant code.  At least for now.
