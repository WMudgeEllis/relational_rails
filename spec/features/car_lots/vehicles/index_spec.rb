require 'rails_helper'

RSpec.describe 'car lot vehicle index page', type: :feature do

  it 'shows attributes of vehicles by car_lot' do
    fly_guys = CarLot.create!(name: "Fly Rydes", being_cleaned: true, lot_area: 1200)
    bummer = CarLot.create!(name: "Michael'z bummer dealz", being_cleaned: false, lot_area: 120)
    car1 = Vehicle.create!(name: 'Toyota Yaris', sold: true, price: 7500, car_lot_id: fly_guys.id)
    car2 = Vehicle.create!(name: 'Chevrolet Silverado', sold: true, price: 10000, car_lot_id: fly_guys.id)
    car3= Vehicle.create!(name: 'Junkerado', sold: false, price: 600, car_lot_id: bummer.id)

    visit "/car_lots/#{fly_guys.id}/vehicles"

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

  it 'links to create new' do
    fly_guys = CarLot.create!(name: "Fly Rydes", being_cleaned: true, lot_area: 1200)
    visit "/car_lots/#{fly_guys.id}/vehicles"
    expect(page).to have_link("create new vehicle")
    click_link "create new vehicle"
    expect(page.current_path).to eq("/car_lots/#{fly_guys.id}/vehicles/new")
  end

  it 'should alphabetize the order of vehicles' do
    fly_guys = CarLot.create!(name: "Fly Rydes", being_cleaned: true, lot_area: 1200)
    car1 = Vehicle.create!(name: 'Toyota Yaris', sold: true, price: 7500, car_lot_id: fly_guys.id)
    car2 = Vehicle.create!(name: 'Chevrolet Silverado', sold: false, price: 10000, car_lot_id: fly_guys.id)

    visit "/car_lots/#{fly_guys.id}/vehicles"

    expect(car1.name).to appear_before(car2.name)
    expect(page).to have_link("alphabetize")

    click_link("alphabetize")

    expect(current_path).to eq("/car_lots/#{fly_guys.id}/vehicles")
    expect(car2.name).to appear_before(car1.name)
  end

  it 'filters vehicles by price' do
    fly_guys = CarLot.create!(name: "Fly Rydes", being_cleaned: true, lot_area: 1200)
    car1 = Vehicle.create!(name: 'Toyota Yaris', sold: true, price: 7500, car_lot_id: fly_guys.id)
    car2 = Vehicle.create!(name: 'Chevrolet Silverado', sold: true, price: 10000, car_lot_id: fly_guys.id)

    visit "/car_lots/#{fly_guys.id}/vehicles"

    fill_in :budget, with: 8000

    click_button "Only return records with more than number of price"

    expect(current_path).to eq("/car_lots/#{fly_guys.id}/vehicles")
    expect(page).to have_content(car2.name)
    expect(page).to_not have_content(car1.name)
  end
end
