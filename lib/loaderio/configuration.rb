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
      "#{protocol}://#{server}/#{api_version}"
    end
    
    def resource
      @resource ||= RestClient::Resource.new(base_url, headers: {"loaderio-Auth" => api_key })
    end
  end
end
