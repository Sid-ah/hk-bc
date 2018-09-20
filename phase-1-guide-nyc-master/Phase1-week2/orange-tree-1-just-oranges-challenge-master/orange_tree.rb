class OrangeTree
  # Define a custom exception class
  class NoOrangesError < StandardError
  end

  def pass_growing_season
  end

  # Returns true if the tree is old enough to bear fruit (6), false otherwise
  def mature?
  end

  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def has_oranges?
  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  def pick_an_orange
    raise NoOrangesError, "This tree has no oranges" unless self.has_oranges?

    # orange-picking logic goes here
  end
end
