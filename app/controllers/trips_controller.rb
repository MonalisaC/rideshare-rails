class TripsController < ApplicationController
  def index
    @trips = Trip.all.order(params[:date])
  end

  def show
    @trip = Trip.find(params[:id])
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
private

def trip_params
  params.require(:trip).permit(:date, :rating, :cost, :driver_id, :passenger_id)
end
