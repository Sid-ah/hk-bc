require_relative 'person'
require_relative 'person_parser'


if ARGV.any?
  # Parse the data in the csv file into ruby objects
  people = PersonParser.parse('people.csv')


  # Parse the command line arguments
  command = ARGV.first
  options = ARGV[1..-1]


  case command
  when "area code"
    then
      area_code = options.first
      people_in_area_code = people.select { |person| person.area_code?(area_code) }

      puts "The following people have phone numbers from area code #{area_code}."
      people_in_area_code.each { |person| puts person.full_name }
  when "last name"
    then
      # Implement search by last name (e.g., "Smith").
  when "email domain"
    then
      # Implement search by email domain (e.g., "gmail.com").
  when "born after"
    then
      # Implement search for people born after a given year (e.g., "1980")
  else
    puts "Unsupported command '#{command}'."
  end
end
