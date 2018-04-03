class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true, length: { in: 2..250 }
  validates :phone_num, presence: true, :uniqueness => true

  def get_rides_taken
    return find_rides_taken
  end

  def get_incomplete_trips
    return find_incomplete_trips
  end

  def get_total_charged
    return calculate_total_charged
  end

  private

  def find_rides_taken
    return self.trips.where.not(rating: nil)
  end

  def find_incomplete_trips
    return self.trips.where(rating: nil)
  end

  def calculate_total_charged
    trips = self.get_rides_taken
    return trips.inject(0.0) { |sum, trip| sum + trip.cost}
  end

end
