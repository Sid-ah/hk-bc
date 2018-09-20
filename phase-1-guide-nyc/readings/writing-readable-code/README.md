# Writing Readable Code
Written by [Torey Hickman](https://github.com/toreyhickman).


## Introduction
When you write code, you have two audiences:  the computer and people.

The computer will parse and execute your code, and so your code needs to follow certain guidelines.  For example, when you define a method, you begin with `def` and close with `end`.  If you don't follow that pattern, the computer won't be able to execute the code.  If you try to run code with improper syntax, you get an error:

```
example.rb:4: syntax error, unexpected end-of-input, expecting keyword_end
```

As long as the syntax is correct, your code will run.  The computer doesn't care what you name variables or methods, how many methods you chain together, or anything else.

However, people do care.  The "Ruby way" is to write code that is easily understandable for programmers who might encounter your code:  your pair, a teammate, a programmer who picks up your code base in the future, even your future self.

## Readable Code Best Practices

### Style
There is a [Ruby Style Guide](https://github.com/styleguide/ruby) on GitHub that describes how your code should be written.  It includes guidelines on indentation and white space, delimiting blocks with `{...}` or `do ... end`, naming, etc.  Familiarize yourself with these guidelies and apply them to your code.

Pay particular attention to indentation.  Indentation will make your code much easier to read:  what lines belong to which methods, when does an `if` statement end, which lines are with a block, etc.  If code is not indented properly, it's much more difficult for a human to parse (i.e., read).

### Variable and Method Naming
Names should be descriptive.  A variable name should inform readers of the value assigned to the variable.  Methods should be named the same way:  inform readers what the method does ... or at least what it returns.

Variables with names like `x` might make sense in the moment you're writing code, but a few days later, you might have to ask yourself, "Now, what was 'x'?"  And, someone unfamiliar with your code would have no clue.  In addition, variable names like `string` or `array` pass on information about the type of object assigned to the variable, but not what the object represents.

```ruby
# poor naming choices
require 'prime'

def p_factors(x)
  return [x] if x.prime?

  pf = p_factor(x)
  n = x / pf

  [pf] + p_factors(n)
end

def p_factor(x)
  pos_factors(x).find { |p| p.prime? && x % p == 0 }
end

def pos_factors(x)
  (2..(x / 2))
end


# better naming choices
require 'prime'

def prime_factors(number)
  return [number] if number.prime?

  prime_factor = find_prime_factor_of(number)
  next_number_to_check = number / prime_factor

  [prime_factor] + prime_factors(next_number_to_check)
end

def find_prime_factor_of(number)
  possible_factors_of(number).find do |possibility|
    possibility.prime? && number % possibility == 0
  end
end

def possible_factors_of(number)
  (2..(number / 2))
end
```

### Method Chaining
Chaining method calls together can make code more concise and readable:

```ruby
def doubled_evens(numbers)
  numbers.select(&:even?).map { |number| number * 2 }
end

my_numbers = [1, 2, 3, 4]

doubled_event(my_numbers)
# => [4, 8]
```

In the code above, the body of the `doubled_evens` method shows an example of method chaining.  Notice that the data type does not change.  The method accepts an array argument and calls `#select` on that array, returning another array.  `#map` is called on this returned array, returning yet another array.

Be wary of hiding a change of data type (e.g., array to string) within a chain of method calls.

Also, remember that you are attempting to write readable code.  Less lines of code is generally a good thing, but not if it makes the code harder to understand. The computer will chain a dozen method calls without a problem, but it will be difficult for a person to read.
