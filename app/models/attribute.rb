class Attribute
  include Mongoid::Document
  field :name, type: String
  field :type, type: Integer
  embedded_in :entity
end
