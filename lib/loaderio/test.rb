module Loaderio
  class Test < Base
    attr_reader :url, :name, :duration, :timeout, :from, :to, :status, :test_id, :request_type
    
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
      
      super
    end
    
    def self.all
      parse(Loaderio::Configuration.resource["tests.json"].get).map do |item|
        new(item)
      end
    end
    
    def self.find(test_id)
      new(parse(Loaderio::Configuration.resource["tests/#{test_id}.json"].get))
    end
  end
end
