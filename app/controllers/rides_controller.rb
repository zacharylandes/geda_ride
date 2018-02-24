class RidesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @ride = Ride.new
  end

  def create
    ride = RideService.new.create_ride(ride_params,current_user)
    flash[:notice] = 'Ride Created!'
    redirect_to ride_path(ride)
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def update
    ride = Ride.find(params[:id])
    request = Request.find(params['request_id'])
    if ride.update(update_params)
      flash[:notice] = 'Request Approved'
      approval_message(request,ride)
      request.delete
      redirect_to user_path(current_user)
    end
  end

  def edit
    @ride = Ride.find(params[:id])
    @requester = current_user
  end


  private

  def ride_params
    params.require(:ride).permit(:origin, :destination, :date)
  end

  def update_params
    params.permit(:passenger, :passenger_count, :status)
  end

end
