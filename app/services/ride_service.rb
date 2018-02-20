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
      origins.select do |ride|
          if ride.in?(dests) && ride.in?(matching_dates)
           ride
        end
      end
      else
      return false
    end
  end


end
