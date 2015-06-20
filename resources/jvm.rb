actions :install
default_action :install

attribute :name, kind_of: String, name_attribute: true
attribute :jvm, kind_of: String, :required => true
attribute :version, kind_of: String
attribute :update_path, kind_of: Boolean, :default => true
attribute :set_home, kind_of: Boolean, :default => true