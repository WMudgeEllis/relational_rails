require "rails_helper"

RSpec.describe 'updates vehicles', type: :feature do
  it 'edits vehicles' do
    fly_guys = CarLot.create!(name: "Fly Rydes", being_cleaned: true, lot_area: 1200)
    car = Vehicle.create!(name: 'Toyota Yaris', sold: true, price: 7500, car_lot_id: fly_guys.id)
    visit "/vehicles/#{car.id}/edit"
    fill_in :name, with: "Mustang Sally"
    fill_in :price, with: 4500
    click_button "submit"
    expect(current_path).to eq("/vehicles/#{car.id}")
    expect(page).to have_content("Sally")
    expect(page).to have_content(4500)
  end
end