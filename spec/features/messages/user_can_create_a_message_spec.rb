require 'rails_helper'

describe 'messages' do
  it 'can create a message from user show' do

    user_1 = create(:user)
    user_2 = create(:user, name:'joe')

    ride = create(:ride, user:user_1 )

    origin  = Origin.create!(full_street_address: "winters, ca", ride:ride )
    destination  = Destination.create!(full_street_address: "davis, ca", ride:ride)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)

    visit "/rides/#{ride.id}"

    click_on "Message User"

    fill_in 'subject', :with => "ride to the party"
    fill_in 'body', :with => "gimme a ride dawg"

    click_on 'Send Message'


    expect(page).to have_content("ride to the party")
    expect(page).to have_content("Message Sent")
end

end
