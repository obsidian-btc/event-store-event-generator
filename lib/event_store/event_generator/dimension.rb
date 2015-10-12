module EventStore
  class EventGenerator
    module Dimension
      def self.included(cls)
        cls.virtual :raw_values
        cls.virtual :apply
      end

      def values
        raw_values.map do |raw_value|
          Value.new(self, raw_value)
        end
      end
    end
  end
end
