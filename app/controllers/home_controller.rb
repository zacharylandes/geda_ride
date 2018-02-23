class HomeController < ApplicationController

  def show
    if params['origin']
      ride = RideService.new.find_ride(params['origin'], params['destination'], params['date'])
      if  ride.nil?
          render :not_found
      elsif ride.class == Hash
        if !ride.values.first.nil?
          if ride.keys.first=="dates"
            @rides = ride.values
            render :no_match
          else
            @locations = ride.values
            render :no_match
        end
        else
          render :not_found
        end
      else
        @rides = ride
      end
    end
  end

end
