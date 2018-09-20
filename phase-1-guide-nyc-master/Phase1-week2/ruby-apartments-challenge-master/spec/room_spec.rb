require_relative '../room.rb'

describe Room do

  let(:sqft) {50 + rand(1..10) * 10}
  let(:first_room) {Room.new(name: "lounge", sqft: sqft, window_count: rand(0..2))}
  let(:second_room) {Room.new}

  describe 'attributes' do

    it "has name" do
      expect(first_room.name).to eq 'lounge'
    end

    it "it 'allows updates to name' do" do
      first_room.name = 'kitchen'
      expect(first_room.name).to eq 'kitchen'
    end

    it "has sqft" do
      expect(first_room.sqft).to eq sqft
    end

    it "has default value for name" do
      expect(second_room.name).to eq 'bedroom'
    end

    it "has default value for sqft" do
      expect(second_room.sqft).to eq 120
    end
  end

end
