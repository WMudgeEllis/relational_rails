class BookshelvesController < ApplicationController
  def index  
    @bookshelves = Bookshelf.all
  end

  def show 
    @bookshelf = Bookshelf.find(params[:id])
  end
end