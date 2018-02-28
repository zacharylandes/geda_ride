require 'rails_helper'

describe 'messages' do
    it 'user viw a messages ride' do

      user_1 = create(:user)
      user_2 = create(:user)

      ride = create(:ride, user:user_1, date: "2018-02-22" )

      origin  = Origin.create!(full_street_address: "winters, ca", ride:ride )
      destination  = Destination.create!(full_street_address: "davis, ca", ride:ride)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)

      visit "/rides/#{ride.id}"
      click_on 'Message User'

      fill_in 'subject', :with => "ride to the party"
      fill_in 'body', :with => "gimme a ride dawg"

      click_on 'Send Message'

      click_on  '< Back to the ride'

      expect(current_path).to eq(ride_path(ride))
  end

end
