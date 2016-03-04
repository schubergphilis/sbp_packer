
# **NOTE** This file should be required from *inside* of a describe_recipe
# block. Doing it globally at the top of a test file has been seen to cause
# issues
require 'minitest/spec'
require 'minitest-chef-handler'

# this module starts ChefPacker
module ChefPacker
  # test helper module under sbp_packer
  module TestHelper
    # This module is intended to be included form test cases to help reduce
    # duplication of includes
    include MiniTest::Chef::Assertions
    include MiniTest::Chef::Context
    include MiniTest::Chef::Resources
  end
end
