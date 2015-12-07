include_recipe 'bazaar'
include_recipe 'tar'

directory '/tmp/branch'

tar_extract 'file://./tmp/kitchen/data/repo.tar.gz' do
  target_dir '/tmp/branch'
  creates '/tmp/branch/repo'
end

directory '/tmp/location'

bazaar '1.0' do
  branch '/tmp/branch/repo'
  tag '1.0'
  location '/tmp/location/test'
end

bazaar '1.1' do
  branch '/tmp/branch/repo'
  tag '1.1'
  location '/tmp/location/test'
  action :update
end
