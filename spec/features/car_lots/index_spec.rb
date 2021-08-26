require "rails_helper"

RSpec.describe 'the car_lot index page', type: :feature do
  it 'can see all vehicle names' do
    car = CarLot.create!(name: "Michael's Bummer Dealz", being_cleaned: false, lot_area: 310)
    visit '/car_lots' 

    expect(page).to have_content(car.name)
  end
end