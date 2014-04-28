class Table
  include Mongoid::Document
  extend DocumentMethods
  field :name, type: String
  belongs_to :app
  embeds_many :columns
  embeds_many :views
  has_many :relationships
  has_many :records
end
