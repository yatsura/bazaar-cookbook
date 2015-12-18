require 'serverspec'

set :backend, :exec

describe 'bazaar::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  it 'should install bzr' do
    expect(package('bzr')).to be_installed
  end
end
