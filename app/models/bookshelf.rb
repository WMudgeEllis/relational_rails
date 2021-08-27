class Bookshelf < ActiveRecord::Base
<<<<<<< HEAD
  # has_many :books
end
=======
  has_many :books
<<<<<<< HEAD
end
>>>>>>> 4d31b167adfaaf0024dc0fbddb3687607ca3600b
=======

  def self.sort_by_created_at
    Bookshelf.order(:created_at).reverse
  end

  def number_of_books
    books.length
  end
end
>>>>>>> c6ef8b9c24137fe60b568115e3152b19a77af35f
