require 'date'

class Student
  attr_accessor :first_name, :last_name, :gender, :email, :phone
  attr_reader :birthday

  def initialize(args = {})
    self.first_name = args[:first_name]
    self.last_name  = args[:last_name]
    self.gender     = args[:gender]
    self.email      = args[:email]
    self.phone      = args[:phone]
    self.birthday   = args[:birthday]
  end

  def birthday=(date_string)
    @birthday = Date.parse(date_string)
  end
end
