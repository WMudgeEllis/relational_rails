class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.only_sold
    @vehicles = Vehicle.only_sold.budget(params[:budget]) if params[:budget] != nil
  end

  def show
    @vehicles = Vehicle.find(params[:id])
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

  def destroy
    Vehicle.destroy(params[:vehicle_id])
    redirect_to "/vehicles"
  end
end
