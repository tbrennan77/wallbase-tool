class MoveMaterialToStyles < ActiveRecord::Migration
  def change
    remove_column :collections, :material
    add_column :style_types, :material, :string, null: false, default: ''
  end
end
