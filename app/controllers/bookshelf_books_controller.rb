class BookshelfBooksController < ApplicationController

  def index
    @books = Book.where(bookshelf_id: params[:bookshelf_id])
    @shelf = Bookshelf.find(params[:bookshelf_id])
    @books = Book.where(bookshelf_id: params[:bookshelf_id]).alphabetize if params[:alpha] == 'true'
  end

  def new
    @bookshelf = Bookshelf.find(params[:bookshelf_id])
  end

  def create
    shelf = Bookshelf.find(params[:bookshelf_id])
    read = params[:read] == "true"
    shelf.books.create(name: params[:name], author: params[:author], read: read, read_time: params[:read_time])
    redirect_to "/bookshelves/#{shelf.id}/books"
  end
end
