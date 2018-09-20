require_relative '../apartment'
require_relative '../room'


describe Apartment do


  let(:first_room) {Room.new(name: 'kitchen', sqft: 120, window_count: rand(0..2))}
  let(:second_room) {Room.new(name: 'lounge', sqft: 380, window_count: rand(0..2))}

  let(:generate_rooms) {[first_room, second_room]}

  let(:apartment) { Apartment.new(number: '10#7', rooms: generate_rooms, monthly_rent: 1450) }
  let(:second_apartment) {Apartment.new}

  describe 'attributes' do
    it 'has rooms' do
      expect(apartment.rooms).to eq(generate_rooms)
    end

    it 'has monthly_rent' do
      expect(apartment.monthly_rent).to eq 1450
    end

    it 'has default value for monthly_rent' do
      expect(second_apartment.monthly_rent).to eq 1000
    end
  end


  describe 'sqft calculations' do
    describe '#total_sqft' do
      it 'return total sqft for all apartments' do
        expect(apartment.total_sqft).to eq 500
      end
    end

    describe '#price_per_sqft' do
      it 'return price per sqft for apartment' do
        expect(apartment.price_per_sqft).to eq 2.9
      end
    end
  end


  describe 'count of rooms' do
    describe '#room_count' do
      it 'return number of room in apartment' do
        expect(apartment.room_count).to eq 2
      end
    end

    describe '#bedroom_count' do
      it 'return number of bedroom' do
        expect(apartment.bedroom_count).to eq 0
      end
    end
  end

end
