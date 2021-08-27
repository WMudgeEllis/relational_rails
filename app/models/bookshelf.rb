class Bookshelf < ActiveRecord::Base
  has_many :books

  def self.sort_by_created_at
    Bookshelf.order(:created_at).reverse
  end
end
