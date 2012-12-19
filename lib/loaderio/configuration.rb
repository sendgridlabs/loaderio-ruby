module Loaderio
  module Configuration
    extend self
        
    attr_accessor :api_key, :api_version, :protocol      
    
    #default values
    self.api_version = "v1"
    self.protocol    = "https"
    
    def server
      "api.loader.io"
    end
    
    def base_url
      "#{protocol}://#{server}"
    end
    
    def resource
      RestClient::Resource.new(base_url)
    end
  end
end
