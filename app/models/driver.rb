class Driver < ApplicationRecord
  has_many :trips

  def get_completed_trips
   return self.trips.where.not(rating: nil)
  end

  def get_average_rating
    trips = self.get_completed_trips
    return trips.inject(0.0) { |sum, trip| sum + trip.rating } / trips.size
  end

  def get_average_pay
  end

end
