require_relative '../building'
require_relative '../apartment'
require_relative '../room'


describe Building do

  let(:first_room) {Room.new(name: 'kitchen', sqft: 400 , window_count: rand(1..2))}
  let(:second_room) {Room.new(sqft: 320, window_count: rand(1..2))}
  let(:third_room) {Room.new(sqft: 200, window_count: rand(1..2))}

  let(:rooms) {[first_room, second_room, third_room]}

  let(:first_apartment) {Apartment.new(number: "105", rooms: rooms, monthly_rent: 1456)}
  let(:second_apartment) {Apartment.new(number: "106", rooms: [first_room, second_room], monthly_rent: 980)}
  let(:third_apartment) {Apartment.new(number: "107", rooms: [third_room, second_room], monthly_rent: 1180)}

  let(:apartments) {[first_apartment, second_apartment, third_apartment]}
  let(:building) {Building.new(address: "123 Flatbush Ave", apartments: apartments)}


  describe 'attributes' do
    it 'has an apartments' do
      expect(building.apartments).to eq apartments
    end
  end

  describe '#total_room_count' do
    it 'returns total rooms in the building' do
      expect(building.total_room_count).to eq 7
    end
  end

  describe '#total_monthly_revenue' do
    it 'returns total monthly revenue' do
      expect(building.total_monthly_revenue).to eq 3616
    end
  end

  describe '#apartments_by_rent' do
    it 'orders apartments by rent from largest to smallest' do
      expect(building.apartments_by_rent).to eq [first_apartment, third_apartment, second_apartment]
    end
  end

  describe '#find_apartments_by_bedroom_count' do
    it 'should find apartment by input number of bedroom' do
      expect(building.find_apartments_by_bedroom_count(1)). to eq second_apartment
    end
  end


  describe '#total_sqft' do
    it 'returns total sqft for all apartments in the building' do
      expect(building.total_sqft).to eq 2160
    end
  end


end
