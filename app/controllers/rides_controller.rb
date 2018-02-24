class RidesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # def index
  #   rides = RideService.new.find_ride(params['origin'], params['destination'], params['date'])
  #   if rides.class == Hash
  #     render :no_match
  #   else
  #     binding.pry
  #     @rides = rides
  #   end


  def new
    @ride = Ride.new
  end

  def create
    ride = RideService.new.create_ride(ride_params,current_user)
    redirect_to ride_path(ride)
  end

  def show
    @ride = Ride.find(params[:id])
  end

  private

  def ride_params
    params.require(:ride).permit(:origin, :destination, :date)
  end

end
