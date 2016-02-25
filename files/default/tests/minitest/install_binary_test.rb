require_relative 'support/test_helper'

describe_recipe 'sbp_packer::install_binary' do
  include ChefPacker::TestHelper

  it 'installed packer' do
    skip 'not tested under Windows' if node['platform_family'] == 'windows'
    packer_dir = "/usr/local/packer-#{node['sbp_packer']['version']}"
    directory(packer_dir)
      .must_exist
      .with(:mode, '755')
      .and(:owner, 'root')
      .and(:group, 'root')
    link('/usr/local/packer')
      .must_exist
      .with(:to, packer_dir)
    link('/usr/local/bin/packer')
      .must_exist
      .with(:to, File.join(packer_dir, 'packer'))
    file(File.join(packer_dir, 'packer'))
      .must_exist
      .with(:mode, '755')
  end
end
