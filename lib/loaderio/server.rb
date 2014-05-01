module Loaderio
  class Server < Base
    attr_reader :ip_addresses

    def initialize(ip_addresses)
      @ip_addresses = ip_addresses[1]
    end

    def self.all
      new(parse(Loaderio::Configuration.resource["#{resource_name}"].get))
    end

    def self.resource_name
      "servers"
    end
  end
end