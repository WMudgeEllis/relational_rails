require "rails_helper"

RSpec.describe 'vehicle details show page' do
  it 'shows vehicle and its attributes' do
    fly_guys = CarLot.create!(name: "Fly Rydes", being_cleaned: true, lot_area: 1200)
    car = Vehicle.create!(name: 'Toyota Yaris', sold: true, price: 7500, car_lot_id: fly_guys.id)

    visit "/vehicles/#{car.id}"

    expect(page).to have_content(car.name)
    expect(page).to have_content(car.sold)
    expect(page).to have_content(car.price)
    expect(page).to have_content(car.car_lot_id)
    expect(page).to have_content(car.id)
  end

  it 'links to update vehicle' do
    fly_guys = CarLot.create!(name: "Fly Rydes", being_cleaned: true, lot_area: 1200)
    car = Vehicle.create!(name: 'Toyota Yaris', sold: true, price: 7500, car_lot_id: fly_guys.id)
    visit "vehicles/#{car.id}"
    expect(page).to have_link("update vehicle")
    click_link "update vehicle"
    expect(current_path).to eq("/vehicles/#{car.id}/edit")
  end
end
# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information