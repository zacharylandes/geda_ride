require 'rails_helper'
describe 'reviews ' do
  it ' can see a users reviews' do
      user = create(:user)
      ride = create(:ride, user:user, date: '2018-03-01' )
      origin  = Origin.create!(full_street_address: "Winters, ca", ride:ride )
      destination  = Destination.create!(full_street_address: "davis, ca", ride:ride)


    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/users/#{user.id}"

      click_on 'Reviews'

      expect(page).to have_selector('.request-form')
  end
end
