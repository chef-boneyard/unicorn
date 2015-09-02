name 'unicorn'
maintainer 'Chef Software, Inc'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Installs and configures unicorn'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.1.0'
%w(debian ubuntu centos fedora redhat scientific suse amazon smartos).each do |os|
  supports os
end
depends 'build-essential'
recipe 'unicorn::default', 'Installs unicorn rubygem'

source_url 'https://github.com/opscode-cookbooks/unicorn' if respond_to?(:source_url)
issues_url 'https://github.com/opscode-cookbooks/unicorn/issues' if respond_to?(:source_url)
