require 'rails_helper'

describe 'rides' do
    it 'should not see an error if there are no matching rides' do
      VCR.use_cassette 'api_response_ride_fail' do

      user = create(:user)
      ride = create(:ride, user:user )
      ride_2 = create(:ride, user:user )

      origin  = Origin.create!(full_street_address: "winters, ca", ride:ride )
      destination  = Destination.create!(full_street_address: "davis, ca", ride:ride)
      origin_2  = Origin.create!(full_street_address: "winters, ca", ride:ride_2 )
      destination_2 = Destination.create!(full_street_address: "oakland, ca", ride:ride_2)

      visit '/'

      fill_in 'f_elem_city', :with => "portland, pr"
      fill_in 'f_elem_city_2', :with => "fresno, ca"
      fill_in 'date', :with => "2018-04-22"

      click_button 'Geda Ride'

      expect(page).to have_content(" We couldn't find any places matching that location ")
    end
  end

    it 'should not see an error if the places are not real ' do
      VCR.use_cassette 'api_response_ride_search_fail' do
      user = create(:user)

      visit '/'

      fill_in 'f_elem_city', :with => "asd, pr"
      fill_in 'f_elem_city_2', :with => "fasdresno, ca"
      fill_in 'date', :with => "2018-04-22"

      click_button 'Geda Ride'

      expect(page).to have_content(" We couldn't find any places matching that location ")

    end
  end


end
