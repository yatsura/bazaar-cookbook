actions :checkout, :update, :sync

default_action :sync

attribute :location, kind_of: String, required: true, name_attribute: true
attribute :repository, kind_of: String, required: true
attribute :tag, kind_of: String, required: true
