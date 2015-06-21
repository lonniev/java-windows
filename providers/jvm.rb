#
# Cookbook Name:: java_windows
# Recipe:: default
#
# Copyright 2014, Lonnie VanZandt lonniev@gmail.com
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

def whyrun_supported?
  true
end

action :install do

  java_binpath = node['java_windows']['binpath'].sub( /<JVM>/, new_resource.jvm )
  java_binpath.sub!( /<VERSION>/, new_resource.version )

  java_root = Pathname( "/Program Files/Java" )
  java_home = java_root.join( java_binpath )

  java_exe = java_binpath.join( "java.exe" )
  
  unless java_exe.exist?
    converge_by("install Java JVM #{new_resource.name}") do

      windowsJavaSite = node['java_windows']['site']
      java_url = windowsJavaSite.sub( /<JVM>/, new_resource.jvm )
      java_url.sub!( /<VERSION>/, new_resource.version )

      windows_zipfile java_root.to_s do
        action :unzip
        source java_url
      end

      win_java_home = "C:#{java_home}".gsub( /\//, "\\" )

      windows_path win_java_home do
        action :add
      end if new_resource.update_path

      env "JAVA_HOME" do
        value win_java_home
      end if new_resource.set_home

      Chef::Log.info("#{new_resource} installed #{java_exe}")
    end
  end

  new_resource.updated_by_last_action(true)
end
