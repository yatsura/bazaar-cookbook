directory '/tmp/location'
directory '/tmp/location/test'

bazaar '/tmp/location/test' do
  repository '/tmp/branch/repo'
  tag '1.0'
end

bazaar '/tmp/location/test' do
  repository '/tmp/branch/repo'
  tag '1.1'
  location
  action :update
end
