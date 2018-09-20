require_relative 'sudoku'

# The sudoku puzzles that your program will solve can be found
# in the sudoku_puzzles.txt file.
#
# Currently, Line 18 defines the variable board_string to equal
# the first puzzle (i.e., the first line in the .txt file).
# After your program can solve this first puzzle, edit
# the code below, so that the program tries to solve
# all of the puzzles.
#
# Remember, the file has newline characters at the end of each line,
# so we call String#chomp to remove them.

board_string = File.readlines('sudoku_puzzles.txt').first.chomp

solved_board = solve(board_string)
if solved?(solved_board)
  puts "The board was solved!"
  puts pretty_board(solved_board)
else
  puts "The board wasn't solved :("
end
