require 'spec_helper'

describe "bazaar_test::default" do
  let(:chef_run) {
    ChefSpec::SoloRunner.new(
      platform: 'ubuntu',
      version: '14.04',
      step_into: 'bazaar'
    ).converge("bazaar_test::checkout_unit")
  }

  context "checkout" do
    it "should execute" do
      expect(chef_run).to checkout_bazaar_repo('/repo')
    end

    it "should execute bzr" do
      expect(chef_run).to checkout_with_bazaar('/repo', tag: '1.0', to: '/1.0')
    end
  end
end
