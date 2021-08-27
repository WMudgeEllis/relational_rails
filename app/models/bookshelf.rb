class Bookshelf < ActiveRecord::Base
  has_many :books

  def self.sort_by_created_at
    Bookshelf.order(:created_at).reverse
  end

  def number_of_books
    books.length
  end
end
