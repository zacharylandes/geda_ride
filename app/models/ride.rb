class Ride < ApplicationRecord
  has_one :origin
  has_one :destination
end
