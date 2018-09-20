# Data Drill: Working with Arrays

## Summary
In this challenge, we're going to continue exploring Ruby arrays.  We'll look at different options for creating arrays filled with data, generate some nested arrays filled with data, and then convert a nested array to a collection of hashes.  All of this is designed to get us more comfortable working with these data structures.

## Releases
### Release 0: Instantiating Arrays
```ruby
numbers = Array.new
# => []
20.times { numbers << rand(5) }
# => 20
numbers
# => [2, 3, 0, 1, 3, 4, 0, 1, 0, 1, 3, 4, 2, 4, 1, 3, 0, 3, 4, 2]
```
*Figure 1*. Building an array of 20 numbers.

When we work with arrays, we'll commonly create empty arrays and then add elements to them.  In Figure 1, for example, we create an empty array and then proceed to shovel twenty random numbers into it.

```ruby
Array.new(5)
# => [nil, nil, nil, nil, nil]
Array.new(3, :a)
# => [:a, :a, :a]
Array.new(20) { rand(5) }
# => [4, 4, 2, 1, 3, 4, 3, 0, 3, 0, 3, 4, 3, 1, 4, 3, 4, 3, 3, 2]
```
*Figure 2.* Instantiating arrays of different sizes containing different elements.

When we instantiate a new array, Ruby allows us to define some attributes of the array.  This allows us to create arrays of data more succinctly than was done in Figure 1.  If we choose, we can specify the size that our array should be.  And, we can also define what the value of each element should be—in fact, there are two different ways for doing this.  (See Figure 2.)


```ruby
Array.new(5, [1, 2, 3].sample)
# => [1, 1, 1, 1, 1]
Array.new(5) { [1, 2, 3].sample }
# => [2, 2, 3, 1, 3]
```
*Figure 3*. Creating arrays with five elements.

In Figure 3, we are generating arrays with five elements where each element is a one, two, or three.  We're using two different approaches.  Why are the outputs different?  In one approach, we pass the value we want for each element as the second argument to the `.new` method; in the other, we pass the value we want as a block.  What actually happens with each approach?

Record the answer in the file `instantiating_arrays.md`.


### Release 1: Generate a Populated Tic-tac-toe Board
```ruby
generate_tic_tac_toe
# => [["X", "O", "X"], ["O", "O", "X"], ["X", "X", "O"]]
generate_tic_tac_toe
# => [["O", "O", "X"], ["X", "X", "O"], ["O", "O", "X"]]
```
*Figure 4*. Generating populated tic-tac-toe boards.

In the [data-drill-nested-arrays-challenge][] we wrote methods that returned one specific nested array. In this release, we'll again write a method that returns a nested array, but in this case, we want to add an element of randomness.

We're going to write a method `generate_tic_tac_toe` that returns a nested array representing a [tic-tac-toe][] board.  The board should be populated with X's and O's.  We can decide how realistic to make the boards (e.g., four of one letter and five of the other, only one winner, etc.).  The only rule is that the board needs to be fully populated with X's and O's.

No tests have been provided for this method.  We'll need to write them ourselves.  Now, there is an element of randomness to our method; it returns a board populated with X's and O's, but we don't know their exact order.  So, we can't test for equality.  We can't say that our method will return an exact value.

Instead, we'll need to think about what we can know about the tic-tac-toe boards and how we can test for those characteristics.  For example, ...

- The board has three rows.
- Each row has three columns.
- Each letter on the board is either an X or an O.

*Note:*  Remember that RSpec is Ruby code.  We can write all the Ruby we need to in the `it` blocks.


### Release 2: Convert a Nested Array of Table Data to a Hash
```ruby
table_data = [
  ["first_name", "last_name", "city", "state"],
  ["Elisabeth", "Gardenar", "Toledo", "OH"],
  ["Jamaal", "Du", "Sylvania", "OH"],
  ["Kathlyn", "Lavoie", "Maumee", "OH"]
]

convert_table(table_data)
# => [
#  { "first_name" => "Elisabeth", "last_name" => "Gardenar", "city" => "Toledo", "state" => "OH" },
#  { "first_name" => "Jamaal", "last_name" => "Du", "city" => "Sylvania", "state" => "OH" },
#  { "first_name" => "Kathlyn", "last_name" => "Lavoie", "city" => "Maumee", "state" => "OH" }
# ]
```
*Figure 5*.  Converting table data to an array of hashes.

In this release we're going to convert a nested array into a collection of hashes.  In other words, we'll transform an array of arrays into an array of hashes.  Let's write a `convert_table` method that takes a nested array representing a data table and transforms each data row into a hash, using the table's header row data as keys (see Figure 5).

We'll need to test our method's behavior.  Given a nested array that holds table data, what does our method return?  There are a number of tests that we can write to confirm that our method is behaving as we expect.  Our code is not complete without tests.


### Release 3:  Stretch for Using RSpec's Built-in Matchers *(optional)*
*This release is optional.*

We wrote tests to verify that the methods we wrote in *Release 1* and *Release 2* work as expected.  In this stretch release, we'll refactor our tests to utilize RSpec's built-in matchers.  Read through the documentation on [RSpecs built-in matchers][built-in matchers] and refactor the tests to utilize them where appropriate.


### Release 4:  Stretch for Creating a Hash *(optional)*
*This release is optional.*

In *Release 2* we converted some table data represented as a nested array into an array of hashes.  How did we pair the table headers with each row's data?  How did we create the hashes?  Ruby provides a number of handy methods for working with and creating arrays and hashes.  For example, there's the `Hash::[]` class method which converts a properly formatted array into a hash.  Take some time to read through the [documentation][Hash Documentation] on this method.  Note that the array we pass to the method can actually be formatted in different ways. Which format seems most convenient, given the table-like structure that we're working with?  As always, we can test out the `Hash::[]` method in IRB to see how it behaves.

Refactor our code to take advantage of this and other methods that Ruby provides us.  


## Conclusion
This challenge has given us practice working with arrays and hashes.  These are two fundamental data structures with which we need to be familiar.  We need to know how to instantiate them, manipulate them, transform them, access their values, etc.  Before moving on, let's be sure that we've answered any questions that popped up in this challenge.


[built-in matchers]: http://www.relishapp.com/rspec/rspec-expectations/v/3-4/docs/built-in-matchers
[data-drill-nested-arrays-challenge]: ../../../data-drill-nested-arrays-challenge
[Hash Documentation]: http://ruby-doc.org/core-2.2.0/Hash.html#method-c-5B-5D
[tic-tac-toe]: https://en.wikipedia.org/wiki/Tic-tac-toe
