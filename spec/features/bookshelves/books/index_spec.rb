
require 'rails_helper'

RSpec.describe 'Bookshelf books page', type: :feature do

  it 'displays book details' do
    shelf1 = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)
    shelf2 = Bookshelf.create!(name: "DIFFERENT", full: false, capacity: 22)
    book1 = Book.create!(name: "Feet of Clay", author: 'Terry Pratchett', read: false, read_time: 7, bookshelf_id: shelf1.id)
    book2 = Book.create!(name: "Three Guineas", author: 'Virginia Woolf', read: false, read_time: 17, bookshelf_id: shelf1.id)
    book3 = Book.create!(name: "Sleepz for Dymmies", author: 'Sleep Meister Main', read: false, read_time: 17, bookshelf_id: shelf2.id)


    visit "/bookshelves/#{shelf1.id}/books"

    expect(page).to have_content(book1.name)
    expect(page).to have_content(book1.author)
    expect(page).to have_content(book1.read)
    expect(page).to have_content(book1.read_time)
    expect(page).to have_content(book1.bookshelf_id)
    expect(page).to have_content(book1.created_at)
    expect(page).to have_content(book1.updated_at)

    expect(page).to have_content(book2.name)
    expect(page).to have_content(book2.author)
    expect(page).to have_content(book2.read)
    expect(page).to have_content(book2.read_time)
    expect(page).to have_content(book2.bookshelf_id)
    expect(page).to have_content(book2.created_at)
    expect(page).to have_content(book2.updated_at)

    expect(page).to_not have_content(book3.name)
    expect(page).to_not have_content(book3.author)
  end

  it 'links to create new book' do
    shelf = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)

    visit "/bookshelves/#{shelf.id}/books"

    expect(page).to have_link "new book"

    click_link "new book"

    expect(current_path).to eq("/bookshelves/#{shelf.id}/books/new")
  end

  it 'links to alphabetical order' do
    shelf = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)
    book1 = Book.create!(name: "Feet of Clay", author: 'Terry Pratchett', read: false, read_time: 7, bookshelf_id: shelf.id)
    book2 = Book.create!(name: "Three Guineas", author: 'Virginia Woolf', read: false, read_time: 17, bookshelf_id: shelf.id)
    book3 = Book.create!(name: "The Republic", author: "Plato", read: true, read_time: 15, bookshelf_id: shelf.id)

    visit "/bookshelves/#{shelf.id}/books"

    expect(book2.name).to appear_before(book3.name)
    expect(page).to have_link('alphabetize')

    click_link 'alphabetize'

    expect(book3.name).to appear_before(book2.name)
    expect(book1.name).to appear_before(book3.name)
  end

  it 'links to book edit page' do
    shelf = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)
    book1 = Book.create!(name: "Green Eggs and Ham", author: 'Dr. Suess', read: true, read_time: 3, bookshelf_id: shelf.id)
    book2 = Book.create!(name: "Sleeping 4 Dummiez", author: 'Sleep Meister Mew', read: true, read_time: 17, bookshelf_id: shelf.id)

    visit "/bookshelves/#{shelf.id}/books"

    expect(page).to have_link("edit #{book1.name}")
    expect(page).to have_link("edit #{book2.name}")

    click_link "edit #{book1.name}"

    expect(current_path).to eq("/books/#{book1.id}/edit")
  end

  it 'deletes a bookshelf from index page' do
    shelf = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)
    book1 = Book.create!(name: "Green Eggs and Ham", author: 'Dr. Suess', read: true, read_time: 3, bookshelf_id: shelf.id)
    book2 = Book.create!(name: "Sleeping 4 Dummiez", author: 'Sleep Meister Mew', read: true, read_time: 17, bookshelf_id: shelf.id)

    visit "/bookshelves/#{shelf.id}/books"

    expect(page).to have_link("delete #{book1.name}")
    expect(page).to have_link("delete #{book2.name}")

    click_link "delete #{book1.name}"

    expect(current_path).to eq("/books")
    expect(page).to_not have_content(book1.name)
  end

  it 'can filter by read time' do
    shelf = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)
    book1 = Book.create!(name: "Green Eggs and Ham", author: 'Dr. Suess', read: true, read_time: 3, bookshelf_id: shelf.id)
    book2 = Book.create!(name: "Sleeping 4 Dummiez", author: 'Sleep Meister Mew', read: true, read_time: 17, bookshelf_id: shelf.id)

    visit "/bookshelves/#{shelf.id}/books"

    fill_in :min_time, with: 10

    click_button 'Only return records with more than number of read time'

    expect(current_path).to eq("/bookshelves/#{shelf.id}/books")
    expect(page).to have_content(book2.name)
    expect(page).to_not have_content(book1.name)
  end

end
