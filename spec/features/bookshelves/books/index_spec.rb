#
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:

require 'rails_helper'


RSpec.describe 'Bookshelf books page' do

  it 'displays book details' do
    shelf1 = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)
    shelf2 = Bookshelf.create!(name: "DIFFERENT", full: false, capacity: 22)
    book1 = Book.create!(name: "Feet of Clay", author: 'Terry Pratchett', read: false, read_time: 7, bookshelf_id: shelf1.id)
    book2 = Book.create!(name: "Three Guineas", author: 'Virginia Woolf', read: false, read_time: 17, bookshelf_id: shelf1.id)
    book3 = Book.create!(name: "Three Guineas", author: 'Virginia Woolf', read: false, read_time: 17, bookshelf_id: shelf2.id)


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
  end


end
