/*
// begin:intro
Write a method `smallest_integer` which takes as its input an `Array` of integers and returns the smallest integer in the `Array`.

For example:

```ruby
smallest_integer([1, 2, 3])       # => 1
smallest_integer([0, -10, 10])    # => -10
smallest_integer([-10, -20, -30]) # => -30
```

If the input `Array` is empty `smallest_integer` should return `nil`.
// end:intro

// begin:hint
// end:hint

// begin:initial_code
// smallest_integer is a method that takes an array of integers as its input
// and returns the smallest integer in the array
// 
// +array+ is an array of integers
// smallest_integer(array) should return the smallest integer in +array+
// 
// If +array+ is empty the method should return nil
def smallest_integer(array)
  # Your code goes here!
end
// end:initial_code

// begin:wrapper_code
// end:wrapper_code
*/

// begin:solution
def smallest_integer(array)
  smallest = nil
  
  array.each do |num|
    if smallest.nil? || num <= smallest
      smallest = num
    end
  end
  
  smallest
end
// end:solution

// begin:spec
describe 'smallest_integer' do
  it "returns nil when the array is empty ([])" do
    smallest_integer([]).should be_nil
  end

  it "returns 0 when that is the only element in the array" do
    smallest_integer([0]).should eq 0
  end

  it "returns -10 when that is the only element in the array" do
    smallest_integer([-10]).should eq -10
  end

  it "returns -10 for [-10, 0, 10]" do
    smallest_integer([-10, 0, 10]).should eq -10
  end
  
  it "returns 1 for [1, 2, 3]" do
    smallest_integer([1, 2, 3]).should eq 1
  end

  it "returns -30 for [-10, -20, -30]" do
    smallest_integer([-10, -20, -30]).should eq -30
  end

  it "returns the smallest positive integer regardless of ordering" do
    array = (1..100).to_a.shuffle

    smallest_integer(array).should eq 1
  end

  it "returns the smallest negative integer regardless of ordering" do
    array = (-100..-10).to_a.shuffle

    smallest_integer(array).should eq -100
  end  
end
// end:spec