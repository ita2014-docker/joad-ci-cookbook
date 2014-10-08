#
# Cookbook Name:: joad-ci
# Recipe:: default
#
# Copyright (C) 2014 
#
# 
#

include_recipe "jenkins::master"

jenkins_plugin "git"
jenkins_plugin "docker-build-publish"

include_recipe "docker"

chefdk_file_path = "#{Chef::Config[:file_cache_path]}/chefdk_0.2.2-1_amd64.deb"
remote_file chefdk_file_path do
  source "https://packagecloud.io/chef/stable/download?distro=precise&filename=chefdk_0.2.2-1_amd64.deb"
end

dpkg_package "chefdk" do
  source chefdk_file_path
  action :install
end

execute "install gems" do
  command "chef gem install knife-container kitchen-docker --no-ri --no-rdoc"
end
