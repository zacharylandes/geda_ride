require 'rails_helper'

describe 'messages' do
    it 'user can message another user do' do
      user_1 = create(:user)
      user_2 = create(:user)

      ride = create(:ride, user:user_1, date: "2018-02-22" )
      ride2 = create(:ride, user:user_1, date: "2018-02-22" )

      origin  = Origin.create!(full_street_address: "winters, ca", ride:ride )
      destination  = Destination.create!(full_street_address: "davis, ca", ride:ride)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)

      visit "/rides/#{ride.id}"
      click_on 'Message User'

      fill_in 'subject', :with => "ride to the party"
      fill_in 'body', :with => "gimme a ride dawg"

      click_on 'Send Message'

      expect(user_2.mailbox.conversations.first.receipts.count).to eq(2)

      within first(".message-body") do
        click_on "Delete"
      end

      expect(user_2.mailbox.conversations).to be_empty

  end

end
