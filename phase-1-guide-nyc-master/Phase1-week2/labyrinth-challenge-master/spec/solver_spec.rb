require_relative '../solver'

describe "Solver" do
  describe 'read_maze' do
    it 'should read a maze into a 2D (nested) array' do
      maze = read_maze("#{File.dirname(__FILE__)}/map_test.txt")
      maze_array = [['#','.','#'],
                    ['#','.','*'],
                    ['#','#','#']]
      expect(maze).to eq(maze_array)
    end
  end
end
