class DestinationsController < ApplicationController
  def index
    dests = Destination.find(params['format'])
    @destinations = Destination.where(full_street_address: dests.full_street_address)
  end
end
