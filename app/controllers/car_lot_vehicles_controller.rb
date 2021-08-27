class CarLotVehiclesController < ApplicationController

  def index
    cars = Vehicle.all
    @cars = cars.where(car_lot_id: params[:car_lot_id])
  end

end
