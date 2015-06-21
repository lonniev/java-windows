#
# Cookbook Name:: java_windows
# Recipe:: default
#
# Copyright 2015, Lonnie VanZandt
#
# All rights reserved - Do Not Redistribute
#

java_windows_jvm node['java_windows']['title'] do
  action :install
  
  jvm node['java_windows']['jvm']
  version node['java_windows']['version']
  update_path true
  set_home true
end