# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  User.create(name: "#{Faker::Seinfeld.unique.character} ")
end


260.times do
  Ride.create!
end

cities = ["Davis, CA "," Winters, CA","San Francisco, CA ", " Sacramento, CA"," Oakland, CA",
 "Denver, co ","Boulder,CO ","Sacramento, CA", " littleton, co","New York, new york ",
"chicago, il ", " los angeles,ca", " seatlle,wa", " st.louis, mo", " nashville,tn", " salt lake city,ut",
 " santa fe, nm", "santa cruz, ca", " eugene, or",  " arcata, ca", " stockton, ca ",  "bakersfield, ca",
 " san diego, ca"," santa ana,ca", " pasadena, ca"," montclair, ca"]

260.times do |i|
  Origin.create!(full_street_address: cities[i], ride: Ride.find(i+1))
end

260.times do |i|
  Destination.create!(full_street_address: cities.reverse[i], ride: Ride.find(i+1))
end
