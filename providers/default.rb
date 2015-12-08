#
# Author:: Paul D Mitchell (<paul.d.mitchell@ed.ac.uk>)
# Cookbook Name:: bazaar
# Provider:: bazaar
use_inline_resources if defined?(use_inline_resources)

def whyrun_supported
  true
end

action :checkout do
  if @current_resource.checked_out
    Chef::Log.info "#{@new_resource} already checked out - nothing to do."
  else
    converge_by("Checkout #{@new_resource}") do
      bazaar_checkout
    end
  end
end

action :update do
  bazaar_update
end

def load_current_resource
  @current_resource = Chef::Resource::Bazaar.new(@new_resource.branch)
  @current_resource.tag = @new_resource.tag
  @current_resource.location = @new_resource.location

  if already_checked_out
    @current_resource.checked_out = true
  end
end

def bazaar_checkout
  checkoutString = "bzr checkout -rtag:#{@current_resource.tag} #{@current_resource.branch} #{@current_resource.location}"
  converge_by("Command: #{checkoutString}") do
    execute checkoutString
  end
end

def bazaar_update
  checkoutString = "bzr update -rtag:#{@current_resource.tag} #{@current_resource.location}"
  converge_by("Command: #{checkoutString}") do
    execute checkoutString
  end
end

def already_checked_out
  false
end
