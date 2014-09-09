#
# Author:: Adam Jacob <adam@opscode.com>
# Cookbook Name:: unicorn
# Definition:: unicorn_config
#
# Copyright 2009, Opscode, Inc.
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

define :unicorn_config,
    :listen               => nil,
    :working_directory    => nil,
    :worker_timeout       => 60,
    :preload_app          => false,
    :worker_processes     => 4,
    :unicorn_command_line => nil,
    :forked_user          => nil,
    :forked_group         => nil,
    :pid                  => nil,
    :before_exec          => nil,
    :before_fork          => nil,
    :after_fork           => nil,
    :stderr_path          => nil,
    :stdout_path          => nil,
    :notifies             => nil,
    :owner                => nil,
    :group                => nil,
    :mode                 => nil,
    :copy_on_write        => false,
    :enable_stats         => false,
    :init_style           => nil,
    :rack_env             => 'production' do

  config_dir = File.dirname(params[:name])
  basename = File.basename(params[:name])

  paths = [:stderr_path, :stdout_path].map {|k| File.dirname(params[k])}
  paths += [config_dir]
  paths.each do |path|
    directory path do
      recursive true
      action :create
    end
  end

  case params[:init_style]
  when 'upstart'
    template "/etc/init/#{basename}.conf" do
      source "ubuntu/unicorn.conf.erb"
      cookbook "unicorn"
      mode "0644"
      owner params[:owner] if params[:owner]
      group params[:group] if params[:group]
      mode params[:mode]   if params[:mode]
      variables params
    end
    service 'unicorn' do
      provider Chef::Provider::Service::Upstart
      supports :status => true, :restart => true, :reload => true
      action   :nothing
    end
  else
    ruby_block "warn-no-init-style" do
      block do
        Chef::Log.warn "Unable to set up the Unicorn init script because a "\
          "init_style' was not specified! Unicorn will be not be started "\
          "without an 'init_style'."
      end
    end
  end

  template params[:name] do
    source "unicorn.rb.erb"
    cookbook "unicorn"
    mode "0644"
    owner params[:owner] if params[:owner]
    group params[:group] if params[:group]
    mode params[:mode]   if params[:mode]
    variables params
    notifies *params[:notifies] if params[:notifies]
  end

  # If the user set a group for forked processes but not a user, warn them that
  # we did not set the group. Unicorn does not allow you to drop privileges at
  # the group level only.
  ruby_block "warn-group-no-user" do
    only_if { params[:forked_user].nil? and !params[:forked_group].nil? }
    block do
      Chef::Log.warn "Unable to set the Unicorn 'forked_group' because a "\
        "forked_user' was not specified! Unicorn will be run as root! Please "\
        "see the Unicorn documentation regarding `user` for proper usage."
    end
  end
end
