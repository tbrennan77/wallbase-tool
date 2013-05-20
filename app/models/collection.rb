class Collection < ActiveRecord::Base
  attr_accessible :name, :material, :collection_description, :icon_1,:icon_2,:icon_3,:icon_4, :icon_5,
    :collection_sections_attributes
  validates_presence_of :name, :material
  has_many :style_types, dependent: :destroy
  has_many :profiles, through: :style_types, dependent: :destroy
  has_many :collection_sections, dependent: :destroy
  accepts_nested_attributes_for :collection_sections, allow_destroy: true
end
