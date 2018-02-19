class RidesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # binding.pry
    # destination = Destination.within(15, :origin => params['loc'][1])
     @rides = Ride.all
     # origin.map {|origin| origin.ride}
     # render :index
  end

  def create
    # response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{params['ff_nm_from']}&key=AIzaSyD8Er31WgERjL7NaVZmBE4bb-LAnXDlKiQ")
    # response = Faraday.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{o.latitude},#{o.longitude}&destinations=#{d.latitude},#{d.longitude}&key=AIzaSyD8Er31WgERjL7NaVZmBE4bb-LAnXDlKiQ")
    # redirect_to '/rides#bottom'
     # rides_path( anchor:"bottom", loc: params['ff_nm_from'])
  end

  def ride_params
    params.require(:origin).permit(:origin, :destination)
  end

end
