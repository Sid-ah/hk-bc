require_relative 'benchmark'


long_string = "abcde" * 5000000

reverse_run_time = benchmark { long_string.reverse }
puts "The #reverse method took #{reverse_run_time} seconds to run."

upcase_run_time = benchmark { long_string.upcase }
puts "The #upcase method took #{upcase_run_time} seconds to run."
