class EventService

  def find_event(location)
      response = Faraday.get("http://api.eventful.com/json/events/search?app_key=dPQmqbgQ9F95XrGd&q=music&location=#{location}&date=next+week")
      response = JSON.parse(response.body)
      response['events']['event'].map  do |event|
      Event.find_or_create_by(title: event['title'], date: event['start_time'], url: event['url'], image: ['image'], city: location)
    end
      lookup(location)
  end

  def lookup(location)
      events = Event.where(:city =>location)
       events.uniq do |event|
        event.title
      end
  end

  def parser(ids)
    ids = ids.gsub("/"," ").split(' ')
    ids.map do |event |
      Event.find(event.to_i)
    end
  end

end
