class ColorPalette < ActiveRecord::Base
  attr_accessible :name, :order_number
  validates_presence_of :name, :order_number
  has_many :colors
  has_many :profile_color_palettes
  has_many :profiles, through: :profile_color_palettes

  scope :ordered, order(:order_number)
end
