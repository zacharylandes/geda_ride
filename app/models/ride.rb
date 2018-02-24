class Ride < ApplicationRecord
  has_one :origin
  has_one :destination
  belongs_to :user


  def route
    response = Faraday.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{self.origin.latitude},#{self.origin.longitude}&destinations=#{self.destination.latitude},#{self.destination.longitude}&key=#{ENV['gmaps_key']}")
    response = JSON.parse(response.body)
    if response['rows'][0]['elements'][0]['distance']
      repsonse = response['rows'][0]['elements'][0]['distance']['text']
    else
      return false
    end
  end

end
