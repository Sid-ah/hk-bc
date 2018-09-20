require_relative 'car'
require_relative 'car_loader'
require_relative 'dealership'

cars = CarLoader.get_cars_from_csv("inventory.csv")
dealership = Dealership.new(cars)

if ARGV[0] == "list"
    # print all of the cars on Deano's lot
    puts dealership.cars

elsif ARGV[0] == "search"
  if ARGV[1] == "make"
    # print cars of the make supplied in ARGV[2]
    puts dealership.find_make(ARGV[2])
  elsif ARGV[1] == "pre"
    # print cars made before the year supplied in ARGV[2]
  elsif ARGV[1] == "post"
    # print cars made after the year supplied in ARGV[2]
  end
end
