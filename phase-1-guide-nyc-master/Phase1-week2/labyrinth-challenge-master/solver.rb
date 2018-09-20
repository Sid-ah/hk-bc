#This method reads a file into a 2D array. See `spec/solver_spec.rb`
def read_maze(file)
  maze = []
  File.open(file).each do |file_row|
    maze << file_row.chomp.split('')
  end
  maze
end
