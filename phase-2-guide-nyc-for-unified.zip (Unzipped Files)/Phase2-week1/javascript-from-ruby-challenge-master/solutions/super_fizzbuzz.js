/*
// begin:intro

FizzBuzz is a classic programming exercise.

The usual example asks the developer to write a program which prints out each number from 1 to 100.  But for multiples of 3 print 'Fizz' instead of the number and for multiples of 5 print 'Buzz'.  For numbers which are multiples of both 3 and 5 print 'FizzBuzz'.

This exercise has a little twist.  Write a method called `super_fizzbuzz` which takes as its input an `Array` of integers.

It should return a "fizzbuzzed" `Array`, i.e., the array is identical to the input with the following substitutions:

1. Multiples of `3` should be replaced with the string `"Fizz"`
2. Multiples of `5` should be replaced with the string `"Buzz"`
3. Multiples of `15` should be replaced with the string `"FizzBuzz"`

For example:

```ruby
super_fuzzbuzz([1,2,3])  # => [1, 2, "Fizz"]
super_fuzzbuzz([1,2,5])  # => [1, 2, "Buzz"]
super_fuzzbuzz([1,2,15]) # => [1, 2, "FizzBuzz"]

super_fizzbuzz([30, 9, 20, 1]) # => ["FizzBuzz", "Fizz", "Buzz", 1]
```

// end:intro

// begin:hint
// end:hint

// begin:initial_code
def super_fizzbuzz(array)
  # Your code goes here!
end
// end:initial_code

// begin:wrapper_code
// end:wrapper_code
*/

// begin:solution
def super_fizzbuzz(array)
  array.map do |i|
    if i % 15 == 0
      'FizzBuzz'
    elsif i % 3 == 0
      'Fizz'
    elsif i % 5 == 0
      'Buzz'
    else
      i
    end
  end
end
// end:solution

// begin:spec

// This returns an array of the given `size` containing random powers of `base`
// Since no power of 3 is ever a multiple of 5, this lets us create random arrays
// that contain multiples of 3 and no multiples of 5
def random_input_array(base, size)
  (1..size).map { |i| base**(1+rand(15)) }
end
 
describe "super_fizzbuzz" do
  it "returns 'Fizz' for multiples of 3" do
    super_fizzbuzz(random_input_array(3,100)).should eq ["Fizz"]*100
  end
 
  it "returns 'Buzz' for multiples of 5" do
    super_fizzbuzz(random_input_array(5,100)).should eq ["Buzz"]*100
  end
 
  it "returns 'FizzBuzz' for multiples of 15" do
    super_fizzbuzz(random_input_array(15, 100)).should eq ["FizzBuzz"]*100
  end
 
  it "works on [1,2,3]" do
    super_fizzbuzz([1,2,3]).should eq [1,2,'Fizz']
  end 

  it "works on [15, 5, 3, 1]" do
    super_fizzbuzz([15, 5, 3, 1]).should eq ['FizzBuzz', 'Buzz', 'Fizz', 1]
  end 
end
// end:spec
