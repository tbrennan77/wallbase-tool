class ProfileColorPalette < ActiveRecord::Base
  belongs_to :profile
  belongs_to :color_palette
end