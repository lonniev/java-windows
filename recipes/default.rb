#
# Cookbook Name:: javawin
# Recipe:: default
#
# Copyright 2015, Lonnie VanZandt
#
# All rights reserved - Do Not Redistribute
#

javawin_jvm node['javawin']['title'] do
  action :install
  
  jvm node['javawin']['jvm']
  version node['javawin']['version']
  update_path true
  set_home true
end