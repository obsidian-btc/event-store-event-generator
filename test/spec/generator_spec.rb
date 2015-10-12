require_relative './spec_init'

generator = EventGenerator::Controls::Generator.build

describe 'Generating events' do
  events = generator.first 7

  specify 'Applies templates to generated events' do
    event_types = events.map &:type
    attributes = events.map &:some_attribute

    assert attributes == %w(foo bar baz foo bar baz foo)
    assert event_types == %w(
      SomeEventType
      SomeEventType
      SomeEventType
      SomeOtherEventType
      SomeOtherEventType
      SomeOtherEventType
      SomeEventType
    )
  end

  specify 'Increments the counter' do
    counters = events.map &:counter

    assert counters == [0, 1, 2, 3, 4, 5, 6]
  end
end
