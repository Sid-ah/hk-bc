require_relative "spec_helper"

describe ItemWriter do
  describe "appending an item to the file" do
    before(:all) do
      open(TEST_DATA_FILENAME, "w") do |item_data_file|
        item_data_file << "[X] Walk the cat.\n"
      end
    end

    it "appends a line representing the item to the file" do
      item = Item.new(description: "Learn something new.", complete: false)
      ItemWriter.append(TEST_DATA_FILENAME, item)
      expect(File.read(TEST_DATA_FILENAME)).to eq "[X] Walk the cat.\n[ ] Learn something new.\n"
    end
  end

  describe "saving a collection of items" do
    before(:all) do
      open(TEST_DATA_FILENAME, "w") do |item_data_file|
        item_data_file << "[X] Walk the cat.\n"
      end
    end

    it "replaces the contents of the file with data representing the items" do
      expect(File.read(TEST_DATA_FILENAME)).to eq "[X] Walk the cat.\n"

      item_1 = Item.new(description: "Eat breakfast.", complete: true)
      item_2 = Item.new(description: "Eat lunch.", complete: false)
      items = [item_1, item_2]

      ItemWriter.write(TEST_DATA_FILENAME, items)
      expect(File.read(TEST_DATA_FILENAME)).to eq "[X] Eat breakfast.\n[ ] Eat lunch.\n"
    end
  end

  after(:all) do
    File.truncate(TEST_DATA_FILENAME, 0)
  end
end
