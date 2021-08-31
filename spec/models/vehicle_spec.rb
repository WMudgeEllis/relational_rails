require "rails_helper"

describe Vehicle, type: :model do
  it 'returns only true' do 
    fly_guys = CarLot.create!(name: "Fly Rydes", being_cleaned: true, lot_area: 1200)
    car1 = Vehicle.create!(name: 'Toyota Yaris', sold: true, price: 7500, car_lot_id: fly_guys.id)
    car2 = Vehicle.create!(name: 'Chevrolet Silverado', sold: false, price: 10000, car_lot_id: fly_guys.id)
    expect(Vehicle.only_sold).to eq([car1])
  end
end