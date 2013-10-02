class AddAvatarToFriends < ActiveRecord::Migration
  def self.up
    add_attachment :profiles, :profile_image
    add_attachment :profiles, :corner_image
  end

  def self.down
    remove_attachment :profiles, :profile_image
    remove_attachment :profiles, :corner_image
  end
end
