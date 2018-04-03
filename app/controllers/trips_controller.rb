class TripsController < ApplicationController
  def index
    @trips = Trip.all.order(id: :asc)
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new
    @trip.driver = Driver.all.sample
    @trip.passenger = Passenger.find_by(id: params[:psngr_id])
    @trip.rating = 0
    @trip.date = Date.today
    @trip.cost = rand(1000..3000)

    if @trip.save
      redirect_to @trip
    else
      render :new
    end

  end

  def edit
    @trip = Trip.find_by(id: params[:id])

  end

  def update
    @trip = Trip.find_by(id: params[:id])
    if !@trip.nil?
      if @trip.update(trip_params)
        redirect_to trip_path(@trip.id)
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
