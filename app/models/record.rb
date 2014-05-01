class Record
  include Mongoid::Document
  extend DocumentMethods
  belongs_to :entity
  field :data, type: Hash
end
