directory '/tmp/sync'
directory '/tmp/sync/test'

bazaar '/tmp/sync/test' do
  repository '/tmp/branch/repo'
  tag '1.0'
end

bazaar '/tmp/sync/test' do
  repository '/tmp/branch/repo'
  tag '1.1'
end
