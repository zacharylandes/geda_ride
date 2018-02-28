require 'rails_helper'

describe 'ride find from event search' do
    it 'can see events' do
        visit '/events'

        fill_in 'f_elem_city', :with => "oakland,ca"
        fill_in 'date', :with => "2018-02-18"

        click_button 'Showtime'
        save_and_open_page
        within first('#click-event') do
            click_on 'GedaRide'
        end


        expect(current_path).to eq(ride_path)
  end
end
