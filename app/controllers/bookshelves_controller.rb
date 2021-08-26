class BookshelvesController < ApplicationController
  def index  
    @bookshelves = Bookshelf.all
  end

  def show 
    @bookshelves = Bookshelf.find(params[:id])
  end
end