class App
  include Mongoid::Document
  extend DocumentMethods
  field :name, type: String
  embeds_many :tables
  embeds_many :relationships
  embeds_many :roles
end
