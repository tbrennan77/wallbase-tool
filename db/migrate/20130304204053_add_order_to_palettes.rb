class AddOrderToPalettes < ActiveRecord::Migration
  def change
    add_column :color_palettes, :order_number, :integer
  end
end
