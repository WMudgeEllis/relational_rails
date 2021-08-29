class CarLotVehiclesController < ApplicationController

  def index
    cars = Vehicle.all
    @cars = cars.where(car_lot_id: params[:car_lot_id])
    @car_lot = CarLot.find(params[:car_lot_id])
  end

  def new 
    @car_lot = CarLot.find(params[:car_lot_id])
  end

  def create

  end
end
