require_relative '../house_listing'

describe HouseListing do
  let(:listing_details) do
    { :address        => "1883 Atwood Rd, Toledo, OH 43615",
      :asking_price   => "$75,000",
      :square_footage => 1003,
      :listing_type   => "single family",
      :listing_id     => "5097751",
      :year_built     => 1947,
      :bedroom_count  => 2,
      :bathroom_count => 1,
      :active         => false,
      :occupied       => false }
  end

  let(:house_listing) { HouseListing.new(listing_details) }


  it "has an address" do
    expect(house_listing.address).to eq "1883 Atwood Rd, Toledo, OH 43615"
  end

  it "has an asking price" do
    expect(house_listing.asking_price).to eq "$75,000"
  end

  it "has a square footage" do
    expect(house_listing.square_footage).to eq 1003
  end

  it "has a listing type" do
    expect(house_listing.listing_type).to eq "single family"
  end

  it "has a listing id" do
    expect(house_listing.listing_id).to eq "5097751"
  end

  it "has a year in which it was built" do
    expect(house_listing.year_built).to eq 1947
  end

  it "has a bedroom count" do
    expect(house_listing.bedroom_count).to eq 2
  end

  it "has a bathroom count" do
    expect(house_listing.bathroom_count).to eq 1
  end

  it "has an active status" do
    expect(house_listing.active?).to be false
  end

  it "has an occupied status" do
    expect(house_listing.occupied?).to be false
  end

  describe "default values" do
    let(:listing_details) do
      { :address        => "1883 Atwood Rd, Toledo, OH 43615",
        :asking_price   => "$75,000",
        :square_footage => 1003,
        :listing_type   => "single family",
        :listing_id     => "5097751",
        :year_built     => 1947 }
    end

    let(:house_listing) { HouseListing.new(listing_details) }


    it "defaults to bedroom count of 3" do
      expect(house_listing.bedroom_count).to eq 3
    end

    it "defaults to bathroom count of 2" do
      expect(house_listing.bathroom_count).to eq 2
    end

    it "defaults to being active" do
      expect(house_listing.active?).to be true
    end

    it "defaults to being occupied" do
      expect(house_listing.occupied?).to be true
    end
  end
end

