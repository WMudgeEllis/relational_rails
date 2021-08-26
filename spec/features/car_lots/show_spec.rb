require "rails_helper"

RSpec.describe 'a particular car lot', type: :feature do
  it 'shows parent and all attributes' do
    car = CarLot.create!(name: "Michael's Bummer Dealz", being_cleaned: false, lot_area: 310)

    visit "/car_lots/#{car.id}"

    expect(page).to have_content(car.id)
    expect(page).to have_content(car.name)
    expect(page).to have_content(car.being_cleaned)
    expect(page).to have_content(car.lot_area)
    expect(page).to have_content(car.created_at)
    expect(page).to have_content(car.updated_at)
  end
end