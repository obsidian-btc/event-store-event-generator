module EventStore
  class EventGenerator
    class Write < EventGenerator
      def self.build_event_data
        WithStreamName.new
      end

      def set_counter(event)
        uuid = ::Controls::ID.get counter
        event.id = uuid
      end

      class WithStreamName < EventStore::Client::HTTP::EventData::Write
        attr_accessor :stream_name
      end
    end
  end
end
