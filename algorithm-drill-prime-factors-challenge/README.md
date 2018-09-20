# Algorithm Drill: Prime Factors

## Summary
Around 300 BC, the Greek mathematician [Euclid][wikipedia euclid] proved that every integer greater than one is either (1) a prime number, or (2) the product of multiplying prime numbers.  In this challenge, we're going to write a method that will return the prime factors of a given number.

### Math Concepts
In order to complete this challenge, we'll need to be familiar with a few math concepts which are described below.

**Prime Numbers**  
If we're going to identify a number's prime factors, we'll need to determine whether or not a number is [prime][wikipedia prime numbers].  The following points describe prime numbers.

- The number is greater than one (e.g., one is not prime).
- The number is evenly divisible no numbers other than one and itself.

Following these rules, we can say that two is prime: two is greater than one, and it is only evenly divisible by one and itself.  Three is also prime.  Four is not prime because it is evenly divisible by two.  What about five, six, and seven?

**Factors**  
We'll also want to be clear on what factors are.  A number is a factor of another number, if that other number is evenly divisible by the number.  To illustrate, two is a factor of four because four is evenly divisible by two.  One and four are also factors of four.  One, two, three, and six are all factors of six because six is evenly divisible by each of them.

**Prime Factorization**
```
4  = 2 * 2
6  = 2 * 3
8  = 2 * 2 * 2
9  = 3 * 3
10 = 2 * 5
12 = 2 * 2 * 3

...

873        = 3 * 3 * 97 
12056      = 2 * 2 * 2 * 11 * 137 
123123123  = 3 * 3 * 41 * 333667
```
*Figure 1*.  Prime factorization examples.

When we say that our method will return the prime factors of a number, what do we mean?  We need to find the set of prime numbers that multiply together to equal the original number.  The process of breaking a number down to a set of prime factors is known as [prime factorization][wikipedia integer factorization].  To illustrate, it would be like seeing the number four as the product of two times two.  Or, seeing twelve as the product of two times two times three.  (see Figure 1)


## Releases
### Release 0: Find a Number's Prime Factors
```ruby
prime_factors(6)
# => [2, 3]
prime_factors(8)
# => [2, 2, 2]
prime_factors(123123123)
# => [3, 3, 41, 333667]
```
*Figure 2*. Our method takes a number and returns its prime factors.

We'll write a `prime_factors` method that accepts one argument, a number, and returns an array of the number's prime factors.  As always, we need to document the behavior of our method through tests.  The basic behavior of our method is shown in Figure 2.  Are there any edge cases that we should cover in tests?  How should our method behave if the argument passed in is itself a prime number?


### Release 1: Refactor
Let's examine our code to see if it's the highest quality that we can write.  Are there any code smells that we can eliminate?  We want to have methods that do only one thing.  Can we extract any methods?  Maybe for determining whether or not a number is prime, or for finding possible factors of a given number?  

Do we do any rework in our method?  For example, do we check whether any number is prime more than once?  If we are making repeat calculations, can we remove them?


## Conclusion
Writing an efficient prime factorization algorithm is a problem that mathematicians and computer scientists have unsuccessfully tried to solve ... [at least for very large numbers][wikipedia rsa-768].  There was even a [contest][wikipedia rsa challenge] held to incentivize working on algorithms to find the prime factors of specific numbers.


[wikipedia euclid]: http://en.wikipedia.org/wiki/Euclid
[wikipedia integer factorization]: https://en.wikipedia.org/wiki/Integer_factorization
[wikipedia prime numbers]: http://en.wikipedia.org/wiki/Prime_number
[wikipedia rsa-768]: https://en.wikipedia.org/wiki/RSA_numbers#RSA-768
[wikipedia rsa challenge]: https://en.wikipedia.org/wiki/RSA_Factoring_Challenge


