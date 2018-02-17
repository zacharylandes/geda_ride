class Destination < ApplicationRecord
  geocoded_by :full_street_address
  after_validation :geocode
  
  belongs_to :ride
end
