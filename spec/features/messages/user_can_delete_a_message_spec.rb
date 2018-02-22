require 'rails_helper'

describe 'messages' do
    it 'user can message another user do' do

      user_1 = create(:user)
      user_2 = create(:user, name:'joe')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      visit '/conversations/new'

      select "#{user_2.name}", :from => "user_id"


      fill_in 'subject', :with => "ride to the party"
      fill_in 'body', :with => "gimme a ride dawg"

      click_button 'Send Message'

      expect(user_2.mailbox.conversations.first.receipts.first.message.body).to eq("gimme a ride dawg")

      fill_in 'body', :with => "gimme another ride dawg"

      click_button 'Send Message'
      expect(user_1.mailbox.conversations.first.receipts.count).to eq(4)

      within first(".message-body") do
        click_on "Delete"
      end

      expect(user_1.mailbox.conversations.first.receipts.count).to eq(2)

  end

end
