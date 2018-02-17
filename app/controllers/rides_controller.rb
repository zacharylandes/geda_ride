class RidesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @rides = Ride.all
    # @origin_rides = Ride.where(origin: ride_params)
  end

  def create
    binding.pry
  end
  def ride_params
    params.require(:ride).permit(:origin, :destination)
  end

end
