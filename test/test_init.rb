ENV['CONSOLE_DEVICE'] ||= 'stdout'
ENV['LOG_COLOR'] ||= 'on'
ENV['LOG_LEVEL'] ||= 'trace'

require_relative '../init'

require 'controls'
require 'runner'
require 'pry'

require 'event_generator/controls'

def logger(name)
  name = name.split('/').last
  Telemetry::Logger.get "-- TEST -- #{name}"
end
