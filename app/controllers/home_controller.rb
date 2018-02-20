class HomeController < ApplicationController
  def show
    if params['origin']
      @rides = RideService.new.find_ride(params['origin'], params['destination'], params['date'])
      if @rides == false
        not_found
      end
    end
  end
end
