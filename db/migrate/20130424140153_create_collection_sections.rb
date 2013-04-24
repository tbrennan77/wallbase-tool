class CreateCollectionSections < ActiveRecord::Migration
  def change
    create_table :collection_sections do |t|
      t.references :collection
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
