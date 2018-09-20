/*
// begin:intro
Write a method `shortest_string` which takes as its input an `Array` of `Strings` and returns the shortest `String` in the `Array`.

For example:

```ruby
// 'cat' is 3 characters long
shortest_string(['cat', 'zzzzzzz', 'apples'])  # => "cat"

// '' is 0 characters long, but it's the only string
shortest_string(['']) # => ''

shortest_string([]) # => nil
```

If the input `Array` is empty `shortest_string` should return `nil`.
// end:intro

// begin:hint
// end:hint

// begin:initial_code
// shortest_string is a method that takes an array of strings as its input
// and returns the shortest string
// 
// +array+ is an array of strings
// shortest_string(array) should return the shortest string in +array+
// 
// If +array+ is empty the method should return nil
def shortest_string(array)
  # Your code goes here!
end
// end:initial_code

// begin:wrapper_code
// end:wrapper_code
*/

// begin:solution
def shortest_string(array)
  shortest = nil

  array.each do |string|
    if shortest.nil? || string.length <= shortest.length
      shortest = string
    end
  end
  
  shortest
end
// end:solution

// begin:spec
describe 'shortest_string' do
  it "returns nil when the array is empty ([])" do
    shortest_string([]).should be_nil
  end

  it "returns '' when that is the only element in the array" do
    shortest_string(['']).should eq ''
  end

  it "returns 'cat' when that is the only element in the array" do
    shortest_string(['cat']).should eq 'cat'
  end
  
  it "returns the 'zzzzzzz' with the example array" do
    shortest_string(['cat', 'zzzzzzz', 'apples']).should eq 'cat'
  end

  it "returns the shortest string regardless of ordering" do
    # This creates an array containing ['a', 'aa', ...]
    # up to 10 characters long, but randomly ordered
    array = Array.new(10) { |i| 'a' * (i + 1) }.shuffle

    shortest_string(array).should eq 'a'
  end
end
// end:spec