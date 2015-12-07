if defined?(ChefSpec)
  def install_bzr # rubocop:disable Style/AccessorMethodName
    ChefSpec::Matchers::ResourceMatcher.new(:package, :install, 'bzr')
  end

  def checkout_with_bazaar(location)
    ChefSpec::Matchers::ResourceMatcher.new(:bazaar, :checkout, location)
  end
end
