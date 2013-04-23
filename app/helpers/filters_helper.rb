# encoding: UTF-8
module FiltersHelper
  def nice_color_palette_name_for(color_palette)
    if color_palette.name == 'Selects'
      'Selects Palette'
    elsif color_palette.name == 'W'
      'Wall Art'
    else
      "Palette #{color_palette.name}"
    end
  end

  def colors_for(color_palette)
    list_items = ""
    if color_palette.name == "Selects"            
      Color.where(:selects => true).each do |color|
      list_items += "<li style='display:inline-block;margin: 0 8px; width: 50px;''>               
            <label class='color-label' style='background: ##{color.hex}' data-color='#{color.hex}'>
              <input type='checkbox' data-sku='#{@profile.uuid.gsub('XX', color.color_number)}' value='#{display_color_number color.color_number} #{color.name}' style='display:none'/>
            </label>
          </li>"
      end
    else
      color_palette.colors.each do |color|
      list_items += "<li style='display:inline-block;margin: 0 8px; width: 50px;'>               
          <label class='color-label' style='background: ##{color.hex}' data-color='#{color.hex}'>
            <input type='checkbox' data-sku='#{@profile.uuid.gsub('XX', color.color_number)}' value='#{display_color_number color.color_number} #{color.name}' style='display:none'/>
          </label>
        </li>"
      end
    end

    list_items.html_safe
  end

  def image_for(profile, options={})    
    if options[:type] == 'profile'
      folder = "profile_images"
      image_suffex = "profile"
    elsif options[:type] == 'corner'
      folder = "corner_images"
      image_suffex = "image"
    end
    image_tag "/assets/#{folder}/#{profile.style_type.name.capitalize.gsub('®', '')}-#{profile.name}-#{image_suffex}.jpg", class: options[:class]
  end  
end