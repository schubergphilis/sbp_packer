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
ce1400cdd612f340ad500b68d83f6615996f510344b1fe57cc01ac3a87b47954  packer_0.9.0_darwin_386.zip
bd5f8ce38ceb866c3f1db2eb3d51091184dd021dd785d05bb47177b223fea9df  packer_0.9.0_darwin_amd64.zip
3ec41f6fe29fe2e6d4182441f4d07f67124562e2cae27c2ee51600c42432ea0b  packer_0.9.0_freebsd_386.zip
5355cdd8e6d7b5fdaa416e466bf782c46130cdf96087dca621bc16d3fd5a2d3b  packer_0.9.0_freebsd_amd64.zip
618e99c2b92a1f6f79a92b6602fcf248fa3ac1aceb76119b250055f5f618141e  packer_0.9.0_freebsd_arm.zip
f3b3dea98f7b7e852d4919074d7a3878f7cc7072338f18e3e5c5e55628b43bf1  packer_0.9.0_linux_386.zip
4119d711855e8b85edb37f2299311f08c215fca884d3e941433f85081387e17c  packer_0.9.0_linux_amd64.zip
30d5a7cee03d3f838c49136a58ed935023093ebaecf063b9f47799e5e5d52c09  packer_0.9.0_linux_arm.zip
b0c498c2265a952d417fe971351f5837edd0bafc9727c4cb2582b808468cced0  packer_0.9.0_openbsd_386.zip
81266445a954f166e1da01f1d2f99962cf7f58a304f809900e646b58550ccf11  packer_0.9.0_openbsd_amd64.zip
f3ea971cefc60e953d64b944fee71b4eb77606895f690a51f485c2562e36f2e9  packer_0.9.0_windows_386.zip
dbb98c5a3be92bfe5a4bca5f29d5a9159409af0f360d590953b0e806ebe2342a  packer_0.9.0_windows_amd64.zip
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
