class AddDescriptionToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :collection_description, :string
  end
end
