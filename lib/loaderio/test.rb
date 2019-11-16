module Loaderio
  class Test < Base
    attr_reader :url, :name, :duration, :timeout, :from, :to, :status, :test_id, :request_type, :results_data

    def initialize(attributes)
      @url          = attributes[:url]
      @name         = attributes[:name]
      @duration     = attributes[:duration]
      @timeout      = attributes[:timeout]
      @from         = attributes[:from]
      @to           = attributes[:to]
      @status       = attributes[:status]
      @test_id      = attributes[:test_id]
      @request_type = attributes[:request_type]
      @results_data = OpenStruct.new(attributes[:results_data])
      super
    end

    def self.resource_name
      "tests"
    end

    def self.results(id)
      new(parse(Loaderio::Configuration.resource["#{resource_name}/#{id}/results"].get))
    end

    def self.run(id)
      new(parse(Loaderio::Configuration.resource["#{resource_name}/#{id}/run"].put({})))
    end

    def self.stop(id)
      new(parse(Loaderio::Configuration.resource["#{resource_name}/#{id}/stop"].put({})))
    end
  end
end
