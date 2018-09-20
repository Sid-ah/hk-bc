class Orange
  attr_reader :diameter

  def initialize
    @diameter = random_diameter
  end

  private
  def random_diameter
    [2.5, 2.6, 2.7, 2.8, 2.9, 3.0, 3.1, 3.2].sample
  end
end
