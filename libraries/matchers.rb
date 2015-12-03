if defined?(ChefSpec)
  def install_bzr # rubocop:disable Style/AccessorMethodName
    ChefSpec::Matchers::ResourceMatcher.new(:package, :install, 'bzr')
  end
end
