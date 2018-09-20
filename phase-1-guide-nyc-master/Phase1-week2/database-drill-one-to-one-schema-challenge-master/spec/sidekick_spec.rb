require_relative "../sidekick"
require_relative "../superhero"

describe Sidekick do
  let(:sidekick) { Sidekick.new(sidekick_data) }
  let(:batwoman) { Superhero.new }

  let(:sidekick_data) do
    { :name            => "Bat-Girl",
      :alter_ego       => "Bette Kane",
      :intelligence    => 58,
      :loyalty         => 78,
      :resourcefulness => 65,
      :humor           => 75,
      :superhero       => batwoman }
  end


  it "has a readable/writable name" do
    expect { sidekick.name = "Wonder Girl"}.to change { sidekick.name }.from("Bat-Girl").to("Wonder Girl")
  end

  it "has a readable/writable alter ego" do
    expect { sidekick.alter_ego = "Cassandra Elizabeth Sandsmark" }.to change { sidekick.alter_ego }.from("Bette Kane").to("Cassandra Elizabeth Sandsmark")
  end

  it "has a readable/writable loyalty rating" do
    expect { sidekick.loyalty = 80 }.to change { sidekick.loyalty }.from(78).to(80)
  end

  it "has a readable/writable resourcefulness rating" do
    expect { sidekick.resourcefulness = 70 }.to change { sidekick.resourcefulness }.from(65).to(70)
  end

  it "has a readable/writable humor rating" do
    expect { sidekick.humor = 55 }.to change { sidekick.humor }.from(75).to(55)
  end

  it "has a readable/writable superhero" do
    wonder_woman = Superhero.new
    expect { sidekick.superhero = wonder_woman }.to change { sidekick.superhero }.from(batwoman).to(wonder_woman)
  end

end
