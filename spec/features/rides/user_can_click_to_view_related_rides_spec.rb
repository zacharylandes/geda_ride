require 'rails_helper'

describe 'rides' do
  it 'click on related destinations' do
    VCR.use_cassette 'api_response_ride_fail' do

    user = create(:user)
    ride = create(:ride, user:user )
    ride_2 = create(:ride, user:user )

    origin  = Origin.create!(full_street_address: "winters, ca", ride:ride )
    destination  = Destination.create!(full_street_address: "davis, ca", ride:ride)
    origin_2  = Origin.create!(full_street_address: "winters, ca", ride:ride_2 )
    destination_2 = Destination.create!(full_street_address: "oakland, ca", ride:ride_2)

    visit '/'

    fill_in 'f_elem_city', :with => "winters, ca"
    fill_in 'f_elem_city_2', :with => "fresno, ca"
    fill_in 'date', :with => "2018-02-22"

    click_button 'Geda Ride'

    click_on 'oakland'

    expect(current_path).to eq(destinations_path(destination_2))
    end
  end
  it 'click on related origins' do
    VCR.use_cassette 'api_response_ride_fail' do

    user = create(:user)
    ride = create(:ride, user:user )
    ride_2 = create(:ride, user:user )

    origin  = Origin.create!(full_street_address: "portland, or", ride:ride )
    destination  = Destination.create!(full_street_address: "oakland, ca", ride:ride)
    origin_2  = Origin.create!(full_street_address: "san jose, ca", ride:ride_2 )
    destination_2 = Destination.create!(full_street_address: "oakland, ca", ride:ride_2)

    visit '/'

    fill_in 'f_elem_city', :with => "winters, ca"
    fill_in 'f_elem_city_2', :with => "oakland, ca"
    fill_in 'date', :with => "2018-02-22"

    click_button 'Geda Ride'

    click_on 'portland, or'

    expect(current_path).to eq(origins_path(origin))
    end
  end

end
