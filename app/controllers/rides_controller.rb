class RidesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @rides = Ride.all
  end

  def create
  end
  def ride_params
    params.require(:ride).permit(:origin, :destination)
  end

end
