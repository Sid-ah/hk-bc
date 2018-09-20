require_relative 'binary_search'
require_relative 'linear_search'

require 'benchmark'

# Define number sets to search through
one_number = [1]
ten_thousand_numbers = (1..10000).to_a
twenty_thousand_numbers = (1..20000).to_a
thirty_thousand_numbers = (1..30000).to_a
