require "spec_helper"

describe Loaderio::Application do
  let(:attributes){ { app: "localhost.local", app_id: "fake-app-id", status: "verified" } }  
  let(:application){ described_class.new(attributes) }
  
  let(:resource){ Loaderio::Configuration.resource }  
  
  subject{ application }
  
  shared_examples_for "application attributes" do
    its(:app){ should ==  "localhost.local" }
    its(:app_id){ should ==  "fake-app-id" }
    its(:status){ should ==  "verified" }      
  end
  
  it_should_behave_like "application attributes"
  
  context ".all" do
    let(:collection){ described_class.all }
    
    subject{ collection }
    
    before do
      resource.should_receive(:[]).with("apps.json").and_return(resource)
      resource.should_receive(:get).and_return(MultiJson.dump([attributes, attributes]))
    end
    
    it{ should have(2).items }
    
    context "with element" do
      subject{ collection[0] }
      
      it_should_behave_like "application attributes"
    end
  end
  
  context ".find" do
    let(:instance){ described_class.find("fake-app-id") }
    
    subject{ instance }
    
    before do
      resource.should_receive(:[]).with("apps/fake-app-id.json").and_return(resource)
      resource.should_receive(:get).and_return(MultiJson.dump(attributes))
    end
    
    it_should_behave_like "application attributes"    
  end
end