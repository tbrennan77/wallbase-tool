class Profile < ActiveRecord::Base
  attr_accessible :style_type_id, :uuid, :size, :color_palette_ids
  validates_presence_of :style_type_id, :uuid, :size
  belongs_to :style_type
  has_one :collection, through: :style_type
  has_many :profile_color_palettes
  has_many :color_palettes, through: :profile_color_palettes

  scope :ordered, order("id")

  def name
    self.uuid
  end

  def related_products
    self.collection.style_types.where("style_types.id != ?", style_type.id).order('random()').limit(5)
  end

  def color_palette_width_in_percent
    "#{100.0 / color_palettes.count.to_f}%"
  end
end
