#
# Cookbook Name:: packer
# Recipe:: default
#
# Copyright (C) 2013 Hadapt, Inc.
#
# Install packages necessary for extracting stuff

include_recipe 'ark'

ark 'packer' do
  # rubocop:disable Metrics/LineLength
  url "#{node['packer']['url_base']}/packer_#{node['packer']['version']}_#{node['os']}_#{node['packer']['arch']}.zip"
  version node['packer']['version']
  checksum node['packer']['checksum']
  has_binaries ['packer']
  append_env_path false
  strip_components 0

  if platform_family?('windows')
  	win_install_dir node['packer']['win_install_dir']
    owner node['packer']['owner']
  end

  action :install
end

# update path
if platform_family?('windows')
   windows_path node['packer']['win_install_dir'] do
     action :add
   end
end
