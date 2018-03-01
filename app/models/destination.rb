class Destination < ApplicationRecord
  geocoded_by :full_street_address
  after_validation :geocode

  belongs_to :ride, dependent: :destroy

  acts_as_mappable :default_units => :miles,
                 :default_formula => :sphere,
                 :distance_field_name => :distance,
                 :lat_column_name => :latitude,
                 :lng_column_name => :longitude
end
