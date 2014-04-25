class Column
  include Mongoid::Document
  field :name, type: String
  field :type, type: Integer
  embedded_in :table
end
