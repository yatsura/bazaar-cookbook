include_recipe 'bazaar'
include_recipe 'tar'

directory '/tmp/branch'

tar_extract 'file://./tmp/kitchen/data/repo.tar.gz' do
  target_dir '/tmp/branch'
  creates '/tmp/branch/repo'
end
