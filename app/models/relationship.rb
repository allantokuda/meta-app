class Relationship
  include Mongoid::Document
  field :type, type: String
  belongs_to :entity1, name: Entity
  belongs_to :entity2, name: Entity
end
