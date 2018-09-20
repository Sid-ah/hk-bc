class ProductReviewsView
  attr_reader :product

  def initialize(product)
    @product = product
  end

  def to_s
    <<-TEXT.gsub(/^ */, '')
    REVIEWS FOR #{product.name.upcase}

    #{product.reviews.map { |review| review_text(review) }.join("\n\n")}


    TEXT
  end

  private
  def review_text(review)
    "#{review.author.username.upcase} (score: #{review.score})\n#{review.description}"
  end
end
