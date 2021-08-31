class Book < ApplicationRecord
  belongs_to :bookshelf

  def self.read_books
    Book.where(read: true)
  end

  def self.alphabetize
    Book.order(:name)
  end
end
