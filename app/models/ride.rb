class Ride < ApplicationRecord
  has_one :origin, dependent: :destroy
  has_one :destination, dependent: :destroy
  belongs_to :user
  has_many :requests

  enum status: %w(pending approved)

  def route
    response = Faraday.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{self.origin.latitude},#{self.origin.longitude}&destinations=#{self.destination.latitude},#{self.destination.longitude}&key=#{ENV['gmaps_key']}")
    response = JSON.parse(response.body)
    if response['rows'][0]['elements'][0]['distance']
      repsonse = response['rows'][0]['elements'][0]['distance']['text']
    else
      return false
    end
  end

  def self.cost(distance)
    (distance/24) * 2.50
  end
end
