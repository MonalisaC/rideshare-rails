class TripsController < ApplicationController
  def index
    @trips = Trip.all.order(id: :asc)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
    @trip = Trip.find_by(id: params[:id])

  end

  def update
    @trip = Trip.find_by(id: params[:id])
    if !@trip.nil?
      if @trip.update(trip_params)
        redirect_to trips_path(@trip.id)
      else
        render :edit
      end
    else
      redirect_to trips_path
    end
  end

  def destroy
  end
end
private

def trip_params
  params.require(:trip).permit(:date, :rating, :cost, :driver_id, :passenger_id)
end
