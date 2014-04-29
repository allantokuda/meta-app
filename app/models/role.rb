class Role
  include Mongoid::Document
  field :name, type: String
  belongs_to :app
  belongs_to :permissions
  has_many :assignments
end
