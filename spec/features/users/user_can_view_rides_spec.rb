require 'rails_helper'

describe 'rides' do
    it 'can see rides' do
      VCR.use_cassette 'api_response' do

      user = create(:user)
      ride = create(:ride, user:user)
      origin  = Origin.create!(full_street_address: "winters, ca", ride:ride)
      destination  = Destination.create!(full_street_address: "davis, ca", ride:ride)

    visit '/'

    fill_in 'f_elem_city', :with => "winters, ca"
    fill_in 'f_elem_city_2', :with => "winters, ca"

    click_button 'Geda Ride'

    expect(current_path).to eq(rides_path)
    expect(page).to have_content("winters, ca")
    expect(page).to have_content("davis, ca")
  end
  end
end
