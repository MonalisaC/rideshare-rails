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
    return '%.2f' % calculate_average_rating
  end

  # Returns
  def get_total_earnings
    #  '%.2f' is needed in case driver has not earned anything
    return '%.2f' % calculate_total_earning
  end

  def get_earned_amount(cost)
    raise ArgumentError.new("Invalid cost") if !cost.is_a?(Float)
    return get_earning_after_fee(cost).round(2)
  end

  def get_status
    return is_available && !has_in_progress_trip ? "Available" : "Unavailable"
  end

  def has_in_progress_trip
    return trips.any? { |trip| !trip.is_complete? }
  end

  private

  def has_only_completed_trips?
    return self.trips.any? { |trip| !trip.is_complete? }
  end

  def find_completed_trips
    return self.trips.select { |trip| trip.is_complete? }
  end

  def calculate_average_rating
    completed_trips = get_completed_trips
    return completed_trips.inject(0.0) { |sum, trip| sum + trip.rating } / completed_trips.size
  end

  def calculate_total_earning
    completed_trips = get_completed_trips
    return completed_trips.inject(0.0) { |sum, trip| sum + get_earned_amount(trip.cost_usd) }
  end

  def get_earning_after_fee(cost)
    return cost < TRIP_FEE ? 0.00 : (cost - TRIP_FEE) * 0.8
  end

end
