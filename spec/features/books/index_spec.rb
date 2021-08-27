require "rails_helper"

RSpec.describe 'book index page', type: :feature do
  it 'shows book and all associated attributes' do
    shelf = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)
    book1 = Book.create!(name: "Feet of Clay", author: 'Terry Pratchett', read: false, read_time: 7, bookshelf_id: shelf.id)
    book2 = Book.create!(name: "Three Guineas", author: 'Virginia Woolf', read: false, read_time: 17, bookshelf_id: shelf.id)

    visit '/books'

    expect(page).to have_content(book1.name)
    expect(page).to have_content(book2.name)
    expect(page).to have_content(book1.author)
    expect(page).to have_content(book2.author)
    expect(page).to have_content(book1.read)
    expect(page).to have_content(book2.read)
    expect(page).to have_content(book1.read_time)
    expect(page).to have_content(book2.read_time)
    expect(page).to have_content(book1.bookshelf_id)
    expect(page).to have_content(book2.bookshelf_id)
    expect(page).to have_content(book1.id)
    expect(page).to have_content(book2.id)
  end
end
