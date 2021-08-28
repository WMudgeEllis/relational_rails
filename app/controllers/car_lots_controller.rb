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
    being_cleaned = params[:being_cleaned] == true
    CarLot.create(name: params[:name], being_cleaned: being_cleaned, lot_area: params[:lot_area].to_i)
    redirect_to "/car_lots"
  end


end
