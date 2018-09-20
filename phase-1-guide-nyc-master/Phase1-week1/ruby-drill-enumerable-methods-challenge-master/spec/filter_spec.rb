require_relative "../filter"

describe "odd_integers" do
  it "returns a new collection with any odd integers" do
    numbers = [3, 4, 7, 9, 10, 16]

    odds = odd_integers(numbers)
    expect(odds).to match_array [3, 7, 9]
  end

  it "does not modify the input array" do
    numbers = [1, 2]
    odd_integers(numbers)

    expect(numbers).to eq [1, 2]
  end
end

describe "long_strings" do
  it "returns a new collection with any strings with a minimum length" do
    fruit = ["apple", "pear", "orange", "peach", "kiwi"]
    minimum_length = 5

    expect(long_strings(fruit, minimum_length)).to match_array ["apple", "orange", "peach"]
  end

  it "does not modify the input array" do
    fruit = ["apple", "pear"]
    long_strings(fruit, 5)

    expect(fruit).to eq fruit
  end
end

describe "multiples_of" do
  it "returns a new collection with any multiples of a given number" do
    possible_multiples = [3, 6, 7, 8, 9, 20, 21]
    number  = 3

    multiples = multiples_of(possible_multiples, number)
    expect(multiples).to match_array [3, 6, 9, 21]
  end

  it "does not modify the input array" do
    possible_multiples = [3, 6]
    number  = 2
    multiples_of(possible_multiples, number)

    expect(possible_multiples).to eq [3, 6]
  end
end
