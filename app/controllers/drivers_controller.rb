class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(params[:id])
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def driver_params
    params.require(:driver).permit(:vin, :car_make, :car_model)
  end
end
