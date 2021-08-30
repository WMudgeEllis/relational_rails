class VehiclesController < ApplicationController
  def index
    @cars = Vehicle.all
  end

  def show
    @cars = Vehicle.find(params[:id])
  end

  def edit 
  end
end