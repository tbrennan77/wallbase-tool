class Collection < ActiveRecord::Base  
  validates_presence_of :name
  
  has_many :style_types, dependent: :destroy
  has_many :profiles, through: :style_types, dependent: :destroy
  has_many :collection_sections, dependent: :destroy
  accepts_nested_attributes_for :collection_sections, allow_destroy: true
end
