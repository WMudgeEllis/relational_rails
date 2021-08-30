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
end
# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information