require 'spec_helper'

describe Purchase do
  describe 'associations' do
    before(:each) do
      @designer = User.create!(name: 'Jannette')
      @shirt = Shirt.create!(designer_id: @designer.id)
      @purchaser = User.create!(name: 'Fredrick')

      @purchase = Purchase.create!(purchaser_id: @purchaser.id, shirt_id: @shirt.id)
    end

    it "returns the shirt that was purchased" do
      expect(@purchase.shirt).to eq @shirt
    end

    it "returns the purchaser" do
      expect(@purchase.purchaser).to eq @purchaser
    end
  end
end
