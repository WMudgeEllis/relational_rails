class BookshelvesController < ApplicationController
  def index  
    @bookshelves = Bookshelf.all
  end
end