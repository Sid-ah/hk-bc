class HouseListing
  attr_reader :address, :asking_price, :bedroom_count, :bathroom_count, :square_footage, :listing_type, :listing_id, :year_built

  def initialize(address, asking_price, square_footage, listing_type, listing_id, year_built, bedroom_count=3, bathroom_count=2, active=true, occupied=true)
    @address = address
    @asking_price = asking_price
    @square_footage = square_footage
    @listing_type = listing_type
    @listing_id = listing_id
    @year_built = year_built
    @bedroom_count = bedroom_count
    @bathroom_count = bathroom_count
    @active = active
    @occupied = occupied
  end

  def active?
    @active
  end

  def occupied?
    @occupied
  end
end
