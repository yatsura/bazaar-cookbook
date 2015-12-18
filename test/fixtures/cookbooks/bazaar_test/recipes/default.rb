include_recipe 'bazaar'
include_recipe 'tar'

directory '/tmp/branch'

tar_extract 'file://./tmp/kitchen/data/repo.tar.gz' do
  target_dir '/tmp/branch'
  creates '/tmp/branch/repo'
end

directory '/tmp/location' do
  recursive true
  action :delete
end

directory '/tmp/location' do
  action :create
end

bazaar '/tmp/location/1.0' do
  repository '/tmp/branch/repo'
  tag '1.0'
end

bazaar '/tmp/location/1.1' do
  repository '/tmp/branch/repo'
  tag '1.1'
end
