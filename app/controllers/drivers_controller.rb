class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(params[:id])
  end

  def show
    @driver = Driver.all.find(params[:id])
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    @driver.save ? (redirect_to driver_path(@driver.id)) : (render :new)
  end

  def edit
    @driver = Driver.find_by(id: params[:id])
  end

  def update
    @driver = Driver.find_by(id: params[:id])
    if !@driver.nil?
      @driver.update(driver_params) ? (redirect_to driver_path(@driver.id)) :
        (render :edit)
    else
      redirect_to drivers_path
    end
    # if !@driver.nil?
    #   @driver.update(driver_params) ? (redirect_to driver_path(@driver.id)) :
    #     (render :edit)
    # else
    #   redirect_to driver_path
    # end
  end

  def destroy
    Driver.find(params[:id]).destroy
    redirect_to drivers_path
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :vin, :car_make, :car_model)
  end
end
