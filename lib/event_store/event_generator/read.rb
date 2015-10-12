module EventStore
  class EventGenerator
    class Read < EventGenerator
      def self.build_event_data
        event_data = EventStore::Client::HTTP::EventData::Read.new
        event_data.links = EventStore::Client::HTTP::EventData::Read::Links.new('http://example.com')
        event_data.created_time = Clock.iso8601
        event_data
      end

      def set_counter(event)
        event.number = counter
      end
    end
  end
end
