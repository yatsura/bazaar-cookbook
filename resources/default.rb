actions :checkout, :update

default_action :checkout

attribute :location, kind_of: String, required: true, name_attribute: true
attribute :repository, kind_of: String, required: true
attribute :tag, kind_of: String, required: true
