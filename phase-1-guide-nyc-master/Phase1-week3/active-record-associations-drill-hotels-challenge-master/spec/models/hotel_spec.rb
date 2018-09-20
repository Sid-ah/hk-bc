require_relative "../spec_helper"

describe Hotel do
  describe 'associations' do
    before(:each) do
      @ritz   = Hotel.create!(name: "Ritz")
      @westin = Hotel.create!(name: "Westin")

      @susan = User.create!(name: "Susan Smith")
      @sam   = User.create!(name: "Sam Smith")
      @joe   = User.create!(name: "Joe Schmo")

      @room_1_at_ritz = Room.create!(rate: 300, number: 1, hotel_id: @ritz.id)
      @room_2_at_ritz = Room.create!(rate: 300, number: 2, hotel_id: @ritz.id)
      @room_at_westin = Room.create!(rate: 200, number: 1, hotel_id: @westin.id)

      @ritz_booking_1 = Booking.create!(guest_id: @susan.id, room_id: @room_1_at_ritz.id)
      @ritz_booking_2 = Booking.create!(guest_id: @sam.id, room_id: @room_2_at_ritz.id)
      @westin_booking = Booking.create!(guest_id: @sam.id, room_id: @room_at_westin.id)
    end

    it "has rooms" do
      expect(@ritz.rooms).to match_array [@room_1_at_ritz, @room_2_at_ritz]
    end

    it "has bookings" do
      expect(@ritz.bookings).to match_array [@ritz_booking_1, @ritz_booking_2]
    end

    it "has booked guests" do
      expect(@ritz.booked_guests).to match_array [@susan, @sam]
    end
  end
end
