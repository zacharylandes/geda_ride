class HomeController < ApplicationController
  def show
    if params['origin']
      ride = RideService.new.find_ride(params['origin'], params['destination'], params['date'])
      if ride.class == Hash
        if !ride.values.first.nil?
          @rides = ride.values.first
          render :no_match
        else
          render :not_found
        end
      else
        @rides = ride
      end
    end
  end


end
