class StyleType < ActiveRecord::Base
  validates_presence_of :name, :collection_id
  belongs_to :collection
  has_many :profiles, dependent: :destroy
  has_many :color_palettes, through: :profiles, dependent: :destroy

  scope :ordered, -> { order("name") }
end
