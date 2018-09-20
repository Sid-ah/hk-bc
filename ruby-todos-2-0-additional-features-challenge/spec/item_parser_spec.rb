require_relative "spec_helper"

describe ItemParser do
  describe "parsing items from a file" do
    before(:all) do
      open(TEST_DATA_FILENAME, "w") do |item_data_file|
        item_data_file << "[X] Walk the cat.\n"
        item_data_file << "[ ] Hit the gym.\n"
      end
    end

    let(:parsed_items) { ItemParser.parse(TEST_DATA_FILENAME) }

    it "creates an object for each row in the file" do
      expect(parsed_items.count).to eq 2
    end

    it "creates completed items correctly" do
      expect(parsed_items.first).to be_complete
    end

    it "creates incomplete items correctly" do
      expect(parsed_items.last).to be_incomplete
    end

    it "assigns descriptions correctly" do
      expect(parsed_items.first.description).to eq "Walk the cat."
    end
  end

  after(:all) do
    File.truncate(TEST_DATA_FILENAME, 0)
  end
end
