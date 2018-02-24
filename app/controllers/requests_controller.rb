class RequestsController < ApplicationController
  def create
    request = Request.create(request_params)
    flash[:notice] = "Ride Requested!"
    redirect_to ride_path(params['ride_id'])
  end

  private
  def request_params
    params.permit(:ride_id, :user_id, :passenger_count)
  end
end
