class ColorPalette < ActiveRecord::Base
  attr_accessible :name
  has_many :colors
  validates_presence_of :name
end
