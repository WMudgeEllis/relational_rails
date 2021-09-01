class CarLotVehiclesController < ApplicationController

  def index
    @vehicles = Vehicle.where(car_lot_id: params[:car_lot_id])
    @car_lot = CarLot.find(params[:car_lot_id])
    @vehicles = Vehicle.where(car_lot_id: params[:car_lot_id]).alphabetize if params[:alpha] == 'true'
  end

  def new 
    @car_lot = CarLot.find(params[:car_lot_id])
  end

  def create
    lot = CarLot.find(params[:car_lot_id])
    sold = params[:sold] == "true"
    lot.vehicles.create(name: params[:name], sold: sold, price: params[:price])
    redirect_to "/car_lots/#{lot.id}/vehicles"
  end
end
