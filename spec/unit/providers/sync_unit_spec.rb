require 'spec_helper'

describe "bazaar_test::sync_unit" do
  let(:chef_run) {
    ChefSpec::SoloRunner.new(
      platform: 'ubuntu',
      version: '14.04',
      step_into: 'bazaar'
    ).converge("bazaar_test::sync_unit")
  }

  context "spec" do
    it "access the repository" do
      expect(chef_run).to sync_bazaar_repo('/1.0')
    end
  end
end
