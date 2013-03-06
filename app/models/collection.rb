class Collection < ActiveRecord::Base
  attr_accessible :name, :material
  validates_presence_of :name, :material
  has_many :style_types
  has_many :profiles, through: :style_types
end
