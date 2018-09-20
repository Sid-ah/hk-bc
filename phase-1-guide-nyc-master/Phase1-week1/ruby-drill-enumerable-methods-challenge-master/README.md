# Ruby Drill: Enumerable Methods

## Summary
When programming we often work with collections of objects: an array of phone numbers, a list of names, a set of GPS coordinates, etc.

In working with collections, some tasks are very common.  For example, we often iterate over an array, doing something with each item.  For example, given an array of phone numbers, we might send a text message to each phone number (see Figure 1).

```ruby
def send_text(number, message)
  # Sends a text message to the number
end

phone_numbers = ["+14195558916", "+14195557849", "+14195559789"]

phone_numbers.each do |number|
  send_text(number, "You will do better in Toledo")
end
```
*Figure 1*.  Iterating over an array of phone numbers, passing each number to a method.


Iterating over an array is one common task when working with a collection.  What are some others?  We often need to pull one or more items out of the collection.  We might need to find a particular item like the phone number ending in 8916.  Or, we might want to select a subset of the items, like all the phone numbers from area code 419.


### Enumerable Methods
Working with collections is so common that Ruby and many other languages provide methods to make these tasks more convenient.  The generic iterating method is `#each`, which we use when we want to do something with every item in an array.  To use `#each`, we call the method on an array and pass a block that defines what we want to do for each item in the array.  Figure 1 is an example of using `#each`.

The `#each` method is a very powerful tool, and we can use it to accomplish just about anything when working with an array.  However, Ruby also provides methods built specifically for common tasks.  Some of these methods are defined in the [`Array`][ruby array] class itself.  Others are written in the [`Enumerable`][ruby enumerable] module.  Using these methods generally leads to more concise and more readable code.


## Releases
### Release 0:  Finding an Element in a Collection
As mentioned in the *Summary*, one common task when working with a collection is to find a particular item: find the phone number ending in 8916, find the job applicant with the id 353687559, etc ...  To help us perform the task of finding an item in a collection, Ruby's `Enumerable` module provides the [`#find`][ruby find] method, which we're going to use.  We can see examples of using `#find` in Figure 2.

```ruby
numbers = [1, 2, 4, 5, 3, 9]

numbers.find { |number| number > 4 }
# => 5
nubmers.find { |number| number.even? }
# => 2
```
*Figure 2*.  Finding an item in an array.

In the file `find.rb` we have a couple methods that find an element in an array.  The methods use `#each` to iterate.  Refactor the methods to use `#find` instead of `#each`.  Tests are provided in the file `spec/find_spec.rb`.  We can use these tests to ensure that we don't break our code while refactoring.  Run:

```
$ rspec spec/find_spec.rb
```


### Release 1:  Filtering a Collection
Sometimes we want to find one specific item in a collection.  At other times we want to find all the items that meet a condition.  Or, that do not meet a condition.  For example, we might want to find all the phone numbers from area code 419, find all the job applicants who've not completed the entire application, etc.

This is often referred to as filtering.  We create a filter that describes how we'll decide which elements were interested in.  Then we run each item in the collection through the filter.  Once we've gone through all of the items, we return a new collection containing the items that "passed through the filter".

[`#select`][ruby select] and [`#reject`][ruby reject] are two Ruby methods that help us to filter collections.  When using either of these methods, we set up our filter in the block passed to the method.  `#select` returns a new array containing the items for which the filter returned a truthy value.  `#reject` does the opposite.  It returns a new array containing the items for which the filter returned a falsey value.  See Figure 3 for examples.

```ruby
numbers = [1, 5, 3, 8, 2]

numbers.select { |number| number < 5 }
# => [1, 3, 2]
numbers.select { |number| number.even? }
# => [8, 2]
numbers.reject { |number| number.even? }
# => [1, 5, 3]
```
*Figure 3*. Filtering an array.

In the file `filter.rb` we have a few methods that filter an array.  The methods use `#each` to iterate.  Refactor the methods to use either `#select` or `#reject`.  Tests are provided in the file `spec/filter_spec.rb`.


### Release 2:  Transforming Items in a Collection
Another common task is transforming items into something based on the items.  If we have an array of phone numbers, we might want to transform each of the numbers into its area code.  If we have a list of social security numbers, we might want to transform each of them into its last four digits.

Ruby provides the [`#map`][ruby map] method to help with this task.  The method returns a new array.  The new array contains the transformed version of each of the original items.  The block passed to the method describes how to perform the transformation.  See Figure 4 for examples.

```ruby
numbers = [1, 4, 7, 3, 9]

numbers.map { |number| number ** 3 }
# => [1, 64, 343, 27, 729]
numbers.map { |number| number * -1 }
# => [-1, -4, -7, -3, -9]
numbers.map { |number| Math.sqrt(number) }
# => [1.0, 2.0, 2.6457513110645907, 1.7320508075688772, 3.0] 
```
*Figure 4*.  Mapping an array.

In the file `transform.rb` we have a few methods that transform items in an array.  The methods use `#each` to iterate.  Refactor the methods to use `#map`.  Tests are provided in the file `spec/transform_spec.rb`.


### Release 3:  Aggregating the Items in a Collection
The final task we'll explore is aggregating the items in a collection.  In other words, using the items to build an object or value.  If we had an array of prices, we could aggregate them into their total.  If we had an array of strings, we could aggregate them into one large string.  

One aggregating method that Ruby provides is [`#reduce`][ruby reduce].  There are different ways to call `#reduce`.  One way is to pass in the starting point for the object that will be built up.  So, if we're going to sum an array of numbers, we might pass in zero as the starting value.  This value is often referred to as the *memo*.  We also pass a block.  Our block will need to take two arguments.  When the block is run for each item in the collection, both the item and the memo are passed to the block.  See Figure 5 for examples.

```ruby
numbers = [1, 3, 6, 3, 9]

numbers.reduce(0) { |sum, number| sum + number }
# => 22
numbers.reduce(100) { |sum, number| sum + number }
# => 122
numbers.reduce("Digits: ") { |digits, number| digits + number.to_s }
#=> "Digits: 13639"
numbers.reduce(Hash.new(0)) do |counts, number|
  counts[number] += 1
  counts
end
# => { 1 => 1, 3 => 2, 6 => 1, 9 => 1 }
```
*Figure 5.*  Aggregating values in an array.

In the file `aggregate.rb` we have a few methods that aggregate the values in an array.  The methods use `#each` to iterate.  Refactor the methods to use `#reduce`.  Tests are provided in the file `spec/aggregate_spec.rb`.


### Release 4:  Refactor to Use Enumerable Methods
In the previous releases we've explored some common enumerable methods and have been led to use them while refactoring.  We're going to continue refactoring code to use these methods.  But, we'll have to figure out which method to use.

How do we figure out which method to use?  We'll have to read each of the methods we're refactoring to figure out what it's doing.  Once we understand the method, we should be able to see whether the method is filtering, transforming, or aggregating.  As we read the methods, we might see patterns in the code—patterns that indicate that the method is filtering, transforming, or aggregating.

The methods we'll refactor are in the file `working_with_enumerables.rb`.  The methods use `#each` to iterate.  Refactor the methods to use the enumerable methods we've explored in this challenge.  Tests are provided in the file `spec/working_with_enumerables_spec.rb`.


## Conclusion
We'll be working with enumerable objects like arrays throughout Dev Bootcamp.  Investing the time to familiarize ourselves with the methods in the `Enumerable` module will certainly pay dividends down the road.  If we're comfortable using the `#each` method, it will be easy for us to reach for it anytime we're working with a collection.  Sometimes it is appropriate to use `#each`, but as we're learning to work with collections we should read through the enumerable methods to see if maybe Ruby provides a more appropriate method.  With practice, using enumerable methods will become second nature.


[ruby array]: http://ruby-doc.org/core-2.2.0/Array.html
[ruby enumerable]: http://ruby-doc.org/core-2.2.0/Enumerable.html
[ruby find]: http://ruby-doc.org/core-2.2.0/Enumerable.html#method-i-find
[ruby map]: http://ruby-doc.org/core-2.2.0/Array.html#method-i-map
[ruby reduce]: http://ruby-doc.org/core-2.2.0/Enumerable.html#method-i-reduce
[ruby reject]: http://ruby-doc.org/core-2.2.0/Array.html#method-i-reject
[ruby select]: http://ruby-doc.org/core-2.2.0/Array.html#method-i-select

