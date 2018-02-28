require 'rails_helper'

describe 'events search' do
  it 'can search events by location' do
    VCR.use_cassette 'search-events' do
      visit '/'

      page.first(".mountain").click

      expect(current_path).to eq(events_path)

      fill_in 'f_elem_city', :with => "oakland, ca"
      fill_in 'date', :with => "2018-02-18"

      click_button 'Showtime'

      expect(Event.count).to be 10
      expect(page).to have_content('oakland, ca')
    end
  end
  it 'can search events by other locations' do
    VCR.use_cassette 'search-events' do
      visit '/'

      page.first(".mountain").click

      expect(current_path).to eq(events_path)

      fill_in 'f_elem_city', :with => "denver, co"
      fill_in 'date', :with => "2018-02-18"

      click_button 'Showtime'

      expect(Event.count).to be 10
      expect(page).to have_content('denver, co')
    end
  end
  it 'can search events by other locations' do
    VCR.use_cassette 'search-events' do
      visit '/'

      page.first(".mountain").click

      expect(current_path).to eq(events_path)

      fill_in 'f_elem_city', :with => "asdas, ca"
      fill_in 'date', :with => "2018-02-18"

      click_button 'Showtime'

      expect(Event.count).to be < 6
      expect(page).to have_content("sorry we couldn't find any events in that area")
    end
  end
end
