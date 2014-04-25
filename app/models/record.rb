class Record
  include Mongoid::Document
  belongs_to :table
end
