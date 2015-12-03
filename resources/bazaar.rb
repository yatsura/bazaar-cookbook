resource_name :bazaar
actions :checkout, :update

default_action :checkout

attribute :branch, kind_of: String, name_attribute: true
attribute :tag, kind_of: String, name_attribute: true
attribute :location, kind_of: String, name_attribute: true
