class EventGenerator
  module Dimension
    class Value
      attr_reader :dimension, :raw_value

      def initialize(dimension, raw_value)
        @dimension = dimension
        @raw_value = raw_value
      end

      def call(event)
        dimension.apply(event, raw_value)
      end
    end
  end
end
