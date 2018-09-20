class Person < ActiveRecord::Base
  has_many :dogs, { foreign_key: :owner_id }
  has_many :ratings, { foreign_key: :judge_id }
end
