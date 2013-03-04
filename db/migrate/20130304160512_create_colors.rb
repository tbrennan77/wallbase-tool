class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.references :color_palette
      t.string :color_number
      t.string :name
      t.string :rgb
      t.string :color_foundation
      t.timestamps
    end
  end
end
