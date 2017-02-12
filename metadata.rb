name 'sbp_packer'
maintainer 'Andrew Repton'
maintainer_email 'arepton@schubergphilis.com'
license 'Apache 2.0'
description 'Installs/Configures packer'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.4.3'

depends 'ark', '~> 1.0.0'
depends 'golang', '~> 1.7.0'

supports 'ubuntu', '= 12.04'
supports 'ubuntu', '= 14.04'
supports 'centos', '= 6.5'
supports 'centos', '= 7.1'
