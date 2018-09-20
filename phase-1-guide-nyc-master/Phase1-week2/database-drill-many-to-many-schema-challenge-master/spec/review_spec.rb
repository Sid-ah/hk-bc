require_relative 'spec_helper'

describe Review do
  let(:review) { Review.new(score: 3, description: 'It works well.', author: authoring_user, product: reviewed_product) }
  let(:authoring_user) { User.new(email: 'username@domain.com', username: 'superuser') }
  let(:reviewed_product) { Product.new(name: 'Mixer', description: 'It mixes.') }

  it 'has a score' do
    expect(review.score).to eq 3
  end

  it 'has a description' do
    expect(review.description).to eq 'It works well.'
  end

  describe 'the review\'s author' do
    it 'has an author' do
      expect(review.author).to eq authoring_user
    end

    it 'is contained within the author\'s collection of reviews' do
      authors_reviews = review.author.reviews
      expect(authors_reviews).to include review
    end
  end

  describe 'the review\'s product' do
    it 'has a product' do
      expect(review.product).to eq reviewed_product
    end

    it 'is contained within the reviewed products\'s collection of reviewed' do
      reviewed_products_reviews = review.product.reviews
      expect(reviewed_products_reviews).to include review
    end
  end

  describe 'being favorited' do
    let(:review_favoriting) { double('favoriting', review: review) }
    let(:other_review_favoriting) { double('favoriting', review: double('other review')) }

    it 'has a collection of favoritings' do
      expect(review.favoritings).to match_array []
    end

    it 'can add a favoriting' do
      expect(review.favoritings).to_not include review_favoriting
      review.add_favoriting(review_favoriting)
      expect(review.favoritings).to include review_favoriting
    end

    it 'does not add a favoriting where it is not the favorited review' do
      expect(review.favoritings).to_not include other_review_favoriting
      review.add_favoriting(other_review_favoriting)
      expect(review.favoritings).to_not include other_review_favoriting
    end

    it 'does not add the same favoriting twice' do
      review.add_favoriting(review_favoriting)
      expect(review.favoritings).to include review_favoriting

      expect { review.add_favoriting(review_favoriting) }.to_not change { review.favoritings }
    end
  end
end
