require "rails_helper"

describe CarLot, type: :model do
  # describe "validations" do
  #   it {should have_many(:vehicles)}
  # end
  it 'can sort by date' do
    lot2 = CarLot.create!(name: "Late Comer Deals", being_cleaned: false, lot_area: 310)
    lot1 = CarLot.create!(name: "Michael's Bummer Dealz", being_cleaned: false, lot_area: 310, created_at: Date.tomorrow)

    expect(CarLot.sort_by_created_at.first).to eq(lot1)
  end

  it 'counts how many cars are in the lot' do
  lot = CarLot.create!(name: "Michael's Bummer Dealz", being_cleaned: false, lot_area: 310)
  car1 = Vehicle.create!(name: 'Toyota Yaris', sold: true, price: 7500, car_lot_id: lot.id)
  car2 = Vehicle.create!(name: 'Chevrolet Silverado', sold: true, price: 10000, car_lot_id: lot.id)

  expect(lot.number_of_vehicles).to eq(2)
  end

end
