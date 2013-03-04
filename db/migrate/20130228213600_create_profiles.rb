class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :style_type
      t.float :size
      t.string :name
      t.string :uuid
      t.timestamps
    end
  end
end
