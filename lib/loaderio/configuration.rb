module Loaderio
  class Configuration
    class << self
      attr_accessor :api_key, :api_version, :protocol      
    end
    
    self.api_version = "v1"    
    self.protocol    = "https"
  end
end
