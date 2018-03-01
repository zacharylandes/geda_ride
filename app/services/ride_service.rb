class RideService

  def create_ride(params, user)
    ride =Ride.create!(user: user, date: params['date'])
    origin = Origin.create!(full_street_address: params['origin'], ride:ride )
    destination = Destination.create(full_street_address:params['destination'], ride:ride)
    if origin.latitude == nil || destination.longitude == nil
      return false
    else
      ride
    end
  end

   def origin_finder(origin)
    begin
      origin = Origin.within(15, :origin=> origin)
      rescue Geokit::Geocoders::GeocodeError
      return  false
    end
    origin.map{|origin|origin.ride}
  end

  def dest_finder(destination)
    begin
      dests = Destination.within(15, :origin=> destination)
  rescue Geokit::Geocoders::GeocodeError
      return false
    end
    dests.map{|dest|dest.ride}
  end

  def find_ride(origin, destination, date)
      matching_dates = Ride.where(date: date)
      ride_origins =  origin_finder(origin)
      ride_dests =  dest_finder(destination)
      if ride_origins == false || ride_dests == false
        return false
      else
        lookup(matching_dates, ride_origins, ride_dests)
      end
  end

  def lookup(matching_dates, ride_origins, ride_dests)
    if ride_origins.any? && ride_dests.any? && !ride_dests.nil? && !ride_origins.nil?
        if !ride_match(matching_dates, ride_origins, ride_dests).any?
          no_match(ride_origins,ride_dests,matching_dates)
        else
          ride_match(matching_dates, ride_origins,ride_dests)
        end
    else
      no_match(ride_origins,ride_dests,matching_dates)
    end
  end


  def no_match(origins,dests,dates)
    no_match = {}
    if dests.any?
      no_match['dests'] = dests
    elsif origins.any?
      no_match['origins'] = origins
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

  def reviews
    ["#{Faker::MostInterestingManInTheWorld.quote}","#{Faker::Seinfeld.character}" ]
  end
end
