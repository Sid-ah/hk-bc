require_relative "../transform"

describe "exclamations" do
  it "returns a new array with each string in all caps and an exclamation mark added" do
    greetings = ["hi", "hello", "howdy"]

    loud_greetings = exclamations(greetings)
    expect(loud_greetings).to eq ["HI!", "HELLO!", "HOWDY!"]
  end

  it "does not modify the input array" do
    greetings = ["hi", "hello", "howdy"]
    exclamations(greetings)

    expect(greetings).to eq ["hi", "hello", "howdy"]
  end
end

describe "square_all" do
  it "returns a new array with the square of each number" do
    numbers = [2, 4, 6]

    squares = square_all(numbers)
    expect(squares).to eq [4, 16, 36]
  end

  it "does not modify the input array" do
    numbers = [2, 4, 6]
    square_all(numbers)

    expect(numbers).to eq [2, 4, 6]
  end
end

describe "first_letters" do
  it "returns a new array with the first letter of each word" do
    words = ["otters", "nighthawks", "bison"]

    letters = first_letters(words)
    expect(letters).to eq ["o", "n", "b"]
  end

  it "does not modify the input array" do
    words = ["otters", "nighthawks", "bison"]
    first_letters(words)
    expect(words).to eq ["otters", "nighthawks", "bison"]
  end
end
