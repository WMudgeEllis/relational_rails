require "rails_helper"

RSpec.describe 'vehicle details show page' do
  it 'shows vehicle and its attributes' do
    fly_guys = CarLot.create!(name: "Fly Rydes", being_cleaned: true, lot_area: 1200)
    car = Vehicle.create!(name: 'Toyota Yaris', sold: true, price: 7500, car_lot_id: fly_guys.id)

    visit "/vehicles/#{car.id}"

    expect(page).to have_content(car.name)
    expect(page).to have_content(car.sold)
    expect(page).to have_content(car.price)
    expect(page).to have_content(car.car_lot_id)
    expect(page).to have_content(car.id)
  end

  it 'links to update vehicle' do
    fly_guys = CarLot.create!(name: "Fly Rydes", being_cleaned: true, lot_area: 1200)
    car = Vehicle.create!(name: 'Toyota Yaris', sold: true, price: 7500, car_lot_id: fly_guys.id)
    visit "vehicles/#{car.id}"
    expect(page).to have_link("update vehicle")
    click_link "update vehicle"
    expect(current_path).to eq("/vehicles/#{car.id}/edit")
  end

  it 'deletes a vehicle' do
    fly_guys = CarLot.create!(name: "Fly Rydes", being_cleaned: true, lot_area: 1200)
    car1 = Vehicle.create!(name: 'Toyota Yaris', sold: true, price: 7500, car_lot_id: fly_guys.id)
    car2 = Vehicle.create!(name: 'Toyota Taco', sold: true, price: 17500, car_lot_id: fly_guys.id)
    visit "/vehicles/#{car1.id}"
    expect(page).to have_link('delete vehicle')
    click_link "delete vehicle"
    expect(current_path).to eq("/vehicles")
    expect(page).to_not have_content("Yaris")
    expect(page).to have_content("Taco")
  end
end
