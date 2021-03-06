require 'rails_helper'
describe 'ride viewing' do
    it 'can view a ride after clicking' do
      VCR.use_cassette 'api_ride' do

      user = create(:user)
      ride = create(:ride, user:user, date: '2018-03-18'  )
      ride_2 = create(:ride, user:user, date: '2018-03-18' )

      origin  = Origin.create!(full_street_address: "winters, ca", ride:ride )
      destination  = Destination.create!(full_street_address: "davis, ca", ride:ride)
      origin_2  = Origin.create!(full_street_address: "winters, ca", ride:ride_2 )
      destination_2 = Destination.create!(full_street_address: "oakland, ca", ride:ride_2)

      visit '/'

      fill_in 'f_elem_city', :with => "winters, ca"
      fill_in 'f_elem_city_2', :with => "davis, ca"
      fill_in 'date', :with => "2018-03-18"

      click_button 'Geda Ride'

        click_on "View"

      expect(current_path).to eq(ride_path(ride))

    end
  end
end
