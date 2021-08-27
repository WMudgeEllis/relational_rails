class BookshelfBooksController < ApplicationController

  def index
    books = Book.all
    @books = books.where(bookshelf_id: params[:bookshelf_id])
  end

end
