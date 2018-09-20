require_relative "../superhero"
require_relative "../sidekick"

describe Superhero do
  let(:hero) { Superhero.new(hero_data) }
  let(:bat_girl) { Sidekick.new }

  let(:hero_data) do
    { :name         => "Batwoman",
      :alter_ego    => "Katherine Kane",
      :intelligence => 93,
      :strength     => 62,
      :speed        => 78,
      :durability   => 75,
      :power        => 75,
      :combat       => 93,
      :sidekick     => bat_girl }
  end


  it "has a readable/writable name" do
    expect { hero.name = "Wonder Woman" }.to change { hero.name }.from("Batwoman").to("Wonder Woman")
  end

  it "has a readable/writable alter ego" do
    expect { hero.alter_ego = "Diana Prince" }.to change { hero.alter_ego }.from("Katherine Kane").to("Diana Prince")
  end

  it "has a readable/writable intelligence rating" do
    expect { hero.intelligence = 88 }.to change { hero.intelligence }.from(93).to(88)
  end

  it "has a readable/writable strength rating" do
    expect { hero.strength = 100 }.to change { hero.strength }.from(62).to(100)
  end

  it "has a readable/writable speed rating" do
    expect { hero.speed = 75 }.to change { hero.speed }.from(78).to(75)
  end

  it "has a readable/writable durability rating" do
    expect { hero.durability = 100 }.to change { hero.durability }.from(75).to(100)
  end

  it "has a readable/writable power rating" do
    expect { hero.power = 97 }.to change { hero.power }.from(75).to(97)
  end

  it "has a readable/writable combat rating" do
    expect { hero.combat = 100 }.to change { hero.combat }.from(93).to(100)
  end

  it "has a readable/writable sidekick" do
    wonder_girl = Sidekick.new
    expect { hero.sidekick = wonder_girl }.to change { hero.sidekick }.from(bat_girl).to(wonder_girl)
  end
end
