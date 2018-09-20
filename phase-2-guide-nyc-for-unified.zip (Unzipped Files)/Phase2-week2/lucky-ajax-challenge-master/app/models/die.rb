class Die
  DEFAULT_SIDES = 6

  attr_accessor :value, :sides

  def initialize(sides)
    if sides.nil? || sides <= 0
      @sides = DEFAULT_SIDES
    else
      @sides = sides
    end
  end

  def roll
    rand(1..sides)
  end
end
