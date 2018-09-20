require_relative 'spec_helper'

describe UserReviewsView do
  let(:first_product) { double('product', { name: 'vaccuum' }) }
  let(:first_review) { double('review', { product: first_product, score: 2, description: 'Not nearly powerful enough.' }) }
  let(:second_product) { double('product', { name: 'big vaccuum' }) }
  let(:second_review) { double('review', { product: second_product, score: 4, description: 'Hours of floor vaccuuming fun.' }) }
  let(:reviews) { [first_review, second_review] }
  let(:user) { double('user', { username: 'dozer', reviews: reviews }) }

  let(:view)  { UserReviewsView.new(user) }

  it 'has a user' do
    expect(view.user).to eq user
  end

  it 'produces a formatted string for a user and its reviews' do
    expected_string = <<-STRING.gsub(/^ */, '')
      REVIEWS BY DOZER

      VACCUUM (score: 2)
      Not nearly powerful enough.

      BIG VACCUUM (score: 4)
      Hours of floor vaccuuming fun.


      STRING

    expect(view.to_s).to eq expected_string
  end
end
