class RidesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @rides = Origin.within(15, :origin=> params['origin']).map{|origin|origin.ride}
  end

  def new
    @ride = Ride.new
  end

  def create
    ride = RideService.new.create_ride(ride_params,current_user)
    # if ride.save!
    # binding.pry
    redirect_to ride_path(ride)
    # end
    # origin = Origin.within(5, :origin => params['loc'][0])
    # o = Origin.find_by("full_street_address LIKE ?", "%Denver, co%")
    #
    # d = Destination.find_by("full_street_address LIKE ?", "%San Francisco, CA%")

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
