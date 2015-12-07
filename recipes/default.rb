#
# Cookbook Name:: bazaar
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'apt'

package 'bzr' do
  action :install
end

bazaar node['bazaar']['branch']
