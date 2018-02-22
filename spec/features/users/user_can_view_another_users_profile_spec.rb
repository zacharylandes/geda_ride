require 'rails_helper'

describe 'user' do
    it 'all users can see another users profile rides' do
      VCR.use_cassette 'user_profile' do

      user = create(:user)
      ride = create(:ride, user:user )
      origin  = Origin.create!(full_street_address: "winters, ca", ride:ride )
      destination  = Destination.create!(full_street_address: "davis, ca", ride:ride)
      ride_2 = create(:ride, user:user )
      origin_2  = Origin.create!(full_street_address: "los angeles, ca", ride:ride_2 )
      destination_2  = Destination.create!(full_street_address: "chicago, il", ride:ride_2)

    visit '/'

    fill_in 'f_elem_city', :with => "winters, ca"
    fill_in 'f_elem_city_2', :with => "davis, ca"
    fill_in 'date', :with => "2018-02-22"

    click_button 'Geda Ride'

    click_on user.name

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("chicago, il")

   end
  end
end
