require 'pry'
require 'spec_helper'

describe "Default Provider" do
  let(:provider) { Chef::Provider::Bazaar.new('location') }

  context "checkout" do
    it "should execute bazaar" do
      binding.pry
      expect(provider).to receive(:execute).with("hello world")
    end
  end
end
