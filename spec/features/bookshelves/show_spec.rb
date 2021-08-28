require "rails_helper"

RSpec.describe 'a particular bookshelf page', type: :feature do
  it 'shows parent and all attributes' do
    shelf = Bookshelf.create!(name: "Mahogany", full: false, capacity: 31)
    book1 = Book.create!(name: "Feet of Clay", author: 'Terry Pratchett', read: false, read_time: 7, bookshelf_id: shelf.id)
    book2 = Book.create!(name: "Three Guineas", author: 'Virginia Woolf', read: false, read_time: 17, bookshelf_id: shelf.id)

    visit "/bookshelves/#{shelf.id}"

    expect(page).to have_content(shelf.id)
    expect(page).to have_content(shelf.name)
    expect(page).to have_content(shelf.capacity)
    expect(page).to have_content(shelf.full)
    expect(page).to have_content(shelf.created_at)
    expect(page).to have_content(shelf.updated_at)
    expect(page).to have_content('the number of books in this shelf is: 2')

    book3 = Book.create!(name: "Four Guineas", author: 'Virginia Woolfe', read: false, read_time: 20, bookshelf_id: shelf.id)

    visit "/bookshelves/#{shelf.id}"

    expect(page).to have_content('the number of books in this shelf is: 3')
  end

  it 'can updated bookshelf' do
    shelf = Bookshelf.create!(name: "Mahogany", full: false, capacity: 31)

    visit "/bookshelves/#{shelf.id}"
    expect(page).to have_link("update shelf")
    click_link "update shelf"
    expect(page.current_path).to eq "/bookshelves/#{shelf.id}/edit"
    fill_in :name, with: "Steel" 
    fill_in :capacity, with: 2000
    click_button "submit"

    expect(page.current_path).to eq "/bookshelves/#{shelf.id}"
    expect(page).to have_content("Steel")
    expect(page).to have_content(2000)
  end
end

# User Story 12, Parent Update (x2)

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info