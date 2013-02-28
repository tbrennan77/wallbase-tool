class Collection < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  has_many :style_types
end
