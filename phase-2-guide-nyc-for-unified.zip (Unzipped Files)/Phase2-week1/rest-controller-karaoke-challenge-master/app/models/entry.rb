class Entry < ActiveRecord::Base
  validates :singer, :song_title, { presence: true, length: { maximum: 64 } }
end
