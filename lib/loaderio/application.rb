class Loaderio::Application

  def initialize(attributes)
  end
  
  def self.all
    MultiJson.load(Loaderio::Configuration.resource["apps.json"], :symbolize_keys => true)
  end
end