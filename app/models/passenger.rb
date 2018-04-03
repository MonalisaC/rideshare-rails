class Passenger < ApplicationRecord
  has_many :trips

  def display_rides_taken
    get_rides_taken.each do |trip|
      puts "Trip id: #{link_to trip.id, trip_path(trip.id)}"
      puts "Date: #{trip.date}"
      puts "Driver: #{trip.driver.name}"
      puts "Cost: #{trip.cost}"
      puts "Rating: #{trip.rating}"
    end
  end

  def get_rides_taken
    return find_rides_taken
  end

  def get_total_charged
    return calculate_total_charged
  end

  private

  def find_rides_taken
    return self.trips.where.not(rating: nil)
  end

  def calculate_total_charged
    trips = self.get_rides_taken
    return trips.inject(0.0) { |sum, trip| sum + trip.cost}
  end

end
