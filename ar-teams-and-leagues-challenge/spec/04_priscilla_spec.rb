require 'spec_helper'

describe "Priscilla" do
  let(:priscilla) { User.find_by(name: "Priscilla") }
  let(:purple_parrots) { Team.find_by(name: "Purple Parrots")} 
  let(:green_monkeys) { Team.find_by(name: "Green Monkeys")}

  it "is the captain of the correct team" do
    expect(priscilla.captain_position).to eq purple_parrots
  end

  it "is the creator of the correct league" do
    expect(priscilla.created_league.name).to eq "Tennis"
  end

  it "is a member of the correct teams" do
    expect(priscilla.joined_teams).to match_array [purple_parrots, green_monkeys]
  end

end