module Loaderio
  class Test < Base
    attr_reader :test_id, :name, :notes,
        :test_type, :duration, :timeout, :initial, :total, :domain, :urls,
        :status, :callback, :callback_email, :scheduled_at


    def initialize(attributes)
      @test_id        = attributes[:test_id]
      @name           = attributes[:name]
      @notes          = attributes[:notes]

      @test_type      = attributes[:test_type]
      @duration       = attributes[:duration]
      @timeout        = attributes[:timeout]
      @initial        = attributes[:initial]
      @total          = attributes[:total]
      @domain         = attributes[:domain]
      @urls           = attributes[:urls]

      @status         = attributes[:status]
      @callback       = attributes[:callback]
      @callback_email = attributes[:callback_email]
      @scheduled_at   = attributes[:scheduled_at]

      super
    end

    def as_json(_options = {})
      {
        test_id: @test_id,
        name: @name,
        notes: @notes,

        test_type: @test_type,
        duration: @duration,
        timeout: @timeout,
        initial: @initial,
        total: @total,
        domain: @domain,
        urls: @urls,

        status: @status,
        callback: @callback,
        callback_email: @callback_email,
        scheduled_at: @scheduled_at
     }
    end

    def to_json(*options)
      as_json(*options).to_json(*options)
    end

    def complete?
      status == 'complete'
    end

    def results
      parse(Loaderio::Configuration.resource["#{resource_name}/#{@test_id}/results"].get)
    end

    def self.resource_name
      "tests"
    end

    def self.run(id)
      new(parse(Loaderio::Configuration.resource["#{resource_name}/#{id}/run"].put({})))
    end

    def self.stop(id)
      new(parse(Loaderio::Configuration.resource["#{resource_name}/#{id}/stop"].put({})))
    end
  end
end
