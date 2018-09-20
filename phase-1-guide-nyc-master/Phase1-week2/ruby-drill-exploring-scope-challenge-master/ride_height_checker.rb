PARK_NAME = "Cedar Point"

module RideHeightChecker
  # Heights given in inches
  ROLLER_COASTER_MINIMUM_HEIGHT = 52
  THRILL_RIDE_MINIMUM_HEIGHT = 48
  FAMILY_RIDE_MINIMUM_HEIGHT = 44
  DEFAULT_MINIMUM_HEIGHT = 36

  def self.rider_permitted?(rider, ride)
    rider.height >= minimum_height_for_ride(ride)
  end

  private
  def self.minimum_height_for_ride(ride)
    ride.minimum_height || minimum_height_for_type(ride.type)
  end

  def self.minimum_height_for_type(ride_type)
    case ride_type
    when :coaster then ROLLER_COASTER_MINIMUM_HEIGHT
    when :thrill  then THRILL_RIDE_MINIMUM_HEIGHT
    when :family  then FAMILY_RIDE_MINIMUM_HEIGHT
    else DEFAULT_MINIMUM_HEIGHT
    end
  end
end
