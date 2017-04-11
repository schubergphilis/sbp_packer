#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

unless %w(binary source).include? node['packer']['install_method']
  Chef::Application.fatal!('[packer::default] unknown install method, ' \
    "method=#{node['packer']['install_method']}")
end

include_recipe "sbp_packer::install_#{node['packer']['install_method']}"
