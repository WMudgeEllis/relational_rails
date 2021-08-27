class CarLot < ActiveRecord::Base
  has_many :vehicles

  def self.sort_by_created_at
    order(:created_at).reverse
  end

end
