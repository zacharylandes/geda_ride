require 'rails_helper'

describe 'ride service' do
  it 'creates ride' do
    user= create(:user)
    params = {"origin"=>"sac", "destination"=>"fresn", "date"=>"2018-02-28"}
    ride = RideService.new.create_ride(params,user)

    expect(ride.id).to_not be_nil
    expect(ride.origin.full_street_address).to eq('sac')
    expect(ride.destination.full_street_address).to eq('fresn')
  end
  it 'finds origins' do
    VCR.use_cassette 'origin finder' do
      user= create(:user)
      ride = create(:ride, user:user)
      origin = Origin.create!(full_street_address:"Boulder, Co", ride:ride)
      result = RideService.new.origin_finder("Louisville, Co")

      expect(result.count).to eq(1)
      expect(result.first.class).to eq Ride
    end
  end
  it 'finds destinations' do
    VCR.use_cassette 'destination finder' do
      user= create(:user)
      ride = create(:ride, user:user)
      destination = Destination.create!(full_street_address:"Denver, Co", ride:ride)
      result = RideService.new.dest_finder("Aurora, Co")

      expect(result.count).to eq(1)
      expect(result.first.class).to eq Ride
    end
  end

  it 'finds rides that exist' do
    VCR.use_cassette 'ride finder' do

    user= create(:user)
    ride = create(:ride, user:user, date: '2018-03-14')
    origin = Origin.create!(full_street_address:"Boulder, Co", ride:ride)
    destination = Destination.create!(full_street_address:"Denver, Co", ride:ride)
    result = RideService.new.find_ride("Boulder, Co", "Denver, CO", "2018-03-14" )

    expect(result.count).to eq(1)
    expect(result.first).to eq(ride)
    end
  end

  it 'finds similar rides if searched rides dont exist' do
    VCR.use_cassette 'no match finder' do

    user= create(:user)
    ride = create(:ride, user:user, date: '2018-03-14')
    origin = Origin.create!(full_street_address:"Boulder, Co", ride:ride)
    destination = Destination.create!(full_street_address:"Denver, Co", ride:ride)
    result = RideService.new.find_ride("Davis, CA", "Denver, Co", "2018-02-14" )

    expect(result.class).to eq Hash
    expect(result.keys.first).to eq("dests")
    end
  end
end
