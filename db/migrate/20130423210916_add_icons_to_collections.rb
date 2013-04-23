class AddIconsToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :icon_1, :boolean
    add_column :collections, :icon_2, :boolean
    add_column :collections, :icon_3, :boolean
    add_column :collections, :icon_4, :boolean
    add_column :collections, :icon_5, :boolean
  end
end
