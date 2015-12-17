if defined?(ChefSpec)
  def install_bzr # rubocop:disable Style/AccessorMethodName
    ChefSpec::Matchers::ResourceMatcher.new(:package, :install, 'bzr')
  end

  def checkout_bazaar_repo(location)
    ChefSpec::Matchers::ResourceMatcher.new(:bazaar, :checkout, location)
  end

  def update_bazaar_repo(location)
    ChefSpec::Matchers::ResourceMatcher.new(:bazaar, :update, location)
  end

  def checkout_to_location(location)
    ChefSpec::Matchers::ResourceMatcher.new(:bazaar, :checkout, location)
  end
  def checkout_with_bazaar(repo, args={})
    tag = args.delete(:tag)
    loc = args.delete(:to)
    str = "bzr checkout -rtag:#{tag} #{repo} #{loc}"
    ChefSpec::Matchers::ResourceMatcher.new(:execute, :run, str)
  end
end
