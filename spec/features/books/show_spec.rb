require "rails_helper"

RSpec.describe 'book details show page', type: :feature do
  it 'shows details of a particular book' do
    shelf = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)
    book = Book.create!(name: "Feet of Clay", author: 'Terry Pratchet', read: false, read_time: 7, bookshelf_id: shelf.id)

    visit "/books/#{book.id}"

    expect(page).to have_content(book.name)
    expect(page).to have_content(book.author)
    expect(page).to have_content(book.read)
    expect(page).to have_content(book.read_time)
    expect(page).to have_content(book.bookshelf_id)
    expect(page).to have_content(book.id)
    expect(page).to have_content(book.created_at)
    expect(page).to have_content(book.updated_at)
  end

  it 'can link to a update page' do
    shelf = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)
    book = Book.create!(name: "Feet of Clay", author: 'Terry Pratchett', read: false, read_time: 7, bookshelf_id: shelf.id)
    visit "/books/#{book.id}"
    expect(page).to have_link "update book"
    click_link "update book"
    expect(current_path).to eq("/books/#{book.id}/edit")
  end

  it 'can delete a book' do
    shelf = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)
    book = Book.create!(name: "Feet of Clay", author: 'Terry Pratchett', read: true, read_time: 7, bookshelf_id: shelf.id)

    visit "/books/#{book.id}"

    expect(page).to have_link('Delete Book')
    click_link 'Delete Book'

    expect(current_path).to eq("/books")
    expect(page).to_not have_content(book.name)
  end
end
