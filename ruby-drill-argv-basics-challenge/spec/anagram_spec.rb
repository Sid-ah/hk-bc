require_relative "../anagram"

describe Anagram do
  let(:subject) { Anagram.new("ocean") }

  it "has word" do
    expect(subject.word).to eq "ocean"
  end

  describe "canonical form" do
    it "the letters in the word are sorted alphabetically" do
      expect(subject.canonical_form).to eq "aceno"
    end
  end

  describe "identifying an anagram" do
    it "returns true if canonical forms are equal" do
      possible_anagram = Anagram.new("canoe")
      expect(subject.anagram_of?(possible_anagram)).to be true
    end

    it "returns false if canonical forms are unequal" do
      possible_anagram = Anagram.new("shoe")
      expect(subject.anagram_of?(possible_anagram)).to be false
    end
  end
end
