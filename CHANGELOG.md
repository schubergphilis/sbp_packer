This is a changelog for the sbp_packer cookbook.

##
  * Chef13 update: disabled minitest-handler in .kitchen.yml
  * Start on inspec smoke tests for verification

## 1.4.3
  * Unlock metadata.rb depends for ark and golang.

## 1.4.2
  * Update to Packer 0.12.2
  * Update test kitchen centos-6.6 to centos-6.8

## 1.4.0
  * Fix from ecliptik for incorrectly generated download URL
  * Update to Packer 0.10.0 from ecliptik 
  * Move sha256sums for 0.9.0 back into attributes

## 1.2.0
  * Starting the change log here, since none existed before
  * Updated for packer 0.9.0
  * added minitest-handler dependency for run-time assertions
  * Added node['packer']['source_repo_url'] to contain the URL for the packer repo during a source install


------------------------------------
Maintainer Andrew Repton <arepton@schubergphilis.com>
Contributor Dang H. nguyen <haidangwa@gmail.com>
Contributor Micheal Waltz <ecliptik@gmail.com>
