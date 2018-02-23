require 'rails_helper'

describe 'rides' do
    it 'can see all rides departing from an origin' do
      VCR.use_cassette 'api_response' do

      user = create(:user)
      ride = create(:ride, user:user, date: "2018-02-22" )
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

      save_and_open_page

      click_on 'winters'

      expect(page).to have_content('oakland, ca')
      expect(page).to have_content('davis, ca')

    end
  end
end
