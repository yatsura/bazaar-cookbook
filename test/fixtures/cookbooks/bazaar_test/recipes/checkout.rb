directory '/tmp/checkout' do
  action :create
end

bazaar '/tmp/checkout/1.0' do
  repository '/tmp/branch/repo'
  tag '1.0'
end

bazaar '/tmp/checkout/1.1' do
  repository '/tmp/branch/repo'
  tag '1.1'
end
