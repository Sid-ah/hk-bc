class Dealership
  def initialize(cars = [])
    @cars = cars
  end

  def find_make(make)
    cars_by_make = []
    @cars.each do |car|
      cars_by_make << car if car.make == make
    end
    cars_by_make
  end
end
