class HomeController < ApplicationController
  def index
    @trending = Event.order("RANDOM()").limit(6)
  end

  def show
    @trending = Ride.order("RANDOM()").limit(6)
    if params['origin']
      ride = RideService.new.find_ride(params['origin'], params['destination'], params['date'])
      if  ride.nil? || ride == false || !ride.any?
          render :not_found
      elsif ride.class == Hash
          @rides = ride.values
          render :no_match
      else
        @rides = ride
      end
    end
  end

end
