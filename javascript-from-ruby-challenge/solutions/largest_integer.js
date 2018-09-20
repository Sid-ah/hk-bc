/*
// begin:intro
Write a method `largest_integer` which takes as its input an `Array` of integers and returns the largest integer in the `Array`.

For example:

```ruby
largest_integer([-10, 0, 10])    # => 10
largest_integer([-10, -20, -30]) # => -10
```

If the input `Array` is empty `largest_integer` should return `nil`.
// end:intro

// begin:hint
// end:hint

// begin:initial_code
// largest_integer is a method that takes an array of integers as its input
// and returns the largest integer in the array
// 
// +array+ is an array of integers
// largest_integer(array) should return the largest integer in +array+
// 
// If +array+ is empty the method should return nil
def largest_integer(array)
  # Your code goes here!
end
// end:initial_code

// begin:wrapper_code
// end:wrapper_code
*/

// begin:solution
def largest_integer(array)
  largest = nil
  
  array.each do |num|
    if largest.nil? || num >= largest
      largest = num
    end
  end
  
  largest
end
// end:solution

// begin:spec
describe 'largest_integer' do
  it "returns nil when the array is empty ([])" do
    largest_integer([]).should be_nil
  end

  it "returns 0 when that is the only element in the array" do
    largest_integer([0]).should eq 0
  end

  it "returns -10 when that is the only element in the array" do
    largest_integer([-10]).should eq -10
  end

  it "returns 10 for [-10, 0, 10]" do
    largest_integer([-10, 0, 10]).should eq 10
  end
  
  it "returns 3 for [1, 2, 3]" do
    largest_integer([1, 2, 3]).should eq 3
  end

  it "returns -10 for [-10, -20, -30]" do
    largest_integer([-10, -20, -30]).should eq -10
  end

  it "returns the largest positive integer regardless of ordering" do
    array = (1..100).to_a.shuffle

    largest_integer(array).should eq 100
  end

  it "returns the largest negative integer regardless of ordering" do
    array = (-100..-10).to_a.shuffle

    largest_integer(array).should eq -10
  end  
end
// end:spec