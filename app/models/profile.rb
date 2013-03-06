class Profile < ActiveRecord::Base
  attr_accessible :style_type_id, :uuid, :size, :color_palette_ids
  validates_presence_of :style_type_id, :uuid, :size
  belongs_to :style_type
  belongs_to :collection
  has_many :profile_color_palettes
  has_many :color_palettes, through: :profile_color_palettes

  scope :ordered, order("id")
end
