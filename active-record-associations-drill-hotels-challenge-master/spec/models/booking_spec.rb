require_relative "../spec_helper"

describe Booking do
  describe 'associations' do
    before(:each) do
      @ritz   = Hotel.create!(name: "Ritz")

      @susan = User.create!(name: "Susan Smith")

      @room_at_ritz = Room.create!(rate: 300, number: 1, hotel_id: @ritz.id)

      @ritz_booking = Booking.create!(guest_id: @susan.id, room_id: @room_at_ritz.id)
    end

    it "has a guest" do
      expect(@ritz_booking.guest).to eq @susan
    end

    it "has a room" do
      expect(@ritz_booking.room).to eq @room_at_ritz
    end

    it "has a hotel" do
      expect(@ritz_booking.hotel).to eq @ritz
    end
  end
end
