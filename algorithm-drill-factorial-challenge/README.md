# Algorithm Drill: Calculate a Factorial

## Summary
In this challenge we're going to write two solutions to the same problem.  We'll write two methods that behave the same way—they'll accept the same arguments and return the same values.  They'll differ in their implementations (i.e., how they do what they do).

The problem that we'll solve is calculating the factorial of a given number—more on what that means later.  We'll solve this problem by writing both an *iterative* solution and a *recursive* solution.  These approaches are useful when solving a problem requires repetitive execution.  


### Iterative Algorithms
```ruby
def countdown_script(number)
  script = String.new
  
  while number > 0
    script << "#{number} ... \n"
    number -= 1
  end
  
  script << "Blast off!"
end
```
*Figure 1*.  Iterative algorithm to generate a countdown script using a while loop.

While we might not recognize the name, we're probably familiar with writing [iterative](https://en.wikipedia.org/wiki/Iteration#Computing) algorithms.  What are some signs that we're writing an iterative algorithm?  Our methods involve looping—maybe with `while` or `until`.  We do something a certain number of times.  Or, when we iterate over the elements in an array.

In Figure 1 we see an iterative solution to generating a countdown script.  The method builds and returns a string.  It does so using a while loop:  as long as the variable `number` points to an integer greater than zero, the method will keep adding to the script.  Important factors in such a method are knowing when to break out of the loop and making sure that we'll eventually hit the break condition.  How are these done in the method in Figure 1?


### Recursive Algorithms
```ruby
def countdown_script(number)
  return "Blast off!" if number < 1
  "#{number} ... \n" + countdown_script(number - 1)
end
```
*Figure 2*.  Recursive solution to generating a countdown script.

Writing a [recursive](http://en.wikipedia.org/wiki/Recursion_%28computer_science%29) method is another approach to solving the same types of problems that we solve with iterative algorithms.  In Figure 2, we solve the same problem of generating a countdown script, but we do so using recursion.

One critical feature of writing a recursive method is the *base case*.  This is a known solution to the problem.  In generating a countdown script, we know that when we get below one, it's time for blast off.  In other words, we have our base case; if the number passed to our method is less than one, we'll just return the string `'Blast off!'` and be done.

"What are the base cases?" should be the first question we ask every time we want to approach a problem recursively. Many recursive algorithms have only one base case, but they can have multiple base cases.

With our base case, we know what to return if the number passed to our method is zero or a negative number.  But otherwise, we need to build the script.  We do so in small steps.  We don't know exactly what the whole script will look like, but we know what one chunk of it looks like:  `"#{number} ... \n"`.

We just need to combine that chunk with the rest of the countdown script.  And, to generate the rest of the script, we'll call our `countdown_script` method again—this time for one number less than we had previously.  This is the most obvious feature of a recursive method:  the method calls itself.

The method will continue to call itself and develop those small chunks of the script until we call our method and hit the base case.  At that point, we'll have all the pieces of our script, and they can be combined.


### Calculating a Factorial
```
0! = 1
1! = 1
2! = 1 * 2
3! = 1 * 2 * 3
4! = 1 * 2 * 3 * 4
```
*Figure 3*.  Example factorial calculations

What is a [factorial](http://en.wikipedia.org/wiki/Factorial)?  For a given number, the factorial of that number is the product of all the positive integers less than or equal to the number itself.  To provide some examples, two factorial is equal to two times one.  Three factorial is equal to three times two times one.  Four factorial is equal to four times three times two times one. (see Figure 3; we denote a number's factorial as `n!`)

While this might sound very theoretical, calculating a factorial has real-world applications.  For example, calculating a factorial will tell us how many different ways we can arrange a set of items.  If we have ten books on a bookshelf, for example, there are `10!` different ways to order the books.  If we have a set of `n` items, then there are `n!` ways to order them.

Looking back at Figure 3, we might notice that the calculation for three factorial shares some factors with two factorial:  they both include multiplying two times one.  And four factorial overlaps with three factorial:  calculating each involves multiplying three times two times one.

```
0! = 1
1! = 1 * 0!
2! = 2 * 1!
3! = 3 * 2!
4! = 4 * 3!
```
*Figure 4*.  Calculating a numbers factorial in terms of another factorial.

Because of this, we could say, for example, that four factorial is equal to four times three factorial.  Or, more generally, that the factorial of any number is equal to that number times the factorial of that number minus one. (see Figure 4)

*Note:* By convention, zero factorial is equal to one.


## Releases
### Release 0: Iteratively Calculate a Factorial
We'll start by writing a method that calculates a factorial for a given number using an iterative implementation.  The method should accept any non-negative integer as input and calculate the factorial of that number—don't worry about handling bad input.

Tests have been provided to describe the behavior of the method (see file `spec/factorial_spec.rb`).


### Release 1: Recursively Calculate a Factorial
Now we're going to write a method with the same behaviors as our iterative method but with a recursive implementation.  No tests have been provided; we'll need to write them ourselves.


### Release 2: Stack Level Too Deep
In the `runner.rb` file, we call our recursive method to calculate the factorial of 5,000.  In order to do the actual calculation, the method will be called again for 4,999 and 4,998 and so on ... right on down to 1.  Depending upon our implementation, the method will be called right around 5,000 times.

Each of these method calls operates in it's own little piece of the computer's memory.  And, each call occupies that memory until the method returns.  When we call `factorial_recursive(5000)`, the method doesn't return until it first evaluates `factorial_recursive(4999)`, which doesn't return until it first evaluates `factorial_recursive(4998)`, and so on.  Little by little, we're using more and more memory.

Each of those roughly 5000 method calls takes up a little piece of memory until we hit our base case and start returning values.  `factorial_recrusive(1)` returns, which allows `factorial_recursive(2)` to return, which allows `factorial_recursive(3)` to return, and so on until all of the method calls are evaluated, and the memory they occupied is freed.

Adjust the number used in the runner file to determine the largest value our recursive factorial method can take as its input before it crashes?  What error do we receive?  What does the error mean?


## Conclusion
Iteration and recursion are different types of implementations.  Each can generally provide the same behavior as the other.  Why choose one over the other?  We might have performance concerns that lead us in one direction.  We might find that one implementation leads to cleaner, more concise, more readable code.

Over time, as we practice and become more aware of each approach and more comfortable implementing each approach, the choice of iteration or recursion will become more natural.  We'll come to see certain problems as iterative or recursive problems.
