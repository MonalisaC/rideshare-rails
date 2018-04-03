class Driver < ApplicationRecord
  has_many :trips

  # TODO:

  def get_completed_trips
   return self.trips.where.not(rating: nil)
   # first_book = books_with_year.order(publication_date: :asc).first
   # return first_book.publication_date
  end

  # def get_average_rating
  #   trips = self.get_completed_trips
  #   return trips.inject(0.0) { |sum, trip| sum + trip.rating } / trips.size
  # end

end
