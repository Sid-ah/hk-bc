require_relative "spec_helper"

describe Item do
  let(:item) { Item.new(description: "Take Jayda for a walk.") }

  describe "an item description" do
    it "has a description" do
      expect(item.description).to eq "Take Jayda for a walk."
    end

    it "raises an error if no description is given" do
      expect { Item.new({}) }.to raise_error(Item::InvalidItemDescription)
    end

    it "raises an error if the description is empty" do
      expect { Item.new(description: "") }.to raise_error(Item::InvalidItemDescription)
    end
  end

  describe "completeness" do
    it "defaults to being incomplete" do
      expect(item).to be_incomplete
    end

    it "can be completed" do
      expect(item).to_not be_complete
      item.mark_complete
      expect(item).to be_complete
    end

    describe "specifying completeness when instatiating an item" do
      it "a truthy complete value makes an item complete" do
        completed_item = Item.new(description: "Hit the gym.", complete: "true")
        expect(completed_item).to be_complete
      end

      it "a falsey complete value makes an item incomplete" do
        incomplete_item = Item.new(description: "Win hot dog eating contest.", complete: nil)
        expect(incomplete_item).to be_incomplete
      end
    end
  end

  describe "matching an item with a piece of text" do
    it "returns true if the item description contains the text" do
      expect(item.match?("Take Jayda")).to be true
    end

    it "is case insensitive" do
      expect(item.match?("TAKE JAYDA")).to be true
    end

    it "returns false it the item description does not contain the text" do
      expect(item.match?("Tenley")).to be false
    end
  end
end
