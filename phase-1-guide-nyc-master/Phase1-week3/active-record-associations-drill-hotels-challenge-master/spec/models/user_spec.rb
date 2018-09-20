require_relative "../spec_helper"

describe User do
  describe 'associations' do
    before(:each) do
      @user = User.create!(name: "Susan Smith")

      @ritz = Hotel.create!(name: "Ritz")
      @westin = Hotel.create!(name: "Westin")
      @hilton = Hotel.create!(name: "Hilton")

      @room_at_ritz = Room.create!(rate: 300, number: 1, hotel_id: @ritz.id)
      @room_at_westin = Room.create!(rate: 200, number: 1, hotel_id: @westin.id)

      @booking_1 = Booking.create(guest_id: @user.id, room_id: @room_at_ritz.id)
    end

    it "has bookings" do
      expect(@user.bookings).to match_array [@booking_1]
    end

    it "has booked rooms" do
      expect(@user.booked_rooms).to match_array [@room_at_ritz]
    end

    it "has booked hotels" do
      expect(@user.booked_hotels).to match_array [@ritz]
    end
  end
end
