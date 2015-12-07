resource_name :bazaar
actions :checkout, :update

default_action :checkout

attribute :branch, kind_of: String, required: true, name_attribute: true
attribute :tag, kind_of: String, required: true
attribute :location, kind_of: String, required: true

attr_accessor :checked_out
