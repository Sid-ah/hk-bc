require 'spec_helper'

describe Shirt do
  describe 'associations' do
    before(:each) do
      @designer = User.create!(name: 'Shaelyn')
      @shirt = Shirt.create!(designer_id: @designer.id)

      @purchaser_1 = User.create!(name: 'Kennith')
      @purchaser_2 = User.create!(name: 'Farouk')

      @purchase_1 = Purchase.create!(shirt_id: @shirt.id, purchaser_id: @purchaser_1.id)
      @purchase_2 = Purchase.create!(shirt_id: @shirt.id, purchaser_id: @purchaser_2.id)
    end

    it "returns the user who designed it" do
      expect(@shirt.designer).to eq @designer
    end

    it "returns purchases in which it was sold" do
      expect(@shirt.sales).to match_array [@purchase_1, @purchase_2]
    end

    it "returns the users who have puchased it" do
      expect(@shirt.purchasers).to match_array [@purchaser_1, @purchaser_2]
    end
  end
end
