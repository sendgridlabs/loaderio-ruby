module Loaderio
  class Test < Base
    attr_reader :urls, :name, :duration, :timeout, :notes, :initial, :total, :status, :test_id, :test_type, :callback, :callback_email, :scheduled_at, :domain

    def initialize(attributes)
      @urls          = attributes[:urls]
      @name         = attributes[:name]
      @duration     = attributes[:duration]
      @timeout      = attributes[:timeout]
      @notes        = attributes[:notes]
      @initial      = attributes[:initial]
      @status       = attributes[:status]
      @test_id      = attributes[:test_id]
      @test_type    = attributes[:test_id]
      @scheduled_at = attributes[:scheduled_at]
      @domain = attributes[:domain]
      @callback         = attributes[:callback]
      @callback_email   = attributes[:callback_email]
      @notes        = attributes[:test_id]
      super
    end

    def self.resource_name
      "tests"
    end

    def self.results(id)
      parse(Loaderio::Configuration.resource["#{resource_name}/#{id}/results"].get).map do |result|
        Loaderio::Result.new(result)
      end
    end

    def self.result(id)
      Loaderio::Result.new(parse(Loaderio::Configuration.resource["#{resource_name}/#{id}/results"].get))
    end

    def self.run(id)
      new(parse(Loaderio::Configuration.resource["#{resource_name}/#{id}/run"].put({})))
    end

    def self.stop(id)
      new(parse(Loaderio::Configuration.resource["#{resource_name}/#{id}/stop"].put({})))
    end

  end
end