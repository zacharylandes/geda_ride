class DestinationsController < ApplicationController

def index
  binding.pry
    dests = Destination.find(params['format'])
    @destinations = Destination.where(full_street_address: dests.full_street_address)
  end

  def show
    location = params['id']
    @destinations = Destination.where('full_street_address  ILIKE ?' ,"%#{location}%" )
    binding.pry
end
end
