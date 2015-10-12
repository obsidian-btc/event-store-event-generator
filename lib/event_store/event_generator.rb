require 'dependency'; Dependency.activate
require 'telemetry/logger'
require 'virtual'; Virtual.activate

require 'event_store/client/http'

require 'event_store/event_generator/dimension'
require 'event_store/event_generator/dimension/value'
require 'event_store/event_generator/dimension/permutation_set'
require 'event_store/event_generator/event_generator'
require 'event_store/event_generator/read'
require 'event_store/event_generator/write'
