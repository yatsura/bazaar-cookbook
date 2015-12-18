require 'spec_helper'

describe "bazaar_test::update_unit" do
  let(:chef_run) {
    ChefSpec::SoloRunner.new(
      platform: 'ubuntu',
      version: '14.04',
      step_into: 'bazaar'
    ).converge("bazaar_test::update_unit")
  }

  context "checkout" do
    it "access the repository" do
      expect(chef_run).to update_location_at('/1.0')
    end

    it "should execute bzr" do
      expect(chef_run).to update_with_bazaar('/1.0', tag: '1.0')
    end
  end
end
