module FiltersHelper
  def nice_color_palette_name_for(color_palette)
    color_palette.name == 'Selects' ? 'Selects Palette' : "Palette #{color_palette.name}"
  end
end