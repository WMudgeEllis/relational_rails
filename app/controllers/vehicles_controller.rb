class VehiclesController < ApplicationController
  def index
    @cars = Vehicle.all
  end

  def show
    @cars = Vehicle.find(params[:id])
  end
end