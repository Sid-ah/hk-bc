require_relative "../orange"
require_relative "../orange_tree"


describe OrangeTree do
  let(:tree) { OrangeTree.new }

  #You'll need to switch `pending` to `describe` when you're ready
  # to implement each set of tests.

  pending "#age" do
    it "has an age" do
    end
  end

  pending "#height" do
    it "has a height" do
    end
  end


  pending "#pass_growing_season" do
    it "should change the age" do
      # This should be more explicit. How much should the tree age by?
      # https://www.relishapp.com/rspec/rspec-expectations/v/2-0/docs/matchers/expect-change
      expect {tree.pass_growing_season}.to change {tree.age}
    end

    it "should make the tree grow" do
      #This should be more explicit. How much should the tree grow?
      expect {tree.pass_growing_season}.to change{tree.height}
    end

    context "the tree is old enough to bear fruit" do
      it "should cause the tree to produce oranges" do
      end
    end
  end

  pending "#mature?" do
    it "returns true if tree is old enough to bear fruit" do
    end

    it "returns false if tree is not old enough to bear fruit" do
    end
  end

  pending "#dead?" do
    it "should return false for an alive tree" do
    end

    it "should return true for a dead tree" do
    end
  end

  pending '#has_oranges?' do
    it 'should return true if oranges are on the tree' do
    end

    it "should return false if the tree has no oranges" do
    end
  end

  pending "#pick_an_orange" do
    it "should return an orange from the tree" do
    end

    it "the returned orange should no longer be on the tree" do
    end

    it "should raise an error if the tree has no oranges" do
    end
  end
end
