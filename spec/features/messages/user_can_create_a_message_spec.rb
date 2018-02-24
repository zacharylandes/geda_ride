require 'rails_helper'

describe 'messages' do
    it 'see create a message from user show' do

      user_1 = create(:user)
      user_2 = create(:user, name:'joe')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      visit "/users/#{user_1.id}"

      click_on "Your Messages"

      expect(current_path).to eq(conversations_path)
      # 
      # click_on "New Message"
      #
      # expect(current_path).to eq(new_conversation_path)

  end

end
