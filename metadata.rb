name 'unicorn'
maintainer 'Chef Software, Inc'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description 'Installs and configures unicorn'
version '3.0.0'
%w(debian ubuntu centos fedora redhat scientific suse amazon smartos).each do |os|
  supports os
end
chef_version '>= 14.0'
source_url 'https://github.com/chef-cookbooks/unicorn'
issues_url 'https://github.com/chef-cookbooks/unicorn/issues'
