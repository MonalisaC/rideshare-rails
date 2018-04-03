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
end
