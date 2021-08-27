require "rails_helper"

describe CarLot, type: :model do
  # describe "validations" do
  #   it {should have_many(:vehicles)}
  # end
  it 'can sort by date' do
    lot2 = CarLot.create!(name: "Late Comer Deals", being_cleaned: false, lot_area: 310)
    lot1 = CarLot.create!(name: "Michael's Bummer Dealz", being_cleaned: false, lot_area: 310, created_at: Date.tomorrow)


    # require "pry"; binding.pry

    expect(CarLot.sort_by_created_at.first).to eq(lot1)
  end

end
