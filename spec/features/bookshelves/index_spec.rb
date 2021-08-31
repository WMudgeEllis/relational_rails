require "rails_helper"

RSpec.describe 'the bookshelves index page', type: :feature do
  it 'can see all names' do
    shelf1 = Bookshelf.create!(name: "Mahogany", full: true, capacity: 31)
    shelf2 = Bookshelf.create!(name: "Cherry Wood", full: true, capacity: 31, created_at: Date.tomorrow)

    visit '/bookshelves'

    expect(page).to have_content(shelf1.name)
    expect(page).to have_content(shelf2.created_at)
    expect(shelf2.name).to appear_before(shelf1.name)
  end

  it 'can link to new bookshelves' do
    visit '/bookshelves'

    expect(page).to have_link('New Bookshelf')

    click_link 'New Bookshelf'

    expect(page.current_path).to eq('/bookshelf/new')

    fill_in :name, with: "Cherry"
    fill_in :capacity, with: 1
    click_button "submit"

    shelf = Bookshelf.last

    expect(page).to have_content(shelf.name)
  end

  it 'each shelf can link to edit page' do
    shelf1 = Bookshelf.create!(name: "Mahogany", full: true, capacity: 31)
    shelf2 = Bookshelf.create!(name: "Cherry Wood", full: true, capacity: 31, created_at: Date.tomorrow)

    visit '/bookshelves'

    expect(page).to have_link("edit #{shelf1.name}")
    expect(page).to have_link("edit #{shelf2.name}")

    click_link shelf1.name

    expect(current_path).to eq("/bookshelves/#{shelf1.id}/edit")
  end

end
