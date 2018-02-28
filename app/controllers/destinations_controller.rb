class DestinationsController < ApplicationController

def index
    dests = Destination.find(params['format'])
    @destinations = Destination.where(full_street_address: dests.full_street_address)
    binding.pry
end

  def show
    location = params['id']
    @destinations = Destination.where("replace(full_street_address, ' ', '') ILIKE replace(?, ' ', '')", "#{location}")
  end
end
