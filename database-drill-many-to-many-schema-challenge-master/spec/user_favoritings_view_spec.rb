require_relative 'spec_helper'

describe UserFavoritingsView do
  let(:first_review_author) { double('user', { username: 'wise_reviewer' }) }
  let(:first_product) { double('product', name: 'shoe') }
  let(:first_review) { double('review', { author: first_review_author, product: first_product, score: 4, description: 'Fashionable, durable.' }) }
  let(:first_favoriting) { double('favoriting', { review: first_review }) }
  let(:second_review_author) { double('user', { username: 'feedbackinator' }) }
  let(:second_product) { double('product', name: 'sock') }
  let(:second_review) { double('review', { author: second_review_author, product: second_product, score: 1, description: 'Did not match; matching algorithm must be broken.' }) }
  let(:second_favoriting) { double('favoriting', { review: second_review }) }
  let(:favoritings) { [first_favoriting, second_favoriting] }
  let(:user) { double('user', { username: 'reviewreader', favoritings: favoritings }) }

  let(:view)  { UserFavoritingsView.new(user) }

  it 'has a user' do
    expect(view.user).to eq user
  end

  it 'produces a formatted string for a user and its favoritings' do
    expected_string = <<-STRING.gsub(/^ */, '')
      REVIEWS FAVORITED BY REVIEWREADER

      WISE_REVIEWER reviewed SHOE (score: 4)
      Fashionable, durable.

      FEEDBACKINATOR reviewed SOCK (score: 1)
      Did not match; matching algorithm must be broken.


      STRING

    expect(view.to_s).to eq expected_string
  end
end
