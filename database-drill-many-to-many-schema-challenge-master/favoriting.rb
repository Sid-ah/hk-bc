class Favoriting
  attr_reader :favoritor, :review

  def initialize(args)
    @favoritor = args.fetch(:favoritor)
    @review = args.fetch(:review)

    add_self_to_favoritors_favoritings
    add_self_to_reviews_favoritings
  end

  private
  def add_self_to_favoritors_favoritings
    favoritor.favoritings << self
  end

  def add_self_to_reviews_favoritings
    review.favoritings << self
  end
end
