class UserReviewsView
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def to_s
    <<-TEXT.gsub(/^ */, '')
    REVIEWS BY #{user.username.upcase}

    #{user.reviews.map { |review| review_text(review) }.join("\n\n")}


    TEXT
  end

  private
  def review_text(review)
    "#{review.product.name.upcase} (score: #{review.score})\n#{review.description}"
  end
end
