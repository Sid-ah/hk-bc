require_relative 'anagram'

def get_word_from_user
  gets.strip
end

# Get words from the user.
puts "Input two words, and we'll tell you if the words are anagrams."

puts "What is the first word?"
first_word = Anagram.new(get_word_from_user)

puts "What is the second word?"
second_word = Anagram.new(get_word_from_user)


# Display result.
if first_word.anagram_of?(second_word)
  puts "\nYes, '#{first_word.word}' and '#{second_word.word}' are anagrams.\n"
else
  puts "\nNo, '#{first_word.word}' and '#{second_word.word}' are not anagrams.\n"
end
