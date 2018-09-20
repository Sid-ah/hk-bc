class Product
  attr_reader :name, :description, :reviews

  def initialize(args)
    @name = args.fetch(:name)
    @description = args.fetch(:description)
    @reviews = Array.new
  end

  def add_review(review)
    if product_being_reviewed?(review) && new_review?(review)
      reviews << review
    end
  end

  private
  def product_being_reviewed?(review)
    self == review.product
  end

  def new_review?(review)
    !reviews.include?(review)
  end
end
