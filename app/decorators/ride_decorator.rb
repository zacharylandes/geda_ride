class  RideDecorator < SimpleDelegator



  def route(ride)
    response = Faraday.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{ride.origin.latitude},#{ride.origin.longitude}&destinations=#{ride.destination.latitude},#{ride.destination.longitude}&key=#{ENV['gmaps_key']}")
    response = JSON.parse(response.body)
    response['rows'][0]['elements'][0]['distance']['text']
  end

end
