class User
  attr_reader :email, :username, :reviews, :favoritings

  def initialize(args)
    @email = args.fetch(:email)
    @username = args.fetch(:username)
    @reviews = Array.new
    @favoritings = Array.new
  end

  def add_review(review)
    if author?(review) && new_review?(review)
      reviews << review
    end
  end

  def add_favoriting(favoriting)
    if favoritor?(favoriting) && new_favoriting?(favoriting)
      favoritings << favoriting
    end
  end

  private
  def author?(authorable)
    self == authorable.author
  end

  def new_review?(review)
    !reviews.include?(review)
  end

  def favoritor?(favoritable)
    self == favoritable.favoritor
  end

  def new_favoriting?(favoriting)
    !favoritings.include?(favoriting)
  end
end
