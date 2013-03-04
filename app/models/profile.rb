class Profile < ActiveRecord::Base
  attr_accessible :style_type_id, :uuid, :size
  validates_presence_of :style_type_id, :uuid, :size
  belongs_to :style_type
end
