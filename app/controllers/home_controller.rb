class HomeController < ApplicationController
  def show
    if params['origin']
      @rides = RideService.new.find_ride(params['origin'], params['destination'])
    end
  end
end
