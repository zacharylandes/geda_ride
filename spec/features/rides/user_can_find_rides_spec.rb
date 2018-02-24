require 'rails_helper'

describe 'rides' do
    it 'can see related rides of origin no ride matches query' do
      VCR.use_cassette 'api_response_ride' do

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


      expect(page).to have_content('oakland, ca')
    end
  end
    it 'can see related rides of destination  if no ride matches query' do
      VCR.use_cassette 'api_response_ride' do

      user = create(:user)
      ride = create(:ride, user:user )
      ride_2 = create(:ride, user:user )

      origin  = Origin.create!(full_street_address: "winters, ca", ride:ride )
      destination  = Destination.create!(full_street_address: "davis, ca", ride:ride)
      origin_2  = Origin.create!(full_street_address: "winters, ca", ride:ride_2 )
      destination_2 = Destination.create!(full_street_address: "oakland, ca", ride:ride_2)

      visit '/'

      fill_in 'f_elem_city', :with => "fresno, ca"
      fill_in 'f_elem_city_2', :with => "oakland, ca"
      fill_in 'date', :with => "2018-02-22"

      click_button 'Geda Ride'


      expect(page).to have_content('winters, ca')
    end
  end

    it 'can see related rides of same date  if no ride matches query' do
      VCR.use_cassette 'api_response_ride' do

      user = create(:user)
      ride = create(:ride, user:user,  date: "2018-02-22" )
      ride_2 = create(:ride, user:user )

      origin  = Origin.create!(full_street_address: "winters, ca", ride:ride )
      destination  = Destination.create!(full_street_address: "davis, ca", ride:ride)
      origin_2  = Origin.create!(full_street_address: "winters, ca", ride:ride_2 )
      destination_2 = Destination.create!(full_street_address: "oakland, ca", ride:ride_2)

      visit '/'

      fill_in 'f_elem_city', :with => "winters, ca"
      fill_in 'f_elem_city_2', :with => "davis, ca"
      fill_in 'date', :with => "2018-02-22"

      click_button 'Geda Ride'

      expect(page).to have_content('winters, ca')
    end
  end
end
