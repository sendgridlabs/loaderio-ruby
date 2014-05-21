require "spec_helper"

describe Loaderio::Test do
  let(:attributes){
    {
      domain: "gonnacrushya.com",
      duration: 60,
      initial: 0,
      name: "Loaderio Test",
      notes: "",
      scheduled_at: nil,
      status: "complete",
      test_id: "237a25ef081192d6a5c8602f99bdce1c",
      test_type: "Non-Cycling",
      timeout: 10000,
      total: 250,
      urls: [
        {
          authentication: nil,
          headers: {},
          payload_file_url: nil,
          raw_post_body: nil,
          request_params: {},
          request_type: "GET",
          url: "http://gonnacrushya.com"
        }
      ]
    }
  }
  let(:test){ described_class.new attributes }
  let(:resource){ double("resource") }

  before{ Loaderio::Configuration.stub(:resource).and_return(resource) }

  subject{ test }

  shared_examples_for "test attributes" do
    its(:domain){ should == "gonnacrushya.com"}
    its(:duration){ should == 60 }
    its(:initial){ should == 0 }
    its(:name){ should == "Loaderio Test" }
    its(:notes){ should == "" }
    its(:scheduled_at){ should == nil }
    its(:status){ should == "complete" }
    its(:test_id){ should == "237a25ef081192d6a5c8602f99bdce1c" }
    its(:test_type){ should == "Non-Cycling" }
    its(:timeout){ should == 10000 }
    its(:total){ should == 250 }
    its(:urls){ should == [
      {
        authentication: nil,
        headers: {},
        payload_file_url: nil,
        raw_post_body: nil,
        request_params: {},
        request_type: "GET",
        url: "http://gonnacrushya.com"
      }
    ] }
  end

  shared_examples_for "test results 1" do
    its(:avg_error_rate){ should == 0.0 }
    its(:avg_response_time){ should == 326 }
    its(:data_received){ should == 12897736 }
    its(:data_sent){ should == 237118792 }
    its(:error){ should == 0 }
    its(:network_error){ should == 0 }
    its(:public_results_url){ should ==
     "http://loader.io/reports/a0a5295cfe9a20d99949761a0b67f9ad/results/b6dccb25a59eb94dc9aba8bd1fdffe65" }
    its(:result_id){ should == "b6dccb25a59eb94dc9aba8bd1fdffe65" }
    its(:started_at){ should == "2014-05-20T19:56:28.197Z" }
    its(:status){ should == "ready" }
    its(:success){ should == 16196 }
    its(:timeout_error){ should == 0 }
  end

  shared_examples_for "test results 2" do
    its(:avg_error_rate){ should == 0.0 }
    its(:avg_response_time){ should == 326 }
    its(:data_received){ should == 12897736 }
    its(:data_sent){ should == 237118792 }
    its(:error){ should == 0 }
    its(:network_error){ should == 0 }
    its(:public_results_url){ should ==
     "http://loader.io/reports/a0a5295cfe9a20d99949761a0b67f9ad/results/b6dccb25a59eb94dc9aba8bd1fdffe66" }
    its(:result_id){ should == "b6dccb25a59eb94dc9aba8bd1fdffe66" }
    its(:started_at){ should == "2014-05-20T19:56:28.197Z" }
    its(:status){ should == "ready" }
    its(:success){ should == 16196 }
    its(:timeout_error){ should == 0 }
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

  context ".results" do
    let(:results_data){
      [
        {
          avg_error_rate: 0.0,
          avg_response_time: 326,
          data_received: 12897736,
          data_sent: 237118792,
          error: 0,
          network_error: 0,
          public_results_url:
           "http://loader.io/reports/a0a5295cfe9a20d99949761a0b67f9ad/results/b6dccb25a59eb94dc9aba8bd1fdffe65",
          result_id: "b6dccb25a59eb94dc9aba8bd1fdffe65",
          started_at: "2014-05-20T19:56:28.197Z",
          status: "ready",
          success: 16196,
          timeout_error: 0
        },
        {
          avg_error_rate: 0.0,
          avg_response_time: 326,
          data_received: 12897736,
          data_sent: 237118792,
          error: 0,
          network_error: 0,
          public_results_url:
           "http://loader.io/reports/a0a5295cfe9a20d99949761a0b67f9ad/results/b6dccb25a59eb94dc9aba8bd1fdffe66",
          result_id: "b6dccb25a59eb94dc9aba8bd1fdffe66",
          started_at: "2014-05-20T19:56:28.197Z",
          status: "ready",
          success: 16196,
          timeout_error: 0
        }
      ]
    }
    let(:resopnce) { described_class.results("fake-test-id")  }

    before do
      resource.should_receive(:[]).with("tests/fake-test-id/results").and_return(resource)
      resource.should_receive(:get).and_return(MultiJson.dump(results_data))
    end

    context "results 1" do
      subject{ resopnce[0] }
      it_should_behave_like "test results 1"
    end

    context "results 2" do
      subject{ resopnce[1] }
      it_should_behave_like "test results 2"
    end
  end

  context ".stop" do
    let(:attributes){ { test_id: "fake-test-id", message: "success" } }

    let(:responce){ described_class.stop("fake-test-id") }

    before do
      resource.should_receive(:[]).with("tests/fake-test-id/stop").and_return(resource)
      resource.should_receive(:put).with({}).and_return(MultiJson.dump(attributes))
    end

    subject{ responce }

    it{ should be_kind_of(described_class) }
    its(:test_id){ should == "fake-test-id" }
    it{ should be_valid }
  end
end