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
    
    def self.resource_name
      "tests"
    end    
  end
end
