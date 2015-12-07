require 'spec_helper'

describe 'bazaar::checkout' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  before(:all) do
    @fixture = "/tmp/kitchen/data"
    system "tar -z -x -f #{@fixture}/repo.tar.gz -C #{@fixture}"
  end

  after(:all) do
    system "rm -rf #{@fixture}/repo"
  end

  it 'should pass the sanity check' do
    expect(file("#{@fixture}/repo")).to be_directory
  end
end
