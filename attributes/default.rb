default['packer']['version'] = '1.0.0'
default['packer']['url_base'] = 'https://releases.hashicorp.com/packer/' \
  "#{node['packer']['version']}"
default['packer']['arch'] = node['kernel']['machine'] =~ /x86_64/ ? 'amd64' : '386'
default['packer']['zipfile'] = "packer_#{node['packer']['version']}_" \
  "#{node['os']}_#{node['packer']['arch']}.zip"

# rubocop:disable Metrics/LineLength
# Transform raw output of the checksum list into a Hash[filename, checksum].
# https://releases.hashicorp.com/packer/${VERSION}/packer_${VERSION}_SHA256SUMS
default['packer']['raw_checksums']['1.0.0'] = <<-EOF
1004119cabe080a8795967659cbf321cb7bee1273f3af6168c7c058bc23e37dc  packer_1.0.0_darwin_386.zip
274f2e45db0e6f6f6673a1c1481afc8c6f402217d984af0ca2956c3488f1ead1  packer_1.0.0_darwin_amd64.zip
f594f6759c0e560ff68e0aa2c348b0330317eb2e5186c320b68f234b7ed6ffb2  packer_1.0.0_freebsd_386.zip
1d7375e227dd281c8282bf3f2a492c81578ee3e073bd6b9ffe6d0f6adcb6f530  packer_1.0.0_freebsd_amd64.zip
c7af7cfc8bc494d9f665e865150fcd1a9ad9f7789f26671fe2ad87f7e6733759  packer_1.0.0_freebsd_arm.zip
ee55eeeb225096c497e5afe2ac4770d10a752c6a6f94c413e0ed3927b4692054  packer_1.0.0_linux_386.zip
ed697ace39f8bb7bf6ccd78e21b2075f53c0f23cdfb5276c380a053a7b906853  packer_1.0.0_linux_amd64.zip
82518c633dbf4d59a0dea58580007bdf05a11b45a1a4310ec7ab0c23dd653aec  packer_1.0.0_linux_arm.zip
c433a10368011c45ffa9174a521d2423b070931c1fad9c51c82c78f9e27fad59  packer_1.0.0_openbsd_386.zip
0ae3e39a430ee7a3c48de245884de545cd424cb6ed3795a1f70e25e5a2e4a29e  packer_1.0.0_openbsd_amd64.zip
445eae4ea9a1eaa42e62776c6917fd83c15f26df320afb77571e9c840152da3b  packer_1.0.0_windows_386.zip
54b2c92548f0a4f434771703f083b6e0fbbf73a8bf81963fd43e429d2561a4e0  packer_1.0.0_windows_amd64.zip
EOF

default['packer']['raw_checksums']['0.12.2'] = <<-EOF
c7bc37eccee47b68d3198eca8da68a7f48bc74aff9807f5bc7ea7ca5a053c463  packer_0.12.2_darwin_386.zip
eef803cd43adc3b67593fd277f94b14ef266fe7124eb247d620beb29ebb4ec85  packer_0.12.2_darwin_amd64.zip
e5e07b74573cdb712412e96e1e24cd784d42674e519e0d0253d87819286bb2a6  packer_0.12.2_darwin_arm.zip
13ba36eb94f142b9d404bec3826be0d4fbea166478334b2a8ed90edd0b5bca43  packer_0.12.2_freebsd_386.zip
dff363b30cf5686adbeb60edbdf33812eeed908b4e715ca4082ec53ff51ffb8c  packer_0.12.2_freebsd_amd64.zip
06f612a436b320e14b18a0d266c30312fd3d0ed376dd425788b632b19e781e75  packer_0.12.2_freebsd_arm.zip
458e63a74104e3e550181f5cf2a20f29d79e326c518bcb5723399d4e56ff3f20  packer_0.12.2_linux_386.zip
035d0ea1fe785ab6b673bc2a79399125d4014f29151e106635fa818bb726bebf  packer_0.12.2_linux_amd64.zip
daecd0f9c9abb0735cab65029c5e2752c0105f58be58a3e5ea423d5fcbf52a77  packer_0.12.2_linux_arm.zip
1695210bc8d81bb0aaaa004bc41c65dda9b6d7eb5646a4c94cd1cc35b57293aa  packer_0.12.2_openbsd_386.zip
21bc55a12799867210f87a7e761cbe4a7be4b205b8b4c5823a7b9b23b5c283b8  packer_0.12.2_openbsd_amd64.zip
4e52975f3b46f97222858b2a1bf9bcd68d5485c3697775b3cfee98a16fce1812  packer_0.12.2_windows_386.zip
2d8704a958af1e593c56aaf7da2be511eda535dd6e509dec84dfe28e8c48c5b5  packer_0.12.2_windows_amd64.zip
EOF

default['packer']['raw_checksums']['0.11.0'] = <<-EOF
4b6348bfdd8d086c20d919e0abde83fe0d0d1758c25463075f1fad42c5ac0efa  packer_0.11.0_darwin_386.zip
5e3c3448f0efc33069ecfeae698eea475b37ebff385db596f6f4621edfd52797  packer_0.11.0_darwin_amd64.zip
2fd05aaa9f70248a783df8aa6ef38457a006b389c5e2111167123ee4dd0b1bd5  packer_0.11.0_darwin_arm.zip
f355cf0145bccdd6e4dc7d8c4b2470e4c8887719ab0fbc4f6edb96db4246a0a0  packer_0.11.0_freebsd_386.zip
e2c5776e90e1bb3f4f3846090ec1b9285e37da226ce7c7351792af046d06ff79  packer_0.11.0_freebsd_amd64.zip
176fea5a1ab4589ca727d4f54dc1b0cd7c7e1c98172adb22540fea4d85af603e  packer_0.11.0_freebsd_arm.zip
abc25443416641e2277c8d968c6557bf9a009f9dc6ece4f0932acbb53c6c6fee  packer_0.11.0_linux_386.zip
318ffffa13763eb6f29f28f572656356dc3dbf8d54c01ffddd1c5e2f08593adb  packer_0.11.0_linux_amd64.zip
bf6fcfe99f6e35cf179d42af01d69bb10ee33ae2a824cbdfc71aba52f3b92a93  packer_0.11.0_linux_arm.zip
d4ba32f50f02f1cdd17d67d41f0f873670c3f3f46f905ff1d376e45defff6a9a  packer_0.11.0_openbsd_386.zip
a95fdc04df3f9fc5dea49943d6cd7830e0281c7c9ce8e4f1715ee04b6c7363bb  packer_0.11.0_openbsd_amd64.zip
ff8149f71021ee65e16c264e42423082b079733a612eb2b6a0a959abd2160d4c  packer_0.11.0_windows_386.zip
0a5fae47bd7269a3e739e7f9e6b6dea7564a80e02f30a152c9a071155eaaa65d  packer_0.11.0_windows_amd64.zip
EOF

default['packer']['raw_checksums']['0.10.0'] = <<-EOF
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

default['packer']['raw_checksums']['0.9.0'] = <<-EOF
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
EOF

node.default['packer']['checksums'] = Hash[
    node['packer']['raw_checksums']["#{node['packer']['version']}"].split("\n").collect { |s| s.split.reverse }
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
