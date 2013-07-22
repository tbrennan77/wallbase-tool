class CreateOpeningPages < ActiveRecord::Migration
  def change
    create_table :opening_pages do |t|
      t.text :body
      t.timestamps
    end
  end
end
