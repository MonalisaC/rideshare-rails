class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :date, presence: true
  validates_inclusion_of :rating, in: (1..5), allow_nil: true
  validates :cost, presence: true, numericality: { only_integer: true }
  validates :driver_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :passenger_id, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def cost_usd
    return (cost/100.00).round(2)
  end

  def is_complete?
    return !self.rating.nil?
  end

end
