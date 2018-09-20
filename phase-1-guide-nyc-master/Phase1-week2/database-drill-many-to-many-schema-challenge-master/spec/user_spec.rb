require_relative 'spec_helper'

describe User do
  let(:user) { User.new(email: 'username@domain.com', username: 'superuser') }

  it 'has an email address' do
    expect(user.email).to eq 'username@domain.com'
  end

  it 'has a username' do
    expect(user.username).to eq 'superuser'
  end

  describe 'reviewing products' do
    let(:authored_review) { double('review', { author: user}) }
    let(:unauthored_review) { double('review', { author: double('other user') }) }

    it 'has a collection of reviews' do
      expect(user.reviews).to match_array []
    end

    it 'can add a review' do
      expect(user.reviews).to_not include authored_review
      user.add_review(authored_review)
      expect(user.reviews).to include authored_review
    end

    it 'does not add a review it did not author' do
      expect(user.reviews).to_not include unauthored_review
      user.add_review(unauthored_review)
      expect(user.reviews).to_not include unauthored_review
    end

    it 'does not add the same review twice' do
      user.add_review(authored_review)
      expect(user.reviews).to include authored_review

      expect { user.add_review(authored_review) }.to_not change { user.reviews }
    end
  end

  describe 'favoriting reviews' do
    let(:favorited_favoriting) { double('favoriting', { favoritor: user }) }
    let(:unfavorited_favoriting) { double('favoriting', { favoritor: double('other user') }) }

    it 'has a collection of favoritings' do
      expect(user.favoritings).to match_array []
    end

    it 'can add a favoriting' do
      expect(user.favoritings).to_not include favorited_favoriting
      user.add_favoriting(favorited_favoriting)
      expect(user.favoritings).to include favorited_favoriting
    end

    it 'does not add a favoriting where it is not the favoritor' do
      expect(user.favoritings).to_not include unfavorited_favoriting
      user.add_favoriting(unfavorited_favoriting)
      expect(user.favoritings).to_not include unfavorited_favoriting
    end

    it 'does not add the same favoriting twice' do
      user.add_favoriting(favorited_favoriting)
      expect(user.favoritings).to include favorited_favoriting

      expect { user.add_favoriting(favorited_favoriting) }.to_not change { user.favoritings }
    end
  end
end
