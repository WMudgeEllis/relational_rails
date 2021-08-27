class BookshelvesController < ApplicationController
  def index
    @bookshelves = Bookshelf.sort_by_created_at
  end

  def show
    @bookshelves = Bookshelf.find(params[:id])
  end
end
