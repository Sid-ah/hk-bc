require_relative 'spec_helper'

describe Favoriting do
  let(:favoriting) { Favoriting.new(favoritor: favoriting_user, review: favorited_review) }
  let(:favoriting_user) { User.new(email: 'username@domain.com', username: 'superuser') }
  let(:favorited_review) { Review.new(score: 2, description: 'It works.', author: review_author, product: product) }
  let(:review_author) { double('user', reviews: []) }
  let(:product) { double('product', reviews: []) }

  it 'has a favoritor' do
    expect(favoriting.favoritor).to eq favoriting_user
  end

  it 'is contained within the favoritor\'s favoritings' do
    favoritors_favoritings = favoriting.favoritor.favoritings
    expect(favoritors_favoritings).to include favoriting
  end

  it 'has a review' do
    expect(favoriting.review).to eq favorited_review
  end

  it 'is contained within the review\'s favoritings' do
    reviews_favoritings = favoriting.review.favoritings
    expect(reviews_favoritings).to include favoriting
  end
end
