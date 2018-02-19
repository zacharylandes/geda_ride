class Ride < ApplicationRecord
  has_one :origin
  has_one :destination
  belongs_to :user
end
