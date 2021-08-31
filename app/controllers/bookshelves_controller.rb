class BookshelvesController < ApplicationController
  def index
    @bookshelves = Bookshelf.sort_by_created_at
  end

  def show
    @bookshelves = Bookshelf.find(params[:id])
  end

  def new
  end

  def create
    name = params[:name]
    full = params[:full] == 'true'
    capacity = params[:capacity].to_i

    Bookshelf.create(name: name, full: full, capacity: capacity)

    redirect_to '/bookshelves'
  end

  def edit
    @bookshelves = Bookshelf.find(params[:bookshelf_id])
  end

  def update
    shelf = Bookshelf.find(params[:id])
    full = params[:full] == 'true'
    shelf.update(name: params[:name], full: full, capacity: params[:capacity].to_i)
    redirect_to "/bookshelves/#{shelf.id}"
  end

  def destroy
    Bookshelf.destroy(params[:id])
    redirect_to "/bookshelves/"
  end
end
