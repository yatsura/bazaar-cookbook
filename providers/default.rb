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

action :sync do
  if resource_exists?
    bazaar_update
  else
    bazaar_checkout
  end
end

def load_current_resource
  @current_resource = Chef::Resource::Bazaar.new(@new_resource.location)
  if resource_exists?
    load_version_info @current_resource.location
    load_tags @current_resource.location
    if @tags.has_key?(@version_info[:revno])
    end
  end
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

def resource_exists?
  false
end

def load_version_info(location)
  cmd = Mixlib::ShellOut.new("bzr version-info --template=\"{last_revision: '{date}', clean: {clean}, revno: {revno}, revision_id: '{revision_id}', branch_nick: '{branch_nick}'}\n\" --custom #{location}")
  cmd.run_command
  cmd.error!
  @version_info = eval cmd.stdout
end

def load_tags
  cmd = Mixlib::ShellOut.new("bzr tags #{location}")
  cmd.run_command
  cmd.error!
  proc = Proc.new { |a| a.split(/\s/).reverse }
  @tags = Hash[cmd.o.split("\n").collect(&p)]
end
