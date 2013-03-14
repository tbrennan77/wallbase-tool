class StyleType < ActiveRecord::Base
  attr_accessible :name, :collection_id
  validates_presence_of :name, :collection_id
  belongs_to :collection
  has_many :profiles

  scope :ordered, order("name")
end
