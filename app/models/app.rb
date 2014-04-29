class App
  include Mongoid::Document
  extend DocumentMethods
  field :name, type: String
  has_many :entities, dependent: :delete
  has_many :roles, dependent: :delete
end
