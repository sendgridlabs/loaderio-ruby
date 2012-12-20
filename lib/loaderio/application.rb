module Loaderio
  class Application < Base
    attr_reader :app_id, :app, :status
    
    def initialize(attributes)
      @app_id, @app, @status = attributes[:app_id], attributes[:app], attributes[:status]
      super
    end
    
    def self.resource_name
      "apps"
    end
    
    def self.verify(app_id)
      new(parse(Loaderio::Configuration.resource["#{resource_name}/#{app_id}/verify"].post({})))
    end
    
    def verification_id
      "loaderio-#{app_id}"
    end
  end  
end
