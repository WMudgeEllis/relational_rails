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
    # require "pry"; binding.pry
    name = params[:name]
    full = params[:full] == 'true'
    capacity = params[:capacity].to_i


    Bookshelf.create(name: name, full: full, capacity: capacity)

    redirect_to '/bookshelves'
  end

  def edit  

  end
end
