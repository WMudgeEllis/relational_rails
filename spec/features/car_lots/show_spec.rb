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

  it 'updates car lot information' do 
    lot = CarLot.create!(name: "Michael's Bummer Dealz", being_cleaned: false, lot_area: 310)
    
    visit "/car_lots/#{lot.id}"
    expect(page).to have_link("update car lot")
    click_link 'update car lot'
    expect(page.current_path).to eq("/car_lots/#{lot.id}/edit") 
    fill_in :name, with: 'Toys Yotas'
    fill_in :lot_area, with: 7589
    click_button 'submit'
    expect(page.current_path).to eq("/car_lots/#{lot.id}")
    expect(page).to have_content('Yotas')
    expect(page).to have_content(7589)
  end
end
