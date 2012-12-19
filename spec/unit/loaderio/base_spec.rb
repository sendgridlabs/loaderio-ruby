require "spec_helper"

describe Loaderio::Base do
  let(:attributes){ { message: "error", errors: ["Invalid record"] } }
  let(:instance){ described_class.new attributes }
  
  subject{ instance }
  
  its(:message){ should == "error" }
  its(:errors){ should == ["Invalid record"] }  
    
  context "#valid?" do
    subject{ instance.valid? }
    
    context "when error" do
      let(:attributes){ { message: "error" } }
      
      it{ should be_false }
    end
    
    context "when success" do
      let(:attributes){ { message: "success" } }
      
      it{ should be_true }
    end
    
    context "by default" do
      let(:attributes){ {} }
      
      it{ should be_true }      
    end
  end
end