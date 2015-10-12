require_relative './spec_init'

describe "Event Dimension" do
  specify "Mutating events" do
    events = [OpenStruct.new, OpenStruct.new]

    dimension = EventStore::EventGenerator::Controls::Dimension::EventType.new
    dimension.values.map.with_index do |value, index|
      event = events.fetch index
      value.(event)
    end

    event_types = events.map &:type

    assert event_types == %w(SomeEventType SomeOtherEventType)
  end
end
