class Post < ActiveRecord::Base
  has_many :votes

  def points
    votes.sum(:value)
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
