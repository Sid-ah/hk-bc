require 'spec_helper'


describe TweetsController do
  describe '#recent' do
    it "returns 50 tweets" do
      50.times do
        Tweet.create(content: 'some content')
      end
      get :recent

      expect(JSON.parse(response.body).length).to eq(50)
    end

    it "does not return older tweets" do
      Tweet.create(content: 'some other content')
      50.times do
        Tweet.create(content: 'some content')
      end
      get :recent

      expect(JSON.parse(response.body).length).to eq(50)
    end
  end

  describe '#search' do
    it "returns tweets associated with the given hashtag" do
      fake_hashtag = Hashtag.create(name: 'some name')
      unmatched_hashtag = Tweet.create
      5.times do
        fake_hashtag.tweets.create
      end
      get :search, keyword: fake_hashtag.name
      expect(JSON.parse(response.body).length).to eq(5)
    end
    it "returns a maximum of 50 tweets" do
      fake_hashtag = Hashtag.create(name: 'some name')
      51.times do
        fake_hashtag.tweets.create
      end
      get :search, keyword: fake_hashtag.name
      expect(JSON.parse(response.body).length).to eq(50)
    end

    it "returns status code 404 if the hashtag doesn't exist" do
      get :search, keyword: 'unlisted keyword'
      expect(response.status).to eq(404)
    end
  end

  describe '#create' do
    it "creates a new tweet" do
      expect{
        post :create, { tweet: { content: 'some content' } }
      }.to change{Tweet.count}.by(1)
    end

    it "associates the tweet with the given hashtags" do
      hashtag = Hashtag.create(name: 'some name')
      attributes = { tweet: { content: 'some content' },
                     hashtags: [hashtag.name] }
      post :create, attributes
      hashtag.reload
      expect(hashtag.tweets.count).to eq(1)
    end

    it "creates the associated hashtags if they don't already exist" do
      expect{
        attributes = { tweet: { content: 'some content' },
                     hashtags: ['some name'] }
        post :create, attributes
      }.to change{Hashtag.count}.by(1)
    end

    it "returns the associated tweet as JSON with hashtags" do
      hashtag = Hashtag.create(name: 'some name')
      attributes = { tweet: { content: 'some content' },
                     hashtags: [hashtag.name] }
      post :create, attributes
      expect(response.body).to eq(Tweet.last.to_json(methods: :hashtag_names))
    end
  end

  describe "POST tweets" do
    ridiculous_tag_name = "Slumgullion Millionaire"

    before :each do
      Hashtag.create!(name:"Unwanted tag");
    end

    let(:tweet_with_new_hashtag_params) do
      {
        tweet: { content: ("Test" + Time.now.to_i.to_s) },
        hashtags: [ridiculous_tag_name]
      }
    end

    it "creates a new hashtag when the tag does not exist" do
      expect {
        post :create, tweet_with_new_hashtag_params
      }.to change(Hashtag, :count).by(1)
    end

    it "does not create a new hashtag when the tag exists" do
      Hashtag.create(name: ridiculous_tag_name)
      expect {
        post :create, tweet_with_new_hashtag_params
      }.to change(Hashtag, :count).by(0)
    end
  end
end
