module Loaderio
  class Base
    attr_reader :message, :errors
        
    def initialize(attributes)
      @message, @errors = attributes[:message] || "success", attributes[:errors]
    end    
    
    def valid?
      @message == "success"
    end
    
    alias_method :success?, :valid?    
    
    def self.resource_name
      raise "resource name was not specified"
    end
    
    def self.all
      parse(Loaderio::Configuration.resource["#{resource_name}.json"].get).map do |item|
        new(item)
      end
    end
    
    def self.find(id)
      new(parse(Loaderio::Configuration.resource["#{resource_name}/#{id}.json"].get))
    end
    
    def self.create(attrs)
      new(parse(Loaderio::Configuration.resource["#{resource_name}.json"].post(attrs)))
    end
    
    private
    
    def self.parse(responce)
      MultiJson.load(responce, :symbolize_keys => true)
    end
  end
end