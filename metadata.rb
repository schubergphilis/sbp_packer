name 'sbp_packer'
maintainer 'Andrew Repton'
maintainer_email 'arepton@schubergphilis.com'
license 'Apache 2.0'
description 'Installs/Configures packer'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.4.4'

depends 'ark'
depends 'golang'

supports 'ubuntu', '= 12.04'
supports 'ubuntu', '= 14.04'
supports 'centos', '= 6.5'
supports 'centos', '= 7.1'
