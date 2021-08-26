class CarLotsController < ApplicationController
  def index 
    @car_lots = CarLot.all
  end

  def show 
    @car_lots = CarLot.find(params[:id])
  end
end