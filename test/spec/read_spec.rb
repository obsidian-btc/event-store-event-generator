require_relative './spec_init'

describe 'Generating read events' do
  template = EventStore::EventGenerator::Controls::Template.example
  generator = EventStore::EventGenerator::Read.build template

  specify 'Created time' do
    event = generator.next

    created_time = Time.parse event.created_time

    assert created_time.to_date == Date.today
  end

  specify 'Links' do
    event = generator.next

    assert event.links.edit_uri == "http://example.com"
  end

  specify 'Number' do
    generator.counter = 1

    numbers = []

    2.times do
      event = generator.next
      number = event.number
      numbers << number
    end

    assert numbers == [1, 2]
  end
end
