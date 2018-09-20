require 'spec_helper'

describe User do
  describe 'associations' do
    before(:each) do
      @user = User.create!(name: 'Shaelyn')
      @other_designer = User.create!(name: 'Caetlin')
      @purchaser_1 = User.create!(name: 'Kennith')
      @purchaser_2 = User.create!(name: 'Farouk')

      @designed_shirt_1 = Shirt.create!(designer_id: @user.id)
      @designed_shirt_2 = Shirt.create!(designer_id: @user.id)
      @purchased_shirt  = Shirt.create!(designer_id: @other_designer.id)

      @purchase = Purchase.create!(shirt_id: @purchased_shirt.id, purchaser_id: @user.id)
      @sale_1 = Purchase.create!(shirt_id: @designed_shirt_1.id, purchaser_id: @purchaser_1.id)
      @sale_2 = Purchase.create!(shirt_id: @designed_shirt_2.id, purchaser_id: @purchaser_2.id)
    end

    it "returns the shirts it designed" do
      expect(@user.designed_shirts).to match_array [@designed_shirt_1, @designed_shirt_2]
    end

    it "returns the purchases that it made" do
      expect(@user.purchases).to match_array [@purchase]
    end

    it "returns the shirts it purchased" do
      expect(@user.purchased_shirts).to match_array [@purchased_shirt]
    end

    it "returns the purchases in which a shirt it designed is sold" do
      expect(@user.sales).to match_array [@sale_1, @sale_2]
    end

    it "returns the users who bought a shirt it designed" do
      expect(@user.clients).to match_array [@purchaser_1, @purchaser_2]
    end

    it "returns the designers of the shirts it purchased" do
      expect(@user.supported_designers).to match_array [@other_designer]
    end
  end
end
