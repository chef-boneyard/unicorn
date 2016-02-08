# unicorn Cookbook CHANGELOG
This file is used to list changes made in each version of the unicorn cookbook.

## v2.1.2 (02-08-2016)
- Marked this cookbook as deprecated. See the readme for additional information
- Added integration testing in Travis CI with kitchen-docker
- Updated platforms that are tested in the .kitchen.yml file

## v2.1.1 (12-14-2015):
- Added a Rakefile for simplified testing
- Added the standard chef .rubocop.yml file and a rubocop_todo.yml file
- Updated the development dependencies in the Gemfile
- Updated contributing and testing docs
- Updated the URLs in the readme for the chef-cookbooks org
- Added maintainers.md and rake task for generating the file from maintainer.toml
- Updated Travis to test using chef-dk

## v2.1.0 (09-08-2015):
- Include build-essential in the default recipe to that the necessary build tools will be in place to compile native gem deps for the unicorn gem
- Add testing with Kitchen CI config, basic convergence Chefspec, Travis CI config
- Add rubocop config and resolve warnings
- Add a gitignore, chefignore, Berksfile, and Gemfile to the repo
- Add source_url and issues_url to the metadata
- Better define chef / platform requirements in the readme and add common platforms to the metadata file
- Add testing and cookbook version badges to the readme
- Update all Opscode references to Chef Software

## v2.0.0:
- #9 Removes transform to allow for using node attributes for params.

## v1.3.0:
### Improvement
- [COOK-2470]: Add "user" directive support to Unicorn cookbook

## v1.2.2:
- [COOK-2442] - Template uses an ActiveSupport method

## v1.2.0:
- [COOK-2229] - Allow specification of unicorn command line in config file
- [COOK-2349] - Add option to include cow and GC stats
- [COOK-2354] - if no listen options are provided for a port, a
- trailing comma is left which causes unicorn to crash

## v1.1.0:
- [COOK-857] - Unicorn not quoting listener ports/sockets
- [COOK-1273] - add ability to specify before_exec block

## v1.0.0:
- Current public release.
