class View
  include Mongoid::Document
  field :read_filter,      type: String
  field :write_filter,     type: String
  field :delete_filter,    type: String
  field :read_projection,  type: String
  field :write_projection, type: String
  field :index_projection, type: String
  field :index_style,      type: String
  field :detail_style,     type: String
  field :default_order,    type: String
  belongs_to :entity
  belongs_to :view
  has_many :views
  has_many :permissions
end
