# Rational Numbers:  Operators as Methods


## Summary
Ruby provides us with different classes for representing numbers.  `Integer` and `Float`, for example.  In this challenge, we're going to build our own class to represent [rational numbers][wikipedia rational numbers].  To do so, we'll need to understand how to add, subtract, etc. rational numbers.  But, in doing so, we're also going to learn how to implement operators like `+`, `-`, and `==` in our custom classes.


### Rational Numbers
A rational number is any number which can be expressed as a fraction with integers for the numerator and denominator.  For example, `3` is a rational number because it can be expressed as `3/1`, and `1.25` is rational because it can be expressed as `5/4`.  [Maths is Fun][maths is fun rational numbers] and [Khan Academy][khan academy rational numbers] each provide an introduction to rational numbers.  The wikipedia article on rational numbers will provide a description of [how to perform arithmetic with rational numbers][wikipedia rational numbers arithmetic].


### Operators as Methods
Ruby is designed to be programmer friendly.  It provides *syntactic sugar* to improve the experience of writing code:  Ruby provides some programmer-friendly alternative syntax in certain situations.  The friendlier syntax might feel more natural or be more readable.  We've been taking advantage of Ruby's syntactic sugar, but perhaps we haven't recognized it.  For example, when we work with numbers we rarely use the standard Ruby method-calling syntax; the sugary syntax is friendlier (see Figure 2).

```ruby
# Syntactic Sugar                #  Standard Ruby Syntax
                                 #
1 + 2                            #  1.+(2)
2 ** 3                           #  2.**(3)
4 == 4                           #  4.==(4)
```
*Figure 2*.  Syntactic sugar for `Fixnum` methods.


When we use Ruby's operators like `+`, `-`, `>`, `==`, etc. the syntax often hides the fact that [many of them are actually methods][programming ruby operator expressions].  And, because these operators are methods, each class can define its own operators.  For example, the classes `Fixnum`, `String`, `Array`, and others implement their own versions of these operators (see Figure 3).  We can define these operator methods in our own custom classes, too, which is what we'll be doing in this challenge.

```ruby
# Syntactic Sugar                #  Standard Ruby Syntax
                                 #
1 + 2                            #  1.+(2)
"add " + "strings"               #  "add ".+("strings")
[:a, :b] + [:c, :d]              #  [:a, :b].+([:c, :d])
                                 #
1 == 2                           #  1.==(2)
"compare" == "strings"           #  "compare".==("strings")
[:a, :b] == [:c, :d]             #  [:a, :b].==([:c, :d])
```
*Figure 3*.  Calling operator methods with the same name on different types of object.


## Releases
### Release 0: Write Down the Rules of Rational Arithmetic
We're going to develop a `RationalNumber` class with behaviors like addition (`+`), subtraction (`-`), etc.  A couple behaviors have been written and tested for us (e.g., calculating a reciprocal.).  Empty method definitions have been written for the methods we need to develop.

We're going to implement the following operations:

1. Addition
2. Subtraction
3. Multiplication
4. Division
5. Equality
6. Exponentiation
7. Inversion / negation
8. Reciprocation (*completed*)

Read the Wikipedia page on the [arithmetic of rational numbers][wikipedia rational numbers arithmetic]; some additional information is provided as comments in the file `rational_number.rb`.  Ensure that we understand how to make each of the calculations.  Use pen and paper to demonstrate that we can make each of them (e.g., add two rational numbers).  Then translate the calculations to pseudocode.  If we need help on any of the math, just ask!


### Release 1: Develop the `RationalNumber` Class
We have some empty method definitions in the provided `RationalNumber` class.  Now that we know how to make each of the calculations, for each of the empty methods we can write tests and then complete the method definition.  Where a method accepts an argument, assume the input is another instance of our `RationalNumber` class (except with exponentiation where an integer is expected).

*Note:*  Ruby has a built-in `Rational` class; don't use it.


## Conclusion
It's important to understand that many of Ruby's operators are methods and that each class can have its own implementation.  As we use different libraries and gems, some of them will define their own operators.  For example, we've seen Ruby's `CSV` library, which defines a shovel operator, [`<<`][csv shovel documentation], for writing to a file.  Later at Dev Bootcamp, we'll work with BCrypt and a custom equality operator, [`==`][bcrypt password equality operator].

When we write our own custom operator methods, we want to be mindful of following conventions.  Developers will have general expectations for how a `+`, `-`, `<<`, or `==` will behave, and we don't want to surprise them with unexpected behaviors.


[bcrypt password equality operator]: https://github.com/codahale/bcrypt-ruby/blob/master/lib/bcrypt/password.rb#L65
[csv shovel documentation]: http://ruby-doc.org/stdlib-2.1.0/libdoc/csv/rdoc/CSV.html#method-i-3C-3C
[khan academy rational numbers]: https://www.khanacademy.org/math/pre-algebra/order-of-operations/rational-irrational-numbers/v/introduction-to-rational-and-irrational-numbers
[maths is fun rational numbers]: http://www.mathsisfun.com/rational-numbers.html
[programming ruby operator expressions]: http://phrogz.net/ProgrammingRuby/frameset.html?content=http%3A//phrogz.net/ProgrammingRuby/language.html%23operatorexpressions
[wikipedia rational numbers]: http://en.wikipedia.org/wiki/Rational_number
[wikipedia rational numbers arithmetic]: https://en.wikipedia.org/wiki/Rational_number#Arithmetic

