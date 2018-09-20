class Die
 attr_reader :side_count

  def initialize(side_count = 6)
    @side_count = side_count
  end

  def roll
    # rand(n) will return a number from 0 to one less than n
    rand(side_count) + 1
  end
end
