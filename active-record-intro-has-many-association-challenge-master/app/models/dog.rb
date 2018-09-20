class Dog < ActiveRecord::Base
  belongs_to :owner, { class_name: "Person" }
  has_many :ratings
end
