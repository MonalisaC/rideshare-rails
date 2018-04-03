# TODO: less expensive way to do the trips thing than calling it every time??
# TODO: should trips be handling the cost logic?

class Driver < ApplicationRecord
  has_many :trips

  TRIP_FEE = 1.65

  # Returns all the completed trips for the driver
  def get_completed_trips
   return find_completed_trips
  end

  #
  def get_average_rating
    return calculate_average_rating
  end

  # Returns
  def get_total_earnings

  end

  def get_earning_from_cost(cost)
    raise ArgumentError.new("Invalid cost") if !cost.is_a?(Integer)
    return '%.2f' % (get_earning_after_fee(cost) / 100)
  end


  private

  def find_completed_trips
    return self.trips.where.not(rating: nil)
  end

  def calculate_average_rating
    trips = self.get_completed_trips
    return trips.inject(0.0) { |sum, trip| sum + trip.rating } / trips.size
  end

  def calculate_total_earning
    trips = self.get_completed_trips
    return trips.inject(0.0) { |sum, trip| sum + get_earning_after_fee(trip.cost) }
  end

  def get_earning_after_fee(cost)
    return cost < TRIP_FEE ? 0.0 : (cost - TRIP_FEE) * 0.8
  end

end
