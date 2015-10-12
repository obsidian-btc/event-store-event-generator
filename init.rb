require 'bundler/setup' unless ENV['DISABLE_BUNDLER'] == 'on'

lib_path = File.expand_path '../lib', __FILE__
unless $LOAD_PATH.include? lib_path
  $LOAD_PATH << lib_path
end

require 'event_store/event_generator'
