class EventsController < ApplicationController

  def index
    if params['origin']
        events = EventService.new.find_event(params['origin'])
        if events == false
            flash[:notice] = "sorry we couldn't find any events in that area"
          @events = Event.order("RANDOM()").limit(6)
        else
          @events = events
        end
    elsif params['format']
        @events =  EventService.new.find_event(params['format'])
    else
      @events = Event.order("RANDOM()").limit(6)
    end
  end

  def show
    @events = EventService.new.parser(params['format'])
  end

end
