class ColorPalette < ActiveRecord::Base
  attr_accessible :name, :order_number
  validates_presence_of :name, :order_number
  has_many :colors, dependent: :destroy
  has_many :profile_color_palettes, dependent: :destroy
  has_many :profiles, through: :profile_color_palettes, dependent: :destroy

  scope :ordered, order(:order_number)
end
