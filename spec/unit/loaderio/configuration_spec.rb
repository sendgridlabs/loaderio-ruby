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
end