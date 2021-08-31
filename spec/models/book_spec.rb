require "rails_helper"

describe Book, type: :model do
  it 'shows only read books' do
    shelf = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)
    book1 = Book.create!(name: "Feet of Clay", author: 'Terry Pratchett', read: true, read_time: 7, bookshelf_id: shelf.id)
    book2 = Book.create!(name: "Three Guineas", author: 'Virginia Woolf', read: false, read_time: 17, bookshelf_id: shelf.id)
    expect(Book.read_books).to eq([book1])
  end

  it 'can alphabetize the books' do
    shelf = Bookshelf.create!(name: "Bamboo", full: false, capacity: 22)
    book1 = Book.create!(name: "Feet of Clay", author: 'Terry Pratchett', read: false, read_time: 7, bookshelf_id: shelf.id)
    book2 = Book.create!(name: "Three Guineas", author: 'Virginia Woolf', read: false, read_time: 17, bookshelf_id: shelf.id)
    book3 = Book.create!(name: "The Republic", author: "Plato", read: true, read_time: 15, bookshelf_id: shelf.id)

    expect(Book.alphabetize).to eq([book1, book3, book2])
  end
end
