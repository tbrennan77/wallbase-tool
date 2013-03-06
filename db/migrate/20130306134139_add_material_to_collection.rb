class AddMaterialToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :material, :string
  end
end
