require "rails_helper"

describe Bookshelf, type: :model do
  # describe "validations" do
  #   it {should have_many(:books)}
  # end

  it 'can sort by created at' do
    shelf1 = Bookshelf.create!(name: "Mahogany", full: true, capacity: 31)
    shelf2 = Bookshelf.create!(name: "Cherry Wood", full: true, capacity: 31, created_at: Date.tomorrow)

    expect(Bookshelf.sort_by_created_at.first).to eq(shelf2)

  end
end
