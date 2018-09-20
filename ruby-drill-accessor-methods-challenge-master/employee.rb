class Employee

  def initialize(name, position, id)
    @name     = name
    @position = position
    @id       = id
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  def position
    @position
  end

  def position=(new_position)
    @position = new_position
  end

  def id
    @id
  end
end
