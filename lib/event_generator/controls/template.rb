class EventGenerator
  module Controls
    module Template
      def self.example
        -> event do
          event.type = "SomeEventType"
        end
      end

      def self.permutations
        EventGenerator::Dimension::PermutationSet.(
          Controls::Dimension::EventType,
          Controls::Dimension::SomeAttribute
        )
      end
    end
  end
end
