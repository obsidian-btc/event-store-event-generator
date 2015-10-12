module EventStore
  class EventGenerator
    module Controls
      module Dimension
        class EventType
          include EventGenerator::Dimension

          def raw_values
            %w(SomeEventType SomeOtherEventType)
          end

          def apply(event, value)
            event.type = value
          end
        end

        class SomeAttribute
          include EventGenerator::Dimension

          def raw_values
            %w(foo bar baz)
          end

          def apply(event, value)
            event.some_attribute = value
          end
        end
      end
    end
  end
end
