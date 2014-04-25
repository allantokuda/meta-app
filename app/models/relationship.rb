class Relationship
  include Mongoid::Document
  field :type, type: String
  embeds_one :table, store_as: "table1"
  embeds_one :table, store_as: "table2"
end
