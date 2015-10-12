require_relative './spec_init'

describe 'Generating write events' do
  template = EventStore::EventGenerator::Controls::Template.example
  generator = EventStore::EventGenerator::Write.build template

  specify 'Setting stream name' do
    event = generator.next

    event.stream_name = 'someStreamName'

    assert event.stream_name == 'someStreamName'
  end

  specify 'Event ID' do
    generator.counter = 1
    event_ids = []

    2.times do
      event = generator.next
      event_id = event.id
      event_ids << event_id
    end

    assert event_ids == %w(
      00000001-0000-0000-0000-000000000000
      00000002-0000-0000-0000-000000000000
    )
  end
end
