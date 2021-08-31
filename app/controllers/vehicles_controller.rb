class VehiclesController < ApplicationController
  def index
    @cars = Vehicle.only_sold
  end

  def show
    @cars = Vehicle.find(params[:id])
  end

  def edit 
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def update
    @vehicle = Vehicle.find(params[:vehicle_id])
    sold = params[:sold] == "true"
    @vehicle.update(name: params[:name], sold: sold, price: params[:price])
    redirect_to "/vehicles/#{@vehicle.id}"
  end
end