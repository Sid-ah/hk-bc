require_relative 'most_frequent_words'


file_path = 'text-files/osiris_myth.txt'
desired_number_of_words = 10

words = most_frequent_words(file_path, desired_number_of_words)

puts "The #{desired_number_of_words} most frequent words in '#{file_path}':"
