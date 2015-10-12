module EventStore
  class EventGenerator
    module Controls
      class Generator < EventGenerator
        def self.build_event_data
          OpenStruct.new
        end

        def self.build
          templates = Template.permutations
          super templates
        end

        def set_counter(event)
          event.counter = counter
        end
      end
    end
  end
end
