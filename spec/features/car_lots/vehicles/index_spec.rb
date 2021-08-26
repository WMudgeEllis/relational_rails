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

end
