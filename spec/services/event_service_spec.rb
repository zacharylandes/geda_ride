require 'rails_helper'

RSpec.describe 'events parser' do
  it 'parses event ids ' do
    event_1 = Event.create(title: 'name', date: '2018-03-20', url: 'google.com', image: ['image'], city: 'davis,ca')
    event_2 = Event.create(title: 'name', date: '2018-03-20', url: 'google.com', image: ['image'], city: 'davis,ca')
    event_3 = Event.create(title: 'name', date: '2018-03-20', url: 'google.com', image: ['image'], city: 'davis,ca')
    event_4 = Event.create(title: 'name', date: '2018-03-20', url: 'google.com', image: ['image'], city: 'davis,ca')

      ids = "#{event_1.id}/#{event_2.id}/#{event_3.id}/#{event_4.id}"

      events = EventService.new.parser(ids)

      expect(events.count).to eq 4
      expect(events.sample.class).to eq Event

  end
end
