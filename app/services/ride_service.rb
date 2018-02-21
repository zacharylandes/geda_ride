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
       ride_match(matching_dates, origins, dests)
    elsif origins.any?
      binding.pry
      return origins
    elsif dests.any?
      return dests
    elsif matching_dates.any?
      return matching_dates
    else
     return false
    end
  end

  def ride_match(matching_dates,origins,dests)
    origins.select do |ride|
      if ride.in?(dests) && ride.in?(matching_dates)
        ride
      end
    end
  end
end
