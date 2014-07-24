class Color < ActiveRecord::Base
  belongs_to :color_palette
  validates_presence_of :color_palette_id, :color_number, :name
end
