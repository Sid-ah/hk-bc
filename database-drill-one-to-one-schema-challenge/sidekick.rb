class Sidekick
  attr_accessor :name, :alter_ego, :resourcefulness, :loyalty, :humor, :superhero

  def initialize(args ={})
    self.name = args[:name]
    self.alter_ego = args[:alter_ego]
    self.resourcefulness = args[:resourcefulness]
    self.loyalty = args[:loyalty]
    self.humor = args[:humor]
    self.superhero = args[:superhero]
  end
end
