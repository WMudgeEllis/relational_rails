require "rails_helper"

RSpec.describe 'a particular car lot', type: :feature do
  it 'shows parent and all attributes' do
    lot = CarLot.create!(name: "Michael's Bummer Dealz", being_cleaned: false, lot_area: 310)
    car1 = Vehicle.create!(name: 'Toyota Yaris', sold: true, price: 7500, car_lot_id: lot.id)
    car2 = Vehicle.create!(name: 'Chevrolet Silverado', sold: true, price: 10000, car_lot_id: lot.id)


    visit "/car_lots/#{lot.id}"

    expect(page).to have_content(lot.id)
    expect(page).to have_content(lot.name)
    expect(page).to have_content(lot.being_cleaned)
    expect(page).to have_content(lot.lot_area)
    expect(page).to have_content(lot.created_at)
    expect(page).to have_content(lot.updated_at)
    expect(page).to have_content('the number of vehicles in this car lot is: 2')

    car3 = Vehicle.create!(name: 'Ford Escape', sold: true, price: 10000, car_lot_id: lot.id)

    visit "/car_lots/#{lot.id}"

    expect(page).to have_content('the number of vehicles in this car lot is: 3')

  end
end
