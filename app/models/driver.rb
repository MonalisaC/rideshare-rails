# TODO: less expensive way to do the trips thing than calling it every time??
# TODO: should trips be handling the cost logic?
# TODO: rounding with float issues. How to resolve? Make into Money?

class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true

  TRIP_FEE = 1.65

  # Returns all the completed trips for the driver
  def get_completed_trips
   return find_completed_trips
  end

  #
  def get_average_rating
    return calculate_average_rating#.round(2)
  end

  # Returns
  def get_total_earnings
    #  '%.2f' is needed in case driver has not earned anything
    return '%.2f' % calculate_total_earning
  end

  def get_earning_from_cost(cost)
    raise ArgumentError.new("Invalid cost") if !cost.is_a?(Float)
    return get_earning_after_fee(cost).round(2)
  end

  def is_new_driver?
    return get_completed_trips.empty?
  end

  private

  def find_completed_trips
    return self.trips.where.not(rating: nil)
  end

  def calculate_average_rating
    trips = self.get_completed_trips
    return "-" if trips.empty?
    return trips.inject(0.0) { |sum, trip| sum + trip.rating } / trips.size
  end

  def calculate_total_earning
    trips = self.get_completed_trips
    return trips.inject(0.0) { |sum, trip| sum + get_earning_from_cost(trip.cost_usd) }
  end

  def get_earning_after_fee(cost)
    return cost < TRIP_FEE ? 0.00 : (cost - TRIP_FEE) * 0.8
  end

end
