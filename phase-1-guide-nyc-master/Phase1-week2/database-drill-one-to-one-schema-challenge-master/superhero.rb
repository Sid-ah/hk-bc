class Superhero
  attr_accessor :name, :alter_ego, :intelligence, :strength, :speed, :durability, :power, :combat, :sidekick

  def initialize(args = {})
    self.name = args[:name]
    self.alter_ego = args[:alter_ego]
    self.intelligence = args[:intelligence]
    self.strength = args[:strength]
    self.speed = args[:speed]
    self.durability = args[:durability]
    self.power = args[:power]
    self.combat = args[:combat]
    self.sidekick = args[:sidekick]
  end
end
