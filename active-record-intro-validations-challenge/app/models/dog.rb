class Dog < ActiveRecord::Base
  include USGeography

  belongs_to :owner, { class_name: "Person" }
  has_many :ratings

  # owner must point to a record that actually exists (Person object)
  validates :owner, { :presence => true }

  # name and license are required
  validates :name, :license, { :presence => true }

  # license must be unique for every dog
  validates :license, { :uniqueness => true }

  # license must start with two capital letters, a dash, then any characters
  validates :license, format: { with: /\A[A-Z]{2}\-/ }

  # age is not required, but if it's present, can't be less than 0
  validates :age, { :numericality => { greater_than_or_equal_to: 0 },
                    :allow_blank  => true }

  validate :license_from_valid_state

  def license_from_valid_state
    unless self.license.instance_of? String
      errors.add :license, "must be a string"
      return
    end

    abbreviation = self.license[0..1]
    unless valid_state_abbreviation? abbreviation
      errors.add :license, "must be from a valid US state"
    end
  end

end
