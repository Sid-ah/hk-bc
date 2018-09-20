class Guess < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :round
  belongs_to :card 

  validates :guess_body, presence: true 
end
