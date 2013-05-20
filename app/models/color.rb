class Color < ActiveRecord::Base
  attr_accessible :color_palette_id, :color_number, :name, :hex, :color_foundation, :selects
  belongs_to :color_palette
  validates_presence_of :color_palette_id, :color_number, :name
end
