class App
  include Mongoid::Document
  field :name, type: String
  embeds_many :tables
  embeds_many :relationships
  embeds_many :roles
end
