require "rails_helper"

RSpec.describe 'the bookshelves index page', type: :feature do
  it 'can see all names' do
    shelf1 = Bookshelf.create!(name: "Mahogany", full: true, capacity: 31)
    shelf2 = Bookshelf.create!(name: "Cherry Wood", full: true, capacity: 31, created_at: Date.tomorrow)

    visit '/bookshelves'

    expect(page).to have_content(shelf1.name)
    expect(page).to have_content(shelf2.created_at)
    expect(page.all(:css, "p")[0].text.include?("Cherry")).to be(true)

  end
end
