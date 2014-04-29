class Record
  include Mongoid::Document
  belongs_to :entity
end
