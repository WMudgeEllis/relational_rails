class CarLotsController < ApplicationController
  def index 
    @car_lots = CarLot.all
  end
end