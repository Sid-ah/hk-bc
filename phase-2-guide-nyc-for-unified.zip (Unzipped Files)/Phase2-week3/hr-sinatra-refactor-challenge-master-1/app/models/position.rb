class Position < ActiveRecord::Base
  belongs_to :user
  belongs_to :salary
  has_many :evaluations
end
