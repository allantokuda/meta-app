class Table
  include Mongoid::Document
  field :name, type: String
  embedded_in :app
  embeds_many :columns
  embeds_many :views
  has_many :relationships
  has_many :records
end
