require "rails_helper"

RSpec.describe 'updates book information', type: :feature do
  it 'updates books' do
    shelf = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)
    book = Book.create!(name: "Feet of Clay", author: 'Terry Pratchett', read: false, read_time: 7, bookshelf_id: shelf.id)
    visit "/books/#{book.id}/edit"
    fill_in :name, with: "Green Eggs and Ham"
    fill_in :author, with: "Dr. Suess"
    fill_in :read_time, with: 3 
    click_button "submit"
    expect(current_path).to eq "/books/#{book.id}"
    expect(page).to have_content("Eggs")
    expect(page).to have_content("Suess")
    expect(page).to have_content(3)
  end
end