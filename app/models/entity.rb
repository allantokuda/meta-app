class Entity
  include Mongoid::Document
  extend DocumentMethods
  field :name, type: String
  belongs_to :app
  embeds_many :data_fields
  has_many :views
  has_many :relationships, inverse_of: :entity1
  has_many :relationships, inverse_of: :entity2
  has_many :records
end
