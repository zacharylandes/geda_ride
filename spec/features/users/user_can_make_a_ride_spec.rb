require 'rails_helper'
describe 'user ' do
  it 'can make a ride  ' do
    user = create(:user, name:"zach")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    click_on "Post a ride"

    expect(current_path).to eq(new_ride_path)


    fill_in 'ride[origin]', :with => "Winters, ca"
    fill_in 'ride[destination]', :with => "Sacramento, ca"
    page.find('#ride_date').set("2018-03-01")

    click_on 'Make a Ride'

    expect(page).to have_content("#{Ride.first.origin.full_street_address}")
    expect(page).to have_content("#{Ride.first.destination.full_street_address}")
    expect(page).to have_content("#{Ride.first.date}")

  end
  it 'a different user can see a  posted ride' do
      user = create(:user)
      ride = create(:ride, user:user, date: '2018-03-01' )

      origin  = Origin.create!(full_street_address: "Winters, ca", ride:ride )
      destination  = Destination.create!(full_street_address: "davis, ca", ride:ride)

    visit '/'
      fill_in 'f_elem_city', :with => "Winters, ca"
      fill_in 'f_elem_city_2', :with => "davis, ca"
      fill_in 'date', :with => "2018-03-01"

      click_button 'Geda Ride'


      expect(page).to have_content('Winters, ca')
  end
    it ' errors if the ride is invalid  ' do
      user = create(:user, name:"zach")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'

      click_on "Post a ride"

      expect(current_path).to eq(new_ride_path)


      fill_in 'ride[origin]', :with => "asdfewf, ca"
      fill_in 'ride[destination]', :with => "fdssdf, ca"
      page.find('#ride_date').set("2018-03-01")

      click_on 'Make a Ride'

      expect(page).to have_content('trouble')

    end
end
