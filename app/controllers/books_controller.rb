class BooksController < ApplicationController
  def index 
    @books = Book.read_books
  end

  def show 
    @books = Book.find(params[:id])
  end

  def edit 
    @book = Book.find(params[:book_id])
  end

  def update 
    @book = Book.find(params[:book_id])
    read = params[:read] == "true"
    @book.update(name: params[:name], author: params[:author], read: read, read_time: params[:read_time])
    redirect_to "/books/#{@book.id}"
  end
end