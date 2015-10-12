require_relative './spec_init'

describe 'Generating write events' do
  generator = EventGenerator::Write.build EventGenerator::Controls::Template.example

  specify 'Setting stream name' do
    event = generator.next

    event.stream_name = 'someStreamName'

    assert event.stream_name == 'someStreamName'
  end

  specify 'Event ID' do
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
