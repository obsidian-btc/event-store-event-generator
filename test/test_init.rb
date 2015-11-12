ENV['CONSOLE_DEVICE'] ||= 'stdout'
ENV['LOG_COLOR'] ||= 'on'
ENV['LOG_LEVEL'] ||= 'trace'

require_relative '../init'

require 'runner'
require 'pry'

require 'event_store/event_generator/controls'

Telemetry::Logger::AdHoc.activate
