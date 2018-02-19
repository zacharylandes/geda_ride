class RidesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    binding.pry
    # origin = Originparams['loc'][0]
    # dest = params['loc'][1]/

    # binding.pry
    @rides = Ride.all
    # origin.map {|origin| origin.ride}
    # render :index
  end

  def create
  @origin = Origin.within(15, :origin=> params['ff_nm_from'][0])
    @destination = Destination.within(15, :origin => params['ff_nm_from'][1])
     # binding.pry
    # origin = Origin.within(5, :origin => params['loc'][0])
    # o = Origin.find_by("full_street_address LIKE ?", "%Denver, co%")
    #
    # d = Destination.find_by("full_street_address LIKE ?", "%San Francisco, CA%")

     response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{params['ff_nm_from']}&key=AIzaSyD8Er31WgERjL7NaVZmBE4bb-LAnXDlKiQ")
     # binding.pry
    # response = Faraday.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{o.latitude},#{o.longitude}&destinations=#{d.latitude},#{d.longitude}&key=AIzaSyD8Er31WgERjL7NaVZmBE4bb-LAnXDlKiQ")
    redirect_to rides_path(origin: @origin,dest: @destination)
  end

  def ride_params
    params.require(:origin).permit(:origin, :destination)
  end

end
