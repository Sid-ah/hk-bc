class Aquarium
  attr_reader :water

  def initialize
    @water = []
  end

  def add_fish(fish)
    water << fish
  end

  def clean
    @last_cleaned = Time.now
  end

  def clean?
    one_week = 60 * 60 * 24 * 7
    !@last_cleaned.nil? && @last_cleaned > Time.now - one_week
  end

  def dirtify!
    @last_cleaned = nil
  end

  def to_s
    <<-TANK
    .______________________________.
    |`.~~  ~~  ~    ~ ~   ~~~     ~|`.
    |~ `.~~ ~  ~~~  ~~~ ~~  ~ ~~~ ~| ~`.
    |   ~`._____________________________`.
    | ~  ~|~  ~~,   ~~~~  ~~ ~ ~ ~ |~ ~  |
    | ~,  |  <')))><~  ~~  ~~,~  ~ |  ~~ |
    |<'))X|~ ~~   ~, ~~   <'>>><  ~|~   ~|
    ._____|_____<'}}}x_____________.~ ~~ |
     `.~  |~ ~~   ~'   ~~~~,  ~  ~~ `.  ~|
       `.~|~  ~~ ~~   ~ <'))>< ~~   ~~`.~|
         `._____________________________`.
    TANK
  end
end

class Fish
  attr_reader :species, :color

  def initialize(attrs)
    @species = attrs[:species]
    @color   = attrs[:color] || 'fish-colored'
    @belly   = []
  end

  def swim
    "~~ ><)))'>"
  end

  def eat(food)
    @belly << food
  end

  def poop!
    @belly.clear
  end
end


# STORY:
# - I want to simulate an aquarium. 
# - It should be able to hold fishes of many different
#   speicies and colors.
# - It will probably get dirty after a while, so I will
#   have to clean it.

# DOMAIN OBJECTS & BEHAVIOR:
# Domain Objects (Nouns)
# - Aquarium
# - Fish
# Attributes
# - Aquarium
#   - water / contents / tank
# - Fish
#   - species
#   - color
# Behavior (Verbs)
# - Aquarium
#   - clean
#   - clean?
#   - dirty?
#   - add_fish
# - Fish
#   - swim
#   - eat
#   - poop

# DRIVER CODE
my_aquarium = Aquarium.new

goldy   = Fish.new(species: 'goldfish', color: 'gold')
nemo    = Fish.new(species: 'clownfish', color: 'orange, black')
horsey  = Fish.new(species: 'seahorse', color: 'blue')
bob     = Fish.new(species: 'tuna', color: 'silver')

my_fish = [goldy, nemo, horsey, bob]

my_fish.each do |fish|
  my_aquarium.add_fish(fish)
  puts "You now have a #{fish.species} in your aquarium."
end

puts "-" * 10
puts "What color is my seahorse?"
puts "My seahorse is #{horsey.color}."

puts "-" * 10
puts "Swim, fishes, swim!"
puts nemo.swim
puts horsey.swim

bob.eat(goldy)
bob.poop!

puts my_aquarium

my_aquarium.dirtify!
my_aquarium.clean?
my_aquarium.clean