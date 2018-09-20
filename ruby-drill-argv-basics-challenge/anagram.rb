class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def canonical_form
    @canonical_form ||= alphabetize_letters
  end

  def anagram_of?(possible_anagram)
    self.canonical_form == possible_anagram.canonical_form
  end

  private
  def alphabetize_letters
    word.split("").sort.join
  end
end
