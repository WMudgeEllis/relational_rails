require "rails_helper"

RSpec.describe 'makes new vehicles', type: :feature do
  it 'creates a new vehicle' do
    fly_guys = CarLot.create!(name: "Fly Rydes", being_cleaned: true, lot_area: 1200)
    visit "/car_lots/#{fly_guys.id}/vehicles/new"
    fill_in :name, :with => "John Deere"
    fill_in :price, :with => 45000
    click_button "submit"
    expect(current_path).to eq("/car_lots/#{fly_guys.id}/vehicles")
    expect(page).to have_content("John")
    expect(page).to have_content("45000")
  end
end