default['packer']['version'] = '0.10.0'
default['packer']['url_base'] = 'https://releases.hashicorp.com/packer/' \
  "#{node['packer']['version']}"
default['packer']['arch'] = kernel['machine'] =~ /x86_64/ ? 'amd64' : '386'
default['packer']['zipfile'] = "packer_#{node['packer']['version']}_" \
  "#{node['os']}_#{node['packer']['arch']}.zip"

# rubocop:disable Metrics/LineLength
# Transform raw output of the checksum list into a Hash[filename, checksum].
# https://releases.hashicorp.com/packer/${VERSION}/packer_${VERSION}_SHA256SUMS
default['packer']['raw_checksums'] = <<-EOF
6506319ce34cea3a53bd3c1075f7dd8883ea89ebfcc13214d87d1513f2ada0c6  packer_0.10.0_darwin_386.zip
cb1d9768306466d566abc79d83911983ace6a9a6c0a6657dc7eaab03cabd2e21  packer_0.10.0_darwin_amd64.zip
7bcb5cef455a16423d5d6940b98501d443a1d6d0ec52c2ef3a44a698121e2be5  packer_0.10.0_freebsd_386.zip
9ad4e9a114953e2fcdfaca7cdb83206afe74de496ef8ee3852f8b33882760b72  packer_0.10.0_freebsd_amd64.zip
b6e079d9c2219ea8d39e54936fa9510745caab5f5064e244f3c84258af60c6f6  packer_0.10.0_freebsd_arm.zip
0d2460f645e73e070cb203e540b64624027f27d82268f7d939898af1c358abaf  packer_0.10.0_linux_386.zip
eadd33bc0f8fa42034059fc1cda5f43ed6f540746e767480f0706ebed49b45e5  packer_0.10.0_linux_amd64.zip
512e7d7a7975ed671899fedc06eadf991746cb828a2a305b331505e440a52049  packer_0.10.0_linux_arm.zip
75977921e45b643c469eea9b2ac344131770e2d300d2362aa69734d60eb36c8e  packer_0.10.0_openbsd_386.zip
bd4fb4c18b96e5a389a7d91d1130b0e33ed4f20738ed3830dfb7af4e34dffe14  packer_0.10.0_openbsd_amd64.zip
9e3e1a8b1e83ac13f9e16c7b8ff707e3f077e882ddee9ee253d1bf3ebe873df2  packer_0.10.0_windows_386.zip
0c19949295e32320171f0e5d4e24d0e938f3986f941593764c7ee19e762046cf  packer_0.10.0_windows_amd64.zip
EOF

node.default['packer']['checksums'] = Hash[
    node['packer']['raw_checksums'].split("\n").collect { |s| s.split.reverse }
]

filename = "packer_#{node['packer']['version']}_#{node['os']}_#{node['packer']['arch']}.zip"

default['packer']['checksum'] = node['packer']['checksums'][filename]

default['packer']['install_method'] = 'binary'
default['packer']['install_dir'] = '/usr/local/bin'

# Windows attribute
if platform_family?('windows')
  node.default['packer']['win_install_dir'] = 'C:\packer'
  node.default['packer']['owner'] = 'Administrator'
end
