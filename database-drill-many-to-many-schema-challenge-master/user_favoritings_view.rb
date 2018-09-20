class UserFavoritingsView
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def to_s
    <<-TEXT.gsub(/^ */, '')
    REVIEWS FAVORITED BY #{user.username.upcase}

    #{user.favoritings.map { |favoriting| favoriting_text(favoriting) }.join("\n\n")}


    TEXT
  end

  private
  def favoriting_text(favoriting)
    "#{favoriting.review.author.username.upcase} reviewed #{favoriting.review.product.name.upcase} (score: #{favoriting.review.score})\n#{favoriting.review.description}"
  end
end
