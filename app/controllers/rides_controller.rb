class RidesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @rides = RideService.new.find_ride(params['origin'], params['destination'], params['date'])
  # binding.pry
  # redirect_to '/rides#bottom'
  end

  def new
    @ride = Ride.new
  end

  def create
    ride = RideService.new.create_ride(ride_params,current_user)

    redirect_to ride_path(ride)

     # response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{params['ff_nm_from']}&key=AIzaSyD8Er31WgERjL7NaVZmBE4bb-LAnXDlKiQ")
     # binding.pry
    # response = Faraday.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{o.latitude},#{o.longitude}&destinations=#{d.latitude},#{d.longitude}&key=AIzaSyD8Er31WgERjL7NaVZmBE4bb-LAnXDlKiQ")
  end

  def show
    @ride = Ride.find(params[:id])
  end

  private

  def ride_params
    params.require(:ride).permit(:origin, :destination, :date)
  end

end
