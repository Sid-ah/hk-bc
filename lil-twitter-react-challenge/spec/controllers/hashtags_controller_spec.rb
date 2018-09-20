require 'spec_helper'

describe HashtagsController do
  describe '#popular' do
    it "returns the 10 most popular hashtags in JSON" do
      (1..10).each do |num|
        Hashtag.create(name: "popular#{num}" ).tweets.create
      end

      (1..20).each do |num|
         Hashtag.create(name: "unpopular#{num}" )
      end

      get :popular
      expect( JSON.parse(response.body).length ).to eq(10)
    end
  end
end