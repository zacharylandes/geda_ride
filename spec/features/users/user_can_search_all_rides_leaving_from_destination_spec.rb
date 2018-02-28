require 'rails_helper'

describe 'rides' do
    it 'can see all rides departing from a destination' do
      VCR.use_cassette 'api_destinations' do

      user = create(:user)
      ride = create(:ride, user:user )
      ride_2 = create(:ride, user:user )

      origin  = Origin.create!(full_street_address: "winters, ca", ride:ride )
      destination  = Destination.create!(full_street_address: "davis, ca", ride:ride)
      origin_2  = Origin.create!(full_street_address: "davis, ca", ride:ride_2 )
      destination_2 = Destination.create!(full_street_address: "oakland, ca", ride:ride_2)

      visit '/'

      fill_in 'f_elem_city', :with => "winters, ca"
      fill_in 'f_elem_city_2', :with => "davis, ca"
      fill_in 'date', :with => "2018-02-22"

      click_button 'Geda Ride'

      first(:link,'davis, ca').click

      expect(page).to have_content('winters, ca')
    end
  end
end
