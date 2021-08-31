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
end
# User Story 13, Parent Child Creation (x2)

# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed




# if update, then redirect.. else error message 
# flash message 
#   this is the page for "any view" to DRY up code
#   flash message in "body" 
# use this page for header/footer