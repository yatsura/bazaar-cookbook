#
# Author:: Paul D Mitchell (<paul.d.mitchell@ed.ac.uk>)
# Cookbook Name:: bazaar
# Provider:: bazaar
use_inline_resources if defined?(use_inline_resources)

def whyrun_supported
  true
end

action :checkout do
  converge_by("Checkout #{@new_resource}") do
    bazaar_checkout
  end
end

action :update do
  converge_by("Update #{new_resource}") do
    bazaar_update
  end
end

def load_current_resource
  @current_resource = Chef::Resource::Bazaar.new(@new_resource.location)
  @current_resource.tag = @new_resource.tag
  @current_resource.repository = @new_resource.repository
end

def bazaar_checkout
  checkoutString = "bzr checkout -rtag:#{@new_resource.tag} #{@new_resource.repository} #{@new_resource.location}"
  converge_by("Command: #{checkoutString}") do
    execute checkoutString
  end
end

def bazaar_update
  checkoutString = "bzr update -rtag:#{@new_resource.tag} #{@new_resource.location}"
  converge_by("Command: #{checkoutString}") do
    execute checkoutString
  end
end
