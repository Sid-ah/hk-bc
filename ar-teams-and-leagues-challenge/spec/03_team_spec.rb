require 'spec_helper'

describe "Team" do
  let(:penelope) {User.find_by(name: "Penelope")}
  let(:pete) {User.find_by(name: "Pete")}
  let(:pepe) {User.find_by(name: "Pepe")}
  let(:priscilla) {User.find_by(name: "Priscilla")}
  let(:silver_snakes) { Team.find_by(name: "Silver Snakes")}  
  let(:green_monkeys) { Team.find_by(name: "Green Monkeys")}

  describe "Green Monkeys" do
    it "is present in the database" do
      expect(green_monkeys).to_not be_nil
    end

    it "has the correct uniform color" do
      expect(green_monkeys.uniform_color).to eq 'green'
    end

    it "has the correct three members" do
      expect(green_monkeys.members).to match_array [penelope, pepe, priscilla]
    end

    it "has the correct captain" do
      expect(green_monkeys.captain).to eq pepe
    end

    it "has belongs to the correct league" do
      expect(green_monkeys.league.name).to eq "Hockey"
    end
  end

  describe "Silver Snakes" do
    it "is present in the database" do
      expect(silver_snakes).to_not be_nil
    end

    it "has the correct uniform color" do
      expect(silver_snakes.uniform_color).to eq 'silver'
    end

    it "has the correct three members" do
      expect(silver_snakes.members).to match_array [pete]
    end

    it "has the correct captain" do
      expect(silver_snakes.captain).to eq pete
    end

    it "has belongs to the correct league" do
      expect(silver_snakes.league.name).to eq "Soccer"
    end
  end
end