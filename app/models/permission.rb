class Permission
  include Mongoid::Document
  has_one :view
  embedded_in :role
end
