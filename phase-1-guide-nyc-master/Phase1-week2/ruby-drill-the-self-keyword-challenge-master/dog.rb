class Dog
  attr_reader :name, :breed

  def initialize(args)
    @name  = args[:name]
    @breed = args[:breed]
  end
end

# Add a behavior to the Dog class object itself
def Dog.create_multiple(data_for_multiple_dogs)
  data_for_multiple_dogs.map { |data_for_one_dog| Dog.new(data_for_one_dog) }
end
