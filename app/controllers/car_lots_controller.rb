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
    name = params[:name]
    being_cleaned = params[:being_cleaned] == true
    lot_area = params[:lot_area].to_i

    CarLot.create(name: name, being_cleaned: being_cleaned, lot_area: lot_area)

    redirect_to "/car_lots"
  end

  def edit 
    @car_lot = CarLot.find(params[:car_lot_id])
  end

  def update 
    lot = CarLot.find(params[:id])
    being_cleaned = params[:being_cleaned] == 'true'
    lot.update(name: params[:name], being_cleaned: being_cleaned, lot_area: params[:lot_area].to_i)
    redirect_to "/car_lots/#{lot.id}"
  end

  def destroy 
    require "pry"; binding.pry
    
    CarLot.destroy(params[:id])
    redirect_to "/car_lots"
  end
end
