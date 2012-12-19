module Loaderio
  class Application
    attr_reader :app_id, :app, :status
    
    def initialize(attributes)
      @app_id, @app, @status = attributes[:app_id], attributes[:app], attributes[:status] 
    end
    
    def self.all
      MultiJson.load(Loaderio::Configuration.resource["apps.json"].get, :symbolize_keys => true).map do |item|
        new(item)
      end
    end
  end  
end
