require "rails_helper"

RSpec.describe 'vehicles index page' do
  it 'should show all vehicles and their associated attributes' do
    fly_guys = CarLot.create!(name: "Fly Rydes", being_cleaned: true, lot_area: 1200)
    car1 = Vehicle.create!(name: 'Toyota Yaris', sold: true, price: 7500, car_lot_id: fly_guys.id)
    car2 = Vehicle.create!(name: 'Chevrolet Silverado', sold: true, price: 10000, car_lot_id: fly_guys.id)

    visit '/vehicles'

    expect(page).to have_content(car1.name)
    expect(page).to have_content(car2.name)
    expect(page).to have_content(car1.sold)
    expect(page).to have_content(car2.sold)
    expect(page).to have_content(car1.price)
    expect(page).to have_content(car2.price)
    expect(page).to have_content(car1.car_lot_id)
    expect(page).to have_content(car2.car_lot_id)
    expect(page).to have_content(car1.id)
    expect(page).to have_content(car2.id)
  end

  it 'should return only sold vehicles' do
    fly_guys = CarLot.create!(name: "Fly Rydes", being_cleaned: true, lot_area: 1200)
    car1 = Vehicle.create!(name: 'Toyota Yaris', sold: true, price: 7500, car_lot_id: fly_guys.id)
    car2 = Vehicle.create!(name: 'Chevrolet Silverado', sold: false, price: 10000, car_lot_id: fly_guys.id)
    visit "/vehicles"
    expect(page).to have_content("Toyota")
    expect(page).to_not have_content("Silverado")
  end

  it 'filters vehicles by price' do
    fly_guys = CarLot.create!(name: "Fly Rydes", being_cleaned: true, lot_area: 1200)
    car1 = Vehicle.create!(name: 'Toyota Yaris', sold: true, price: 7500, car_lot_id: fly_guys.id)
    car2 = Vehicle.create!(name: 'Chevrolet Silverado', sold: true, price: 10000, car_lot_id: fly_guys.id)
    visit "/vehicles"
    fill_in :budget, with: 8000
    click_button "Only return records with more than number of price"
    expect(current_path).to eq('/vehicles')
    expect(page).to have_content(car2.name)
    expect(page).to_not have_content(car1.name)
  end
end
