require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.color = true
  config.log_level = :fatal # ignore warnings
  config.alias_example_group_to :describe_recipe, type: :recipe
  config.alias_example_group_to :describe_resource, type: :resource
  config.alias_example_group_to :describe_attribute, type: :attribute

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :except
    mocks.verify_partial_doubles = true
  end
end

RSpec.shared_context 'recipe tests', type: :recipe do
  let(:branch) { 'http://example.com/bzr' }
  let(:tag) { '1.0' }
  let(:location) { '/tmp/test' }

  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04') do |node|
      node.set['bazaar']['branch'] = branch
      node.set['bazaar']['tag'] = tag
      node.set['bazaar']['location'] = location
    end
    runner.converge(described_recipe)
  end
end

at_exit { ChefSpec::Coverage.report! }
