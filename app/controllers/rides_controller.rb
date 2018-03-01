class RidesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @ride = Ride.new
  end

  def create
    ride = RideService.new.create_ride(ride_params,current_user)
    if ride == false
      flash[:notice] = 'We had some trouble posting your ride, please try again'
      redirect_to new_ride_path
    else
      flash[:notice] = 'Ride Created!'
      redirect_to ride_path(ride)
    end
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def update
    ride = Ride.find(params[:id])
    if params['text']
      distance = params['text'].gsub(/[^0-9]/, '').to_i
      cost = cost(distance)
      ride.update(cost: cost)
    elsif update_params
      request = Request.find(params['request_id'])
      ride.update(update_params)
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
