require 'rails_helper'
describe 'user edit page' do
  it 'can update profile ' do
    user = create(:user, name:"zach")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    click_on "#{user.name}"

    expect(current_path).to eq(user_path(user))
    click_on 'Edit your profile'
    page.attach_file('user[image]', Rails.root + 'app/assets/images/car-draw.png')
    click_on 'Submit'

    expect(current_path).to eq(user_path(user))
    
  end
end
