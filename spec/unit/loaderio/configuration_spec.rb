require "spec_helper"

describe Loaderio::Configuration do
  context "#protocol" do
    subject{ described_class.protocol }
    
    it{ should == "https" }
  end
  
  context "#api_version" do
    subject{ described_class.api_version }
    
    it{ should == "v1" }
  end
  
  context "#api_key" do
    subject{ described_class.api_key }
    
    before{ described_class.api_key = "api_key" }
    
    it{ should == "api_key" }
  end
  
  context "#server" do
    subject{ described_class.server }
    
    before{ described_class.server = "api.loader.io" }
    
    it{ should == "api.loader.io" }
  end
  
  context "#base_url" do
    subject{ described_class.base_url }
    
    it{ should == "https://api.loader.io/v1" }
  end
  
  context "#resource" do
    subject{ described_class.resource }
    
    it{ should be_kind_of(RestClient::Resource) }
  end
end