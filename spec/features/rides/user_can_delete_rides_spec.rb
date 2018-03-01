require 'rails_helper'

describe 'rides delete' do

  it 'can delte rides ' do
    VCR.use_cassette 'api_delete_response_ride' do

    user = create(:user)
    ride = create(:ride, user:user )

    origin  = Origin.create!(full_street_address: "winters, ca", ride:ride )
    destination  = Destination.create!(full_street_address: "davis, ca", ride:ride)

    visit "/users/#{user.id}"

    click_on 'Delete'

    expect(Ride.count).to eq(0)
  end
  end
end
