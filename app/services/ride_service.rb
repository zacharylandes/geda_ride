class RideService

  def create_ride(params, user)
    ride =Ride.create!(user: user, date: params['date'])
    origin = Origin.create!(full_street_address: params['origin'], ride:ride )
    destination = Destination.create(full_street_address:params['destination'], ride:ride)
    ride
  end

  def find_ride(origin, destination, date)
    matching_dates = Ride.where(date: date)
    origins = Origin.within(15, :origin=> origin).map{|origin|origin.ride}
    dests = Destination.within(15, :origin=> destination).map{|dest|dest.ride}
    if origins.any? && dests.any?
        return ride_match(matching_dates, origins, dests)
        if !ride_match(matching_dates, origins, dests).any?
          no_match(origins,dests,matching_dates)
        end
    else
      no_match(origins,dests,matching_dates)
    end
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
    origins.select do |ride|
      ride if ride.in?(dests) && ride.in?(matching_dates)
    end
  end

end
