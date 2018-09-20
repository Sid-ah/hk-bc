# Implementing Enumerable Methods

## Summary
In this challenge, we're going to recreate the functionality of some of Ruby's more commonly used enumerable methods (`map`, `select`, etc).  These kinds of methods are powerful tools that can be found in many languages, not just Ruby.

Writing these enumerable methods ourselves will help us understand what's going on behind the scenes.  It will also give us practice writing methods that yield to blocks.

This challenge assumes that we're at least somewhat familiar with Ruby's `Enumerable` module, specifically `find`, `map`, `select` and `reject`.  Since we'll be re-creating these methods, you should be comfortable with what they're doing conceptually. If you're not, look at the documentation for them in the [Ruby Docs](http://ruby-doc.org/core-2.2.3/Enumerable.html) and read up. You might also open `irb` to test these methods and get a feel for how they work.

We'll also look at some examples of using these methods below, and there are accompanying tests in the `spec` folder to help guide you each step of the way.

### Blocks

To complete this challenge we'll be using blocks. Blocks are small chunks of code you can give a method to be run later. They can be declared with a `do/end`:

```ruby
do |element|
  element * 2
end
```

or with curly braces:

```ruby
{ |element| element + "!" }
```

You've probably already used blocks, but not by themselves. They usually work with a method.

```ruby
[1,2,3].map do |element|
  element * 2
end
```

```ruby
["hi", "hello", "hola"].map { |element| element + "!" }
```

As we can see, if we want to pass a block to a method we have to put the block right after the method call.

This challenge is all about exploring why blocks can be useful to us, and how we can use them.

#### Blocks in Enumerables
When we call enumerable methods, we generally pass a block.  The enumerable methods themselves are pretty generic and are made to be used in different circumstances.  For example, `Enumerable#select` will return a subset of a collection, including only the elements for which some condition is met.

Given a collection of numbers, we could use `#select` to get a new collection that includes only the odd numbers:

```ruby
[1,2,3].select { |number| number.odd? }
# => [1, 3]
```

But we could just as easily use the same method to only select strings in an array that begin with "a":

```ruby
["hello", "apple", "aardvark"].select { |word| word.start_with?("a") }
# => ["apple", "aardvark"]
```

In the examples above we passed a block, and `select` ran that block whenever it needed to decide if an element should be in the new array or not.

Behind the scenes, `select` ran our blocks using the keyword `yield`. As we write our versions of the enumerable methods, we'll want to understand more about how blocks are passed to methods and how the methods run those blocks.  These links might prove helpful if these concepts are new or a refresher is in order.

* [Methods can Implicitly Take a Block](http://www.skorks.com/2013/04/ruby-ampersand-parameter-demystified/#theimplicitblock)
* [Blocks and Yield in Ruby](http://stackoverflow.com/questions/3066703/blocks-and-yields-in-ruby)
* [The Building Blocks of Ruby](http://yehudakatz.com/2010/02/07/the-building-blocks-of-ruby/)


### Restrictions:  Do Not Use Most Array and Enumerable Methods
In this challenge, we're not going to utilize much of Ruby's built-in array functionality. When we're using an array, we're only going to use `Array#[]` and `Array#length`. When we need to loop through the array we might consider `loop` or  `while`.

```ruby
numbers = [1, 6, 3, 7, 9]
# => [1, 6, 3, 7, 9]
numbers[2]
# => 3
numbers.length
# => 5
```

## Releases

### Pre-release:  The Code Base
In the file `enumerating_methods.rb`, we'll find an example implementation for an `each` method that demonstrate the use of yield—don't hesitate to refer back to the links on yield listed in the *Summary* if anything is unclear or we get stuck.  Tests are also provided for the `each` method and each of the additional methods we'll write.  Read through the tests.  For each release, ensure that we can describe the behavior of the method before writing the code.

### Release 0: Implement find
We'll work through the enumerable behaviors one at a time, beginning with searching for a single element in a collection.  We are going to mimic the behavior of Ruby's [`Enumerable#find`](http://ruby-doc.org/core-2.0.0/Enumerable.html#method-i-find) method.  What does the Ruby method do?  We'll want to mimic that behavior in our own method:

```ruby
numbers = [4, 5, 6]
# => [4, 5, 6]
find(numbers) { |n| n > 4 }
# => 5
```

Tests for the behavior of the `find` method have been written. These tests are organized within an example group with the description `"find"` (look at the second `describe` in  `spec/enumerating_methods_spec.rb`).  We can run _just_ these tests by specifying the name of the example group when running RSpec:

```
$ rspec --example "find"
```

### Release 1: Implement map
```ruby
greetings = ["hi", "hello", "how are you"]
# => ["hi", "hello", "how are you"]
map(greetings) { |greeting| greeting.upcase + "!" }
# => ["HI!", "HELLO!", "HOW ARE YOU!"]
```

Tests for the behavior of the `map` method have been written to mimic the behavior of Ruby's [`Enumerable#map`](http://ruby-doc.org/core-2.0.0/Enumerable.html#method-i-map).


### Release 2: Implement select
```ruby
numbers = [4, 5, 6]
# => [4, 5, 6]
select(numbers) { |n| n < 6 }
# => [4, 5]
```

Tests for the behavior of the `select` method have been written to mimic the behavior of Ruby's [`Enumerable#select`](http://ruby-doc.org/core-2.0.0/Enumerable.html#method-i-select).


### Release 3: Implement reject
```ruby
numbers = [4, 5, 6]
# => [4, 5, 6]
reject(numbers) { |n| n < 5 }
# => [5, 6]
```

Tests for the behavior of the `reject` method have been written to mimic the behavior of Ruby's [`Enumerable#reject`](http://ruby-doc.org/core-2.0.0/Enumerable.html#method-i-reject).

## Conclusion

We've worked through writing homemade versions of just a sample of Ruby's enumerable methods, and we should understand what each of them does. `#find`, `#select`, `#reject` and `#map` are methods we'll use very regularly, and we need to know them inside and out.  Before moving on to the next challenge, make sure we understand the methods covered in this challenge (ask an instructor if you need help).

If you're hungry for more, try working on the stretches below.

## Stretches
### Stretch: Implement all?
```ruby
numbers = [4, 5, 6]
# => [4, 5, 6]
all?(numbers) { |n| n < 6 }
# => false
all?(numbers) { |n| n < 7 }
# => true
```

Tests for the behavior of the `all?` method have been written to mimic the behavior of Ruby's [`Enumerable#all?`](http://ruby-doc.org/core-2.0.0/Enumerable.html#method-i-all-3F).


### Stretch: Implement reduce
```ruby
numbers = [4, 5, 6]
# => [4, 5, 6]
reduce(numbers) { |aggregate, n| aggregate + n }
# => 15
```

Tests for the behavior of the `reduce` method have been written to mimic the behavior of Ruby's [`Enumerable#reduce`](http://ruby-doc.org/core-2.0.0/Enumerable.html#method-i-reduce).  The Ruby method can be called in four different ways with different combinations of arguments. Our method will only be callable one way; remember we want to understand the basic concept of what it means to reduce a collection.
