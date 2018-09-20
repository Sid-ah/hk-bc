# Single Responsibility Methods

## Introduction
Writing methods with a single responsibility is a practice that is stressed in Phase 1.  The idea is that every method should do just one thing (i.e., have one responsibility).

## Breaking Down a Method
On Monday you were presented with a [design drill challenge dealing with method chaining](../../../../../design-drill-method-chaining-challenge).  Release 1 asked you to refactor a `squared_primes` method.

```ruby
# FIXME: This is convoluted. Refactor for clarity.
def squared_primes(array)
  array.find_all{|x| (2..x-1).select(){|i| x % i == 0 }.count == 0 }.map{|p| p*p}
end
```

Looking at this method, it doesn't look all that complex.  It's hard to read because of the method chaining, the nested blocks within blocks, and unnecessary parentheses, but it can be cleaned up fairly easily:

```ruby
def squared_primes(numbers)
  # find the primes
  primes = numbers.find_all do |x|
    (2..x-1).select { |i| x % i == 0 }.count == 0
  end

  # square the primes
  primes.map{ |p| p * p }
end
```

It's now much more readable.  We find the prime numbers in the `numbers` argument and then square each of those prime numbers.  Just that simple refactor and explanation makes it obvious that this method has multiple bits of logic tucked inside itself.  The clue is that the method does that *and* that.

Ask yourself, "What is the responsibility of this method?"

It receives an array of integers and it returns another array that includes the square of any prime number in the argument array.

In it's current form, it's doing much more than that.  At a minimum, it is ...

1. determining what it means for a number to be prime.  
   `{ |x| (2..x-1).select { |i| x % i == 0 }.count == 0 }`

2. determining how to square a number.  
  `{ |p| p * p }`

Furthermore, in the way the method identifies prime numbers in an array and squares all numbers in an array, it is hiding even more logic, which we'll see later.

For now, a simple refactor would be to extract identifying primes in an array and squaring numbers in an array:

```ruby
def squared_primes(numbers)
  primes = primes_in(numbers)
  square_all(primes)
end

def primes_in(numbers)
  numbers.find_all do |x|
    (2..x-1).select{ |i| x % i == 0 }.count == 0
  end
end

def square_all(numbers)
  numbers.map { |p| p * p }
end
```

And we can then make the code of `#squared_primes` even more concise:

```ruby
def squared_primes(numbers)
  square_all primes_in(numbers)
end

def primes_in(numbers)
  numbers.find_all do |x|
    (2..x-1).select { |i| x % i == 0 }.count == 0
  end
end

def square_all(numbers)
  numbers.map { |p| p * p }
end
```

The purpose of the `#squared_primes` method is now very clear.  With our well named methods, if anyone wonders what the `#squared_primes` method does, all they have to do is read the code:  given an array of numbers, the method will `square_all primes_in(numbers)`.

In addition to a method whose code is readable and whose purpose is clear, we've gained a couple of methods that might prove useful in the future.  There is a method for finding prime numbers in an array and another method that will square all numbers in an array.

However, our new methods are hiding logic of their own.

The `#square_all` method hides how to square a number within the block that it passes to `#map`.  We can extract squaring a number into its own method, giving us the possibility to square any number we want in the future—just pass the number to the `#square` method.

```ruby
def squared_primes(numbers)
  square_all primes_in(numbers)
end

def primes_in(numbers)
  numbers.find_all do |x|
    (2..x-1).select { |i| x % i == 0 }.count == 0
  end
end

def square_all(numbers)
  numbers.map { |p| square(p) }
end

def square(number)
  number * number
end
```

There is even more logic tucked away within the `#primes_in` method.  The block passed to the `#find_all` method identifies whether or not a number is prime.  We can move that to its own method.

```ruby
def squared_primes(numbers)
  square_all primes_in(numbers)
end

def primes_in(numbers)
  numbers.find_all { |number| is_prime?(number) }
end

def is_prime?(number)
  (2..number-1).select { |i| number % i == 0 }.count == 0
end

def square_all(numbers)
  numbers.map { |p| square(p) }
end

def square(number)
  number * number
end
```

Our new `#is_prime?` method can now be used any time we might need to determine whether or not an `Integer` is prime.  What is this method really doing?  If we look at the code, it's determining whether or not a number has factors other than 1 and itself.  Let's extract finding factors other than 1 and self into its own method.

```ruby
def squared_primes(numbers)
  square_all primes_in(numbers)
end

def primes_in(numbers)
  numbers.find_all { |number| is_prime?(number) }
end

def is_prime?(number)
  number > 1 && !has_factors_other_than_one_and_self?(number)
end

def has_factors_other_than_one_and_self?(number)
  (2..number-1).select { |divisor| number % divisor == 0 }.any?
end

def square_all(numbers)
  numbers.map { |p| square(p) }
end

def square(number)
  number * number
end
```

We've now described in the `#is_prime?` method what it means to be prime: (1) a number is greater than 1 and (2) it has no factors other than 1 and itself.  1 is not considered to be prime.  This logic around 1 was not present in the original method, but is being introduced here to be mathematically correct.

And, we have another method that we might reuse later:  `#has_factors_other_than_one_and_self?`.  This method can be broken down itself.  It's purpose is to identify whether the factors of a number includes any value other than 1 and the number itself.  Finding the factors is not its responsibility; that should belong in another method.

```ruby
def squared_primes(numbers)
  square_all primes_in(numbers)
end

def primes_in(numbers)
  numbers.find_all { |number| is_prime?(number) }
end

def is_prime?(number)
  number > 1 && !has_factors_other_than_one_and_self?(number)
end

def has_factors_other_than_one_and_self?(number)
  (factors(number) - [1, number]).any?
end

def factors(number)
  (1..number).select { |divisor| number % divisor == 0 }
end

def square_all(numbers)
  numbers.map { |p| square(p) }
end

def square(number)
  number * number
end
```

We now have a `#factors` method that will return the factors of any number.  As you might have guessed, there's more logic to be extracted from this new method.  There are two things.  First, the method identifies the possible factors of `number`:  `(1..number)`.  Second, in determining whether or not a possible factor is in deed a factor, the block tests whether `number` is evenly divisible by the possible factor.  Both of these can be extracted to their own methods.

```ruby
def squared_primes(numbers)
  square_all primes_in(numbers)
end

def primes_in(numbers)
  numbers.find_all { |number| is_prime?(number) }
end

def is_prime?(number)
  number > 1 && !has_factors_other_than_one_and_self?(number)
end

def has_factors_other_than_one_and_self?(number)
  (factors(number) - [1, number]).any?
end

def factors(number)
  possible_factors(number).select { |divisor| evenly_divisible?(number, divisor) }
end

def possible_factors(number)
  (1..number)
end

def evenly_divisible?(dividend, divisor)
  (dividend % divisor).zero?
end

def square_all(numbers)
  numbers.map { |p| square(p) }
end

def square(number)
  number * number
end
```
## Conclusion
At this point, we've taken a largely illegible method, refactored it to make it more readable, and piece-by-piece extracted out all the tiny bits of logic being done.  It might seem like a lot of extra work to take a working method and make changes that provide no immediate gains.

However, consider Wednesday's [prime factors challenge](../../../../../algorithm-drill-prime-factors-challenge).  What does that challenge entail?  Finding a numbers factors?  Determining whether or not a number is prime?  I can complete the prime factors challenge, relying largely on the individual methods extracted from the `#squared_primes` method to do the heavy lifting.

```ruby
def prime_factors(number)
  return Array.new unless number > 1

  first_prime_factor = primes_in(factors(number)).first
  [first_prime_factor] + prime_factors(number / first_prime_factor)
end
```

Code reuse in action.  This would not have been possible if the logic from the `#square_primes` method had been left tucked away inside that method.



