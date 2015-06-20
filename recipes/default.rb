#
# Cookbook Name:: java-windows
# Recipe:: default
#
# Copyright 2015, Lonnie VanZandt
#
# All rights reserved - Do Not Redistribute
#

java-windows_jvm node['java-windows']['title'] do
  action :install
  
  jvm node['java-windows']['jvm']
  version node['java-windows']['version']
  update_path true
  set_home true
end