name             "unicorn"
maintainer       "Chef Software, Inc"
maintainer_email "cookbooks@chef.io"
license          "Apache 2.0"
description      "Installs/Configures unicorn"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.3.1"
recipe "unicorn", "Installs unicorn rubygem"
