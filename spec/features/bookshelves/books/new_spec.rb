require "rails_helper"

RSpec.describe 'creates new book', type: :feature do
  it 'creates a new book' do 
    shelf = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)
    visit "/bookshelves/#{shelf.id}/books/new"
    fill_in :name, with: "Feet of Clay"
    fill_in :author, with: "Terry Pratchett"
    fill_in :read_time, with: 7
    click_button "submit"
    expect(current_path).to eq("/bookshelves/#{shelf.id}/books")
    expect(page).to have_content("Feet")
    expect(page).to have_content("Terry")
    expect(page).to have_content(7)
  end
end