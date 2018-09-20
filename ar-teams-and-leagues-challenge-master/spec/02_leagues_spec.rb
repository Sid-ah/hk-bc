require 'spec_helper'

describe "League" do
  
  it "has four teams with corect names" do
    names = League.all.order(:name).map(&:name)

    expect(names).to eq ['Hockey', 'Soccer', 'Tennis']
  end

  describe "Hockey League" do
    let(:hockey) { League.find_by(name: "Hockey") }
    let(:green_monkeys) { Team.find_by(name: "Green Monkeys") }

    it "has the correct day" do
      expect(hockey.day).to eq "Wednesday"
    end

    it "has the correct creator" do
      expect(hockey.creator.name).to eq "Pepe"
    end

    it 'has the correct listing of teams' do
      expect(hockey.teams).to eq [green_monkeys]
    end
  end

  describe "Soccer League" do
    let(:soccer) {League.find_by(name: "Soccer")}
    let(:silver_snakes) { Team.find_by(name: "Silver Snakes") }
    let(:purple_parrots) { Team.find_by(name: "Purple Parrots")}

    it "has the correct day" do
      expect(soccer.day).to eq "Thursday"
    end

    it "has the correct creator" do
      expect(soccer.creator.name).to eq "Penelope"
    end

    it "has the correct teams" do
      expect(soccer.teams).to eq [silver_snakes, purple_parrots]
    end
  end

  describe "Tennis League" do
    let(:tennis) {League.find_by(name: "Tennis")}

    it "has the correct day" do
      expect(tennis.day).to eq "Tuesday"
    end

    it "has the correct creator" do
      expect(tennis.creator.name).to eq "Priscilla"
    end

    it "does not have any teams" do
      expect(tennis.teams).to eq []
    end
  end
end
