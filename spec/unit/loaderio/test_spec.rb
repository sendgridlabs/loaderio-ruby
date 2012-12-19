require "spec_helper"

describe Loaderio::Test do
  let(:attributes){
    {
      url: "http://app.loader.io/tests#12",
      name: "name",
      duration: 30,
      timeout: 0,
      from: 0,
      to: 15000,
      status: "complete",
      test_id: "fake-test-id",
      request_type: "GET"
    }
  }  
  let(:test){ described_class.new attributes }
  
  let(:resource){ Loaderio::Configuration.resource }  
  
  subject{ test }
  
  shared_examples_for "test attributes" do
    its(:url){ should == "http://app.loader.io/tests#12" }
    its(:name){ should == "name" }
    its(:duration){ should == 30 }
    its(:timeout){ should == 0 }
    its(:from){ should == 0 }
    its(:to){ should == 15000 }
    its(:status){ should == "complete" }
    its(:test_id){ should == "fake-test-id" }
    its(:request_type){ should == "GET" }
  end
  
  it_should_behave_like "test attributes"
  
  context ".all" do
    let(:collection){ described_class.all }
    
    subject{ collection }
    
    before do
      resource.should_receive(:[]).with("tests.json").and_return(resource)
      resource.should_receive(:get).and_return(MultiJson.dump([attributes, attributes]))
    end
    
    it{ should have(2).items }
    
    context "with element" do
      subject{ collection[0] }
      
      it_should_behave_like "test attributes"
    end    
  end
  
  context ".find" do
    let(:instance){ described_class.find("fake-test-id") }
    
    subject{ instance }

    before do
      resource.should_receive(:[]).with("tests/fake-test-id.json").and_return(resource)
      resource.should_receive(:get).and_return(MultiJson.dump(attributes))
    end
    
    it_should_behave_like "test attributes"
  end
end