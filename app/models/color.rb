class Color < ActiveRecord::Base
  attr_accessible :color_palette_id, :color_number, :name, :rgb, :color_foundation
  belongs_to :color_palette
  validates_presence_of :color_palette_id, :color_number, :name, :rgb
end
