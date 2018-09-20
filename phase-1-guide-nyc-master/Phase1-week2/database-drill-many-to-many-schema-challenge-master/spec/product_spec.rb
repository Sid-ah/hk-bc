require_relative 'spec_helper'

describe Product do
  let(:product) { Product.new(name: 'Mixer', description: 'It mixes.') }

  it 'has a name' do
    expect(product.name).to eq 'Mixer'
  end

  it 'has a description' do
    expect(product.description).to eq 'It mixes.'
  end

  describe 'being reviewed' do
    let(:product_review) { double('review', product: product) }
    let(:other_product_review) { double('review', product: double('other product')) }

    it 'has a collection of reviews' do
      expect(product.reviews).to match_array []
    end

    it 'can add a review' do
      expect(product.reviews).to_not include product_review
      product.add_review(product_review)
      expect(product.reviews).to include product_review
    end

    it 'does not add a review for which it is not the reviewed product' do
      expect(product.reviews).to_not include other_product_review
      product.add_review(other_product_review)
      expect(product.reviews).to_not include other_product_review
    end

    it 'does not add the same review twice' do
      product.add_review(product_review)
      expect(product.reviews).to include product_review

      expect { product.add_review(product_review) }.to_not change { product.reviews }
    end
  end
end
