class Person
  # Look at the above CSV file
  # What attributes should a Person object have?
end

class PersonParser
  attr_reader :file

  def initialize(file)
    @file = file
    @people = []
  end

  def people
    # If we've already parsed the CSV file, don't parse it again.
    return @people if @people

    # We've never called people before, now parse the CSV file
    # and return an Array of Person objects here.  Save the
    # Array in the @people instance variable.
  end

  def save
  end

  def save_as_yaml
  end

  def save_as_json
  end
end
