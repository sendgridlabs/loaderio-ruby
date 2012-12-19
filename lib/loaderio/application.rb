module Loaderio
  class Application < Base
    attr_reader :app_id, :app, :status
    
    def initialize(attributes)
      @app_id, @app, @status = attributes[:app_id], attributes[:app], attributes[:status]
      super
    end
    
    def self.all
      parse(Loaderio::Configuration.resource["apps.json"].get).map do |item|
        new(item)
      end
    end
    
    def self.find(app_id)
      new(parse(Loaderio::Configuration.resource["apps/#{app_id}.json"].get))
    end
    
    def self.create(domain)
      new(parse(Loaderio::Configuration.resource["apps.json"].post(app: domain)))
    end
    
    def self.verify(app_id)
      new(parse(Loaderio::Configuration.resource["apps/#{app_id}/verify.json"].post({})))
    end
    
    def verification_id
      "loaderio-#{app_id}"
    end
  end  
end
