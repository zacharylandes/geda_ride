
require 'date'
avatars  = ['https://s3-us-west-1.amazonaws.com/gedaride/team-01.png','https://s3-us-west-1.amazonaws.com/gedaride/team-02.png','https://s3-us-west-1.amazonaws.com/gedaride/team-03.png', 'https://s3-us-west-1.amazonaws.com/gedaride/donkey-avatar.png', "https://s3-us-west-1.amazonaws.com/gedaride/leopard-onesie.png", 'https://s3-us-west-1.amazonaws.com/gedaride/bill.jpg','https://s3-us-west-1.amazonaws.com/gedaride/elaine.jpeg',"https://s3-us-west-1.amazonaws.com/gedaride/fat-bunny.jpg","https://s3-us-west-1.amazonaws.com/gedaride/fat-cat.jpg","https://s3-us-west-1.amazonaws.com/gedaride/george.jpg","https://s3-us-west-1.amazonaws.com/gedaride/hamster1.jpg","https://s3-us-west-1.amazonaws.com/gedaride/hamster4.jpg","https://s3-us-west-1.amazonaws.com/gedaride/ilana.jpg","https://s3-us-west-1.amazonaws.com/gedaride/jb_1.jpeg","https://s3-us-west-1.amazonaws.com/gedaride/jb.jpg","https://s3-us-west-1.amazonaws.com/gedaride/jesus.jpg","https://s3-us-west-1.amazonaws.com/gedaride/koala.jpeg","https://s3-us-west-1.amazonaws.com/gedaride/skully.jpg","https://s3-us-west-1.amazonaws.com/gedaride/tina.png","https://s3-us-west-1.amazonaws.com/gedaride/woody.jpg", "https://s3-us-west-1.amazonaws.com/gedaride/mulder.jpg", 'https://s3-us-west-1.amazonaws.com/gedaride/screech.jpg','https://s3-us-west-1.amazonaws.com/gedaride/panda-bear-avatar.jpg','https://s3-us-west-1.amazonaws.com/gedaride/alex.jpg']
#
100.times do
  User.create(name: "#{Faker::GameOfThrones.character}", email: "#{Faker::Internet.email }",remote_image_url: avatars.sample)
end

def next_thirty_days
  today = Date.today
  (today .. today + 30).reduce([]) { |init, date|  init << "#{date}" }
end

1000.times do |i|
  Ride.create!(user: User.limit(1).order("RANDOM()").first, date: next_thirty_days.sample)
end


  cities = ["Aberdeen, MD", "Abilene, TX", "Akron, OH", "Albany, NY", "Albuquerque, NM", "Alexandria, VA", "Allentown, GA", "Amarillo, TX", "Anaheim, CA", "Anchorage AK", "Ann Arbor, MI", "Antioch, CA", "Apple Valley, CA", "Appleton, MN", "Arlington, VA", "Arvada, CO", "Asheville, NC", "Athens, GA", "Atlanta, ga", "Atlantic City, nj", "Augusta, GA", "Aurora", "Austin, TX", "Bakersfield, CA", "Baltimore, MD", "Barnstable, MN", "Baton Rouge, LA", "Beaumont, CA", "Bel Air, CA", "Bellevue, WA", "Berkeley, CA", "Bethlehem, CT", "Billings, MT", "Birmingham, AL", "Bloomington, ID", "Boise, ID", "Boise City,id", "Bonita Springs, FL", "Boston, ma", "Boulder, co", "Bradenton", "Bremerton,wa", "Bridgeportct ", "Brighton, co", "Brownsville, CA", "Bryan, OH", "Buffalo, NY", "Burbank, CA", "Burlington, vt", "Cambridge, ma", "Canton, CT", "Cape Coral, FL", "Carrollton,al", "Cary, IL", "Cathedral City, CA", "Cedar Rapids, IA", "Champaign, IL", "Chandler, AZ", "Charleston, SC", "Charlotte, NC", "Chattanooga,tn", "Chesapeake, MD", "Chicago, IL", "Chula Vista, CA", "Cincinnati, OH", "Clarksville ar", "Clearwater, FL", "Cleveland, OH", "College Station,md", "Colorado Springs, CO", "Columbia, CT", "Columbus, OH", "Concord, CA", "Coral Springs, FL", "Corona, CA", "Corpus Christi, TX", "Costa Mesa, CA", "Dallas, TX", "Daly City, CA", "Danbury, CT", "Davenport, CT", "Dayton, OH", "Daytona Beach, FL", "Deltona, FL", "Denton, GA", "Denver, CA", "Des Moines, IA", "Detroit,m i", "Downey, CA", "Duluth,mn", "Durham, NC", "El Monte, CA", "El Paso, TX", "Elizabeth, CO", "Elk Grove, CA", "Elkhart, IL", "Erie, IN", "Escondido,CA", "Eugene, OR", "Evansville, IN", "Fairfield, TN", "Fargo, ND", "Fayetteville, AR", "Fitchburg, MA", "Flint, mi", "Fontana, CA", "Fort Collins, co", "Fort Lauderdale, FL", "Fort Smith, AR", "Fort Walton Beach, FL", "Fort Wayne, IN", "Fort Worth, TX", "Fremont, CA", "Fresno, CA", "Fullerton, CA", "Gainesville, TN", "Garden Grove, CA", "Garland, TX", "Gastonia, NC", "Gilbert, ar", "Glendale,CA", "Grand Prairie, TX", "Grand Rapids, IN", "Grayslake, IL", "Green Bay wi", "Greensboro, FL", "Greenville, WI","Hampton, nj", "Harrisburg, pa", "Hartford, CT",  "Hayward,CA", "Hemet, CA", "Henderson, TX", "Hesperia, CA", "Hollywood, CA", "Houston, TX", "Huntington, CA", "Huntington Beach, CA", "Huntsville, NC", "Independence, WI", "Indianapolis, IN", "Inglewood, CA", "Irvine, CA", "Irving, TX", "Jackson,MS", "Jacksonville, FL", "Jefferson, ga", "Jersey City, nj", "Johnson City, TN", "Joliet, IL", "Kailua, hi", "Kalamazoo, TN", "Kansas City,mo", "Kennewick,wa", "Kenosha,wi", "Killeen, TX", "Kissimmee, FL", "Knoxville,tn", "Lacey,wa", "Lafayette, CA", "Lake Charles, LA", "Lakeland, FL", "Lakewood, CA", "Lancaster, CA", "Lansing, MI", "Laredo, TX", "Las Cruces, nm", "Las Vegas, NV", "Layton,nj", "Leominster, MA", "Lewisville, ID", "Lexington,va", "Lincoln, CA", "Little Rock, AR", "Long Beach, CA", "Lorain, OH", "Los Angeles, CA", "Louisville, CO", "Lowell, MA", "Lubbock tx", "Macon, CA", "Madison, WI", "Manchester, CT", "Marina, CA", "Marysville, CA", "McAllen, TX", "McHenry, IL", "Medford, OR", "Melbourne, AR", "Memphis, TN", "Merced, CA", "Mesa,az", "Mesquite, TX", "Miami, FL", "Milwaukee, WI", "Minneapolis, MN", "Miramar, CA", "Mission Viejo, CA", "Mobile, AL", "Modesto, CA", "Monroe, CT", "Monterey, CA", "Montgomery,al", "Moreno Valley, CA", "Murfreesboro, NC", "Murrieta, CA", "Muskegon,mi", "Myrtle Beach, SC", "Naperville, IL", "Naples, FL", "Nashua,mn" "Nashville, TN", "New Bedford, CT", "New Haven, CT", "New London, CT", "New Orleans, LA", "New York, NY", "New York City, NY", "Newark,nj", "Newburgh, NY", "Newport News,va", "Norfolk, CT", "Normal, IL", "Norman,in", "North Charleston, SC", "North Las Vegas, NV", "North Port, FL", "Norwalk, CA", "Norwich, CT", "Oakland, CA", "Ocala, FL", "Oceanside, CA", "Odessa, TX", "Ogden, UT", "Oklahoma City, ok", "Olathe,ks", "Olympia, WA", "Omaha,ne", "Ontario, CA", "Orange, CA", "Orem, UT", "Orlando, FL", "Overland Park,ks", "Oxnard, CA", "Palm Bay, FL", "Palm Springs, CA", "Palmdale, CA", "Panama City, FL", "Pasadena, CA", "Paterson,nj", "Pembroke Pines, FL", "Pensacola, FL", "Peoria, IL", "Philadelphia,pa", "Phoenix,az", "Pittsburgh, pa", "Plano, TX", "Pomona, CA", "Pompano Beach, FL", "Port Arthur, TX", "Port Orange, FL", "Port Saint Lucie, FL", "Portland,or", "Portsmouth,ri", "Poughkeepsie, NY", "Providence,ri", "Provo, UT", "Pueblo, CO", "Punta Gorda, FL", "Racine,mn", "Raleigh, NC", "Rancho Cucamonga, CA", "Reading,ks", "Redding, CA", "Reno, NV", "Richland, GA", "Richmond, CA", "Riverside, CA", "Roanoke,al", "Rochester, NY", "Rockford, IL", "Roseville, CA", "Round Lake, IL", "Sacramento, CA", "Saginaw,al", "Saint Louis,mo", "Saint Paul,mn", "Saint Petersburg, FL", "Salem, ma", "Salinas, CA ", "Salt Lake City, UT", "San Antonio, TX", "San Bernardino, CA", "San Buenaventura, CA", "San Diego, CA", "San Francisco, CA", "San Jose, CA", "Santa Ana, CA", "Santa Barbara, CA", "Santa Clara, CA", "Santa Clarita, CA", "Santa Cruz, CA", "Santa Maria, CA", "Santa Rosa, CA", "Sarasota, FL", "Savannah, GA", "Scottsdale,az", "Scranton,pa", "Seaside, CA", "Seattle,wa", "Sebastian, TX", "Shreveport, LA", "Simi Valley, CA", "Sioux City,ia", "South Bend, IN", "South Lyon,mi", "Spartanburg, SC", "Spokane,wa", "Springdale, AR", "Springfield, IL", "St. Louis, mo", "St. Paul, MN", "St. Petersburg, FL", "Stamford, CT", "Sterling Heights,mi", "Stockton, CA ", "Sunnyvale, CA", "Syracuse, NY", "Tacoma,wa", "Tallahassee, FL", "Tampa, FL", "Temecula, CA", "Tempe, AZ", "Thornton, AR", "Thousand Oaks, CA", "Toledo, TX", "Topeka, ks", "Torrance, CA", "Trenton,nj", "Tucson,az", "Tulsa, ok", "Tuscaloosa,al", "Tyler,al", "Uticany", "Vallejo, CA", "Vancouver,wa", "Vero Beach, FL", "Victorville, CA", "Virginia Beach, VA", "Visalia, CA", "Waco, TX", "Warren, ID", "Waterbury, CT", "Waterloo, NY", "West Covina, CA", "West Valley City, UT", "Westminster, CO", "Wichita, ks", "Wilmington,de", "Winston, ga", "Winter Haven, FL", "Worcester, ma", "Yakima,wa", "Yonkers, NY", "Youngstown, NY"]

big_cities = ["New York, NY", "Los Angeles, CA", "Chciago, IL","Denver, CO", 'San Francisco, CA','Portland, OR', 'Seattle, WA', 'Oakland, CA', "Boston, MA", 'Miami, FL', 'Boulder, CO', "Boise, ID", 'Salt Lke City, UT', 'Phoenix, AZ', 'Austin, TX', 'Philadelphia, PA', 'Washinton, DC', 'Detroit, MI', 'San Diego, CA', 'Atlanta, GA','Houston, TX','Las Vegas, NV','Pittsburgh, PA','St Paul, MN','San Jose, CA','Dallas,TX', 'Orlando, Fl','Tampa, Fl', 'Jacksonville,Fl' ]


  dests = Destination.where('id % 5 = 0')
  dests.each {|dest| dest.update(full_street_address: big_cities.sample)}


1000.times do |i|
  Destination.create!(full_street_address: cities.sample, ride: Ride.find(i+1))
end
