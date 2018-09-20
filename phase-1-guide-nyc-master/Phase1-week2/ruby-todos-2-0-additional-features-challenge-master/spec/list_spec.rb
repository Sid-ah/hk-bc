require_relative 'spec_helper'

describe List do
  let(:completed_item) { Item.new(description: "Sleep in.", complete: true) }
  let(:incomplete_item) { Item.new(description: "Take a nap.", complete: false) }
  let(:list) { List.new(items: [completed_item, incomplete_item]) }

  it "has items" do
    expect(list.items).to match_array [completed_item, incomplete_item]
  end

  it "defaults to be empty if no items are given" do
    empty_list = List.new
    expect(empty_list).to be_empty
  end

  it "is not empty if it has items" do
    expect(list).to_not be_empty
  end

  describe "deleting an item" do
    context "when list has an item with a matching description" do
      it "removes the matching item" do
        expect(list.items).to include completed_item
        list.delete("sleep")
        expect(list.items).to_not include completed_item
      end

      it "returns the matching item" do
        expect(list.delete("sleep")).to be completed_item
      end
    end

    context "when list does not have an item with a matching description" do
      it "does not change the list's items" do
        expect { list.delete("eat") }.to_not change { list.items }
      end

      it "returns nil" do
        expect(list.delete("eat")).to be_nil
      end
    end
  end

  describe "finding an item" do
    it "returns the matching item" do
      expect(list.find("sleep")).to be completed_item
    end

    it "is case insensitive" do
      expect(list.find("SLEEP")).to be completed_item
    end

    it "returns nil if there's no matching item" do
      expect(list.find("eat")).to be_nil
    end
  end
end
