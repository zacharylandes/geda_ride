class EventsController < ApplicationController

  def index
  binding.  pry
    if params['origin'] || params['format']
      @events = EventService.new.find_event(params['origin']) || EventService.new.find_event(params['format'])
    else
      @events = Event.order("RANDOM()").limit(6)
    end
  end

  def show
    @events = EventService.new.parser(params['format'])
  end

end
