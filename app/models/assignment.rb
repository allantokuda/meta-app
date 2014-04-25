class Assignment
  include Mongoid::Document
  has_one :role
  embedded_in :user
end
