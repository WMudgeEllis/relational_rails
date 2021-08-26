require "rails_helper"

RSpec.describe 'the bookshelves index page', type: :feature do
  it 'can see all names' do
    shelf = Bookshelf.create!(name: "Mahogany", full: true, capacity: 31)
    visit '/bookshelves' 

    expect(page).to have_content(shelf.name)
  end
end