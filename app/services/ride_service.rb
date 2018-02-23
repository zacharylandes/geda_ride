class RideService

  def create_ride(params, user)
    ride =Ride.create!(user: user, date: params['date'])
    origin = Origin.create!(full_street_address: params['origin'], ride:ride )
    destination = Destination.create(full_street_address:params['destination'], ride:ride)
    ride
  end

def error
  html = render :template => 'home/not_found',
                :layout => 'application'
  html
end

  def find_ride(origin, destination, date)
    matching_dates = Ride.where(date: date)
    begin
      origins = Origin.within(15, :origin=> origin)
    rescue Geokit::Geocoders::GeocodeError
     return  error
      end
    begin
      dests = Destination.within(15, :origin=> destination)
    rescue Geokit::Geocoders::GeocodeError
    return error
      end
    if origins.map{|origin|origin.ride}.any? && dests.map{|dest|dest.ride}.any? && !dests.nil? && !origins.nil?
        if !ride_match(matching_dates, origins, dests).any?
          no_match(origins,dests,matching_dates)
        else
          ride_match(matching_dates, origins, dests)
        end
    else
      no_match(origins,dests,matching_dates)
    end
  end

  def error

  end

  def no_match(origins,dests,dates)
    no_match = {}
    if origins.any?
      no_match['origins'] = origins
    elsif dests.any?
      no_match['dests'] = dests
    elsif dates.any?
      no_match['dates'] = dates
    end
    no_match
  end

  def ride_match(matching_dates,origins,dests)
    origins.map{|origin|origin.ride}.select do |ride|
      ride if ride.in?(dests.map{|dest|dest.ride}) && ride.in?(matching_dates)
    end
  end

end
