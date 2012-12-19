module Loaderio
  class Base
    attr_reader :message, :errors
    
    def initialize(attributes)
      @message, @errors = attributes[:message] || "success", attributes[:errors]
    end    
    
    def valid?
      @message == "success"
    end
    
    private
    
    def self.parse(responce)
      MultiJson.load(responce, :symbolize_keys => true)
    end
  end
end