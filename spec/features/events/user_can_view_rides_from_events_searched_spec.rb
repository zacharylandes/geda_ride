require 'rails_helper'

describe 'ride find from event search' do
    it 'can see events' do
      user = create(:user)
      ride = create(:ride, user:user )
      ride_2 = create(:ride, user:user )

      origin  = Origin.create!(full_street_address: "portland, or", ride:ride )
      destination  = Destination.create!(full_street_address: "oakland, CA", ride:ride)
      origin_2  = Origin.create!(full_street_address: "san jose, ca", ride:ride_2 )
      destination_2 = Destination.create!(full_street_address: "oakland, CA", ride:ride_2)

        visit '/events'

        fill_in 'f_elem_city', :with => "oakland,ca"
        fill_in 'date', :with => "2018-02-18"

        click_button 'Showtime'
        within first('#click-event') do
            click_on 'GedaRide'
        end


        expect(current_path).to eq("/destinations/oakland,ca")
  end
end
