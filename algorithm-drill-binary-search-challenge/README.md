# Algorithm Drill: Binary Search

## Summary
In a [previous challenge][algorithm-drill-linear-search-challenge] we wrote a linear search algorithm to implement search behavior that mimicked the behavior of Ruby's [`Array#index`][rubydocs Array#index] method.  In this challenge, we're going to implement the same behavior using a different type of algorithm:  [binary search][wikipedia binary search].

### Linear Search

In a linear search we looked at one item at a time. The bigger the array, the more comparisons our program needed to make as it searched for what it was looking for. Another way of saying this is that the relationship between the size of the array and the number of operations your program has to make is _linear_ since they increase in lock step.

Linear searches are very useful and very simple, but imagine an array with a million elements. In the worst case scenario, you might be searching for the item at the end of that long array. A linear search will need to make 999,999 checks before it finally gets to that last item!

Could there be a better way?

### More Efficient Searching

To make things interesting, let's consider searching through a large list of items that's already sorted. Dictionaries are a great example of a sorted data set. We could have thousands of words in a single dictionary, all sorted alphabetically. If you had to look up a word in a dictionary, how would you do it?

If you were a linear search you would start on page 1 in the "A's" and work your way forward until you found your result. In practice, though, we never do that.

A more common approach is to flip the dictionary open somewhere in the middle and figure out if we need to then continue searching left or right. If we're looking for the word "Golden" and the page we open to has the word "Lettuce" we know we need to head left because "G" comes before "L".

If we're searching to the left then we will ignore the right half of the dictionary and split the left half somewhere in the middle. This time we might land in the "F's" meaning we need to search right. If we keep this up we'll eventually find our word, or find that it isn't in the dictionary at all.

Reflect on what's happening here. How does this approach stack up against the linear search? Which would be faster? If the linear search's relationship to the size of the array is linear, is the same true of our approach?

### Binary Search

The dictionary search strategy we're describing above is really a _binary search_. It's "binary" because every time you open the dictionary and decide to go left or right you have a _binary choice_. That binary choice means our "search space" reduces by half with every step. This is in stark contrast to the one-at-a-time approach that linear search offers us.

If you we were to describe our binary search approach in pseudocode, it might look like this:

 1. Pick a point in the middle
 1. Compare what we find in the middle to what we're searching for
 1. If we found what we're looking for, we're done!
 1. If we didn't find what we're looking for, pick the left or right half to keep searching
 1. Apply the same process to our new half

Here's an animation of us doing just that to a list of sorted numbers:

![binary search animation](readme-assets/binary-search.gif)

*Figure 1*. Searching an ordered set of data using a binary search algorithm.

It can look daunting, but try to match your newfound understanding of binary search against the [wikipedia page][wikipedia binary search]. Note: the pseucode they offer on that page is iterative, but ours will be recursive.

### Hidden Complexity
On the surface, writing a binary search algorithm might seem simple, but it's very common to find bugs in a binary search algorithm. In the book *[Programming Pearls]*, Jon Bentley wrote that given two hours, 90% of professional programmers were unable to write a proper implementation of binary search.  Donald Knuth, in *[The Art of Computer Programming]*, wrote that though the first binary search was published in 1946, the first bug-free binary search wasn’t published until 1962.  Taking a test-driven development approach can help us avoid introducing bugs into our algorithm.

Go slow, and dont be afraid to `puts` everything! When doing detailed-oriented work like this it's important to be methodical in your approach. Printing out variables in your program is a way of checking what _you_ think the code is doing against what's actually happening on the computer.

### Restrictions

Our solution needs to be recursive. Binary search is a classic recursive algorithm, and offers good practice.

We also need to complete this challenge without relying on Ruby's built in `Array` and `Enumerable` methods.  The only methods we may call on the array we're searching are `Array#[]` and `Array#length`.

## Releases
### Release 0: Implementing a binary search

Now let's implement our `binary_search` method. This method should search through an array for an item and return the index of where the item was found, or `nil` if the item isn't in the array.

For example, if we're looking for `:G` in the array `[:A, :B, :C, :D, :E, :F, :G, :H]`, our method should return 6. If we look for `:X` it should return `nil`. Your method can assume that any array it receives is already sorted.

Don't dive in right away, do some upfront planning and pseudocoding. Remember our original plan:

 1. Pick a point in the middle
 1. Compare what we find in the middle to what we're searching for
 1. If we found what we're looking for, we're done!
 1. If we didn't find what we're looking for, pick the left or right half to keep searching
 1. Apply the same process to our new half

Of course it won't be enough to find the item, you'll need to figure out how to return the index of that item too. Take it one step at a time.

#### Testing is important
No tests have been written for us.  We'll need to write them ourselves to determine whether or not our method is behaving as we expect.  We can try to minimize the chance of introducing bugs into our binary search algorithm by taking a test-driven approach.  We can start simple and gradually add complexity.  Does our method work when the array we're searching is empty?  What if there is one element in the array, two elements, etc.?  Are there other edge cases that we should test for?

### Release 1: Refactor
Before we conclude this challenge, let's read through our code to see if we might be able to improve it.  Have we followed the [Ruby style guide] (e.g., spacing and indentation)?  Could our variable names be more descriptive?  Are there any code smells that we can eliminate?  For example, are there any methods we could extract from our `binary_search` method?

Having a solid test suite will help us as we refactor.  Remember:  [red, green, refactor].  We should only refactor when our tests are all passing.  As we refactor, they should continue to pass.  This will inform us when our refactoring breaks functioning code.

## Conclusion
Like linear search, binary search is another common search algorithm and one that we should be familiar with.  Assuming we're searching an ordered data set, a binary search will be more efficient than a linear search method — particularly as the size of the data set grows.

Familiarity with binary search might even help us if we end up playing the [Clock Game][price is right clock game videos] on *The Price is Right*.


[algorithm-drill-linear-search-challenge]: ../../../algorithm-drill-linear-search-challenge
[price is right clock game videos]: https://www.google.com/webhp?&tbm=vid#tbm=vid&q=the+price+is+right+clock+game
[Programming Pearls]: http://www.amazon.com/Programming-Pearls-Press-Louis-Bentley/dp/0201103311/
[red, green, refactor]: http://www.jamesshore.com/Blog/Red-Green-Refactor.html
[rubydocs Array#index]: http://ruby-doc.org/core-2.1.0/Array.html#method-i-index
[Ruby style guide]: https://github.com/bbatsov/ruby-style-guide
[The Art of Computer Programming]: http://www.amazon.com/Computer-Programming-Volumes-1-4A-Boxed/dp/0321751043/
[wikipedia binary search]: http://en.wikipedia.org/wiki/Binary_search_algorithm
