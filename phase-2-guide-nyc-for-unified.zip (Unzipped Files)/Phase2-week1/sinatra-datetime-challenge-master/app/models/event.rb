class Event < ActiveRecord::Base
  validates :name, presence: { message: "An event must have a name." }
  validates :location, presence: { message: "An event must have a location." }
  validates :starts_at, presence: { message: "An event must have a properly formatted starting date and time." }
end
