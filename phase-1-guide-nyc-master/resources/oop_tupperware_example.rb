class Tupperware
  # dimensions in inches
  attr_reader :length, :width, :height, :contents
  attr_accessor :label

  def initialize(length, width, height, label='')
    @length = length
    @width = width
    @height = height
    @label = label
    @lid_on = true
    @contents = []
  end

  def self.standard_food_box(label)
    box = Tupperware.new(10, 14, 4, label)
    box.open!
    box.add_item(Thing.new("Subway"))
    box.add_item(Thing.new("Lobster"))
    box.close!
    box
  end

  def volume
    length * width * height
  end

  def surface_area
    2 * (length * width + height * width + length * height)
  end

  def weight # in pounds
    # TODO: implement different weights
    0.01 * surface_area + weight_of_contents
  end

  def weight_of_contents
    contents.map { |thing| thing.weight }.reduce(:+) || 0.0
  end

  def open?
    !@lid_on
  end

  def open!
    raise ArgumentError if open?
    @lid_on = false
  end

  def close!
    raise ArgumentError unless open?
    @lid_on = true
  end

  def add_item(thing)
    raise ArgumentError unless open?
    contents << thing
  end

  def remove_item(thing)
    raise ArgumentError unless open?
    raise "sorry we have no #{thing}" unless contents.include?(thing)
    contents.delete(thing)
  end

  def shake!
    puts "RATTLE!"
    contents.each { |thing| thing.shake! }
  end

end

class Thing
  def initialize(value)
    @value = value
  end

  def weight
    1
  end

  def shake!
    puts "BONK!"
  end
end

food_box = Tupperware.new(10, 14, 4)
puts "Length is: #{food_box.length}"
puts "Volume is: #{food_box.volume}"
puts "Surface area is: #{food_box.surface_area}"
puts "Weight is: #{food_box.weight}"
food_box.open!
puts "Food box lid is open: #{food_box.open?}"
begin
  puts "Trying to open box again."
  food_box.open!
rescue ArgumentError
  puts "Oops."
end
food_box.label = 'Matt'
puts "This is #{food_box.label}'s food box."

food_box.add_item(Thing.new("Apples"))
puts "Weight is: #{food_box.weight}"

food_box.add_item(Thing.new("Lobster"))
puts "Weight is: #{food_box.weight}"

apples = food_box.contents[0]
food_box.remove_item(apples)
puts "Weight is: #{food_box.weight}"

# this fails
# food_box.remove_item("Bananas")

smaller_box = Tupperware.new(5, 5, 2)
food_box.add_item(smaller_box)

puts "Weight is: #{food_box.weight}"

# this will get a StackLevelTooDeep
# food_box.add_item(food_box)
# puts "Weight is: #{food_box.weight}"

food_box.shake!

other_food_box = Tupperware.standard_food_box("Jonathan")

