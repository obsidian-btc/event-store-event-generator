module EventStore
  class EventGenerator
    module Dimension
      class PermutationSet
        attr_reader :dimensions

        def initialize(*dimensions)
          @dimensions = dimensions
        end

        def self.call(*dimensions)
          instance = new *dimensions
          instance.()
        end

        def call
          values = dimensions.map do |dimension_cls|
            dimension_cls.new.values
          end

          first_values = values.shift or return []

          first_values.product(*values).map do |values|
            Permutation.new(values)
          end
        end

        class Permutation
          attr_reader :values

          def initialize(values)
            @values = values
          end

          def call(event)
            values.each do |value|
              value.(event)
            end
          end

          def raw_values
            values.map &:raw_value
          end

          def inspect
            inspected_raw_values = raw_values.map &:inspect
            "ValueSet(#{inspected_raw_values*", "})"
          end
        end
      end
    end
  end
end
