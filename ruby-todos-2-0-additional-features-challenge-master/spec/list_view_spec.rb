require_relative "spec_helper"

describe ListView do
  let(:item_1) { Item.new(description: "Relax in hammock.", complete: true) }
  let(:item_2) { Item.new(description: "Go to the beach.", complete: false) }
  let(:list) { List.new(items: [item_1, item_2]) }

  describe "representing a list view as a string" do
    it "represents each of the list's items" do
      expect(ListView.render(list)).to eq "[X] Relax in hammock.\n[ ] Go to the beach."
    end
  end
end
