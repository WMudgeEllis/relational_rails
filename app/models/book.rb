class Book < ApplicationRecord
  belongs_to :bookshelf

  def self.read_books
    Book.where(read: true)
  end

  def self.alphabetize
    Book.order(:name)
  end

  def self.min_read_time(min)
    Book.where("books.read_time > #{min}")
  end
end
