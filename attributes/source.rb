default['packer']['source_revision'] = 'master'
default['packer']['source_repo_url'] = 'https://github.com/mitchellh/packer.git'
default['packer']['source_install_path'] = "#{node['go']['gopath']}/src/github.com/mitchellh/packer"
