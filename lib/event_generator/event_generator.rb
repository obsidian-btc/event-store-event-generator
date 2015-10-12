class EventGenerator
  include Enumerable

  attr_accessor :counter
  attr_reader :prototype
  attr_reader :templates

  def initialize(prototype, templates)
    @prototype = prototype
    @templates = templates
    @counter = 0
  end

  def self.build(templates)
    prototype = method :prototype
    templates = Array(templates)
    new prototype, templates
  end

  def self.prototype
    event_data = build_event_data
    event_data.metadata = {}
    event_data.data = {}

    Telemetry::Logger.configure event_data
    event_data
  end

  def self.build_event_data
    EventStore::Client::HTTP::EventData.new
  end

  def each
    return to_enum unless block_given?

    templates.cycle.each do |template|
      event = self.next
      template.(event)
      yield event
    end
  end

  def next
    event = prototype.()
    set_counter event
    self.counter += 1
    event
  end

  def one_cycle
    cycle_size = templates.size
    first cycle_size
  end

  def set_counter(event)
  end

  def to_enum
    Enumerator::Lazy.new(self) do |yielder, *args|
      yielder << args
    end
  end
end
