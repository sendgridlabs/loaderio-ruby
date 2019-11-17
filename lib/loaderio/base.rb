module Loaderio
  class Base
    attr_reader :message, :errors

    def initialize(attributes)
      @message, @errors = attributes[:message] || "success", attributes[:errors]
    end

    def valid?
      @message == "success"
    end

    def parse(response)
      self.class.parse(response)
    end

    def resource_name
      self.class.resource_name
    end

    alias_method :success?, :valid?

    def self.resource_name
      raise "resource name was not specified"
    end

    def self.all
      parse(Loaderio::Configuration.resource["#{resource_name}"].get).map do |item|
        new(item)
      end
    end

    def self.find(id)
      new(parse(Loaderio::Configuration.resource["#{resource_name}/#{id}"].get))
    end

    def self.create(attrs)
      new(parse(Loaderio::Configuration.resource["#{resource_name}"].post(MultiJson.dump(attrs))))
    end

    private

    def self.parse(response)
      MultiJson.load(response, :symbolize_keys => true)
    end
  end
end
