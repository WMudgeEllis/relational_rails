require "rails_helper"

describe Bookshelf, type: :model do
  # describe "validations" do
  #   it {should have_many(:books)}
  # end

  it 'can sort by created at' do
    shelf1 = Bookshelf.create!(name: "Mahogany", full: true, capacity: 31)
    shelf2 = Bookshelf.create!(name: "Cherry Wood", full: true, capacity: 31, created_at: Date.tomorrow)

    expect(Bookshelf.sort_by_created_at.first).to eq(shelf2)
  end

  it 'can count the books' do
    shelf = Bookshelf.create!(name: "Mahogany", full: false, capacity: 31)
    book1 = Book.create!(name: "Feet of Clay", author: 'Terry Pratchett', read: false, read_time: 7, bookshelf_id: shelf.id)
    book2 = Book.create!(name: "Three Guineas", author: 'Virginia Woolf', read: false, read_time: 17, bookshelf_id: shelf.id)

    expect(shelf.number_of_books).to eq(2)
  end
end
