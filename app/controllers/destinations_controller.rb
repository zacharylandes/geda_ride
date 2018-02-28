class DestinationsController < ApplicationController

def index
    dest = Destination.find(params['format'])
    @destinations = Destination.where(full_street_address: dest.full_street_address)
    @events = EventService.new.find_event(dest.full_street_address)
end

  def show
    location = params['id']
    @destinations = Destination.where("replace(full_street_address, ' ', '') ILIKE replace(?, ' ', '')", "#{location}")
  end
end
