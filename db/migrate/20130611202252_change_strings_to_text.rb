class ChangeStringsToText < ActiveRecord::Migration
  def change
    execute "
      ALTER TABLE collections ALTER COLUMN collection_description TYPE text;
      ALTER TABLE collection_sections ALTER COLUMN body TYPE text;
    "
  end
end
