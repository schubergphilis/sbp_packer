default['packer']['url_base'] = 'https://releases.hashicorp.com/packer'
default['packer']['version'] = '0.8.6'
default['packer']['arch'] = kernel['machine'] =~ /x86_64/ ? 'amd64' : '386'
default['packer']['zipfile'] = "packer_#{node['packer']['version']}_" \
  "#{node['os']}_#{node['packer']['arch']}.zip"

# rubocop:disable Metrics/LineLength
# Transform raw output of the checksum list into a Hash[filename, checksum].
# https://releases.hashicorp.com/packer/${VERSION}/packer_${VERSION}_SHA256SUMS
default['packer']['raw_checksums'] = <<-EOF
1fb3b1382885f39c1f1f159fc7a6ef4be12d074c97fba76e0050d1990a990aed  packer_0.8.6_darwin_386.zip
91b5e5d4524a7a2f09a07aad1c8e26e1200b47191a42c1b2facac4a27fd674d0  packer_0.8.6_darwin_amd64.zip
c1eee9159a2b808a98392026b18b9b8d273dc7315729be223b872f244ee4a8a2  packer_0.8.6_freebsd_386.zip
bd0dac59e22a490068f45e4d97a8e698637efca88c89caa7df764ea96bd7b718  packer_0.8.6_freebsd_amd64.zip
4ca3827f70af25656dd3eff6ac442b0e62adc28d6ea1d56f47721189bb7d0453  packer_0.8.6_freebsd_arm.zip
d1385af26ea42560ddc4f4958c88cb00c3e4a9f8a2d88a81c96b4bf1cb60369b  packer_0.8.6_linux_386.zip
2f1ca794e51de831ace30792ab0886aca516bf6b407f6027e816ba7ca79703b5  packer_0.8.6_linux_amd64.zip
958cbae3f99990946c1de9af238bf1760c3382f83c4975a32be54cfb0378d8d8  packer_0.8.6_linux_arm.zip
009f30cf9f137429ca4dc2c175e0431a72f44ba3dd427cb8a173c68c7d3be7eb  packer_0.8.6_openbsd_386.zip
bfab2f16a6b4f34e317d792ad97c3e879304dc8ae7866e70737f61ebfc8952a0  packer_0.8.6_openbsd_amd64.zip
8d0bd037909206926d988b30e9336faf105dffe97c2924d455b28de437557c7f  packer_0.8.6_windows_386.zip
786503f2ffe658c1b318af227eabb8c10f3f425608ad4ef709206757931b7eee  packer_0.8.6_windows_amd64.zip
EOF

node.default['packer']['checksums'] = Hash[
    node['packer']['raw_checksums'].split("\n").collect { |s| s.split.reverse }
]

filename = "packer_#{node['packer']['version']}_#{node['os']}_#{node['packer']['arch']}.zip"

default['packer']['checksum'] = node['packer']['checksums'][filename]

default['packer']['install_method'] = 'binary'
default['packer']['install_dir'] = '/usr/local/bin'
default['packer']['source_revision'] = 'master'

# Windows attribute
if platform_family?('windows')
  node.default['packer']['win_install_dir'] = 'C:\packer'
  node.default['packer']['owner'] = 'Administrator'
end
