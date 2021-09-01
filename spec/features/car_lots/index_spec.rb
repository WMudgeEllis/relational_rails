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

  it 'can link to new car lots' do 
    visit '/car_lots' 
    expect(page).to have_link("new car lot")
    click_link "new car lot"
    expect(page.current_path).to eq('/car_lot/new')
    fill_in :name, with: "Weslas Teslas"
    fill_in :lot_area, with: 1234
    click_button "submit"
    lot = CarLot.last
    expect(page).to have_content(lot.name)
  end

  it 'can link you to edit car lot' do 
    lot1 = CarLot.create!(name: "Michael's Bummer Dealz", being_cleaned: false, lot_area: 310)
    lot2 = CarLot.create!(name: "Late Comer Deals", being_cleaned: false, lot_area: 310)
    visit "/car_lots"
    expect(page).to have_link("edit #{lot1.name}")
    expect(page).to have_link("edit #{lot2.name}")
    click_link lot1.name
    expect(current_path).to eq("/car_lots/#{lot1.id}/edit")
  end
end
# User Story 17, Parent Update From Parent Index Page (x2)

# As a visitor
# When I visit the parent index page
# Next to every parent, I see a link to edit that parent's info
# When I click the link
# I should be taken to that parents edit page where I can update its information just like in User Story 4