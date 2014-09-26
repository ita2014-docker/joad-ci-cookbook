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
