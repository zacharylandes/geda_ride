require 'rails_helper'

describe 'rides' do
    it 'can see rides' do
    visit '/'

    fill_in 'f_elem_city', :with => "winters, ca"

    click_button 'Geda Ride'
    save_and_open_page


    expect(current_path).to eq(rides_path)
  end
end
