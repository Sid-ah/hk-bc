class Entry < ActiveRecord::Base
  validates :title, :body, { presence: true }

  def self.most_recent
    Entry.order(created_at: :desc).limit(5)
  end
end
