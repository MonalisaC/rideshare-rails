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
    @trip.passenger = Passenger.find_by(id: params[:passenger_id])
    @trip.driver = find_available_driver #Driver.all.sample
    if @trip.driver.nil?
      flash[:notice] = "Sorry! There are no available drivers right now."
      redirect_to @trip.passenger
    else
      @trip.rating = nil
      @trip.date = Date.today
      @trip.cost = rand(1000..3000)

      if @trip.save
        @trip.driver.update(is_available: false)
        redirect_to @trip
      else
        render :new
      end
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
    if  @trip = Trip.find(params[:id])
      @trip.destroy
    end
    flash[:notice] = "You have successfully deleted the trip."
    redirect_to trips_path
  end

end

private

def find_available_driver
  #
  return Driver.where(is_available: true).sample
end

def trip_params
  params.require(:trip).permit(:date, :rating, :cost, :driver_id, :passenger_id,
  :is_available)
end
