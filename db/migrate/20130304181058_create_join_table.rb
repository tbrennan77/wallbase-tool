class CreateJoinTable < ActiveRecord::Migration
  def change
    execute "CREATE TABLE profile_color_palettes
              (
                profile_id integer NOT NULL,
                color_palette_id integer NOT NULL,
                CONSTRAINT profile_color_palettes_pkey PRIMARY KEY (profile_id , color_palette_id )
              )"
  end
end
