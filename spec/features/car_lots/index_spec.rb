require "rails_helper"

RSpec.describe 'the car_lot index page', type: :feature do
  it 'can see all vehicle names' do
    car2 = CarLot.create!(name: "Late Comer Deals", being_cleaned: false, lot_area: 310)
    car1 = CarLot.create!(name: "Michael's Bummer Dealz", being_cleaned: false, lot_area: 310, created_at: Date.tomorrow)


    visit '/car_lots'

    expect(page).to have_content(car1.name)
    expect(page).to have_content(car1.created_at)
    expect(page.all(:css, "p")[0].text.include?("Dealz")).to be(true)
  end
end
