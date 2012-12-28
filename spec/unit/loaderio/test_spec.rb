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
  
  let(:resource){ mock("resource") }
  
  before{ Loaderio::Configuration.stub!(:resource).and_return(resource) }  
  
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
  
  shared_examples_for "test results" do
    its(:started_at){ should == "2012-09-13T10:32:36Z" }
    its(:public_results_url){ should == "http://loader.io/results/1f25f5d42d6839bc30815dc92d301e86" }
    its(:success){ should == 25588 }
    its(:error){ should == 0 }
    its(:timeout_error){ should == 6220 }
    its(:data_sent){ should == 7617840 }
    its(:data_received){ should == 4212000 }
  end
  
  it_should_behave_like "test attributes"
  
  context ".all" do
    let(:collection){ described_class.all }
    
    subject{ collection }
    
    before do
      resource.should_receive(:[]).with("tests").and_return(resource)
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
      resource.should_receive(:[]).with("tests/fake-test-id").and_return(resource)
      resource.should_receive(:get).and_return(MultiJson.dump(attributes))
    end
    
    it_should_behave_like "test attributes"
  end
  
  context ".create" do
    let(:results_data){
      {
        started_at: "2012-09-13T10:32:36Z",
        public_results_url: "http://loader.io/results/1f25f5d42d6839bc30815dc92d301e86",
        success: 25588,
        error: 0,
        timeout_error: 6220,
        data_sent: 7617840,
        data_received: 4212000
      }
    }
    let(:responce){ described_class.create(url: "http://app.loader.io/tests#12", load: "0-10-10")  }
    
    subject{ responce }
    
    before do
      resource.should_receive(:[]).with("tests").and_return(resource)
      resource.should_receive(:post).with(MultiJson.dump(url: "http://app.loader.io/tests#12", load: "0-10-10")).and_return(MultiJson.dump(attributes.merge(results_data: results_data)))
    end
    
    it_should_behave_like "test attributes"
    
    context "with results data" do
      subject{ responce.results_data }
      
      it_should_behave_like "test results"
    end
  end
  
  context ".results" do
    let(:results_data){
      {
        started_at: "2012-09-13T10:32:36Z",
        public_results_url: "http://loader.io/results/1f25f5d42d6839bc30815dc92d301e86",
        success: 25588,
        error: 0,
        timeout_error: 6220,
        data_sent: 7617840,
        data_received: 4212000
      }
    }
    let(:responce){ described_class.results("fake-test-id")  }
    
    subject{ responce }
    
    before do
      resource.should_receive(:[]).with("tests/fake-test-id/results").and_return(resource)
      resource.should_receive(:get).and_return(MultiJson.dump(attributes.merge(results_data: results_data)))
    end
    
    it_should_behave_like "test attributes"
    
    context "with results data" do
      subject{ responce.results_data }
      
      it_should_behave_like "test results"
    end
  end
end