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