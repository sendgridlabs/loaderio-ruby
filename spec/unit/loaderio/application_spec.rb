require "spec_helper"

describe Loaderio::Application do
  let(:attributes){ { app: "localhost.local", app_id: "fake-app-id", status: "verified" } }
  let(:application){ described_class.new(attributes) }

  let(:resource){ double("resource") }

  before{ Loaderio::Configuration.stub(:resource) { resource } }

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
      resource.should_receive(:[]).with("apps").and_return(resource)
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
      resource.should_receive(:[]).with("apps/fake-app-id").and_return(resource)
      resource.should_receive(:get).and_return(MultiJson.dump(attributes))
    end

    it_should_behave_like "application attributes"
  end

  context ".create" do
    let(:responce){ { message: "success", app_id: "fake-app-id", verification_id: "loaderio-fake-app-id" }  }

    subject{ described_class.create app: "localhost.local"}

    before do
      resource.should_receive(:[]).with("apps").and_return(resource)
      resource.should_receive(:post).with(MultiJson.dump(app: "localhost.local")).and_return(MultiJson.dump(responce))
    end

    its(:app_id){ should == "fake-app-id" }
    its(:app){ should be_nil }
    its(:status){ should be_nil }
  end

  context ".verify" do
    let(:responce){ { app_id: "fake-app-id", message: "success" }}

    subject{ described_class.verify("fake-app-id") }

    before do
      resource.should_receive(:[]).with("apps/fake-app-id/verify").and_return(resource)
      resource.should_receive(:post).with({}).and_return(MultiJson.dump(responce))
    end

    its(:app_id){ should == "fake-app-id" }
    its(:app){ should be_nil }
    its(:status){ should be_nil }
  end

  context "#verification_id" do
    subject{ application.verification_id }

    it{ should == "loaderio-fake-app-id" }
  end
end