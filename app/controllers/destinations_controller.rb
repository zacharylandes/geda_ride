class DestinationsController < ApplicationController

def index
    dest = Destination.find(params['format'])
    @destinations = Destination.where(full_street_address: dest.full_street_address)
    @events = EventService.new.find_event(dest.full_street_address)
end

  def show
    location = params['id']
    begin
      @destinations = Destination.within(15, :origin=> location)
      rescue Geokit::Geocoders::GeocodeError
      return  false
    end
  end
end
