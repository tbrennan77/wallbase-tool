class CreateColorPalettes < ActiveRecord::Migration
  def change
    create_table :color_palettes do |t|
      t.string :name
      t.timestamps
    end
  end
end
