class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  def cost_usd
    return (cost/100.00).round(2)
  end

end
