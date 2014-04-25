class Role
  include Mongoid::Document
  field :name, type: String
  embedded_in :app
  embeds_many :permissions
  has_many :assignments
end
