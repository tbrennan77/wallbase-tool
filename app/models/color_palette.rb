class ColorPalette < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  has_many :colors
  has_many :profile_color_palettes
  has_many :profiles, through: :profile_color_palettes
end
