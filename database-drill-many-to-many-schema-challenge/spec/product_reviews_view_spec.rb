require_relative 'spec_helper'

describe ProductReviewsView do
  let(:first_review_author) { double('author', { username: 'gamer' }) }
  let(:first_review) { double('review', { author: first_review_author, score: 2, description: 'Mildly entertaining.' }) }
  let(:second_review_author) { double('author', { username: 'highroller' }) }
  let(:second_review) { double('review', { author: second_review_author, score: 1, description: 'The die only goes up to three.' }) }
  let(:reviews) { [first_review, second_review] }
  let(:product) { double('product', { name: 'game', reviews: reviews }) }

  let(:view)  { ProductReviewsView.new(product) }

  it 'has a product' do
    expect(view.product).to eq product
  end

  it 'produces a formatted string for a product and its reviews' do
    expected_string = <<-STRING.gsub(/^ */, '')
      REVIEWS FOR GAME

      GAMER (score: 2)
      Mildly entertaining.

      HIGHROLLER (score: 1)
      The die only goes up to three.


      STRING

    expect(view.to_s).to eq expected_string
  end
end
