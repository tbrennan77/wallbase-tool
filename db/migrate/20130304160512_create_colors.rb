class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.references :color_palette
      t.string :color_number
      t.string :name
      t.string :hex
      t.string :color_foundation
      t.boolean :selects
      t.timestamps
    end
  end
end
