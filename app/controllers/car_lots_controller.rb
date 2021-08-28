class CarLotsController < ApplicationController
  def index
    @car_lots = CarLot.order(:created_at).reverse
  end

  def show
    @car_lots = CarLot.find(params[:id])
  end

  def new 
  end

  def create
    require "pry"; binding.pry
  end
end
