class BookshelfBooksController < ApplicationController

  def index
    books = Book.all
    require "pry"; binding.pry
    @books = books.where(bookshelf_id: params[:bookshelf_id])
  end

end
