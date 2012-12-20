require "spec_helper"

describe Loaderio::Base do
  let(:attributes){ { message: "error", errors: ["Invalid record"] } }
  let(:instance){ described_class.new attributes }
  
  subject{ instance }
  
  its(:message){ should == "error" }
  its(:errors){ should == ["Invalid record"] }  
  
  context ".resource_name" do
    subject{ described_class.resource_name }
    
    it{ lambda{ subject }.should raise_error }
  end
  
  context "#valid?" do
    subject{ instance }
    
    context "when error" do
      let(:attributes){ { message: "error" } }
      
      it{ should_not be_valid }
      it{ should_not be_success }
    end
    
    context "when success" do
      let(:attributes){ { message: "success" } }
      
      it{ should be_valid }
      it{ should be_success }
    end
    
    context "by default" do
      let(:attributes){ {} }
      
      it{ should be_valid }
      it{ should be_success }
    end
  end
end