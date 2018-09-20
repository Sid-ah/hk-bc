require_relative "../aggregate"

describe "sum" do
  it "sums the numbers" do
    numbers = [1, 1, 2, 3, 5]

    total = sum(numbers)
    expect(total).to eq 12
  end

  it "can be given a starting value" do
    numbers = [1, 1, 2, 3, 5]
    starting_value = 1000

    total = sum(numbers, starting_value)
    expect(total).to eq 1012
  end

  it "does not modify the input array" do
    numbers = [1, 1, 2, 3, 5]
    sum(numbers)

    expect(numbers).to eq [1, 1, 2, 3, 5]
  end
end

describe "hyphenate" do
  it "concatenates the strings with hyphens between the words" do
    words = ["what", "have", "you"]

    hyphenated_words = hyphenate(words)
    expect(hyphenated_words).to eq "what-have-you"
  end

  it "does not modify the input array" do
    words = ["what", "have", "you"]
    hyphenate(words)

    expect(words).to eq ["what", "have", "you"]
  end
end
