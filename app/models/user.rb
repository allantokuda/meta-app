class User
  include Mongoid::Document
  field :email, type: String
  field :password, type: String
  embeds_many :assignments
end
