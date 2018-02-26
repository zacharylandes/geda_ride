require 'rails_helper'

describe 'rides' do
  before(:each) do
    @user = create(:user)
    @user_2 = create(:user, name: "joe")
    @ride = create(:ride, user: @user )
    @ride_2 = create(:ride, user: @user )
    @origin = Origin.create!(full_street_address: "winters, ca", ride: @ride )
    @destination = Destination.create!(full_street_address: "davis, ca", ride: @ride)
    @origin_2 = Origin.create!(full_street_address: "winters, ca", ride:@ride_2 )
    @destination_2= Destination.create!(full_street_address: "oakland, ca", ride: @ride_2)
  end
  it 'can request a ride' do
    VCR.use_cassette 'api_request_ride' do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_2)

    visit "/rides/#{@ride_2.id}"

    click_on "Request this ride"

    select '1', :from => 'passenger_count'

    click_on 'Request Ride'

    expect(current_path).to eq(ride_path("#{@ride_2.id}"))

    expect(Request.count).to eq(1)
    expect(@ride_2.requests.count).to eq(1)
    end
  end

it 'a user can approve a ride spec' do
  VCR.use_cassette 'api_request_ride' do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_2)

    visit "/rides/#{@ride_2.id}"

    click_on "Request this ride"

    select '1', :from => 'passenger_count'

    click_on 'Request Ride'

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit "/users/#{@user.id}"

    expect(page).to have_content(@user_2.name)
    expect(page).to have_content('Approve')

    click_button "Approve"

    expect(Request.count).to eq(0)
    expect(Ride.find(@ride_2.id).status).to eq('approved')
    expect(Ride.find(@ride_2.id).passenger_count).to eq(1)

    end
  end
end
