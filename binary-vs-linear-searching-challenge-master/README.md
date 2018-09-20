# Benchmarking Search Algorithms

## Summary
In this challenge, we'll be comparing the performance of different search algorithms.  We'll compare a linear search algorithm, a binary search algorithm, and the Ruby `Array.index` method.

The behaviors of these methods are the same.  Each of these methods looks through an array of elements to try to find one specific element.  If the element is found, the method returns the array index where the element was found.  The difference between them is in how the behavior is implemented (i.e., how do we look for the element).


## Releases
### Pre-release: Linear and Binary Search Methods
We'll be using the search algorithms that we wrote in the *[algorithm-drill-linear-search-challenge][]* and the *[algorithm-drill-binary-search-challenge][]*.  Copy each of these methods into the appropriate file.


### Release 0: Benchmark the Search Algorithms
We're going to use Ruby's [`Benchmark`][] module to chart the performance of our linear search method, our binary search method, and the `Array#index` method when searching through sorted arrays of different sizes (see [chart mockup][]).

```ruby
require 'benchmark'

ten_thousand_numbers = (1..10000).to_a

benchmark = Benchmark.measure do
  ten_thousand_numbers.each do |n|
    linear_search(n, ten_thousand_numbers)
  end
end

puts "Linear search: #{benchmark.total} seconds to find each element in a ten-thousand-element array."
```
*Figure 1*.  Code example for reporting how long it took a linear search method to find each element in an array of ten thousand elements.

The sorted arrays that we'll be working with are of size one, ten thousand, twenty thousand, and thirty thousand.  For each array, we'll measure how long it takes for each algorithm to search for each element in the array.  Figure 1 shows some example code for measuring the performance of a linear search method.

In the end, for each of our array sizes, we'll be able to answer how long it took each of the search methods to find each element in the array.  Then for good measure, for only the `binary_search` method, let's see how long it takes to find each element in an array of one million elements.


## Conclusion
We now have some data that showcase the performance of these different search algorithms.  What can we deduce from the numbers?  Is one always faster than the other?  When do the performance differences really become noticeable?  What are the advantages to one over the other?


[algorithm-drill-linear-search-challenge]: ../../../algorithm-drill-linear-search-challenge
[algorithm-drill-binary-search-challenge]: ../../../algorithm-drill-binary-search-challenge
[`Benchmark`]: http://ruby-doc.org/stdlib-2.2.0/libdoc/benchmark/rdoc/Benchmark.html
[chart mockup]: readme-assets/search-algorithm-chart.png
