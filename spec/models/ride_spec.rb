require 'rails_helper'
RSpec.describe Ride, type: :model do
  it { should have_one(:origin) }
  it { should have_one(:destination) }
  it { should belong_to(:user) }

  it 'cost' do
    cost= Ride.cost(1030)
    expect(cost).to eq(20)
  end

end
