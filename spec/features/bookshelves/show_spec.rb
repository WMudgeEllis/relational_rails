require "rails_helper"

RSpec.describe 'a particular bookshelf page', type: :feature do
  it 'shows parent and all attributes' do
    shelf = Bookshelf.create!(name: "Mahogany", full: true, capacity: 31)
    
    visit "/bookshelves/#{shelf.id}"

    expect(page).to have_content(shelf.id)
    expect(page).to have_content(shelf.name)
    expect(page).to have_content(shelf.capacity)
    expect(page).to have_content(shelf.full)
    expect(page).to have_content(shelf.created_at)
    expect(page).to have_content(shelf.updated_at)
  end
end