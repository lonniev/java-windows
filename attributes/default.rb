#
# Cookbook Name:: javawin
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

default['javawin'] =
  {
    'title'   => "Java JRE 1.6 for Windows",
    'site'    => "http://installbuilder.bitrock.com/java/<JVM><VERSION>-windows.zip",
    'binpath' => "<JVM><VERSION>-windows\\java-windows\\bin",    
    'jvm'          => "jre",
    'jvm_version'  => "1.6.0_45",
  }
