require_relative './spec_init'

describe 'Permutations of Event Dimensions' do
  permutations = EventGenerator::Controls::Template.permutations

  specify 'Mutating events' do
    events = []

    permutations.each do |permutation|
      event = OpenStruct.new
      permutation.(event)
      events << event
    end

    assert events == [
      OpenStruct.new(:type => 'SomeEventType', :some_attribute => 'foo'),
      OpenStruct.new(:type => 'SomeEventType', :some_attribute => 'bar'),
      OpenStruct.new(:type => 'SomeEventType', :some_attribute => 'baz'),
      OpenStruct.new(:type => 'SomeOtherEventType', :some_attribute => 'foo'),
      OpenStruct.new(:type => 'SomeOtherEventType', :some_attribute => 'bar'),
      OpenStruct.new(:type => 'SomeOtherEventType', :some_attribute => 'baz'),
    ]
  end
end
