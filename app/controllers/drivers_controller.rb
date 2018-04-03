class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(params[:id])
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def new
    @driver = Driver.new
  end

  def create
    Driver.create(driver_params).save ? (redirect_to root_path) : (render :new)
  end

  def edit
    @driver = Driver.find_by(id: params[:id])
  end

  def update
    @driver = Driver.find_by(id: params[:id])
    if !@driver.nil?
      @driver.update(driver_params) ? (redirect_to driver_path) : (render :edit)
    else
      redirect_to driver_path
    end
  end

  def destroy
    # Passenger.find(params[:id]).destroy
    # redirect_to root_path
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :vin, :car_make, :car_model)
  end
end
