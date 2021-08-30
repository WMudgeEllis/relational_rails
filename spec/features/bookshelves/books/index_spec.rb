#
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:

require 'rails_helper'


RSpec.describe 'Bookshelf books page', type: :feature do

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

  it 'links to create new book' do
    shelf = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)
    visit "/bookshelves/#{shelf.id}/books"
    expect(page).to have_link "new book"
    click_link "new book"
    expect(current_path).to eq("/bookshelves/#{shelf.id}/books/new")
  end
end
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed