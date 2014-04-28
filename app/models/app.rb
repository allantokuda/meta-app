class App
  include Mongoid::Document
  extend DocumentMethods
  field :name, type: String
  has_many :tables
  embeds_many :relationships
  embeds_many :roles
end
