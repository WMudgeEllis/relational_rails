require "rails_helper"

RSpec.describe 'book details show page', type: :feature do
  it 'shows details of a particular book' do
    shelf = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)
    book = Book.create!(name: "Feet of Clay", read: false, read_time: 7, bookshelf_id: shelf.id)

    visit "/books/#{book.id}"
    
    expect(page).to have_content(book.name)
    expect(page).to have_content(book.read)
    expect(page).to have_content(book.read_time)
    expect(page).to have_content(book.bookshelf_id)
    expect(page).to have_content(book.id)
    expect(page).to have_content(book.created_at)
    expect(page).to have_content(book.updated_at)
  end
end