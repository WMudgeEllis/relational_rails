class Vehicle < ApplicationRecord
  belongs_to :car_lot

  def self.only_sold
    Vehicle.where(sold: true)
  end
end